from .models import skip_columns
import re
###  Mysql  自定义规则
# 1、不允许提交非["CREATE", "ALTER"] 开头的语句
# 2、语句中包含唯一索引的，必须符合 "UNIQUE KEY UK_"
# 3、语句中包含索引的，必须符合 "KEY IDX_"
# 4、语句中若不包含"CHARSET=UTF8MB4" ，提示--没有字符集或字符集不符合规范
# 5、语句中若不包含"PRIMARY KEY" ，提示--没有主键
# 6、语句中若不包含"DEFAULT NULL ' "，提示--没有默认值
# 7、语句中若不包含"COMMENT ' "，提示--没有注释
class sql_check():

    def __init__(self, sql_content):
        self.str1 = sql_content.upper()
        self.result = dict(result=True, data="", sql="")
        self.str1_list = list(filter(None, self.str1.split(' ')))

    def check_sql_prefix(self):
        self.result["result"] = True
        if self.str1_list[0] == 'INSERT' or self.str1_list[0] == "UPDATE":
            sql_list = self.str1.split(";")
            new_sql_list = list(filter(None, sql_list))
            self.result["sql"] = "update_or_insert"
            if len(new_sql_list) > 2001:
                self.result["result"] = False
             ##   self.result["data"] = "Update 和Insert 语句最大允许提交2000行。"
        return self.result

    def get_sql_type(self):
        if self.str1_list[0:2] == ['CREATE', 'TABLE']:
            self.result["data"] = "create_table"
        elif self.str1_list[0:2] == ['CREATE', 'INDEX']:
            self.result["data"] = "create_index"
        elif self.str1_list[0:2] == ['ALTER', 'TABLE']:
            self.result["data"] = "alter_table"
        return self.result

    def return_result(self, data, sql="", result=False):
        self.result["result"] = result
        self.result["data"] = data + sql
        return self.result

