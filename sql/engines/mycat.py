# -*- coding: UTF-8 -*-
import logging
import traceback
import MySQLdb
import re
import sqlparse
from MySQLdb.connections import numeric_part
from MySQLdb.constants import FIELD_TYPE
from common.utils.timer import FuncTimer

from sql.engines.goinception import GoInceptionEngine
from sql.utils.sql_utils import get_syntax_type, remove_comments
from . import EngineBase
from .models import ResultSet, ReviewResult, ReviewSet
from sql.models import Instance
from .inception import InceptionEngine
from sql.utils.data_masking import data_masking
from common.config import SysConfig
import datetime
from sql.sql_check_sql import sql_check_sql


logger = logging.getLogger('default')
class MyCatEngine(EngineBase):
    def get_connection(self, db_name=None):
        # https://stackoverflow.com/questions/19256155/python-mysqldb-returning-x01-for-bit-values
        conversions = MySQLdb.converters.conversions
        conversions[FIELD_TYPE.BIT] = lambda data: data == b'\x01'
        if self.conn:
            self.thread_id = self.conn.thread_id()
            return self.conn
        if db_name:
            self.conn = MySQLdb.connect(host=self.host, port=self.port, user=self.user, passwd=self.password,
                                        db=db_name, charset=self.instance.charset or 'utf8mb4',
                                        conv=conversions,autocommit=True,
                                        connect_timeout=10)
        else:
            self.conn = MySQLdb.connect(host=self.host, port=self.port, user=self.user, passwd=self.password,
                                        charset=self.instance.charset or 'utf8mb4',
                                        conv=conversions,autocommit=True,
                                        connect_timeout=10)
        self.thread_id = self.conn.thread_id()
        return self.conn
    @property
    def name(self):
        return 'MyCat'

    @property
    def info(self):
        return 'MyCat engine'

    @property
    def auto_backup(self):
        """是否支持备份"""
        return False

    def get_all_databases(self):
        """
        获取数据库列表
        :return:
        """
        result = self._query(sql=f"show databases;")
        db_list = [row[0] for row in result.rows
                   if row[0] not in ('information_schema', 'performance_schema', 'mysql', 'test', 'sys')]
        result.rows = db_list
        return result

    def get_all_tables(self, db_name, schema_name=None):
        """
        获取表列表
        :param db_name:
        :param schema_name:
        :return:
        """
        sql = f"show tables"
        result = self.query(db_name=db_name, sql=sql)
        tb_list = [row[0] for row in result.rows if row[0] not in ['test']]
        result.rows = tb_list
        return result

    def get_all_columns_by_tb(self, db_name, tb_name, schema_name=None):
        """
        获取字段列表
        :param db_name:
        :param tb_name:
        :param schema_name:
        :return:
        """
        sql = f"""SELECT 
            COLUMN_NAME,
            COLUMN_TYPE,
            CHARACTER_SET_NAME,
            IS_NULLABLE,
            COLUMN_KEY,
            EXTRA,
            COLUMN_COMMENT
        FROM
            information_schema.COLUMNS
        WHERE
            TABLE_SCHEMA = '{db_name}'
                AND TABLE_NAME = '{tb_name}'
        ORDER BY ORDINAL_POSITION;"""
        result = self.query(db_name=db_name, sql=sql)
        column_list = [row[0] for row in result.rows]
        result.rows = column_list
        return result

    def describe_table(self, db_name, tb_name):
        """return ResultSet 类似查询"""
        sql = f"show create table {tb_name};"
        result = self.query(db_name=db_name, sql=sql)
        return result

    def query_check(self,instance_name=None, db_name=None, sql=''):
        # 查询语句的检查、注释去除、切分
        ##drds
        db_type=Instance.objects.values('db_type').get(instance_name=instance_name)
        if db_type["db_type"] in ["drds","mycat"]:
            result = {'msg': '', 'bad_query': False, 'filtered_sql': sql, 'has_star': False}
        else:
            result = {'msg': '', 'bad_query': False, 'filtered_sql': sql, 'has_star': False}
        # 删除注释语句，进行语法判断，执行第一条有效sql
            try:
                sql = sqlparse.format(sql, strip_comments=True)
                sql = sqlparse.split(sql)[0]
                result['filtered_sql'] = sql.strip()
            except IndexError:
                result['bad_query'] = True
                result['msg'] = '没有有效的SQL语句'
            if re.match(r"^select", sql, re.I) is None:
                result['bad_query'] = True
                result['msg'] = '不支持的查询语法类型!'
            #if '*' in sql:
            #result['has_star'] = True
            #result['msg'] = 'SQL语句中含有 * '
        return result
    
    def _query(self, db_name=None, sql='',limit_num=0,close_conn=True):
        """返回 ResultSet """
        result_set = ResultSet(full_sql=sql)
        try:
            conn = self.get_connection(db_name=db_name)
            cursor = conn.cursor()
            cursor.execute(sql)
            effect_row = cursor.rowcount
            if int(limit_num) > 0:
                rows = cursor.fetchmany(size=int(limit_num))
            else:
                rows = cursor.fetchall()
            fields = cursor.description

            result_set.column_list = [i[0] for i in fields] if fields else []
            result_set.rows = rows
            result_set.affected_rows = effect_row
        except Exception as e:
            logger.warning(f"MyCat命令执行报错，语句：{sql}， 错误信息：{traceback.format_exc()}")
            result_set.error = str(e)
        finally:
            if close_conn:
                self.close()
        return result_set
    
    def query(self, db_name=None, sql='', limit_num=0, close_conn=True):
        if not db_name:
            raise ValueError('db_name未填写,请检查参数')
        return self._query(db_name=db_name, sql=sql, limit_num=limit_num, close_conn=close_conn)

    def filter_sql(self, sql='', limit_num=0):
        # 对查询sql增加limit限制，# TODO limit改写待优化
        sql_lower = sql.lower().rstrip(';').strip()
        if re.match(r"^select", sql_lower):
            if re.search(r"limit\s+(\d+)$", sql_lower) is None:
                if re.search(r"limit\s+\d+\s*,\s*(\d+)$", sql_lower) is None:
                    return f"{sql.rstrip(';')} limit {limit_num};"
        return f"{sql.rstrip(';')};"

    def query_masking(self, db_name=None, sql='', resultset=None):
        """不做脱敏"""
        return resultset

    def execute_check(self, db_name=None, sql=''):
        """上线单执行前的检查, 返回Review set"""
        config = SysConfig()
        check_result = ReviewSet(full_sql=sql)
        self_check=True
        # 禁用/高危语句检查
        line = 1
        critical_ddl_regex = config.get('critical_ddl_regex', '')
        p = re.compile(critical_ddl_regex)
        check_result.syntax_type = 2  # TODO 工单类型 0、其他 1、DDL，2、DML
        for statement  in sqlparse.split(sql):
            if re.match(r"^delete", statement.lower()):
                self_check=False
                result = ReviewResult(id=line, errlevel=1,
                         stagestatus='驳回不支持语句',
                         errormessage='禁止提交Delete语句！',
                         sql=statement)
                check_result.error_count += 1
                check_result.rows+=[result]
                return check_result

            if re.match(r"^create", statement.lower()):
                check_result.is_critical = True
                result = ReviewResult(id=line, errlevel=2,
                         stagestatus='驳回不支持语句',
                         errormessage='平台不支持MyCat创建表，请联系DBA！',
                         sql=statement)
                check_result.error_count += 1
                check_result.rows+=[result]

            sqlcheck=sql_check_sql(statement)
            res=sqlcheck.get_sql_type() 
            if res=='DDL' and statement.upper().find("CREATE TABLE")!=-1:
                if statement.upper().find("INNODB") == -1 or re.split('ENGINE',statement.upper())[1].strip().find("UTF8MB4")==-1 or re.split('ENGINE',statement.upper())[1].strip().find("COMMENT")==-1:
                    self_check=False
                    result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回高危SQL',
                             errormessage="建表语句未指定engine=innodb或字符集未使用UTF8MB4或表没有COMMENT信息",
                             sql=statement)
                    check_result.error_count += 1
                    check_result.rows+=[result]
                    return check_result
                else:
                    res=sqlcheck.get_check_create()
                    if res:
                        self_check=False
                        result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回高危SQL',
                             errormessage=res,
                             sql=statement)
                        check_result.error_count += 1
                        check_result.rows+=[result]
                        return check_result


            elif res == 'DDL' and statement.upper().find("ALTER TABLE") != -1:
                res=sqlcheck.get_check_alter()
                if res:
                    self_check=False
                    result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回高危SQL',
                             errormessage=res,
                             sql=statement)
                    check_result.error_count += 1
                    check_result.rows+=[result]
                    return check_result
                   
            elif res == 'DML'  and   statement.upper().find("INSERT INTO") == -1:
                if len(sqlparse.split(sql))<1001:
                    res=sqlcheck.get_check_update()
                    if res:
                        self_check=False
                        result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回高危SQL',
                             errormessage=res,
                             sql=statement)
                        check_result.error_count += 1
                        check_result.rows+=[result]
                        return check_result
                else:
                    self_check=False
                    result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回SQL',
                             errormessage="本次提交"+ str(len(sqlparse.split(sql))) +"条,最大可1000条DML语句",
                             sql=statement)
                    check_result.error_count += 1
                    check_result.rows+=[result]
                    return check_result

            elif res == 'DML'  and   statement.upper().find("INSERT INTO") != -1:
                if len(sqlparse.split(sql))>1001:
                    self_check=False
                    result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回SQL',
                             errormessage="本次提交"+ str(len(sqlparse.split(sql))) +"条,最大可1000条DML语句",
                             sql=statement)
                    check_result.error_count += 1
                    check_result.rows+=[result]
                    return check_result



            if self_check==True:
                # 禁用语句
                if re.match(r"^select", statement.lower()):
                    check_result.is_critical = True
                    result = ReviewResult(id=line, errlevel=2,
                         stagestatus='驳回不支持语句',
                         errormessage='仅支持DML和DDL语句，查询语句请使用SQL查询功能！',
                         sql=statement)

                # 高危语句
                elif critical_ddl_regex and p.match(statement.strip().lower()):
                    check_result.is_critical = True
                    result = ReviewResult(id=line, errlevel=2,
                             stagestatus='驳回高危SQL',
                             errormessage='禁止提交匹配' + critical_ddl_regex + '条件的语句！',
                             sql=statement)
                # 正常语句
                else:
                    result = ReviewResult(id=line, errlevel=0,
                          stagestatus='Audit completed',
                          errormessage='None',
                          sql=statement,
                          affected_rows=0,
                          execute_time=0, )
                # 判断工单类型
            if get_syntax_type(statement) == 'DDL':
                check_result.syntax_type = 1
                check_result.rows += [result]
                # 遇到禁用和高危语句直接返回，提高效率
            if check_result.is_critical:
                check_result.error_count += 1
                return check_result
                line += 1
            return check_result


    def execute_workflow(self, workflow, close_conn=True):
        """执行上线单，返回Review set"""
        sql = workflow.sqlworkflowcontent.sql_content
        execute_result = ReviewSet(full_sql=sql)
        # 删除注释语句，切分语句，将切换CURRENT_SCHEMA语句增加到切分结果中
        sql = sqlparse.format(sql, strip_comments=True)
        split_sql = sqlparse.split(sql)
        line = 1
        statement = None
        db_name = workflow.db_name
        try:
            conn = self.get_connection(db_name=db_name)
            cursor = conn.cursor()
            # 逐条执行切分语句，追加到执行结果中
            for statement in split_sql:
                statement = statement.rstrip(';')
                with FuncTimer() as t:
                    cursor.execute(statement)
                    conn.commit()
                execute_result.rows.append(ReviewResult(
                    id=line,
                    errlevel=0,
                    stagestatus='Execute Successfully',
                    errormessage='None',
                    sql=statement,
                    affected_rows=cursor.rowcount,
                    execute_time=t.cost,
                ))
                line += 1
        except Exception as e:
            logger.warning(f"MyCat命令执行报错，语句：{statement or sql}， 错误信息：{traceback.format_exc()}")
            execute_result.error = str(e)
            # 追加当前报错语句信息到执行结果中
            execute_result.rows.append(ReviewResult(
                id=line,
                errlevel=2,
                stagestatus='Execute Failed',
                errormessage=f'异常信息：{e}',
                sql=statement or sql,
                affected_rows=0,
                execute_time=0,
            ))
            line += 1
            # 报错语句后面的语句标记为审核通过、未执行，追加到执行结果中
            for statement in split_sql[line - 1:]:
                execute_result.rows.append(ReviewResult(
                    id=line,
                    errlevel=0,
                    stagestatus='Audit completed',
                    errormessage=f'前序语句失败, 未执行',
                    sql=statement,
                    affected_rows=0,
                    execute_time=0,
                ))
                line += 1
        finally:
            if close_conn:
                self.close()
        return execute_result


    def close(self):
        if self.conn:
            self.conn.close()
            self.conn = None


