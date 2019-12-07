# -*- coding:utf-8 -*-
import sqlparse
import re
from .models import skip_columns,necessary_columns


class sql_check_sql():
    def __init__(self, sql_content):
        for i in range ( len( list(set(re.findall(r"\(\d+.*\,.*\d+\)",sql_content)))  ) ):
            sql_content=sql_content.replace(  re.findall(r"\(\d+.*\,.*\d+\)",sql_content)[0],'')
        self.str1 = sqlparse.format(re.sub(' +', ' ', sql_content), keyword_case="upper", strip_comments=True, reindent=True).replace('\n', '').replace('`','')

    def check_sql_type(self):
        stmt_parsed = sqlparse.parse(sqlparse.format(self.str1, keyword_case="upper"))
        if len(stmt_parsed)>0:
            for token in stmt_parsed[0].tokens:
                if str(token.ttype).find("DML") != -1:
                    return "DML"
                if str(token.ttype).find("DDL") != -1:
                    return "DDL"

    # 判断SQL语句类型
    def get_sql_type(self):
        for newsql in sqlparse.split(self.str1):
            stmt_parsed = sqlparse.parse(self.str1)
            if len(stmt_parsed)>0:
                for token in stmt_parsed[0].tokens:
                    if str(token.ttype).find("DML") != -1:
                        return "DML"
                    if str(token.ttype).find("DDL") != -1:
                        return "DDL"

    def check_create_column(self,col_str,has):
        if col_str.upper().find("CHARSET") != -1 or col_str.upper().find("UTF8") != -1 or col_str.upper().find("CHARACTER")!=-1:
            return "字段禁止指定字符集 " + col_str
        if col_str.upper().find('NOT NULL')==-1 and has==0:
            return "字段禁止默认NULL值 " + col_str
        if col_str.upper().find("COMMENT") == -1:
            return "字段没有注释 " + col_str
        if col_str.upper().find("DEFAULT") == -1:
            return "字段没有默认值 "+col_str

    def check_create_index(self):
        pidx = self.str1.find("PRIMARY KEY")
        str2 = self.str1[pidx:].split("ENGINE")[0].split(',')
        for i in range(len(str2)):
            idx_name=re.split(' ',str2[i].strip())[0]
            if idx_name.find('PRIMARY') !=-1:
                pk_col=str(re.split(' ',str2[i].strip())[2]).replace('(','').replace(')','')
            if 'PRIMARY' in self.str1:
                pk_is_bigint = re.split(',', self.str1)[0].strip().split('(')[1].strip().split(' ')[1].upper()
                if pk_is_bigint != "BIGINT":
                    return "主键" + pk_col + "必须是BIGINT类型!!！"
                else:
                    pass
            if idx_name.find('KEY') !=-1 and str2[i].find('idx_') ==-1:
                return "普通索引命名必须以idx_开头" + str2[i]
            if idx_name.find('UNIQUE') !=-1 and str2[i].find('uniq_') ==-1:
                return "唯一索引命名必须以uniq_开头" + str2[i]

    def check_alter_column(self,col_str,has):
        if col_str.upper().find("CHARSET") != -1 or col_str.upper().find("UTF8") != -1 or col_str.upper().find("CHARACTER")!=-1:
            return "字段禁止指定字符集 " + col_str
        elif col_str.find('NOT NULL')==-1 and has==0:
            return "字段禁止NULL默认值 " + col_str
        elif col_str.find("COMMENT") == -1:
            return "字段没有注释 " + col_str
        elif col_str.find("DEFAULT") == -1:
            return "字段没有默认值 "+col_str
        

    ##检查建表语句
    def get_check_create(self):
        if self.str1.find("PRIMARY KEY")==-1:
            return "建表语句必须有主键！！"
        col_list=necessary_columns.objects.values("colunm_name").all()
        for i in range(len(col_list)):
            col_mast=col_list[i]["colunm_name"]
            if self.str1.upper().find(col_mast)==-1:
                return "建表语句必须有字段"+col_mast +"！！"
            
        iidx = self.str1.find("KEY")
        pidx = self.str1.find("PRIMARY KEY")
        if pidx>iidx:
            return "主键索引必须在其他索引前定义！！！"
        str_parsed = sqlparse.format(self.str1[:pidx], keyword_case="upper", strip_comments=True, reindent=True).split("PRIMARY KEY")[0]
        if str_parsed.upper().find("UTF8")!=-1 or  str_parsed.upper().find("CHARSET")!=-1 or str_parsed.upper().find("CHARACTER")!=-1:
            return "字段禁止指定字符集"
        temp_content_item = str_parsed.replace('\n','').replace("\r\n", "\n").replace('\t', '')
        for i in range(len  (temp_content_item.split(','))-1) :
            stm=temp_content_item.split(',')[i].strip()
            if stm.strip().find("CREATE TABLE")==-1:
                col_name=stm.strip().split(' ')[0]
            else:
                col_name = stm.strip().split('(')[1].strip().split(' ')[0]

            ifhas=skip_columns.objects.filter(colunm_name=col_name.upper()).count()
            res = self.check_create_column(stm.strip(), ifhas)
            if res :
                return res
            else:
                res=self.check_create_index()
            if res:
                return res


    ##检查UPDATE语句
    def get_check_update(self):
        if self.str1.find("WHERE")==-1:
            return "UPDATE语句必须指定WHERE条件 " + self.str1.strip()

    def get_check_insert(self):
        pass
 



    ##检查alter语句
    def get_check_alter(self):
        str_parsed = sqlparse.format(self.str1, keyword_case="upper", strip_comments=True, reindent=True).split("ALTER TABLE")[1]
        temp_content_item1 = str_parsed.replace("\r\n", "\n").replace('\t', '')
        temp_content_item2 = temp_content_item1.replace("\r", "\n")
        uncomment_list = temp_content_item2.split('\n')
        for idx, stm in enumerate(uncomment_list):
            if stm.find("INDEX")!=-1 :
                if stm.find("UNIQUE")!=-1:
                    if stm.find("uniq_")==-1:
                        return "唯一索引命名不规范 必须使用uniq_做前缀 "+stm.strip()
                elif stm.find("idx_") == -1:
                    return "普通索引命名不规范 必须使用idx_做前缀 "+stm.strip()

            elif stm.find("COLUMN")!=-1:
                if stm.find("CHANGE")!=-1:
                    return "DDL仅支持ADD和MODIFY "+ stm.strip()
                else:
                    col_name=stm.strip().split('COLUMN')[1].strip().split(' ')[0]
                    ifhas=skip_columns.objects.filter(colunm_name=col_name.upper()).count()
                    res=self.check_alter_column(stm.strip(), ifhas)
                    if res:
                       return res
            else:
                 return "未使用关键字INDEX或COLUMN "+stm.strip()