##add by shenjun on 2019-12-02
    def check_columns(self,col_str, has):
        err_msg='ok'
        if col_str.find("CHARSET") != -1 or col_str.find("UTF8") != -1:
            err_msg="字段禁止指定字符集" + col_str
        if col_str.find('NOT NULL')==-1 and has==0:
            err_msg="字段禁止NULL默认值" + col_str
        if col_str.find("COMMENT") == -1:
            err_msg="字段没有注释" + col_str
        if col_str.find("DEFAULT") == -1:
            err_msg="字段没有默认值"+col_str
        return err_msg

    def check_index(self,str1,pidx):
        err_msg='ok'
        pidx =int(pidx-8)
        str1=str1.replace("`","").upper()
        chkidx_str=  str1[pidx:].split("ENGINE")[0].split('\n')
        for i in range( len(chkidx_str)-1):
            idx_name=re.split(' ',chkidx_str[i].strip())[0]
            if idx_name.find('PRIMARY') !=-1:
                pass
            if idx_name.find('KEY') !=-1 and chkidx_str[i].find('IDX_') ==-1:
                err_msg= "普通索引命名必须以IDX_开头" + chkidx_str[i]
            if idx_name.find('UNIQUE') !=-1 and chkidx_str[i].find('UNIQ_') ==-1:
                err_msg= "唯一索引命名必须以UNIQ_开头" + chkidx_str[i]
        return err_msg



    def check_create_table(self):
        str1=self.str1.replace("`","")
        iidx=self.str1.find("KEY")
        pidx=self.str1.find("PRIMARY KEY")
        
        if iidx<pidx:
            return self.return_result(data="主键索引必须放其他索引前!!!")
        if 'ENGINE' in str1:
            if re.split("ENGINE",str1)[1].find("UTF8MB4") != -1 and re.split("ENGINE",str1)[1].find("COMMENT") != -1:
                pass
            else:
               return self.return_result(data="必须有注释信息和指定字符集utf8mb4 !!!")
            if re.split("ENGINE",str1)[1].find("INNODB") != -1:
                pass
            else:
                return self.return_result(data="表ENGINE必须为 INNODB !!!")

        else:
            return self.return_result(data="建表语句必须指定ENGINE=INNODB!!！")

        if 'PRIMARY' in str1:
            pk_col=re.findall(r"\((.*)\)",re.split("PRIMARY KEY",str1)[1])[0].upper()
            pk_is_bigint=re.split(',',str1)[0].strip().split('(')[1].strip().split(' ')[1].upper()
            if pk_is_bigint != "BIGINT":
                return self.return_result(data="主键"+pk_col+"必须是BIGINT类型!!！")
            else:
                pass
        else:
            return self.return_result(data="建表语句必须指定主键!!！")
             
        if "UPDATED" in self.str1 or "CREATED" in self.str1:
            pass
        else:
            if "CREATER_TIME" not in self.str1:
                return self.return_result(data="建表必须包含CREATER_TIME 字段！")
            if "LATEST_TIME" not in self.str1:
                return self.return_result(data="建表必须包含LATEST_TIME 字段！")

        if (len(re.findall(r"^.*TABLE(.*)\(",str1)))>0:
            ##获取表名
            split_str=str(str((re.findall(r"^.*TABLE(.*)\(",str1))).split('(')[0]).split(' ')[1]
            for i in range(len(re.split('PRIMARY KEY',re.split(split_str, str1)[1])[0].replace("(",'').split(','))-1):
                chkcol=re.split('PRIMARY KEY',re.split(split_str, str1)[1])[0].replace("(",'').split(',')[i].strip()
                skip_col=chkcol.split(' ')[0]
                ifhas=skip_columns.objects.filter(colunm_name=skip_col.upper()).count()
                res=self.check_columns(chkcol,int(ifhas))
            res=self.check_index(str1,pidx)
            return self.return_result(data=res)
                  
    def check_alter_table_add(self):
        alt_col = " ".join(self.str1.split()).split('ADD')
        for i in range(1, len(alt_col)):
            tmp_col = alt_col[i].strip().replace('`','').split(' ')[1]
            ifhas = skip_columns.objects.filter(colunm_name=tmp_col.upper()).count()
            if ifhas<1:
                if 'COLUMN' in alt_col[i] :
                    if alt_col[i].find(") CHAR") != -1:
                        return self.return_result("字段禁止指定字符集", sql=alt_col[i])
                    elif 'NOT NULL' not in alt_col[i]:
                        if alt_col[i].find("DEFAULT") == -1:
                            return self.return_result("没有默认值或默认值不规范", sql=alt_col[i])
                    if alt_col[i].find("COMMENT '") == -1:
                        return self.return_result("没有注释", sql=alt_col[i])
                elif 'UNIQUE' in alt_col[i]:
                    if alt_col[i].find("UNIQUE UNIQ_") == -1:
                        return self.return_result("唯一键命名不规范,请使用UNIQ_开头", sql=alt_col[i])
                elif 'INDEX' in alt_col[i]:
                    if alt_col[i].find("IDX_") == -1:
                        return self.return_result("索引命名不规范,请使用IDX_开头", sql=alt_col[i])
                elif 'COLUMN' not in alt_col[i]: 
                    return self.return_result("DDL请使用关键字COLUMN")

    def check_alter_table_modify(self):
        alt_col = " ".join(self.str1.split()).split('MODIFY')
        for i in range(1, len(alt_col)):
            tmp_col = alt_col[i].strip().replace('`','').split(' ')[1]
            ifhas = skip_columns.objects.filter(colunm_name=tmp_col.upper()).count()
            if ifhas<1:
                if 'COLUMN' in alt_col[i] :
                    if alt_col[i].find(") CHAR") != -1:
                        return self.return_result("字段禁止指定字符集", sql=alt_col[i])
                    elif 'NOT NULL' not in alt_col[i]:
                        if alt_col[i].find("DEFAULT") == -1:
                            return self.return_result("没有默认值或默认值不规范", sql=alt_col[i])
                    if alt_col[i].find("COMMENT '") == -1:
                        return self.return_result("没有注释", sql=alt_col[i])
                elif 'UNIQUE' in alt_col[i]:
                    if alt_col[i].find("UNIQUE UNIQ_") == -1:
                        return self.return_result("唯一键命名不规范,请使用UNIQ_开头", sql=alt_col[i])
                elif 'INDEX' in alt_col[i]:
                    if alt_col[i].find("IDX_") == -1:
                        return self.return_result("索引命名不规范,请使用IDX_开头", sql=alt_col[i])
                elif 'COLUMN' not in alt_col[i]:
                    return self.return_result("DDL请使用关键字COLUMN")

    def alter_check_cols(self,sql_str):
        sql_str = sql_str.upper().replace('`', '')
        for i in range(len(sql_str.split('COLUMN'))):
            if i == 0:
                pass
            else:
                tmp_lock = False
                skip_col=sql_str.split('COLUMN')[i].strip().split(' ')[0]
                chkcol=sql_str.split('COLUMN')[i].strip().replace('\n','')
                ifhas = skip_columns.objects.filter(colunm_name=skip_col.upper()).count()
                if ifhas>0:
                    tmp_lock = True
                if tmp_lock:
                    continue
                if sql_str.find('COLUMN') !=-1:
                    if chkcol.find(") CHAR") != -1:
                        return self.return_result("字段禁止指定字符集", sql=chkcol)
                    elif chkcol.find('NOT NULL')==-1:
                        if chkcol.find("DEFAULT'") == -1:
                            return self.return_result("没有默认值或默认值不规范", sql=chkcol)
                    if chkcol.find("COMMENT '") == -1:
                        return self.return_result("没有注释", sql=chkcol)
                elif sql_str.find('UNIQUE'):
                    if chkcol.find("UNIQUE UNIQ_") == -1:
                        return self.return_result("唯一键命名不规范,请使用UNIQ_开头", sql=chkcol)
                elif sql_str.find('INDEX')!=-1:
                    if chkcol.find.find("IDX_") == -1:
                        return self.return_result("索引命名不规范,请使用IDX_开头", sql=chkcol)
                elif sql_str.find('COLUMN') ==-1:
                    return self.return_result("DDL请使用关键字COLUMN")
