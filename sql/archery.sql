-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: archery
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `archery`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `archery` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `archery`;

--
-- Table structure for table `aliyun_rds_config`
--

DROP TABLE IF EXISTS `aliyun_rds_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aliyun_rds_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rds_dbinstanceid` varchar(100) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_id` (`instance_id`),
  CONSTRAINT `aliyun_rds_config_instance_id_4ad756cc_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliyun_rds_config`
--

LOCK TABLES `aliyun_rds_config` WRITE;
/*!40000 ALTER TABLE `aliyun_rds_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliyun_rds_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'user');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,1,149),(150,1,150),(151,1,151),(152,1,152),(153,1,153),(154,1,154),(155,1,155);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add Scheduled task',6,'add_schedule'),(17,'Can change Scheduled task',6,'change_schedule'),(18,'Can delete Scheduled task',6,'delete_schedule'),(19,'Can add task',7,'add_task'),(20,'Can change task',7,'change_task'),(21,'Can delete task',7,'delete_task'),(22,'Can add Failed task',7,'add_failure'),(23,'Can change Failed task',7,'change_failure'),(24,'Can delete Failed task',7,'delete_failure'),(25,'Can add Successful task',7,'add_success'),(26,'Can change Successful task',7,'change_success'),(27,'Can delete Successful task',7,'delete_success'),(28,'Can add Queued task',8,'add_ormq'),(29,'Can change Queued task',8,'change_ormq'),(30,'Can delete Queued task',8,'delete_ormq'),(31,'Can add 慢日志统计',11,'add_slowquery'),(32,'Can change 慢日志统计',11,'change_slowquery'),(33,'Can delete 慢日志统计',11,'delete_slowquery'),(34,'Can add 慢日志明细',12,'add_slowqueryhistory'),(35,'Can change 慢日志明细',12,'change_slowqueryhistory'),(36,'Can delete 慢日志明细',12,'delete_slowqueryhistory'),(37,'Can add 用户管理',13,'add_users'),(38,'Can change 用户管理',13,'change_users'),(39,'Can delete 用户管理',13,'delete_users'),(40,'Can add 阿里云rds配置',14,'add_aliyunrdsconfig'),(41,'Can change 阿里云rds配置',14,'change_aliyunrdsconfig'),(42,'Can delete 阿里云rds配置',14,'delete_aliyunrdsconfig'),(43,'Can add 系统配置',15,'add_config'),(44,'Can change 系统配置',15,'change_config'),(45,'Can delete 系统配置',15,'delete_config'),(46,'Can add 脱敏字段配置',16,'add_datamaskingcolumns'),(47,'Can change 脱敏字段配置',16,'change_datamaskingcolumns'),(48,'Can delete 脱敏字段配置',16,'delete_datamaskingcolumns'),(49,'Can add 脱敏规则配置',17,'add_datamaskingrules'),(50,'Can change 脱敏规则配置',17,'change_datamaskingrules'),(51,'Can delete 脱敏规则配置',17,'delete_datamaskingrules'),(52,'Can add 实例配置',18,'add_instance'),(53,'Can change 实例配置',18,'change_instance'),(54,'Can delete 实例配置',18,'delete_instance'),(55,'Can add 实例账号列表',19,'add_instanceaccount'),(56,'Can change 实例账号列表',19,'change_instanceaccount'),(57,'Can delete 实例账号列表',19,'delete_instanceaccount'),(58,'Can add 实例数据库',20,'add_instancedatabase'),(59,'Can change 实例数据库',20,'change_instancedatabase'),(60,'Can delete 实例数据库',20,'delete_instancedatabase'),(61,'Can add 实例标签',21,'add_instancetag'),(62,'Can change 实例标签',21,'change_instancetag'),(63,'Can delete 实例标签',21,'delete_instancetag'),(64,'Can add 实例标签关系',22,'add_instancetagrelations'),(65,'Can change 实例标签关系',22,'change_instancetagrelations'),(66,'Can delete 实例标签关系',22,'delete_instancetagrelations'),(67,'Can add 实例参数修改历史',23,'add_paramhistory'),(68,'Can change 实例参数修改历史',23,'change_paramhistory'),(69,'Can delete 实例参数修改历史',23,'delete_paramhistory'),(70,'Can add 实例参数模板配置',24,'add_paramtemplate'),(71,'Can change 实例参数模板配置',24,'change_paramtemplate'),(72,'Can delete 实例参数模板配置',24,'delete_paramtemplate'),(73,'Can add permission',25,'add_permission'),(74,'Can change permission',25,'change_permission'),(75,'Can delete permission',25,'delete_permission'),(76,'菜单 Dashboard',25,'menu_dashboard'),(77,'菜单 SQL审核',25,'menu_sqlcheck'),(78,'菜单 SQL上线',25,'menu_sqlworkflow'),(79,'菜单 SQL分析',25,'menu_sqlanalyze'),(80,'菜单 SQL查询',25,'menu_query'),(81,'菜单 在线查询',25,'menu_sqlquery'),(82,'菜单 权限管理',25,'menu_queryapplylist'),(83,'菜单 SQL优化',25,'menu_sqloptimize'),(84,'菜单 优化工具',25,'menu_sqladvisor'),(85,'菜单 慢查日志',25,'menu_slowquery'),(86,'菜单 实例管理',25,'menu_instance'),(87,'菜单 实例列表',25,'menu_instance_list'),(88,'菜单 会话管理',25,'menu_dbdiagnostic'),(89,'菜单 数据库管理',25,'menu_database'),(90,'菜单 实例账号管理',25,'menu_instance_account'),(91,'菜单 参数配置',25,'menu_param'),(92,'菜单 数据字典',25,'menu_data_dictionary'),(93,'菜单 工具插件',25,'menu_menu_tools'),(94,'菜单 Binlog2SQL',25,'menu_binlog2sql'),(95,'菜单 SchemaSync',25,'menu_schemasync'),(96,'菜单 系统管理',25,'menu_system'),(97,'菜单 相关文档',25,'menu_document'),(98,'提交SQL上线工单',25,'sql_submit'),(99,'审核SQL上线工单',25,'sql_review'),(100,'执行SQL上线工单(资源组粒度)',25,'sql_execute_for_resource_group'),(101,'执行SQL上线工单(仅自己提交的)',25,'sql_execute'),(102,'执行SQL分析',25,'sql_analyze'),(103,'执行SQLAdvisor',25,'optimize_sqladvisor'),(104,'执行SQLTuning',25,'optimize_sqltuning'),(105,'执行SOAR',25,'optimize_soar'),(106,'申请查询权限',25,'query_applypriv'),(107,'管理查询权限',25,'query_mgtpriv'),(108,'审核查询权限',25,'query_review'),(109,'提交SQL查询',25,'query_submit'),(110,'可查询所有实例',25,'query_all_instances'),(111,'可查询所在资源组内的所有实例',25,'query_resource_group_instance'),(112,'查看会话',25,'process_view'),(113,'终止会话',25,'process_kill'),(114,'查看表空间',25,'tablespace_view'),(115,'查看锁信息',25,'trxandlocks_view'),(116,'管理实例账号',25,'instance_account_manage'),(117,'查看实例参数列表',25,'param_view'),(118,'修改实例参数',25,'param_edit'),(119,'导出数据字典',25,'data_dictionary_export'),(120,'Can add 查询日志',26,'add_querylog'),(121,'Can change 查询日志',26,'change_querylog'),(122,'Can delete 查询日志',26,'delete_querylog'),(123,'Can add 查询权限记录',27,'add_queryprivileges'),(124,'Can change 查询权限记录',27,'change_queryprivileges'),(125,'Can delete 查询权限记录',27,'delete_queryprivileges'),(126,'Can add 查询权限申请记录表',28,'add_queryprivilegesapply'),(127,'Can change 查询权限申请记录表',28,'change_queryprivilegesapply'),(128,'Can delete 查询权限申请记录表',28,'delete_queryprivilegesapply'),(129,'Can add 资源组管理',29,'add_resourcegroup'),(130,'Can change 资源组管理',29,'change_resourcegroup'),(131,'Can delete 资源组管理',29,'delete_resourcegroup'),(132,'Can add 资源组关联实例',30,'add_resourcegroup2instance'),(133,'Can change 资源组关联实例',30,'change_resourcegroup2instance'),(134,'Can delete 资源组关联实例',30,'delete_resourcegroup2instance'),(135,'Can add 资源组关联用户',31,'add_resourcegroup2user'),(136,'Can change 资源组关联用户',31,'change_resourcegroup2user'),(137,'Can delete 资源组关联用户',31,'delete_resourcegroup2user'),(138,'Can add SQL工单',32,'add_sqlworkflow'),(139,'Can change SQL工单',32,'change_sqlworkflow'),(140,'Can delete SQL工单',32,'delete_sqlworkflow'),(141,'Can add SQL工单内容',33,'add_sqlworkflowcontent'),(142,'Can change SQL工单内容',33,'change_sqlworkflowcontent'),(143,'Can delete SQL工单内容',33,'delete_sqlworkflowcontent'),(144,'Can add 工作流审批列表',34,'add_workflowaudit'),(145,'Can change 工作流审批列表',34,'change_workflowaudit'),(146,'Can delete 工作流审批列表',34,'delete_workflowaudit'),(147,'Can add 工作流审批明细',35,'add_workflowauditdetail'),(148,'Can change 工作流审批明细',35,'change_workflowauditdetail'),(149,'Can delete 工作流审批明细',35,'delete_workflowauditdetail'),(150,'Can add 审批流程配置',36,'add_workflowauditsetting'),(151,'Can change 审批流程配置',36,'change_workflowauditsetting'),(152,'Can delete 审批流程配置',36,'delete_workflowauditsetting'),(153,'Can add 工作流日志',37,'add_workflowlog'),(154,'Can change 工作流日志',37,'change_workflowlog'),(155,'Can delete 工作流日志',37,'delete_workflowlog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_masking_columns`
--

DROP TABLE IF EXISTS `data_masking_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_masking_columns` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `table_schema` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `column_comment` varchar(1024) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`column_id`),
  KEY `data_masking_columns_instance_id_470661d3_fk_sql_instance_id` (`instance_id`),
  CONSTRAINT `data_masking_columns_instance_id_470661d3_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_masking_columns`
--

LOCK TABLES `data_masking_columns` WRITE;
/*!40000 ALTER TABLE `data_masking_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_masking_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_masking_rules`
--

DROP TABLE IF EXISTS `data_masking_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_masking_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` int(11) NOT NULL,
  `rule_regex` varchar(255) NOT NULL,
  `hide_group` int(11) NOT NULL,
  `rule_desc` varchar(100) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_type` (`rule_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_masking_rules`
--

LOCK TABLES `data_masking_rules` WRITE;
/*!40000 ALTER TABLE `data_masking_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_masking_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_sql_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_sql_users_id` FOREIGN KEY (`user_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-22 15:53:27.699123','1','DRDS测试',1,'[{\"added\": {}}]',29,1),(2,'2019-11-22 15:53:32.139223','1','uat-account',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u5b9e\\u4f8b\\u6807\\u7b7e\\u5173\\u7cfb\", \"object\": \"InstanceTagRelations object (1)\"}}, {\"added\": {\"name\": \"\\u5b9e\\u4f8b\\u6807\\u7b7e\\u5173\\u7cfb\", \"object\": \"InstanceTagRelations object (2)\"}}, {\"added\": {\"name\": \"\\u8d44\\u6e90\\u7ec4\\u5173\\u8054\\u5b9e\\u4f8b\", \"object\": \"ResourceGroup2Instance object (1)\"}}]',18,1),(3,'2019-11-22 15:54:52.599555','2','user',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u8d44\\u6e90\\u7ec4\\u5173\\u8054\\u7528\\u6237\", \"object\": \"ResourceGroup2User object (1)\"}}]',13,1),(4,'2019-11-22 15:55:30.734863','1','user',1,'[{\"added\": {}}]',3,1),(5,'2019-11-22 15:55:45.212333','2','user',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',13,1),(6,'2019-11-22 16:19:15.532650','1','uat-account',2,'[{\"changed\": {\"fields\": [\"db_type\"]}}]',18,1),(7,'2019-11-22 16:22:55.560558','1','uat-account',2,'[{\"changed\": {\"fields\": [\"db_type\"]}}]',18,1),(8,'2019-11-22 16:59:54.025476','2','RDS测试',1,'[{\"added\": {}}]',29,1),(9,'2019-11-22 16:59:56.891107','2','mysql57',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u5b9e\\u4f8b\\u6807\\u7b7e\\u5173\\u7cfb\", \"object\": \"InstanceTagRelations object (3)\"}}, {\"added\": {\"name\": \"\\u5b9e\\u4f8b\\u6807\\u7b7e\\u5173\\u7cfb\", \"object\": \"InstanceTagRelations object (4)\"}}, {\"added\": {\"name\": \"\\u8d44\\u6e90\\u7ec4\\u5173\\u8054\\u5b9e\\u4f8b\", \"object\": \"ResourceGroup2Instance object (2)\"}}]',18,1),(10,'2019-11-22 17:00:49.245280','2','mysql57',2,'[{\"changed\": {\"fields\": [\"host\"]}}]',18,1),(11,'2019-11-22 17:01:20.565431','2','mysql57',2,'[]',18,1),(12,'2019-11-22 17:02:08.449445','2','mysql57',2,'[]',18,1),(13,'2019-11-22 17:18:49.512030','1','uataccount',2,'[{\"changed\": {\"fields\": [\"instance_name\"]}}]',18,1),(14,'2019-11-22 17:20:56.932886','1','uat-account',2,'[{\"changed\": {\"fields\": [\"instance_name\"]}}]',18,1),(15,'2019-11-22 17:21:29.375277','1','uat_account',2,'[{\"changed\": {\"fields\": [\"instance_name\"]}}]',18,1),(16,'2019-11-22 20:38:01.332492','2','mysql57',2,'[{\"changed\": {\"fields\": [\"host\"]}}]',18,1),(17,'2019-11-22 20:39:58.086491','2','mysql57',2,'[]',18,1),(18,'2019-11-23 08:19:15.814698','2','mysql57',2,'[]',18,1),(19,'2019-11-23 08:21:08.193832','2','mysql57',2,'[{\"changed\": {\"fields\": [\"host\"]}}]',18,1),(20,'2019-11-23 08:22:14.650426','2','mysql57',2,'[{\"changed\": {\"fields\": [\"host\"]}}]',18,1),(21,'2019-11-23 08:25:26.853274','2','mysql5',2,'[{\"changed\": {\"fields\": [\"instance_name\"]}}]',18,1),(22,'2019-11-23 11:51:03.425280','1','uat_account',2,'[{\"changed\": {\"fields\": [\"tddlnode\"]}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'django_q','failure'),(8,'django_q','ormq'),(6,'django_q','schedule'),(10,'django_q','success'),(7,'django_q','task'),(5,'sessions','session'),(14,'sql','aliyunrdsconfig'),(15,'sql','config'),(16,'sql','datamaskingcolumns'),(17,'sql','datamaskingrules'),(18,'sql','instance'),(19,'sql','instanceaccount'),(20,'sql','instancedatabase'),(21,'sql','instancetag'),(22,'sql','instancetagrelations'),(23,'sql','paramhistory'),(24,'sql','paramtemplate'),(25,'sql','permission'),(26,'sql','querylog'),(27,'sql','queryprivileges'),(28,'sql','queryprivilegesapply'),(29,'sql','resourcegroup'),(30,'sql','resourcegroup2instance'),(31,'sql','resourcegroup2user'),(11,'sql','slowquery'),(12,'sql','slowqueryhistory'),(32,'sql','sqlworkflow'),(33,'sql','sqlworkflowcontent'),(13,'sql','users'),(34,'sql','workflowaudit'),(35,'sql','workflowauditdetail'),(36,'sql','workflowauditsetting'),(37,'sql','workflowlog');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-22 14:25:21.416473'),(2,'contenttypes','0002_remove_content_type_name','2019-11-22 14:25:21.495321'),(3,'auth','0001_initial','2019-11-22 14:25:21.702821'),(4,'auth','0002_alter_permission_name_max_length','2019-11-22 14:25:21.752275'),(5,'auth','0003_alter_user_email_max_length','2019-11-22 14:25:21.763285'),(6,'auth','0004_alter_user_username_opts','2019-11-22 14:25:21.787807'),(7,'auth','0005_alter_user_last_login_null','2019-11-22 14:25:21.838983'),(8,'auth','0006_require_contenttypes_0002','2019-11-22 14:25:21.842955'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-22 14:25:21.858578'),(10,'auth','0008_alter_user_username_max_length','2019-11-22 14:25:21.875086'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-22 14:25:21.896605'),(12,'sql','0001_initial','2019-11-22 14:25:23.614683'),(13,'admin','0001_initial','2019-11-22 14:25:23.735012'),(14,'admin','0002_logentry_remove_auto_add','2019-11-22 14:25:23.773116'),(15,'django_q','0001_initial','2019-11-22 14:25:23.844319'),(16,'django_q','0002_auto_20150630_1624','2019-11-22 14:25:23.902613'),(17,'django_q','0003_auto_20150708_1326','2019-11-22 14:25:23.973948'),(18,'django_q','0004_auto_20150710_1043','2019-11-22 14:25:23.987277'),(19,'django_q','0005_auto_20150718_1506','2019-11-22 14:25:24.047046'),(20,'django_q','0006_auto_20150805_1817','2019-11-22 14:25:24.084459'),(21,'django_q','0007_ormq','2019-11-22 14:25:24.115829'),(22,'django_q','0008_auto_20160224_1026','2019-11-22 14:25:24.126151'),(23,'django_q','0009_auto_20171009_0915','2019-11-22 14:25:24.163865'),(24,'sessions','0001_initial','2019-11-22 14:25:24.195445');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_ormq`
--

DROP TABLE IF EXISTS `django_q_ormq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_q_ormq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `payload` longtext NOT NULL,
  `lock` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_ormq`
--

LOCK TABLES `django_q_ormq` WRITE;
/*!40000 ALTER TABLE `django_q_ormq` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_ormq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_schedule`
--

DROP TABLE IF EXISTS `django_q_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_q_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func` varchar(256) NOT NULL,
  `hook` varchar(256) DEFAULT NULL,
  `args` longtext,
  `kwargs` longtext,
  `schedule_type` varchar(1) NOT NULL,
  `repeats` int(11) NOT NULL,
  `next_run` datetime(6) DEFAULT NULL,
  `task` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `minutes` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_schedule`
--

LOCK TABLES `django_q_schedule` WRITE;
/*!40000 ALTER TABLE `django_q_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_task`
--

DROP TABLE IF EXISTS `django_q_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_q_task` (
  `name` varchar(100) NOT NULL,
  `func` varchar(256) NOT NULL,
  `hook` varchar(256) DEFAULT NULL,
  `args` longtext,
  `kwargs` longtext,
  `result` longtext,
  `started` datetime(6) NOT NULL,
  `stopped` datetime(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `id` varchar(32) NOT NULL,
  `group` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_task`
--

LOCK TABLES `django_q_task` WRITE;
/*!40000 ALTER TABLE `django_q_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3hsu8weici6wp6mfae9xdoqybvvts8g9','M2FkM2VlNTgxOTgzNjliNzdhNWJkMzBkOWFiZmVkMjczMTVhNzhlYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjZmNzY5OTIwZWExNWI1NTFkMjAxZDU4OTU3MTJmODI0NWNlYzk5In0=','2019-11-23 00:16:32.667842'),('o9lb04v2xyd5pes5azfm03ogox5hte1w','M2FkM2VlNTgxOTgzNjliNzdhNWJkMzBkOWFiZmVkMjczMTVhNzhlYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjZmNzY5OTIwZWExNWI1NTFkMjAxZDU4OTU3MTJmODI0NWNlYzk5In0=','2019-11-23 16:51:03.587874'),('tvdyxb6kk7k6bueasyazsy4x90ek8ts1','M2FkM2VlNTgxOTgzNjliNzdhNWJkMzBkOWFiZmVkMjczMTVhNzhlYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjZmNzY5OTIwZWExNWI1NTFkMjAxZDU4OTU3MTJmODI0NWNlYzk5In0=','2019-11-23 01:55:01.158228');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_account`
--

DROP TABLE IF EXISTS `instance_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL,
  `host` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_account_instance_id_user_host_514c1ac6_uniq` (`instance_id`,`user`,`host`),
  CONSTRAINT `instance_account_instance_id_53a7a305_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_account`
--

LOCK TABLES `instance_account` WRITE;
/*!40000 ALTER TABLE `instance_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_database`
--

DROP TABLE IF EXISTS `instance_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(128) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `owner_display` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_database_instance_id_db_name_d8700935_uniq` (`instance_id`,`db_name`),
  CONSTRAINT `instance_database_instance_id_22c69243_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_database`
--

LOCK TABLES `instance_database` WRITE;
/*!40000 ALTER TABLE `instance_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_history`
--

DROP TABLE IF EXISTS `param_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(64) NOT NULL,
  `old_var` varchar(1024) NOT NULL,
  `new_var` varchar(1024) NOT NULL,
  `set_sql` varchar(1024) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `param_history_instance_id_601e8d3f_fk_sql_instance_id` (`instance_id`),
  CONSTRAINT `param_history_instance_id_601e8d3f_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_history`
--

LOCK TABLES `param_history` WRITE;
/*!40000 ALTER TABLE `param_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `param_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_template`
--

DROP TABLE IF EXISTS `param_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_type` varchar(20) NOT NULL,
  `variable_name` varchar(64) NOT NULL,
  `default_value` varchar(1024) NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `valid_values` varchar(1024) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_template_db_type_variable_name_139c76a6_uniq` (`db_type`,`variable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_template`
--

LOCK TABLES `param_template` WRITE;
/*!40000 ALTER TABLE `param_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `param_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_log`
--

DROP TABLE IF EXISTS `query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `sqllog` longtext NOT NULL,
  `effect_row` bigint(20) NOT NULL,
  `cost_time` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `priv_check` tinyint(1) NOT NULL,
  `hit_rule` tinyint(1) NOT NULL,
  `masking` tinyint(1) NOT NULL,
  `favorite` tinyint(1) NOT NULL,
  `alias` varchar(64) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_log`
--

LOCK TABLES `query_log` WRITE;
/*!40000 ALTER TABLE `query_log` DISABLE KEYS */;
INSERT INTO `query_log` VALUES (1,'uat_account','account','select * from i18n_messages limit 100;',100,'0.038164','admin','',1,0,0,0,'','2019-11-22 17:37:23.206188','2019-11-22 17:37:23.206250'),(2,'uat_account','account','select * from i18n_messages limit 100;',100,'0.024071','admin','',1,0,0,0,'','2019-11-22 17:37:38.243820','2019-11-22 17:37:38.243860'),(3,'uat_account','account','select * from stl_capital_pool_statement limit 100;',100,'0.107757','admin','',1,0,0,0,'','2019-11-22 17:38:56.756257','2019-11-22 17:38:56.756291'),(4,'uat_account','account','select * from stl_capital_pool_statement limit 100;',100,'0.089922','admin','',1,0,0,0,'','2019-11-22 17:50:27.964834','2019-11-22 17:50:27.964895'),(5,'mysql57','tidb','select * from goods limit 100;',8,'0.006676','admin','',1,0,0,0,'','2019-11-22 18:06:49.820069','2019-11-22 18:06:49.820099'),(6,'uat_account','account','select * from stl_capital_pool_statement limit 100;',100,'0.109294','admin','',1,0,0,0,'','2019-11-22 18:32:08.499574','2019-11-22 18:32:08.499629'),(7,'uat_account','account','select * from stl_account_statement limit 100;',100,'0.212064','admin','',1,0,0,0,'','2019-11-22 19:08:16.805444','2019-11-22 19:08:16.805479'),(8,'mysql57','tidb','explain select\n  *\nfrom\n  goods;',1,'0.006348','admin','',1,0,0,0,'','2019-11-22 20:48:52.749702','2019-11-22 20:48:52.749749'),(9,'mysql57','tidb','select\n  *\nfrom\n  goods limit 100;',8,'0.007158','admin','',1,0,0,0,'','2019-11-22 20:48:55.580848','2019-11-22 20:48:55.580918'),(10,'uat_account','account','select * from stl_account_statement limit 100;',100,'0.382671','admin','',1,0,0,0,'','2019-11-23 09:11:30.700196','2019-11-23 09:11:30.700236'),(11,'mysql5','tidb','explain select\n  *\nfrom\n  goods;',1,'0.005075','admin','',1,0,0,0,'','2019-11-23 09:11:51.715600','2019-11-23 09:11:51.715669'),(12,'mysql5','tidb','explain select\n  *\nfrom\n  goods;',1,'0.002231','admin','',1,0,0,0,'','2019-11-23 09:11:54.311247','2019-11-23 09:11:54.311278'),(13,'mysql5','tidb','explain select\n  *\nfrom\n  goods;',1,'0.002204','admin','',1,0,0,0,'','2019-11-23 09:11:54.850905','2019-11-23 09:11:54.850944'),(14,'mysql5','tidb','explain select\n  *\nfrom\n  goods;',1,'0.002186','admin','',1,0,0,0,'','2019-11-23 09:11:55.056892','2019-11-23 09:11:55.056948'),(15,'mysql5','tidb','explain select\n  *\nfrom\n  goods;',1,'0.002169','admin','',1,0,0,0,'','2019-11-23 09:11:55.245243','2019-11-23 09:11:55.245285'),(16,'mysql5','tidb','select\n  *\nfrom\n  goods limit 100;',8,'0.002403','admin','',1,0,0,0,'','2019-11-23 09:12:00.800574','2019-11-23 09:12:00.800603');
/*!40000 ALTER TABLE `query_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_privileges`
--

DROP TABLE IF EXISTS `query_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_privileges` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `valid_date` date NOT NULL,
  `limit_num` int(11) NOT NULL,
  `priv_type` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_id`),
  KEY `query_privileges_user_name_instance_id_db__ed2ad8a3_idx` (`user_name`,`instance_id`,`db_name`,`valid_date`),
  KEY `query_privileges_instance_id_047fcde2_fk_sql_instance_id` (`instance_id`),
  CONSTRAINT `query_privileges_instance_id_047fcde2_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_privileges`
--

LOCK TABLES `query_privileges` WRITE;
/*!40000 ALTER TABLE `query_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_privileges_apply`
--

DROP TABLE IF EXISTS `query_privileges_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_privileges_apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `db_list` longtext NOT NULL,
  `table_list` longtext NOT NULL,
  `valid_date` date NOT NULL,
  `limit_num` int(11) NOT NULL,
  `priv_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `query_privileges_apply_instance_id_bc03347f_fk_sql_instance_id` (`instance_id`),
  CONSTRAINT `query_privileges_apply_instance_id_bc03347f_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_privileges_apply`
--

LOCK TABLES `query_privileges_apply` WRITE;
/*!40000 ALTER TABLE `query_privileges_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_privileges_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group`
--

DROP TABLE IF EXISTS `resource_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_parent_id` bigint(20) NOT NULL,
  `group_sort` int(11) NOT NULL,
  `group_level` int(11) NOT NULL,
  `ding_webhook` varchar(255) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group`
--

LOCK TABLES `resource_group` WRITE;
/*!40000 ALTER TABLE `resource_group` DISABLE KEYS */;
INSERT INTO `resource_group` VALUES (1,'DRDS测试',0,1,1,'',0,'2019-11-22 15:53:27.698300','2019-11-22 15:53:27.698332'),(2,'RDS测试',0,1,1,'',0,'2019-11-22 16:59:54.024250','2019-11-22 16:59:54.024280');
/*!40000 ALTER TABLE `resource_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group_instance`
--

DROP TABLE IF EXISTS `resource_group_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  `resource_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_group_instance_resource_group_id_instan_afb909ad_uniq` (`resource_group_id`,`instance_id`),
  KEY `resource_group_instance_instance_id_12ec2f0e_fk_sql_instance_id` (`instance_id`),
  CONSTRAINT `resource_group_insta_resource_group_id_023e5cd4_fk_resource_` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_group` (`group_id`),
  CONSTRAINT `resource_group_instance_instance_id_12ec2f0e_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group_instance`
--

LOCK TABLES `resource_group_instance` WRITE;
/*!40000 ALTER TABLE `resource_group_instance` DISABLE KEYS */;
INSERT INTO `resource_group_instance` VALUES (1,'2019-11-22 15:53:32.135190',1,1),(2,'2019-11-22 16:59:56.880345',2,2);
/*!40000 ALTER TABLE `resource_group_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group_user`
--

DROP TABLE IF EXISTS `resource_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `resource_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_group_user_resource_group_id_user_id_716fef24_uniq` (`resource_group_id`,`user_id`),
  KEY `resource_group_user_user_id_fcce5de3_fk_sql_users_id` (`user_id`),
  CONSTRAINT `resource_group_user_resource_group_id_46ef9652_fk_resource_` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_group` (`group_id`),
  CONSTRAINT `resource_group_user_user_id_fcce5de3_fk_sql_users_id` FOREIGN KEY (`user_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group_user`
--

LOCK TABLES `resource_group_user` WRITE;
/*!40000 ALTER TABLE `resource_group_user` DISABLE KEYS */;
INSERT INTO `resource_group_user` VALUES (1,'2019-11-22 15:54:52.596361',1,2);
/*!40000 ALTER TABLE `resource_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_config`
--

DROP TABLE IF EXISTS `sql_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_config` (
  `item` varchar(200) NOT NULL,
  `value` varchar(500) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_config`
--

LOCK TABLES `sql_config` WRITE;
/*!40000 ALTER TABLE `sql_config` DISABLE KEYS */;
INSERT INTO `sql_config` VALUES ('admin_query_limit','r1ldhQMGvmgkKRBwj_TerA==',''),('aliyun_ak','BnJSUXJxlgf5K8lnvoXrLg==',''),('aliyun_secret','BnJSUXJxlgf5K8lnvoXrLg==',''),('archery_base_url','BnJSUXJxlgf5K8lnvoXrLg==',''),('auto_review','BnJSUXJxlgf5K8lnvoXrLg==',''),('auto_review_max_update_rows','BnJSUXJxlgf5K8lnvoXrLg==',''),('auto_review_regex','BnJSUXJxlgf5K8lnvoXrLg==',''),('auto_review_tag','BnJSUXJxlgf5K8lnvoXrLg==',''),('auto_review_wrong','suwCkkNSpbcRAXNtf2cZ6g==',''),('binlog2sql','BnJSUXJxlgf5K8lnvoXrLg==',''),('critical_ddl_regex','J83Ju7VpVwYrBQ9UMmtTx7p9eqdtqbRM9J1zuYkAJVSTk3goklVVtA4xEDpDRe9Y',''),('data_masking','BnJSUXJxlgf5K8lnvoXrLg==',''),('ddl_notify_auth_group','BnJSUXJxlgf5K8lnvoXrLg==',''),('default_auth_group','BnJSUXJxlgf5K8lnvoXrLg==',''),('default_resource_group','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_agent_id','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_app_key','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_app_secret','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_archery_username','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_dept_ids','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_to_person','BnJSUXJxlgf5K8lnvoXrLg==',''),('disable_star','BnJSUXJxlgf5K8lnvoXrLg==',''),('enable_backup_switch','vFO44abhNH4MJdz3j7GvdA==',''),('go_inception_host','OhJNTdxUWkqACQYXonuRlQ==',''),('go_inception_port','D_iAIoesr7mmjPtiaS5Qeg==',''),('inception','vFO44abhNH4MJdz3j7GvdA==',''),('inception_host','OhJNTdxUWkqACQYXonuRlQ==',''),('inception_port','m_r65OyTgjNCnwfBdaER4Q==',''),('inception_remote_backup_host','OhJNTdxUWkqACQYXonuRlQ==',''),('inception_remote_backup_password','qiEtMuSKxT4G9ynhuU9prQ==',''),('inception_remote_backup_port','gzj9jvgRHy5zl-GMtpamug==',''),('inception_remote_backup_user','mgc-Oh9sGUWwSFhtQFio4A==',''),('index_path_url','BnJSUXJxlgf5K8lnvoXrLg==',''),('lock_cnt_threshold','BnJSUXJxlgf5K8lnvoXrLg==',''),('lock_time_threshold','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_password','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_port','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_server','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_user','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_ssl','BnJSUXJxlgf5K8lnvoXrLg==',''),('manual','vFO44abhNH4MJdz3j7GvdA==',''),('max_execution_time','oSJr3wLovuOCXJYhVgBVdw==',''),('query_check','BnJSUXJxlgf5K8lnvoXrLg==',''),('schemasync','BnJSUXJxlgf5K8lnvoXrLg==',''),('sign_up_enabled','BnJSUXJxlgf5K8lnvoXrLg==',''),('soar','wN_Y9XF1cjtRiQVFwjNfDQwYtTkUISeCJt05v0HbqsA=',''),('soar_test_dsn','M3dIlPje3CQq5TbB9E6sTALMgpIgevyAMZqMgiD35BnPHouuGD2WBcV5GRA5v5ne',''),('sqladvisor','lfrvwr28wR01uOyjtr9lMp0fEFljmKzQHV_zlYmII2N5fE2MkhmzjPVSKFaA2hK0',''),('wx','BnJSUXJxlgf5K8lnvoXrLg==',''),('wx_agent_id','BnJSUXJxlgf5K8lnvoXrLg==',''),('wx_app_secret','BnJSUXJxlgf5K8lnvoXrLg==',''),('wx_corpid','BnJSUXJxlgf5K8lnvoXrLg==','');
/*!40000 ALTER TABLE `sql_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance`
--

DROP TABLE IF EXISTS `sql_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL,
  `type` varchar(6) NOT NULL,
  `db_type` varchar(20) NOT NULL,
  `tddlnode` varchar(500) NOT NULL DEFAULT '',
  `host` varchar(200) NOT NULL,
  `port` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `charset` varchar(20) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `sid` varchar(50) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_name` (`instance_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance`
--

LOCK TABLES `sql_instance` WRITE;
/*!40000 ALTER TABLE `sql_instance` DISABLE KEYS */;
INSERT INTO `sql_instance` VALUES (1,'uat_account','master','drds','5.drds.aliy','drds7430095w12p5.drds.aliyuncs.com',3306,'5Ytfcq2Ul1uTooUExRMAxA==','pZFs9C_kMVzmRWh7janXqw==','',NULL,NULL,'2019-11-22 15:53:32.129964','2019-11-23 11:51:03.423286'),(2,'mysql5','master','mysql','','192.168.18.1',3306,'mgc-Oh9sGUWwSFhtQFio4A==','oOuyT6wkjrqZryBbJQcIvw==','utf8mb4',NULL,NULL,'2019-11-22 16:59:56.874025','2019-11-23 08:25:26.851210');
/*!40000 ALTER TABLE `sql_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance_tag`
--

DROP TABLE IF EXISTS `sql_instance_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_code` varchar(20) NOT NULL,
  `tag_name` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_code` (`tag_code`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance_tag`
--

LOCK TABLES `sql_instance_tag` WRITE;
/*!40000 ALTER TABLE `sql_instance_tag` DISABLE KEYS */;
INSERT INTO `sql_instance_tag` VALUES (1,'can_write','支持上线',1,'2019-05-03 00:00:00.000000'),(2,'can_read','支持查询',1,'2019-05-03 00:00:00.000000');
/*!40000 ALTER TABLE `sql_instance_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance_tag_relations`
--

DROP TABLE IF EXISTS `sql_instance_tag_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance_tag_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  `instance_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sql_instance_tag_relatio_instance_id_instance_tag_032d14b9_uniq` (`instance_id`,`instance_tag_id`),
  KEY `sql_instance_tag_rel_instance_tag_id_cf22474e_fk_sql_insta` (`instance_tag_id`),
  CONSTRAINT `sql_instance_tag_rel_instance_id_d76eb8bd_fk_sql_insta` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`),
  CONSTRAINT `sql_instance_tag_rel_instance_tag_id_cf22474e_fk_sql_insta` FOREIGN KEY (`instance_tag_id`) REFERENCES `sql_instance_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance_tag_relations`
--

LOCK TABLES `sql_instance_tag_relations` WRITE;
/*!40000 ALTER TABLE `sql_instance_tag_relations` DISABLE KEYS */;
INSERT INTO `sql_instance_tag_relations` VALUES (1,1,'2019-11-22 15:53:32.131160',1,1),(2,1,'2019-11-22 15:53:32.133858',1,2),(3,1,'2019-11-22 16:59:56.876498',2,2),(4,1,'2019-11-22 16:59:56.878947',2,1);
/*!40000 ALTER TABLE `sql_instance_tag_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_permission`
--

DROP TABLE IF EXISTS `sql_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_permission`
--

LOCK TABLES `sql_permission` WRITE;
/*!40000 ALTER TABLE `sql_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sql_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users`
--

DROP TABLE IF EXISTS `sql_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `display` varchar(50) NOT NULL,
  `ding_user_id` varchar(64) DEFAULT NULL,
  `wx_user_id` varchar(64) DEFAULT NULL,
  `failed_login_count` int(11) NOT NULL,
  `last_login_failed_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users`
--

LOCK TABLES `sql_users` WRITE;
/*!40000 ALTER TABLE `sql_users` DISABLE KEYS */;
INSERT INTO `sql_users` VALUES (1,'pbkdf2_sha256$100000$d2SUvJ4ZQQKn$OSZ5+DYAfz5Nc0B+r82oC232tCg8D8Wno6d0eMoXIl8=','2019-11-23 08:17:53.135759',1,'admin','','','dba2019@yimidida.com',1,1,'2019-11-22 14:26:01.846501','',NULL,NULL,0,NULL),(2,'pbkdf2_sha256$100000$tE6UX7Lq3bQD$kemqZ91Kp60bjbwM5WFmZPH3qHH/gbYYue+rexzwjJ0=',NULL,0,'user','','','',0,1,'2019-11-22 15:54:52.000000','user',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `sql_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users_groups`
--

DROP TABLE IF EXISTS `sql_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sql_users_groups_users_id_group_id_4540dddc_uniq` (`users_id`,`group_id`),
  KEY `sql_users_groups_group_id_d572a82e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `sql_users_groups_group_id_d572a82e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `sql_users_groups_users_id_d674bacf_fk_sql_users_id` FOREIGN KEY (`users_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users_groups`
--

LOCK TABLES `sql_users_groups` WRITE;
/*!40000 ALTER TABLE `sql_users_groups` DISABLE KEYS */;
INSERT INTO `sql_users_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `sql_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users_user_permissions`
--

DROP TABLE IF EXISTS `sql_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sql_users_user_permissions_users_id_permission_id_5fffb2bb_uniq` (`users_id`,`permission_id`),
  KEY `sql_users_user_permi_permission_id_e990caab_fk_auth_perm` (`permission_id`),
  CONSTRAINT `sql_users_user_permi_permission_id_e990caab_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `sql_users_user_permissions_users_id_efad14b0_fk_sql_users_id` FOREIGN KEY (`users_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users_user_permissions`
--

LOCK TABLES `sql_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `sql_users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sql_users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_workflow`
--

DROP TABLE IF EXISTS `sql_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_name` varchar(50) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `syntax_type` int(11) NOT NULL,
  `is_backup` tinyint(1) NOT NULL,
  `engineer` varchar(30) NOT NULL,
  `engineer_display` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `run_date_start` datetime(6) DEFAULT NULL,
  `run_date_end` datetime(6) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `finish_time` datetime(6) DEFAULT NULL,
  `is_manual` int(11) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sql_workflow_instance_id_ad34809b_fk_sql_instance_id` (`instance_id`),
  CONSTRAINT `sql_workflow_instance_id_ad34809b_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_workflow`
--

LOCK TABLES `sql_workflow` WRITE;
/*!40000 ALTER TABLE `sql_workflow` DISABLE KEYS */;
INSERT INTO `sql_workflow` VALUES (1,'rds',2,'RDS测试','tidb',2,0,'admin','','workflow_executing','1','2019-11-22 18:08:00.000000','2019-12-01 18:08:00.000000','2019-11-22 18:17:39.697278',NULL,0,2),(2,'drds',2,'DRDS测试','account',2,0,'admin','','workflow_abort','1','2019-11-22 18:08:00.000000','2019-12-01 18:08:00.000000','2019-11-22 18:17:39.697278','2019-11-22 19:11:17.000000',0,1),(3,'rds',2,'RDS测试','tidb',2,0,'admin','','workflow_executing','1',NULL,NULL,'2019-11-22 20:43:45.103889',NULL,0,2),(4,'rds',2,'RDS测试','tidb',2,0,'admin','','workflow_executing','1',NULL,NULL,'2019-11-22 20:44:27.031304',NULL,0,2),(6,'drds',1,'DRDS测试','account',2,0,'admin','','workflow_manreviewing','1',NULL,NULL,'2019-11-23 11:39:27.989093',NULL,0,1);
/*!40000 ALTER TABLE `sql_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_workflow_content`
--

DROP TABLE IF EXISTS `sql_workflow_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_workflow_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_content` longtext NOT NULL,
  `review_content` longtext NOT NULL,
  `execute_result` longtext NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_id` (`workflow_id`),
  CONSTRAINT `sql_workflow_content_workflow_id_3af79b62_fk_sql_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `sql_workflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_workflow_content`
--

LOCK TABLES `sql_workflow_content` WRITE;
/*!40000 ALTER TABLE `sql_workflow_content` DISABLE KEYS */;
INSERT INTO `sql_workflow_content` VALUES (1,'update goods set gprice=999999\r\n where gid=9001;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `tidb`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"update goods set gprice=999999\\r\\nwhere gid=9001\", \"affected_rows\": 1, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',1),(2,'update stl_account_statement\nset dept_code=\'DRDS\'\nwhere statement_id=1987334;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `account`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"update stl_account_statement\nset dept_code=\'DRDS\'\n where statement_id=1987334;\", \"affected_rows\": 1, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',2),(3,'update goods set gprice=999999\r\n where gid=9001;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `tidb`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"update goods set gprice=999999\\r\\n where gid=9001\", \"affected_rows\": 1, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',3),(4,'update goods set gprice=999999\r\n where gid=9001;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit completed\", \"errormessage\": \"None\", \"sql\": \"use `tidb`\", \"affected_rows\": 0, \"sequence\": \"\'0_0_0\'\", \"backup_dbname\": \"None\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit completed\", \"errormessage\": \"None\", \"sql\": \"update goods set gprice=999999\\r\\n where gid=9001\", \"affected_rows\": 1, \"sequence\": \"\'0_0_1\'\", \"backup_dbname\": \"192_168_18_1_3306_tidb\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"\", \"actual_affected_rows\": \"\"}]','',4),(5,'update stl_account_statement\r\nset dept_code=\'DRDS\'\r\nwhere statement_id=1987334;','0','',6);
/*!40000 ALTER TABLE `sql_workflow_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_audit`
--

DROP TABLE IF EXISTS `workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `workflow_id` bigint(20) NOT NULL,
  `workflow_type` int(11) NOT NULL,
  `workflow_title` varchar(50) NOT NULL,
  `workflow_remark` varchar(140) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `current_audit` varchar(20) NOT NULL,
  `next_audit` varchar(20) NOT NULL,
  `current_status` int(11) NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `create_user_display` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_id`),
  UNIQUE KEY `workflow_audit_workflow_id_workflow_type_14044a22_uniq` (`workflow_id`,`workflow_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_audit`
--

LOCK TABLES `workflow_audit` WRITE;
/*!40000 ALTER TABLE `workflow_audit` DISABLE KEYS */;
INSERT INTO `workflow_audit` VALUES (1,2,'RDS测试',1,2,'rds','','1','-1','-1',1,'admin','','2019-11-22 18:17:39.712367','2019-11-22 18:17:39.712404'),(2,2,'DRDS测试',2,2,'drds','','1','1','-1',3,'admin','','2019-11-22 18:17:39.712367','2019-11-22 18:17:39.712404'),(3,2,'RDS测试',3,2,'rds','','1','-1','-1',1,'admin','','2019-11-22 20:43:45.116456','2019-11-22 20:43:45.116496'),(4,2,'RDS测试',4,2,'rds','','1','-1','-1',1,'admin','','2019-11-22 20:44:27.060493','2019-11-22 20:44:27.060563'),(5,1,'DRDS测试',6,2,'drds','','1','1','-1',0,'admin','','2019-11-23 11:39:28.005814','2019-11-23 11:39:28.005847');
/*!40000 ALTER TABLE `workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_audit_detail`
--

DROP TABLE IF EXISTS `workflow_audit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_audit_detail` (
  `audit_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_id` int(11) NOT NULL,
  `audit_user` varchar(30) NOT NULL,
  `audit_time` datetime(6) NOT NULL,
  `audit_status` int(11) NOT NULL,
  `remark` varchar(140) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_audit_detail`
--

LOCK TABLES `workflow_audit_detail` WRITE;
/*!40000 ALTER TABLE `workflow_audit_detail` DISABLE KEYS */;
INSERT INTO `workflow_audit_detail` VALUES (1,1,'admin','2019-11-22 20:33:43.663207',1,'','2019-11-22 20:33:43.663552'),(2,2,'admin','2019-11-22 20:40:54.119271',3,'qq','2019-11-22 20:40:54.119560'),(3,3,'admin','2019-11-22 20:43:46.903260',1,'','2019-11-22 20:43:46.903611'),(4,4,'admin','2019-11-22 20:44:29.293449',1,'','2019-11-22 20:44:29.293619');
/*!40000 ALTER TABLE `workflow_audit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_audit_setting`
--

DROP TABLE IF EXISTS `workflow_audit_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_audit_setting` (
  `audit_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `workflow_type` int(11) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_setting_id`),
  UNIQUE KEY `workflow_audit_setting_group_id_workflow_type_5884053a_uniq` (`group_id`,`workflow_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_audit_setting`
--

LOCK TABLES `workflow_audit_setting` WRITE;
/*!40000 ALTER TABLE `workflow_audit_setting` DISABLE KEYS */;
INSERT INTO `workflow_audit_setting` VALUES (1,1,'DRDS测试',2,'1','2019-11-22 15:55:51.410429','2019-11-22 15:55:51.410456'),(2,2,'RDS测试',2,'1','2019-11-22 18:07:36.477598','2019-11-22 18:07:36.477668');
/*!40000 ALTER TABLE `workflow_audit_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_log`
--

DROP TABLE IF EXISTS `workflow_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_id` int(11) NOT NULL,
  `operation_type` smallint(6) NOT NULL,
  `operation_type_desc` varchar(10) NOT NULL,
  `operation_info` varchar(200) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `operator_display` varchar(50) NOT NULL,
  `operation_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_log_audit_id_71ad84b7` (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_log`
--

LOCK TABLES `workflow_log` WRITE;
/*!40000 ALTER TABLE `workflow_log` DISABLE KEYS */;
INSERT INTO `workflow_log` VALUES (1,1,0,'提交','等待审批，审批流程：user','admin','','2019-11-22 18:17:39.720061'),(2,2,0,'提交','等待审批，审批流程：user','admin','','2019-11-22 18:17:39.720061'),(3,1,1,'审批通过','审批备注：，下级审批：None','admin','','2019-11-22 20:33:43.675799'),(4,1,5,'执行工单','自动操作执行','admin','','2019-11-22 20:33:49.923161'),(5,2,3,'审批取消','取消原因：qq','admin','','2019-11-22 20:40:54.123207'),(6,3,0,'提交','等待审批，审批流程：user','admin','','2019-11-22 20:43:45.124315'),(7,3,1,'审批通过','审批备注：，下级审批：None','admin','','2019-11-22 20:43:46.917016'),(8,3,5,'执行工单','自动操作执行','admin','','2019-11-22 20:43:49.816072'),(9,4,0,'提交','等待审批，审批流程：user','admin','','2019-11-22 20:44:27.081261'),(10,4,1,'审批通过','审批备注：，下级审批：None','admin','','2019-11-22 20:44:29.305735'),(11,4,5,'执行工单','自动操作执行','admin','','2019-11-22 20:44:32.326195'),(12,5,0,'提交','等待审批，审批流程：user','admin','','2019-11-23 11:39:28.017011');
/*!40000 ALTER TABLE `workflow_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-23  5:48:33
