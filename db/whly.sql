/*
Navicat MySQL Data Transfer

Source Server         : eoffice
Source Server Version : 50020
Source Host           : localhost:3306
Source Database       : whly

Target Server Type    : MYSQL
Target Server Version : 50020
File Encoding         : 65001

Date: 2017-10-12 11:23:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.15.1)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.15.1', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  `CREATE_TIME_` datetime default NULL,
  `LAST_UPDATED_TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `DEPLOY_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) collate utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) collate utf8_bin NOT NULL COMMENT '标题',
  `link` varchar(255) collate utf8_bin default NULL COMMENT '文章链接',
  `color` varchar(50) collate utf8_bin default NULL COMMENT '标题颜色',
  `image` varchar(255) collate utf8_bin default NULL COMMENT '文章图片',
  `keywords` varchar(255) collate utf8_bin default NULL COMMENT '关键字',
  `description` varchar(255) collate utf8_bin default NULL COMMENT '描述、摘要',
  `weight` int(11) default '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime default NULL COMMENT '权重期限',
  `hits` int(11) default '0' COMMENT '点击数',
  `posid` varchar(10) collate utf8_bin default NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) collate utf8_bin default NULL COMMENT '自定义内容视图',
  `view_config` text collate utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '3', '文章标题标题标题标题', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('10', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('11', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('12', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('13', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('14', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('15', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('16', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('17', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('18', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('19', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('2', '3', '文章标题标题标题标题', null, 'red', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('20', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('21', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('22', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('23', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('24', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('25', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('26', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('27', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('28', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('29', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('3', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('30', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('31', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('32', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('33', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('34', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('35', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('36', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('37', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('38', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('39', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('4', '3', '文章标题标题标题标题', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('40', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('41', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('42', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('43', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('44', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('45', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('46', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('47', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('48', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('49', '16', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('5', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('50', '17', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('51', '17', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('52', '26', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('53', '26', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('6', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('7', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('8', '4', '文章标题标题标题标题', null, 'blue', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('9', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data`;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `content` text collate utf8_bin COMMENT '文章内容',
  `copyfrom` varchar(255) collate utf8_bin default NULL COMMENT '文章来源',
  `relation` varchar(255) collate utf8_bin default NULL COMMENT '相关文章',
  `allow_comment` char(1) collate utf8_bin default NULL COMMENT '是否允许评论',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章详表';

-- ----------------------------
-- Records of cms_article_data
-- ----------------------------
INSERT INTO `cms_article_data` VALUES ('1', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('10', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('11', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('12', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('13', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('14', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('15', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('16', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('17', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('18', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('19', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('2', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('20', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('21', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('22', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('23', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('24', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('25', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('26', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('27', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('28', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('29', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('3', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('30', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('31', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('32', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('33', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('34', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('35', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('36', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('37', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('38', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('39', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('4', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('40', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('41', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('42', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('43', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('44', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('45', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('46', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('47', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('48', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('49', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('5', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('50', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('51', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('52', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('53', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('6', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('7', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('8', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('9', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) collate utf8_bin default '1' COMMENT '站点编号',
  `office_id` varchar(64) collate utf8_bin default NULL COMMENT '归属机构',
  `module` varchar(20) collate utf8_bin default NULL COMMENT '栏目模块',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '栏目名称',
  `icon` varchar(255) collate utf8_bin default NULL COMMENT 'fontawesome 图标',
  `image` varchar(255) collate utf8_bin default NULL COMMENT '栏目图片',
  `href` varchar(255) collate utf8_bin default NULL COMMENT '链接',
  `target` varchar(20) collate utf8_bin default NULL COMMENT '目标',
  `description` varchar(255) collate utf8_bin default NULL COMMENT '描述',
  `keywords` varchar(255) collate utf8_bin default NULL COMMENT '关键字',
  `sort` int(11) default '30' COMMENT '排序（升序）',
  `in_menu` char(1) collate utf8_bin default '1' COMMENT '是否在导航中显示',
  `in_list` char(1) collate utf8_bin default '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) collate utf8_bin default '0' COMMENT '展现方式',
  `allow_comment` char(1) collate utf8_bin default NULL COMMENT '是否允许评论',
  `is_audit` char(1) collate utf8_bin default NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) collate utf8_bin default NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) collate utf8_bin default NULL COMMENT '自定义内容视图',
  `view_config` text collate utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '0', '0,', '0', '1', null, '顶级栏目', null, null, '/home', null, null, null, '0', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('10', '1', '0,1,', '1', '4', 'article', '软件介绍', 'icon-notebook', '', '/home', '', '', '', '20', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:20:31', null, '0');
INSERT INTO `cms_category` VALUES ('11', '10', '0,1,10,', '1', '4', 'article', '网络工具', 'icon-ghost', '', '/home', '', '', '', '30', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:24:06', null, '0');
INSERT INTO `cms_category` VALUES ('12', '10', '0,1,10,', '1', '4', 'article', '浏览工具', 'icon-game-controller', '', '/home', '', '', '', '40', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:24:16', null, '0');
INSERT INTO `cms_category` VALUES ('13', '10', '0,1,10,', '1', '4', 'article', '浏览辅助', 'icon-fire', '', '/home', '', '', '', '50', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:24:27', null, '0');
INSERT INTO `cms_category` VALUES ('14', '10', '0,1,10,', '1', '4', 'article', '网络优化', 'icon-eyeglasses', '', '/home', '', '', '', '50', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:24:38', null, '0');
INSERT INTO `cms_category` VALUES ('15', '10', '0,1,10,', '1', '4', 'article', '邮件处理', 'icon-envelope-open', '', '/home', '', '', '', '50', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:24:48', null, '0');
INSERT INTO `cms_category` VALUES ('16', '10', '0,1,10,', '1', '4', 'article', '下载工具', 'icon-envelope-letter', '', '/home', '', '', '', '50', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:24:58', null, '0');
INSERT INTO `cms_category` VALUES ('17', '10', '0,1,10,', '1', '4', 'article', '搜索工具', 'icon-energy', '', '/home', '', '', '', '50', '1', '1', '2', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:25:22', null, '0');
INSERT INTO `cms_category` VALUES ('18', '1', '0,1,', '1', '5', 'link', '友情链接', null, null, '/home', null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('19', '18', '0,1,18,', '1', '5', 'link', '常用网站', null, null, '/home', null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('2', '1', '0,1,', '1', '3', 'article', '组织机构', 'icon-umbrella', '', '/home', '', '', '', '10', '1', '1', '0', '0', '1', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:59:34', null, '0');
INSERT INTO `cms_category` VALUES ('20', '18', '0,1,18,', '1', '5', 'link', '门户网站', null, null, '/home', null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('21', '18', '0,1,18,', '1', '5', 'link', '购物网站', null, null, '/home', null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('22', '18', '0,1,18,', '1', '5', 'link', '交友社区', null, null, '/home', null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('23', '18', '0,1,18,', '1', '5', 'link', '音乐视频', null, null, '/home', null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('24', '1', '0,1,', '1', '6', null, '百度一下', null, null, '/home', '_blank', null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('2406efed3be74e15b6ff0909ece1b0d9', '3', '0,1,2,3,', '1', '3', '', '测试', 'icon-magnet', '', '/home', '', '', '', '30', '1', '1', '0', '0', '0', '', '', '', '1', '2017-09-30 14:12:02', '1', '2017-09-30 21:23:15', null, '0');
INSERT INTO `cms_category` VALUES ('25', '1', '0,1,', '1', '6', null, '全文检索', null, null, '/home', null, null, null, '90', '0', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('26', '1', '0,1,', '2', '6', 'article', '测试栏目', null, null, '/home', null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('27', '1', '0,1,', '1', '6', null, '公共留言', null, null, '/home', null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('3', '2', '0,1,2,', '1', '3', 'article', '网站简介', 'icon-mouse', '', '/home', '', '', '', '30', '1', '1', '0', '0', '1', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:23:01', null, '0');
INSERT INTO `cms_category` VALUES ('4', '2', '0,1,2,', '1', '3', 'article', '内部机构', 'icon-hourglass', '', '/home', '', '', '', '40', '1', '1', '0', '0', '1', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:23:38', null, '0');
INSERT INTO `cms_category` VALUES ('5', '2', '0,1,2,', '1', '3', 'article', '地方机构', 'icon-graduation', '', '/home', '', '', '', '50', '1', '1', '0', '0', '1', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:23:52', null, '0');
INSERT INTO `cms_category` VALUES ('6', '1', '0,1,', '1', '3', 'article', '质量检验', 'icon-moustache', '', '/home', '', '', '', '20', '1', '1', '1', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2017-09-30 21:20:54', null, '0');
INSERT INTO `cms_category` VALUES ('6d8cf6d6bc58443e9ab2e14b9b68edf6', '2406efed3be74e15b6ff0909ece1b0d9', '0,1,2,3,2406efed3be74e15b6ff0909ece1b0d9,', '1', '3', '', '菜单1', 'icon-emoticon-smile', '', '/home', '', '', '', '30', '1', '1', '0', '0', '0', '', '', '', '1', '2017-09-30 14:12:21', '1', '2017-09-30 21:25:34', null, '0');
INSERT INTO `cms_category` VALUES ('7', '6', '0,1,6,', '1', '3', 'article', '产品质量', null, null, '/home', null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('8', '6', '0,1,6,', '1', '3', 'article', '技术质量', null, null, '/home', null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('85030076c1ff45499819979498aa749c', '3', '0,1,2,3,', '1', '3', '', '测试2', 'icon-magic-wand', '', '/home', '', '', '', '30', '1', '1', '0', '0', '0', '', '', '', '1', '2017-09-30 14:12:12', '1', '2017-09-30 21:23:25', null, '0');
INSERT INTO `cms_category` VALUES ('8e6e92eb2ece4557bb81c8ce8311e68b', '2406efed3be74e15b6ff0909ece1b0d9', '0,1,2,3,2406efed3be74e15b6ff0909ece1b0d9,', '1', '3', '', '菜单2', 'icon-cursor-move', '', '/home', '', '', '', '30', '0', '0', '0', '0', '0', '', '', '', '1', '2017-09-30 14:12:32', '1', '2017-09-30 21:25:47', null, '0');
INSERT INTO `cms_category` VALUES ('9', '6', '0,1,6,', '1', '3', 'article', '工程质量', null, null, '/home', null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) collate utf8_bin NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) collate utf8_bin NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) collate utf8_bin default NULL COMMENT '栏目内容的标题',
  `content` varchar(255) collate utf8_bin default NULL COMMENT '评论内容',
  `name` varchar(100) collate utf8_bin default NULL COMMENT '评论姓名',
  `ip` varchar(100) collate utf8_bin default NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) collate utf8_bin default NULL COMMENT '审核人',
  `audit_date` datetime default NULL COMMENT '审核时间',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

-- ----------------------------
-- Records of cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_bin NOT NULL COMMENT '留言分类',
  `content` varchar(255) collate utf8_bin NOT NULL COMMENT '留言内容',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(100) collate utf8_bin NOT NULL COMMENT '邮箱',
  `phone` varchar(100) collate utf8_bin NOT NULL COMMENT '电话',
  `workunit` varchar(100) collate utf8_bin NOT NULL COMMENT '单位',
  `ip` varchar(100) collate utf8_bin NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) collate utf8_bin default NULL COMMENT '回复人',
  `re_date` datetime default NULL COMMENT '回复时间',
  `re_content` varchar(100) collate utf8_bin default NULL COMMENT '回复内容',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) collate utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) collate utf8_bin NOT NULL COMMENT '链接名称',
  `color` varchar(50) collate utf8_bin default NULL COMMENT '标题颜色',
  `image` varchar(255) collate utf8_bin default NULL COMMENT '链接图片',
  `href` varchar(255) collate utf8_bin default NULL COMMENT '链接地址',
  `weight` int(11) default '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime default NULL COMMENT '权重期限',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='友情链接';

-- ----------------------------
-- Records of cms_link
-- ----------------------------
INSERT INTO `cms_link` VALUES ('1', '19', 'JeeSite', null, null, 'http://thinkgem.github.com/jeesite', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('10', '22', '58同城', null, null, 'http://www.58.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('11', '23', '视频大全', null, null, 'http://v.360.cn/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('12', '23', '凤凰网', null, null, 'http://www.ifeng.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('2', '19', 'ThinkGem', null, null, 'http://thinkgem.iteye.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('3', '19', '百度一下', null, null, 'http://www.baidu.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('4', '19', '谷歌搜索', null, null, 'http://www.google.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('5', '20', '新浪网', null, null, 'http://www.sina.com.cn', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('6', '20', '腾讯网', null, null, 'http://www.qq.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('7', '21', '淘宝网', null, null, 'http://www.taobao.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('8', '21', '新华网', null, null, 'http://www.xinhuanet.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('9', '22', '赶集网', null, null, 'http://www.ganji.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '站点名称',
  `title` varchar(100) collate utf8_bin NOT NULL COMMENT '站点标题',
  `logo` varchar(255) collate utf8_bin default NULL COMMENT '站点Logo',
  `domain` varchar(255) collate utf8_bin default NULL COMMENT '站点域名',
  `description` varchar(255) collate utf8_bin default NULL COMMENT '描述',
  `keywords` varchar(255) collate utf8_bin default NULL COMMENT '关键字',
  `theme` varchar(255) collate utf8_bin default 'default' COMMENT '主题',
  `copyright` text collate utf8_bin COMMENT '版权信息',
  `custom_index_view` varchar(255) collate utf8_bin default NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点表';

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES ('1', '威海服务业发展局重点服务业企业监测平台', '威海服务业发展局重点服务业企业监测平台', '', null, '', '', 'basic', 0x3C703E0D0A09436F707972696768742026636F70793B2032303137205A756F202D20506F776572656420427920486C736F6674746563683C2F703E, '', '1', '2013-05-27 08:00:00', '1', '2017-10-10 17:28:11', null, '0');

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) collate utf8_bin default NULL COMMENT '名称',
  `category` varchar(2000) collate utf8_bin default NULL COMMENT '分类',
  `package_name` varchar(500) collate utf8_bin default NULL COMMENT '生成包路径',
  `module_name` varchar(30) collate utf8_bin default NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) collate utf8_bin default NULL COMMENT '生成子模块名',
  `function_name` varchar(500) collate utf8_bin default NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) collate utf8_bin default NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) collate utf8_bin default NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) collate utf8_bin default NULL COMMENT '生成表编号',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) collate utf8_bin default NULL COMMENT '名称',
  `comments` varchar(500) collate utf8_bin default NULL COMMENT '描述',
  `class_name` varchar(100) collate utf8_bin default NULL COMMENT '实体类名称',
  `parent_table` varchar(200) collate utf8_bin default NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) collate utf8_bin default NULL COMMENT '关联父表外键',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) collate utf8_bin default NULL COMMENT '归属表编号',
  `name` varchar(200) collate utf8_bin default NULL COMMENT '名称',
  `comments` varchar(500) collate utf8_bin default NULL COMMENT '描述',
  `jdbc_type` varchar(100) collate utf8_bin default NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) collate utf8_bin default NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) collate utf8_bin default NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) collate utf8_bin default NULL COMMENT '是否主键',
  `is_null` char(1) collate utf8_bin default NULL COMMENT '是否可为空',
  `is_insert` char(1) collate utf8_bin default NULL COMMENT '是否为插入字段',
  `is_edit` char(1) collate utf8_bin default NULL COMMENT '是否编辑字段',
  `is_list` char(1) collate utf8_bin default NULL COMMENT '是否列表字段',
  `is_query` char(1) collate utf8_bin default NULL COMMENT '是否查询字段',
  `query_type` varchar(200) collate utf8_bin default NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) collate utf8_bin default NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) collate utf8_bin default NULL COMMENT '字典类型',
  `settings` varchar(2000) collate utf8_bin default NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) default NULL COMMENT '排序（升序）',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) collate utf8_bin default NULL COMMENT '名称',
  `category` varchar(2000) collate utf8_bin default NULL COMMENT '分类',
  `file_path` varchar(500) collate utf8_bin default NULL COMMENT '生成文件路径',
  `file_name` varchar(200) collate utf8_bin default NULL COMMENT '生成文件名',
  `content` text collate utf8_bin COMMENT '内容',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) collate utf8_bin default NULL COMMENT '流程实例编号',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `leave_type` varchar(20) collate utf8_bin default NULL COMMENT '请假类型',
  `reason` varchar(255) collate utf8_bin default NULL COMMENT '请假理由',
  `apply_time` datetime default NULL COMMENT '申请时间',
  `reality_start_time` datetime default NULL COMMENT '实际开始时间',
  `reality_end_time` datetime default NULL COMMENT '实际结束时间',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请假流程表';

-- ----------------------------
-- Records of oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_bin default NULL COMMENT '类型',
  `title` varchar(200) collate utf8_bin default NULL COMMENT '标题',
  `content` varchar(2000) collate utf8_bin default NULL COMMENT '内容',
  `files` varchar(2000) collate utf8_bin default NULL COMMENT '附件',
  `status` char(1) collate utf8_bin default NULL COMMENT '状态',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

-- ----------------------------
-- Records of oa_notify
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) collate utf8_bin default NULL COMMENT '通知通告ID',
  `user_id` varchar(64) collate utf8_bin default NULL COMMENT '接受人',
  `read_flag` char(1) collate utf8_bin default '0' COMMENT '阅读标记',
  `read_date` date default NULL COMMENT '阅读时间',
  PRIMARY KEY  (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

-- ----------------------------
-- Records of oa_notify_record
-- ----------------------------

-- ----------------------------
-- Table structure for oa_test_audit
-- ----------------------------
DROP TABLE IF EXISTS `oa_test_audit`;
CREATE TABLE `oa_test_audit` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) collate utf8_bin default NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) collate utf8_bin default NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) collate utf8_bin default NULL COMMENT '归属部门',
  `POST` varchar(255) collate utf8_bin default NULL COMMENT '岗位',
  `AGE` char(1) collate utf8_bin default NULL COMMENT '性别',
  `EDU` varchar(255) collate utf8_bin default NULL COMMENT '学历',
  `CONTENT` varchar(255) collate utf8_bin default NULL COMMENT '调整原因',
  `OLDA` varchar(255) collate utf8_bin default NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) collate utf8_bin default NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) collate utf8_bin default NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) collate utf8_bin default NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) collate utf8_bin default NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) collate utf8_bin default NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) collate utf8_bin default NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) collate utf8_bin default NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) collate utf8_bin default NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) collate utf8_bin default NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) collate utf8_bin default NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';

-- ----------------------------
-- Records of oa_test_audit
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) collate utf8_bin default NULL COMMENT '区域编码',
  `type` char(1) collate utf8_bin default NULL COMMENT '区域类型',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '济南市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', '50', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', '60', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) collate utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) collate utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) collate utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) collate utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) collate utf8_bin default '0' COMMENT '父级编号',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型\0\0', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型\0\0', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型\0\0', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型\0\0', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型\0\0', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择\0', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型\0\0', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_bin default '1' COMMENT '日志类型',
  `title` varchar(255) collate utf8_bin default '' COMMENT '日志标题',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `remote_addr` varchar(255) collate utf8_bin default NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) collate utf8_bin default NULL COMMENT '用户代理',
  `request_uri` varchar(255) collate utf8_bin default NULL COMMENT '请求URI',
  `method` varchar(5) collate utf8_bin default NULL COMMENT '操作方式',
  `params` text collate utf8_bin COMMENT '操作提交的数据',
  `exception` text collate utf8_bin COMMENT '异常信息',
  PRIMARY KEY  (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('008bcff0144f4eca804a5338df226914', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-10 17:27:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3238, '');
INSERT INTO `sys_log` VALUES ('00d9b614a0474853a1a75c6616d34dad', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 10:20:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('01bbd45c1cc547d592af124d9d023d2f', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:39:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('029f6d0fe2394eada90a65af2d90e8a1', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:25:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('02b5115194224d1b95718e15667bb393', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-10-10 17:33:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('02ba96e64d2248d0b7d4bc7800f5ad75', '1', '内容管理-内容管理', '1', '2017-10-09 10:20:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3664386366366436626335383434336539616232653134623962363865646636, '');
INSERT INTO `sys_log` VALUES ('02c5150ce59c40d5b412053c690bab2c', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 21:45:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('04037c8e1b144278a6a25f92962e07a1', '1', '内容管理-栏目设置-切换站点', '1', '2017-10-09 10:31:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3231, '');
INSERT INTO `sys_log` VALUES ('0403f61cab1142abb78225dc2fa1c324', '1', '内容管理-内容管理', '1', '2017-09-30 14:27:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3664386366366436626335383434336539616232653134623962363865646636, '');
INSERT INTO `sys_log` VALUES ('0408f7edb8c9453ab18bf6b612aa47f6', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:47:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('040cf49b13d24786b2249ba1a607bf12', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-10-10 16:50:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/list', 'GET', 0x706172656E744964733D2669643D, '');
INSERT INTO `sys_log` VALUES ('0511d1f1a44b4886b8497b6179fa48c1', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 21:02:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('05fa23fb54724a62868d88710973a372', '1', '系统登录', '1', '2017-09-30 21:44:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('060e87a264904a5aa30b415cb2e52e7f', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 13:49:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('065bd6d733154fb89d8d464a67101de3', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 21:02:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('06faf549647f44e5bda5a1f6de6ceb48', '1', '内容管理-内容管理', '1', '2017-09-30 14:00:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('07045348790648379acb63cb4ad8bfe7', '1', '内容管理-内容管理-评论管理-查看', '1', '2017-10-10 16:46:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/comment/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('080e47fbdbe74e7884672720174c3233', '1', '系统登录', '1', '2017-09-30 12:53:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('0834f8e4629947f28c2df600f84fd31f', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 20:06:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('0847c79106954f82871acb9d3f3deb71', '1', '内容管理-内容管理', '1', '2017-09-30 21:44:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('09a18e65fd724ea1a3bd933052dee3bb', '1', '系统登录', '1', '2017-09-30 10:39:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('0ae2d56be6134c619b6954c3e0403edd', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:32:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0bb38f9db6424574855a4b7128ced2ce', '1', '在线办公-通知通告-我的通告', '1', '2017-10-10 17:43:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0bee731c36d04bc6bd1aaafd4e3a3960', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:15:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('0c858ddd2c6e4c95bd4a684b5c0aca28', '1', '系统设置-系统设置-角色管理', '1', '2017-09-30 14:33:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('0cccd1a9433d41c48b2cde8414ae4e51', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 14:56:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('0d1343a17e7343be81d9b8be58915dcf', '1', '内容管理-内容管理', '1', '2017-09-30 20:15:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0da76a811ff549c2a102bd02720e1d6e', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 17:32:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'POST', 0x706167654E6F3D312663617465676F72792E6E616D653DE4B88BE8BDBDE5B7A5E585B7267061676553697A653D33302663617465676F72792E69643D3136267469746C653D2664656C466C61673D30, '');
INSERT INTO `sys_log` VALUES ('0e15b4b62e524d5bb3df25b58bad4bf8', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 16:50:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('0e274f318923417282519e7dea77cc99', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-09 10:20:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0f1306a2f9f447d081de0fcd4bfecd12', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:20:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE9A1B6E7BAA7E6A08FE79BAE266B6579776F7264733D2669636F6E3D2069636F6E2D6E6F7465626F6F6B266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313026687265663D26696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D323026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE8BDAFE4BBB6E4BB8BE7BB8D26706172656E742E69643D3126696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('0f30f7c21c8a44c1b0633390779dc481', '1', '内容管理-内容管理', '1', '2017-10-01 10:26:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0f3b8700005042b2a07badf5320489d3', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:10:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('0ff8a095ab0f4b7084e65d8948a173a2', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-10-10 17:36:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('109a07241f264bca86f3a8147d9e92c4', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:09:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('10b645ea69f542df9768ce4d7f02b342', '1', '系统登录', '1', '2017-10-01 10:24:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('10f605fc8d254f9383f22023f5f63502', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:10:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('121ab8b726394b48b55f29728f9fca3e', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 13:14:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('126d3a686edb419982590f9ef40d4f41', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:10:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('12bcd3d896cb4968928e418310e0b232', '1', '系统设置-机构用户-用户管理', '1', '2017-10-09 10:30:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3138, '');
INSERT INTO `sys_log` VALUES ('12e9e9bbdd2643a0a379c76231abe5b1', '1', '代码生成-代码生成-业务表配置', '1', '2017-10-09 10:28:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3132, '');
INSERT INTO `sys_log` VALUES ('137ffaf52788425daf35b9c0126a3bdc', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:30:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('13f109169b174490a9aa1b06c52745ee', '1', '系统登录', '1', '2017-09-30 21:30:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('14a36d93a5b04a55a5faba551c1cd015', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:56:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D33, '');
INSERT INTO `sys_log` VALUES ('155945454bf741949cdd1564489f4455', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 14:12:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE7BD91E7AB99E7AE80E4BB8B266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE6B58BE8AF953226706172656E742E69643D3326637573746F6D436F6E74656E74566965773D2669643D26687265663D26696E4D656E753D3026696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('15b5d0b406f546a3b0c0618e21424a21', '1', '内容管理-栏目设置-切换站点', '1', '2017-10-10 16:49:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F39, '');
INSERT INTO `sys_log` VALUES ('1680b94ccc8d49619c91f9a577ef8a13', '1', '内容管理-栏目设置-站点设置', '1', '2017-09-30 14:02:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('16c42e0aa2ca49228c88680fa1fb623a', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:32:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17355fbcb5ce4b34bde7a4804bf67779', '1', '内容管理-内容管理', '1', '2017-10-10 17:31:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17780244f72b4e1b86d635cd6e3db524', '1', '内容管理-内容管理', '1', '2017-09-30 20:09:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17fa4926f7b148e7989878215662393c', '1', '代码生成-代码生成-业务表配置', '1', '2017-09-30 13:34:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('186a56d64c804ea8a2bb0dcc78e6cafd', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-09 10:31:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3230, '');
INSERT INTO `sys_log` VALUES ('19b1d5b912d14416b5292259501e735a', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-09-30 14:33:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/usertorole', 'POST', 0x5F5F5F74302E393136323431303834393932333533353D2669643D3336366438316339666337313437636139633836393737633962646666653162, '');
INSERT INTO `sys_log` VALUES ('1aa50abbbf3b481199d9d94cab8f3847', '1', '系统设置-系统设置-角色管理', '1', '2017-10-09 10:23:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F39, '');
INSERT INTO `sys_log` VALUES ('1aba6a830d554d86a67fce79cc6ec342', '1', '内容管理-内容管理', '1', '2017-09-30 19:58:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1b17bd0c780a444fbbc2036cb81b5d00', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 20:16:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('1c131a5185df486691894feb7dbcd73d', '1', '系统设置-机构用户-用户管理', '1', '2017-10-10 16:50:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3132, '');
INSERT INTO `sys_log` VALUES ('1c172c11002445ab86ee6e56a1c153f9', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:30:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('1c720ea2cc7c448f8476993203af685c', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-09-30 14:30:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/users', 'GET', 0x6F666669636549643D32, '');
INSERT INTO `sys_log` VALUES ('1d68514a32574104b428f2b5e5fb6a5a', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:25:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D2069636F6E2D656E65726779266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313726687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D353026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE6909CE7B4A2E5B7A5E585B726706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D32, '');
INSERT INTO `sys_log` VALUES ('1db36805ffae4d02a567ff541f55109d', '1', '系统设置-机构用户-用户管理', '1', '2017-10-09 10:20:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('1e92e53936f1479190425c1dd153ea3c', '1', '内容管理-内容管理', '1', '2017-10-01 08:56:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1f6e099f4a774d5e9ceba3854c6c6ae9', '1', '内容管理-内容管理', '1', '2017-10-01 21:02:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1f89cef5ce4b41a9861acf69637a4d5a', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 19:59:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('1fa278de37eb4e2ca9bfb768bb587eeb', '1', '系统设置-系统设置-字典管理-查看', '1', '2017-10-10 17:39:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/dict/form', 'GET', 0x69643D3731, '');
INSERT INTO `sys_log` VALUES ('1ffb87bd4c6345a6b647b717d3ac002c', '1', '系统登录', '1', '2017-09-30 12:43:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('200dce4a266f431db535fd059800a255', '1', '系统登录', '1', '2017-10-09 10:30:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3137, '');
INSERT INTO `sys_log` VALUES ('2018cd5619ec46a5998457b58d48a9b8', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:24:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D69636F6E2D657965676C6173736573266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313426687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D353026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE7BD91E7BB9CE4BC98E58C9626706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('2070512dce92410fa9b1fd23b1eb9525', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:20:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE9A1B6E7BAA7E6A08FE79BAE266B6579776F7264733D2669636F6E3D69636F6E2D706C616E65266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D3226687265663D26696D6167653D266F66666963652E69643D33266D6F64756C653D61727469636C6526697341756469743D3126736F72743D313026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE7BB84E7BB87E69CBAE69E8426706172656E742E69643D3126696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('207084f0d97d4c9bbeafd609f9bdbb82', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:24:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3136, '');
INSERT INTO `sys_log` VALUES ('207c98086b5e437e8aced61574bd9431', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 20:35:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('20bc2a16010f4078b1991d5278aa8bac', '1', '系统设置-机构用户-用户管理', '1', '2017-10-10 17:27:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3236, '');
INSERT INTO `sys_log` VALUES ('20bc5638b9ae431c84054f443914c839', '1', '我的面板-个人信息-修改密码', '1', '2017-10-10 17:30:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2121623cbc184054a488544f6865e9c2', '1', '系统设置-机构用户-用户管理', '1', '2017-10-01 08:56:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('215db24135404601a9d05e719bc306d3', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:09:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('21df783fb8d1441a82164d6f19252cf4', '1', '内容管理-内容管理-内容发布', '1', '2017-10-10 16:45:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('22018cd5051f49368ce55119759301bf', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 11:10:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('221468dc1ec54104865afcc721bd1687', '1', '系统登录', '1', '2017-09-30 12:36:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('231a6ba8bd9042ec81f10e4aa61bfb72', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 12:43:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2335c3fa69dd4a7e8e0243593a3929fd', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 16:46:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D38, '');
INSERT INTO `sys_log` VALUES ('23d4c63a98994f9cb668077212e9f0bb', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:25:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('23fe1fb020cc4acea328391e5a3a120e', '1', '系统登录', '1', '2017-10-01 09:03:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('255d4654ef00491182220a9002026db7', '2', '', '1', '2017-10-01 21:05:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/front/r/home', 'GET', '', 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A20505743363033333A20556E61626C6520746F20636F6D70696C6520636C61737320666F72204A53500A0A505743363139373A20416E206572726F72206F63637572726564206174206C696E653A203120696E20746865206A73702066696C653A202F5745422D494E462F76696577732F6572726F722F3530302E6A73700A505743363139393A2047656E65726174656420736572766C6574206572726F723A0A5468652074797065206A6176612E6C616E672E4368617253657175656E63652063616E6E6F74206265207265736F6C7665642E20497420697320696E6469726563746C79207265666572656E6365642066726F6D207265717569726564202E636C6173732066696C65730A0A0D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E44656661756C744572726F7248616E646C65722E6A617661634572726F722844656661756C744572726F7248616E646C65722E6A6176613A313037290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6A617661634572726F72284572726F72446973706174636865722E6A6176613A323830290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E67656E6572617465436C61737328436F6D70696C65722E6A6176613A333530290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E636F6D70696C6528436F6D70696C65722E6A6176613A343131290D0A096174206F72672E6170616368652E6A61737065722E4A7370436F6D70696C6174696F6E436F6E746578742E636F6D70696C65284A7370436F6D70696C6174696F6E436F6E746578742E6A6176613A353932290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333434290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E696E636C75646528446973706174636865722E6A6176613A313932290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323031290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A);
INSERT INTO `sys_log` VALUES ('25b6797ad63149da823e278b5322122a', '1', '内容管理-内容管理', '1', '2017-09-30 20:05:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('262493821153442f944576191bf5fee4', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:23:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D35, '');
INSERT INTO `sys_log` VALUES ('271a8da6b2424ad0b459cb4cd3135735', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 19:58:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('276c0c026d03427889d1da6d35dc01ac', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 16:45:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D35, '');
INSERT INTO `sys_log` VALUES ('277dd442a685482b8aad9c4de5e5b2fc', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 09:41:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('283734707d194b338e7079c866f3d266', '1', '我的面板-个人信息-个人信息', '1', '2017-10-10 17:43:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3231, '');
INSERT INTO `sys_log` VALUES ('285ababcdd644cc599549423f010c898', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:24:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2875544ce27e430c9de801f3c00d6614', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:13:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('2889b309bcfe4b7f9983032fe4a6cfd5', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:11:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('28dafe51a6e742f8b37ca3c3a2b87ae1', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 14:00:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('2990d1c75c2e460d9e88be3e5ad3cc35', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:23:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('29debb64d109471980f034754aced2b7', '1', '系统设置-系统设置-菜单管理', '1', '2017-10-10 16:52:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3135, '');
INSERT INTO `sys_log` VALUES ('2a9f36a023a74b09997c76eb09d43fae', '1', '内容管理-内容管理', '1', '2017-09-30 14:28:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3664386366366436626335383434336539616232653134623962363865646636, '');
INSERT INTO `sys_log` VALUES ('2b4b97f4f3c542af9454ee8435b1b31c', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-10-09 10:21:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('2b9e8f1b1dd644e38bba2e4ccda61473', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-10-10 17:37:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', 0x69643D3237, '');
INSERT INTO `sys_log` VALUES ('2c09f148642a48ef8f6fe05302d8742c', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:24:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('2d25e5f91b1d4c8fb861020b27990378', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 12:36:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('2d5e904f32ae4045a13e2bf3f1071604', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 16:50:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2de2b5b738194b4fbcdaa63548f287ef', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:32:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('2df817d7f8db4cb5a3dcf025901c33bc', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:10:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3134, '');
INSERT INTO `sys_log` VALUES ('2e1aad6a1ad04c8da8d7f974054863b9', '1', '内容管理-内容管理', '1', '2017-10-10 17:47:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2e20266d4e88494889958fa7fae9f959', '1', '内容管理-内容管理', '1', '2017-10-09 10:31:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f47d844f93b434c8a3aed4b4d40ac06', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 20:35:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('306185800a5f4f48b734308325591c41', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:10:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('30d307ae28034bfb89c6e7e167269ebe', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:58:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('30f64300c7164c7f93a7d4994dd6f68c', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:48:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('31020121691442c691f288be2bbe0a63', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:10:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('31029b7c53db4c28a039a088ede1ae1a', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:30:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('310fba7a6ec54acaa5d9ca7200181962', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 17:35:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('31c0e24616654c42ae4cfb802b6219fd', '1', '系统设置-系统设置-角色管理', '1', '2017-09-30 14:28:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('32024495b962464bb2b84adc98bf716d', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:16:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('3238d16e03aa446d8a33bda1f5fff1aa', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 13:34:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3248291fce7746da9ece5f2bb41f14ef', '1', '系统登录', '1', '2017-09-30 11:10:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('32f6f9ecff3540a295dcf374d3f5f4a5', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:37:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3384c89e783a4473b5302a3b7afbc4e6', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 13:50:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('338772f3abe84565bb111a7ed4a18355', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 12:38:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('33dd08f1574c482e9192e8653d016c14', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:56:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('33e0a813d0b44665b5f84a05f9870149', '1', '系统登录', '1', '2017-09-30 09:27:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('34f6c06316a9499dbf054fcfbd808421', '1', '系统登录', '1', '2017-09-30 13:00:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3558c3ba1dc14cc59bfe2d3847fdc440', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:08:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('355d440fb2974635954704f8420cb496', '1', '在线办公-个人办公-审批测试', '1', '2017-10-09 10:32:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/testAudit', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3332, '');
INSERT INTO `sys_log` VALUES ('35d3af29786044b6a4e762ba54a8e99f', '1', '内容管理-内容管理', '1', '2017-10-01 10:24:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('362892f4fd6e4eb4960c0541ee78b720', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-09-30 14:29:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/assign', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('363074b135004218b14568402986c35c', '1', '代码生成-代码生成-生成方案配置', '1', '2017-10-10 17:42:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genScheme', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3139, '');
INSERT INTO `sys_log` VALUES ('366b7f5e19d44048aed9e48890b9999f', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:30:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('36c252d290d94870b059325837dd65da', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:24:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D69636F6E2D67616D652D636F6E74726F6C6C6572266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313226687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D343026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE6B58FE8A788E5B7A5E585B726706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('37189c9ccdf544f79724b40cb34950c7', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:19:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('3756c37d378c447eb026d769f2dbb141', '2', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:06:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A202F5745422D494E462F76696577732F6D6F64756C65732F636D732F63617465676F72794C6973742E6A73702834362C31372920505743363033383A2022247B74706C2E6872656620656D7074792027273A74706C2E687265667D2220636F6E7461696E7320696E76616C69642065787072657373696F6E2873293A206A617661782E656C2E454C457863657074696F6E3A204572726F722050617273696E673A20247B74706C2E6872656620656D7074792027273A74706C2E687265667D0D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E44656661756C744572726F7248616E646C65722E6A73704572726F722844656661756C744572726F7248616E646C65722E6A6176613A3632290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6469737061746368284572726F72446973706174636865722E6A6176613A333537290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6A73704572726F72284572726F72446973706174636865722E6A6176613A313639290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4A73705574696C2E76616C696461746545787072657373696F6E73284A73705574696C2E6A6176613A363333290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722456616C696461746556697369746F722E76697369742856616C696461746F722E6A6176613A373336290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F646524454C45787072657373696F6E2E616363657074284E6F64652E6A6176613A393239290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F6465244E6F6465732E7669736974284E6F64652E6A6176613A32323537290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F64652456697369746F722E7669736974426F6479284E6F64652E6A6176613A32333037290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722456616C696461746556697369746F722E76697369742856616C696461746F722E6A6176613A383534290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F646524437573746F6D5461672E616363657074284E6F64652E6A6176613A31343832290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F6465244E6F6465732E7669736974284E6F64652E6A6176613A32323537290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F64652456697369746F722E7669736974426F6479284E6F64652E6A6176613A32333037290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F64652456697369746F722E7669736974284E6F64652E6A6176613A32333133290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F646524526F6F742E616363657074284E6F64652E6A6176613A343831290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F6465244E6F6465732E7669736974284E6F64652E6A6176613A32323537290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722E76616C69646174652856616C696461746F722E6A6176613A31383337290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E67656E65726174654A61766128436F6D70696C65722E6A6176613A313935290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E636F6D70696C6528436F6D70696C65722E6A6176613A343039290D0A096174206F72672E6170616368652E6A61737065722E4A7370436F6D70696C6174696F6E436F6E746578742E636F6D70696C65284A7370436F6D70696C6174696F6E436F6E746578742E6A6176613A353932290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333434290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A333237290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313236290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323039290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A);
INSERT INTO `sys_log` VALUES ('381971f02b2e4b8cb94bfad35bde5335', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:24:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3133, '');
INSERT INTO `sys_log` VALUES ('38955e65b945417191df9e9538cfdfbe', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-10 17:28:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('39a30f25090942708c3430c08289bd4f', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:07:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('3a1df238d0604dddb5be0e103c96b268', '1', '内容管理-内容管理', '1', '2017-09-30 21:22:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3ac9281b2aaa42b3932ba7783c9cfef0', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-09 10:21:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('3adc3e1a067a4b51976a36f76e692a17', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 14:12:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('3b06f3ea2f14420692af9dda26453f47', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-10-01 21:04:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/save', 'POST', 0x636F6E6669726D4E657750617373776F72643D266E6F3D30303034266F66666963652E69643D3426726F6C6549644C6973743D33265F726F6C6549644C6973743D6F6E266D6F62696C653D2670686F746F3D266E657750617373776F72643D266F6C644C6F67696E4E616D653D73645F736362266C6F67696E466C61673D3126636F6D70616E792E69643D312670686F6E653D266F66666963652E6E616D653DE5B882E59CBAE983A8266C6F67696E4E616D653D7A7162266E616D653DE5B882E59CBAE983A82669643D3426636F6D70616E792E6E616D653DE5B1B1E4B89CE79C81E680BBE585ACE58FB82675736572547970653D26656D61696C3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('3bfbcec129bc4781b7771f9998bde402', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:11:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('3d08cf90d2d54f9e8b2c67b63d3c5970', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:23:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE7BB84E7BB87E69CBAE69E84266B6579776F7264733D2669636F6E3D69636F6E2D6D6F757365266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D3326687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D61727469636C6526697341756469743D3126736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE7BD91E7AB99E7AE80E4BB8B26706172656E742E69643D3226696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('3d7828db97a24986945502b138f6df41', '1', '系统登录', '1', '2017-09-30 19:58:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3db19c19007142669a08938cc49e5009', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:23:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3835303330303736633166663435343939383139393739343938616137343963, '');
INSERT INTO `sys_log` VALUES ('3dcfebbc2eec47d1b0d98850894f67d4', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-09-30 14:34:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/assignrole', 'POST', 0x6964734172723D312C31302C31312C31322C322C332C342C352C362C372C382C392669643D3336366438316339666337313437636139633836393737633962646666653162, '');
INSERT INTO `sys_log` VALUES ('3e375b91b5464a7fbad05177f77285c8', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 19:58:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('3e578d199fc94046b91deda23bd54e31', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-09-30 14:31:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3e838a40717c4e46ac12e424214c8722', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 08:58:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('3eafc42bc08745a5a589b121c675e5ca', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 16:46:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D3137, '');
INSERT INTO `sys_log` VALUES ('3ee7731f98b447d1943295222da5fb53', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 21:45:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('3efcb54061134f5ea1de89ee010fcb03', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-09-30 14:32:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', 0x69643D6564663166383263383239333465666161356563656637383231393831333839, '');
INSERT INTO `sys_log` VALUES ('3f3ebb89bc444b5d8a63295592946322', '1', '内容管理-内容管理', '1', '2017-09-30 14:27:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3fa3054fd42040b481eb1eab0aaa8ea1', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 19:58:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('3fce3e5e30bc4c678b69d9221b6b9faa', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 14:32:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4004aedd6b7d4317a572013bb603e628', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:32:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3835303330303736633166663435343939383139393739343938616137343963, '');
INSERT INTO `sys_log` VALUES ('41b075a65d154fc391d8bbbbf94f4965', '1', '在线办公-通知通告-通告管理', '1', '2017-10-09 10:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3330, '');
INSERT INTO `sys_log` VALUES ('42de3856463545c29268518e3e494a91', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 08:56:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('42e27fdd2ffa4f8b82c9f6ff498254e2', '1', '系统登录', '1', '2017-10-01 10:26:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('42f50b63ba3e4531824b1f1eadff9cef', '1', '系统登录', '1', '2017-09-30 13:47:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('42f9f024b7c343d393cc373a67ab6181', '1', '在线办公-通知通告-我的通告', '1', '2017-10-10 17:43:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3230, '');
INSERT INTO `sys_log` VALUES ('4314ecd4950e48aaa17f9f7340c562ca', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:38:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('4320ce93a5604daca18dce30fb8d2641', '1', '系统登录', '1', '2017-09-30 12:52:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('43328dc155174ffcaf4ee035be7166e8', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-09-30 14:01:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('439bd8fd14ab4256906a4e1e5dfd5133', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-01 10:20:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('439fd022f173485bb3dc8a33e36f1c59', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 13:07:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('453233b2d85e4f869a971cda669ebac2', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:20:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE9A1B6E7BAA7E6A08FE79BAE266B6579776F7264733D2669636F6E3D69636F6E2D6D6F75737461636865266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D3626687265663D26696D6167653D266F66666963652E69643D33266D6F64756C653D61727469636C6526697341756469743D3026736F72743D323026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE8B4A8E9878FE6A380E9AA8C26706172656E742E69643D3126696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D31, '');
INSERT INTO `sys_log` VALUES ('4549ded461814cec9b7a63554c0b6234', '1', '代码生成-生成示例-单表', '1', '2017-10-09 10:29:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/test/testData', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3134, '');
INSERT INTO `sys_log` VALUES ('454d97bce53a4e3d95e2555afccaff30', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 12:59:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('45829e2bc9a54421b482b5722e204e6e', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:09:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('46972caeb8744f1a90beca19cac39bb0', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 21:19:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('46a9f1104d87406a8f025ae520ce7b8b', '1', '系统登录', '1', '2017-09-30 13:07:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('46c67b44059a45118fb0aabd38504914', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:13:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('46ee9af9db5049ce9406c3f9a75ad7cd', '1', '系统登录', '1', '2017-10-01 20:15:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('47482ffba2a24bf9b0ceaeafa8dff78d', '1', '内容管理-内容管理', '1', '2017-09-30 14:27:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('475aea434d714a039acc9105746896da', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:39:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('476b0fa7f1ea4adc8d75a61d9af3f4a7', '1', '内容管理-内容管理-内容发布', '1', '2017-10-09 10:20:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('478e66a6a26a4901b39d2b28c401950d', '1', '系统登录', '1', '2017-09-30 10:06:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('4928961f4df24715be7eac37128640ec', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 13:51:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D37, '');
INSERT INTO `sys_log` VALUES ('4a3c473ebab945dd92f2e7841ebfd81d', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:05:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('4b15684fad08407691823ec31d8f4469', '1', '系统设置-机构用户-机构管理', '1', '2017-10-10 16:50:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3133, '');
INSERT INTO `sys_log` VALUES ('4b3f9b50a4d54213a1cff1aacd053325', '1', '代码生成-生成示例-主子表', '1', '2017-10-10 16:58:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/test/testDataMain', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3233, '');
INSERT INTO `sys_log` VALUES ('4c13d8e2047942c9aa97b1b4971f6eb0', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:08:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('4c6c89c17b5240e0b1f3c90a777c6877', '1', '内容管理-内容管理', '1', '2017-10-10 17:27:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4cb842de1a634b68a2852108b994594b', '1', '内容管理-内容管理', '1', '2017-09-30 14:56:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4d068228799f41a6b5f63af0c667ca14', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:00:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('4db0a3a7644349b88e92e954302dbe32', '1', '系统设置-系统设置-字典管理-查看', '1', '2017-10-10 16:55:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/dict/form', 'GET', 0x747970653D6163745F63617465676F7279266465736372697074696F6E3DE6B581E7A88BE58886E7B1BB26736F72743D3230, '');
INSERT INTO `sys_log` VALUES ('500e42f649034410a8789d1e9dc37027', '1', '系统登录', '1', '2017-10-10 17:27:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3236, '');
INSERT INTO `sys_log` VALUES ('5179a1fde58844199c287b6bc1252cfb', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 14:28:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('51fe0a6859304d218444b441a0c4e116', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:07:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('523a63bb177945a0afc09fc5dd5cab8d', '1', '内容管理-内容管理', '1', '2017-09-30 20:30:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('529eafe3fab04f19b1319c83ccc38367', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 17:32:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D3136, '');
INSERT INTO `sys_log` VALUES ('52b54b2056c945cc945384e33be0232e', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:45:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('532d713d1412431b874256cc813b71fe', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 08:56:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('536efe886c69475fb3658641055fe3bc', '1', '在线办公-个人办公-我的任务', '1', '2017-10-09 10:33:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/act/task/todo/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('53cc5848be8c43cd8bff918659ce4841', '1', '内容管理-内容管理', '1', '2017-09-30 20:11:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('543dcd50e8ac49e697c997942eba542d', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:25:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5442e8e3def648d3a71d00c7d6f108cd', '1', '系统设置-系统设置-字典管理', '1', '2017-10-09 10:22:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/dict/', 'POST', 0x7061676553697A653D3330266465736372697074696F6E3D26747970653D26706167654E6F3D32, '');
INSERT INTO `sys_log` VALUES ('545d87cc805c4dc4af6cdb6eb2fbadcc', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-09-30 14:33:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('54f6318bd5fc4cfc9f37a6d7a44e9daa', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 13:34:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('557282858230492f93edb5ea2b81ee23', '1', '代码生成-代码生成-业务表配置', '1', '2017-10-09 10:36:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F37, '');
INSERT INTO `sys_log` VALUES ('561825cdf65b47578d74036c74ba4a41', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:25:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE6B58BE8AF95266B6579776F7264733D2669636F6E3D69636F6E2D637572736F722D6D6F7665266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D386536653932656232656365343535376262383163386365383331316536386226687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D26697341756469743D3026736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE88F9CE58D953226706172656E742E69643D323430366566656433626537346531356236666630393039656365316230643926696E4D656E753D3026696E4C6973743D302673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('56f23edd16934cbe8b43034aea34a7f6', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:24:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3132, '');
INSERT INTO `sys_log` VALUES ('5743db3f37c94ccca12dbc561d70d008', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:57:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('5752f6e873934b9faf36e4ca1147d6b2', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:10:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('5796a2f44b8b4258a1d770c45564d1a7', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:24:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3134, '');
INSERT INTO `sys_log` VALUES ('5797392389b54d50a9a551ac4e88e426', '1', '系统设置-机构用户-用户管理', '1', '2017-10-09 10:36:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F38, '');
INSERT INTO `sys_log` VALUES ('57a7d591003a494290550ddc8d3ab3e5', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 21:03:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/form', 'GET', 0x69643D33, '');
INSERT INTO `sys_log` VALUES ('5825714ec3b64a33b118d2fae8520b27', '1', '内容管理-内容管理-公共留言-查看', '1', '2017-10-09 10:31:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/guestbook/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3236267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('592ad3c71f2c40a592f45441f755d3e1', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:24:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3131, '');
INSERT INTO `sys_log` VALUES ('592f3438ffdd4c46aeab584f21e4a766', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:06:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('5940dcb9b8fc46b288b76f08a82c1f95', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 09:29:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('5975a4660f3748d2b77d91e9c7cff08b', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:09:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('59bd22cd48034370b1fb32dc9468a807', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 09:28:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('5a2dfd1a1de64d32aa1c558aa70e1574', '1', '系统登录', '1', '2017-09-30 13:10:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('5a6b56e54e854332843f8a29e0b37131', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 20:30:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE6B58BE8AF95266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE88F9CE58D953126706172656E742E69643D323430366566656433626537346531356236666630393039656365316230643926637573746F6D436F6E74656E74566965773D2669643D366438636636643662633538343433653961623265313462396236386564663626687265663D2F66726F6E742F722F686F6D6526696E4D656E753D3126696E4C6973743D302673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('5adbb6b97243414db187535b11aa4147', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 16:46:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D3133, '');
INSERT INTO `sys_log` VALUES ('5b1ae3de827e47bfb10132997aa683b6', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 20:35:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('5b770f0106984840be8251b656c7a1e2', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 21:03:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('5bb90797df304b02bd93ddbfb114b608', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-10 17:33:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F37, '');
INSERT INTO `sys_log` VALUES ('5bff930fbd844d0a8cb48437944c44bc', '1', '内容管理-内容管理-评论管理-查看', '1', '2017-10-09 10:31:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/comment/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3235267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('5c42117d67e442d7abbf3c3a4f587dea', '1', '在线办公-通知通告-我的通告', '1', '2017-10-09 10:37:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3130, '');
INSERT INTO `sys_log` VALUES ('5dc50954a8374c1f80629fbc706ea75a', '1', '内容管理-栏目设置-切换站点', '1', '2017-09-30 13:34:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('5dddcdef360742a798f575d6e77a691a', '1', '内容管理-内容管理', '1', '2017-10-01 08:56:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5e72478c89ed47f3af6904765f49e00c', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-10 16:48:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('5e8ecef3cb3e4ae9a5e65623ab90e3ce', '1', '系统登录', '1', '2017-09-30 10:39:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5eb64a0eb6e64f43aeb262b4cf74475d', '1', '内容管理-内容管理-评论管理-查看', '1', '2017-10-10 17:32:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/comment/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('5fb8f7eca3794ff9979c54cfaf9ac235', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:09:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('6090f46302864b6ba0cf4c2349447260', '1', '内容管理-内容管理-内容发布', '1', '2017-10-10 17:31:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('609e69d3a4c943dba7925131ae7edad5', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-01 10:24:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('60b1098d454b467e93c6c64bac9769a9', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-10-10 17:38:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/assign', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('6129b0816d854e71ad002d4402fbc109', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:57:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('616ab60f66e54c59b8d1b04129aca0ad', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:51:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('61d363bef5484bdaa6e181b1eb2c8769', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:25:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3664386366366436626335383434336539616232653134623962363865646636, '');
INSERT INTO `sys_log` VALUES ('61e89d2cad4d43df869d8815dc7aa382', '1', '在线办公-通知通告-我的通告', '1', '2017-10-09 10:33:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('61feefe7a24d43009eb927c881cb1755', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-10 16:46:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F37, '');
INSERT INTO `sys_log` VALUES ('653ad3443573483bb1aed3eed6c6c4ea', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:07:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('65db0670e281422fa4de5763a6ccb88c', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:23:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('66395867ca6c49beaa72a6e7279ff0d6', '1', '内容管理-内容管理', '1', '2017-09-30 13:14:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('66869ff32b2e4518a3161156eeb1bb1f', '1', '内容管理-内容管理', '1', '2017-09-30 20:05:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('676333b81a394ad98b044f86b05d1bbe', '1', '系统设置-机构用户-区域管理', '1', '2017-10-10 16:51:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/area/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3134, '');
INSERT INTO `sys_log` VALUES ('67813edad14142aab677a3f57489684f', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 12:36:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('67c5e7dba88e4f0aa0b1a83e2ca0cd72', '1', '内容管理-内容管理', '1', '2017-09-30 20:32:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('67db8c412bbb40a4814ddd5607aa57e5', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-09 10:30:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('68010b4e1da04830a347fcc22078d0ce', '1', '我的面板-个人信息-个人信息', '1', '2017-10-09 10:32:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3237, '');
INSERT INTO `sys_log` VALUES ('683cc59a109a41f388f9c5afc7977c7a', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:38:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('68b63d142b524b72bb13e62d88774ad6', '1', '内容管理-栏目设置-切换站点', '1', '2017-09-30 13:34:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('690ae2294f844450b869a8a1d0e325d0', '1', '内容管理-内容管理', '1', '2017-09-30 21:45:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('692b95fb576e44508b288c244041a592', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:15:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('699693ca69b54c2fbc4f43f66715f6e8', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:19:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('69c042ccac424f92bdf6b644c2f864c4', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:22:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('6af068c6c6df42879f57fdbedf151625', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-10-10 16:54:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('6b771fffde154a0d9bbc98ebcddbc98e', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-09-30 14:06:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('6b87e45425e3455eb286f8dcf6834f1a', '1', '内容管理-内容管理', '1', '2017-10-01 20:15:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6bb000d3fdc949199e8126f9c487a13d', '1', '内容管理-内容管理', '1', '2017-09-30 14:27:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6bda2098c9954b35960fb201fd4c59cd', '1', '系统登录', '1', '2017-09-30 20:30:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('6be4f3c1d8124a3db653ea481d2d1209', '1', '系统设置-系统设置-角色管理', '1', '2017-10-10 16:53:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3136, '');
INSERT INTO `sys_log` VALUES ('6c1ad691bec840d181429788d0603aa3', '1', '系统设置-系统设置-菜单管理', '1', '2017-10-09 10:24:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3130, '');
INSERT INTO `sys_log` VALUES ('6c1c8f8aaff64ee380f7d823a81a0077', '1', '系统登录', '1', '2017-09-30 10:03:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('6cc67c8c0e134cb2a22888dad8d57e4a', '1', '在线办公-通知通告-通告管理', '1', '2017-10-09 10:33:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('6e0ab7999b844e219e0b2952c7cb1332', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:24:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6e6fdbb0e9004a79afe664128ad12fb9', '1', '系统登录', '1', '2017-10-10 17:47:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3232, '');
INSERT INTO `sys_log` VALUES ('6f1528f419dd4f4ea5e02845a2cb0469', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 21:45:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('6fc7603b497f45f7ae23626b623c7d69', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:55:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('6fd05f1ea4ad4aa4a492633e43c58f04', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 14:27:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('70445ef3d0aa4057823ac56c69a5be8e', '1', '系统设置-系统设置-角色管理', '1', '2017-10-10 16:54:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7093e7738ce74b5d953386da8d04571f', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:35:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('712ed7d472794658ae135fc9ca3a30f3', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:15:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('716d1e99d0ce44ee8c24463a693ecb6b', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-10-10 16:45:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D3133, '');
INSERT INTO `sys_log` VALUES ('719216825af545dd88e659fac8d46756', '1', '我的面板-个人信息-个人信息', '1', '2017-10-09 10:36:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('7226298a9ac442f1b7503822906c8566', '1', '系统设置-日志查询-日志查询', '1', '2017-10-10 16:55:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/log', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3138, '');
INSERT INTO `sys_log` VALUES ('724fb48fa08346fe98719c304a12132b', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-10 17:48:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('725d876f72b846d4b86aa038c3e67d98', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 21:44:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('731a7efabfa7404aa1b9f053e78195da', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 20:32:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE7BD91E7AB99E7AE80E4BB8B266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE6B58BE8AF953226706172656E742E69643D3326637573746F6D436F6E74656E74566965773D2669643D383530333030373663316666343534393938313939373934393861613734396326687265663D2F66726F6E742F722F686F6D6526696E4D656E753D3126696E4C6973743D302673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('733262b911434c2ca600f08b39a0385a', '1', '系统设置-机构用户-用户管理', '1', '2017-10-01 10:20:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('73d76b10c40a42bab362495b041ed7eb', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 14:12:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE6B58BE8AF95266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE88F9CE58D953126706172656E742E69643D323430366566656433626537346531356236666630393039656365316230643926637573746F6D436F6E74656E74566965773D2669643D26687265663D26696E4D656E753D3026696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('73dede91fbef4180bff2d4cd602df2b4', '1', '内容管理-内容管理', '1', '2017-09-30 13:34:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('753089f66ba744e090c5fe354e830527', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:08:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('7630ebb2be62433aa53d5769c7445807', '1', '系统设置-机构用户-机构管理', '1', '2017-10-10 17:36:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3131, '');
INSERT INTO `sys_log` VALUES ('766b103b900949dc9a918067a361a87d', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:12:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7688ed9b09f84fe7b8e22df975a36487', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-10-10 16:54:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/usertorole', 'POST', 0x5F5F5F74302E3032373338323939363336393339393232363D2669643D32, '');
INSERT INTO `sys_log` VALUES ('76e0a47fa0144895b3877798ffd3f7c1', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:20:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('777df96bf8c2407fb48d96714ceb8879', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 21:04:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('77adf7050f704e3cbe9bf81ce73b175a', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-10 17:48:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3233, '');
INSERT INTO `sys_log` VALUES ('77c10e230fff459c818936963711c1d5', '1', '内容管理-内容管理-内容发布', '1', '2017-10-10 17:47:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3232, '');
INSERT INTO `sys_log` VALUES ('785f078e9b14460bbc7c5a78eff40355', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 21:45:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('7874679b7bdf4f20865051c35a2001d6', '1', '内容管理-内容管理', '1', '2017-09-30 21:19:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('78e22a27b0324ff9ba709cccc70902bf', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-09 10:31:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('794e319da73c4eb2adac8b03ee577255', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:11:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('79adf1f31367424e8db7c37eb3bbd20e', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 14:00:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('79db6f85a9ce4870aeba60e4b3b0a8b8', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 12:43:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('7a484aa46d7e4d41b3a74244a2a665fa', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:32:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('7a94419a1eb0498f89468e56526db967', '1', '内容管理-栏目设置-站点设置', '1', '2017-09-30 14:01:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F37, '');
INSERT INTO `sys_log` VALUES ('7c6a12d716924417a09162c741766374', '1', '在线办公-流程管理-流程管理', '1', '2017-10-09 10:32:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/act/process', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3333, '');
INSERT INTO `sys_log` VALUES ('7c8a8a5484b0457e834852989bb3d9d0', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-10-01 21:03:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/checkLoginName', 'GET', 0x6F6C644C6F67696E4E616D653D73645F736362266C6F67696E4E616D653D7A7162, '');
INSERT INTO `sys_log` VALUES ('7c8f511bad024488950f488ea220aa34', '1', '在线办公-通知通告-我的通告', '1', '2017-10-10 17:31:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('7c8faf437ddb42b48e184c4449324951', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-01 20:16:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('7cc1cd45644d42e3a231d220fa433c9d', '1', '内容管理-内容管理', '1', '2017-10-10 16:45:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7d1d4a04b49043e0be80dc281c4c4d8c', '1', '系统设置-系统设置-角色管理', '1', '2017-10-09 10:21:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7da2b16cc91940c498714290c985d4e7', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:22:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D33, '');
INSERT INTO `sys_log` VALUES ('7dbe93469d394468b2d78b56854f5595', '1', '内容管理-内容管理', '1', '2017-09-30 20:06:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7ec0b53312ca422abf603843f7d14cfc', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:34:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('7ee6820a64184b2e84f874aa41d62354', '1', '内容管理-内容管理', '1', '2017-09-30 20:15:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7f5f2e9f3fc54b41aee2219c9d024f2a', '1', '系统设置-机构用户-用户管理', '1', '2017-10-09 10:24:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3131, '');
INSERT INTO `sys_log` VALUES ('7f5f44e8df4f42d2822477262f302107', '1', '内容管理-内容管理', '1', '2017-09-30 13:49:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7fd28fb6c88f4db2980344ba2812dc10', '1', '系统设置-日志查询-日志查询', '1', '2017-09-30 12:43:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/log', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('80043a79f5dd45fb92da19e92a0985ab', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:20:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('804659ada45d494085d31a693cefaa92', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-01 10:28:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/save', 'POST', 0x636F707972696768743D0D0A09436F7079726967687420C2A92032303137205A756F202D20506F776572656420427920486C736F6674746563680D0A266B6579776F7264733D26637573746F6D496E646578566965773D266E616D653DE5A881E6B5B7E69E97E4B89AE7B3BBE7BB9F266C6F676F3D2F7573657266696C65732F312F696D616765732F636D732F736974652F323031372F31302F6C6F676F352E6A7067266465736372697074696F6E3D267468656D653D62617369632669643D31267469746C653DE5A881E6B5B7E69E97E4B89A, '');
INSERT INTO `sys_log` VALUES ('806f9c3cfd94426a87f22629af6b6432', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-01 10:25:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/save', 'POST', 0x636F707972696768743D0D0A09436F7079726967687420C2A92032303137205A756F202D20506F776572656420427920486C736F6674746563680D0A266B6579776F7264733DE5A881E6B5B7E69E97E4B89A26637573746F6D496E646578566965773D266E616D653DE5A881E6B5B7E7AB99E782B9266C6F676F3D2F7573657266696C65732F312F696D616765732F636D732F736974652F323031372F31302F6C6F676F352E6A7067266465736372697074696F6E3DE5A881E6B5B7E69E97E4B89A267468656D653D62617369632669643D31267469746C653DE5A881E6B5B7E69E97E4B89A, '');
INSERT INTO `sys_log` VALUES ('80a01d5f1e054d16a08d6ae1944ae9f2', '1', '系统登录', '1', '2017-09-30 09:41:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('810a81d32f29443faaee22fc7772db0a', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:15:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('814a97f409d54639a86eb16cc041130d', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 21:22:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('817f3b13077d4445a13291e20582e910', '1', '系统登录', '1', '2017-09-30 10:07:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('820ccd088439461fbb4575fa1c19e0b1', '1', '代码生成-代码生成-生成方案配置', '1', '2017-10-09 10:28:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genScheme', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3133, '');
INSERT INTO `sys_log` VALUES ('8240fd481f57499984cc30c50bf64ade', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-01 21:02:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('8273ca364291496e8c41ec7b74946ac8', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:55:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('829349cab6a4433e9dd74d87971efcb8', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:23:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE7BD91E7AB99E7AE80E4BB8B266B6579776F7264733D2669636F6E3D69636F6E2D6D61676E6574266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D323430366566656433626537346531356236666630393039656365316230643926687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D26697341756469743D3026736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE6B58BE8AF9526706172656E742E69643D3326696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('82f2d21220564cc19bbc8292af4ba2d2', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:03:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('8395c6254ae047d0a58eb40504657eb3', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:25:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('83dcdc686af64ee6b08f755e25219f07', '1', '内容管理-内容管理', '1', '2017-09-30 13:34:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('84564b8e656f48a8aa8a80900ec0fcff', '1', '代码生成-代码生成-业务表配置', '1', '2017-10-10 16:57:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3230, '');
INSERT INTO `sys_log` VALUES ('84d6c30a48364bd5bb47683358f2111c', '1', '代码生成-生成示例-树结构', '1', '2017-10-10 16:58:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/test/testTree', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3234, '');
INSERT INTO `sys_log` VALUES ('84fec7397562467a871c3ef2ec599065', '1', '系统设置-系统设置-字典管理', '1', '2017-10-10 17:38:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/dict/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3135, '');
INSERT INTO `sys_log` VALUES ('85467bbe887f44c9a1c91e7be6ffe822', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:07:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('866db3fc00c14ab6b62f25408dee8714', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-09-30 20:35:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', 0x69643D6561363137333261633330643437306161326339656663386163336235393030, '');
INSERT INTO `sys_log` VALUES ('8732b87fba744f75bf3c380cc7f1fd0c', '1', '系统登录', '1', '2017-10-09 10:20:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('877895e6c0ed4c25ab7b435a3e61fa24', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-09-30 14:33:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/save', 'POST', 0x6F6C64456E6E616D653D266F66666963652E69643D3226726F6C65547970653D7573657226737973446174613D31266461746153636F70653D3826656E6E616D653D77686C7966726F6E742675736561626C653D31266F66666963654964733D266F66666963652E6E616D653DE585ACE58FB8E9A286E5AFBC266F6C644E616D653D266E616D653DE5A881E6B5B7E69E97E4B89AE5898DE58FB0E88F9CE58D95E69D83E999902669643D266D656E754964733D312C65613631373332616333306434373061613263396566633861633362353930302C65646631663832633832393334656661613565636566373832313938313338392672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('87a46dc8a6fb410cb2a6e1e06b6fc5fc', '1', '系统设置-机构用户-区域管理-查看', '1', '2017-10-10 17:37:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/area/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('89278b701da34dd387221b35d5490ef1', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:25:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3137, '');
INSERT INTO `sys_log` VALUES ('89adac3b576242ddb73001c0775fcc23', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 20:16:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('8a026559121340c392efe1a9ca6defb4', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:59:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE9A1B6E7BAA7E6A08FE79BAE266B6579776F7264733D2669636F6E3D69636F6E2D756D6272656C6C61266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D3226687265663D26696D6167653D266F66666963652E69643D33266D6F64756C653D61727469636C6526697341756469743D3126736F72743D313026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE7BB84E7BB87E69CBAE69E8426706172656E742E69643D3126696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('8a98cd844fbb4abf9be26798e5a21ef3', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-10-01 21:03:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/checkLoginName', 'GET', 0x6F6C644C6F67696E4E616D653D73645F7A6862266C6F67696E4E616D653D7A756F, '');
INSERT INTO `sys_log` VALUES ('8bba984ad51f4716ad739920d076acc0', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-09 10:24:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8c898f1e58ea45d7a7ffa46ab3e732fb', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 21:19:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('8d743d14fd0548cab80427b08e7d1cef', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:11:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('8e519dd9c353452489a35d71c13e0282', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:30:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('8e79603645064fcc8bcda093c626cfb3', '1', '代码生成-生成示例-树结构', '1', '2017-10-09 10:29:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/test/testTree', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3136, '');
INSERT INTO `sys_log` VALUES ('8e904bed612b4d528d38463f20220199', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 08:56:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8ece8a09b66842809e4f1362261ac636', '1', '代码生成-代码生成-业务表配置', '1', '2017-09-30 14:00:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('8ed80fafb8474683a5eacfa1591ccbd3', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-10-10 16:47:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D32, '');
INSERT INTO `sys_log` VALUES ('8efa78409b3f4792a609ae84ba5361f0', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:24:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8f1cb464ba4741f9b3a14dc5380623a9', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:24:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8f21423f697c4213bf9bbe1f67b0b4b2', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:11:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8fc5983296d14585a56f3d2ff1ac2cfa', '1', '内容管理-内容管理-内容发布', '1', '2017-10-09 10:31:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3139, '');
INSERT INTO `sys_log` VALUES ('90b3d7bf66e14dc4a69412d97b1edd8a', '1', '我的面板-个人信息-修改密码', '1', '2017-10-10 16:44:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('90cd36e184014260aac0549820dd0b05', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-10-10 16:52:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', 0x69643D3237, '');
INSERT INTO `sys_log` VALUES ('91c03bce4b2b49928b9467b86bcceb27', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:20:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('91dca751b8724fa29ee8f13f360121ce', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:37:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('921fc50fc34b4e6990b613a2d616781b', '1', '内容管理-内容管理', '1', '2017-09-30 21:45:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('94031edc2c47434caf719df3c0d472a0', '1', '系统登录', '1', '2017-09-30 21:37:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('94e4f86173ed42488b9bbf3127f9a032', '1', '系统设置-日志查询-日志查询', '1', '2017-09-30 12:36:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/log', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('96234f289bdc4e66be1b4ce1cbe72720', '1', '系统登录', '1', '2017-09-30 20:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('96b059fd66a940b5a13f2b4a2d8743ea', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 20:06:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('96d7e01f0ae843f2b91524d6766a8524', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-10-10 17:38:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/usertorole', 'POST', 0x5F5F5F74302E323338383336373137353734343635393D2669643D32, '');
INSERT INTO `sys_log` VALUES ('97272823376c4f9393f4a85385378eba', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 09:03:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('9764ff5304eb40bb9a728b201ad08279', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-10-01 21:03:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/save', 'POST', 0x636F6E6669726D4E657750617373776F72643D266E6F3D30303033266F66666963652E69643D3326726F6C6549644C6973743D32265F726F6C6549644C6973743D6F6E266D6F62696C653D2670686F746F3D266E657750617373776F72643D266F6C644C6F67696E4E616D653D73645F7A6862266C6F67696E466C61673D3126636F6D70616E792E69643D312670686F6E653D266F66666963652E6E616D653DE7BBBCE59088E983A8266C6F67696E4E616D653D7A756F266E616D653DE7BBBCE59088E983A82669643D3326636F6D70616E792E6E616D653DE5B1B1E4B89CE79C81E680BBE585ACE58FB82675736572547970653D26656D61696C3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('97a5052d941f4622aefac3519342e98e', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 14:32:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('97b26c6b914943808ad9d4dbc0219709', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 14:28:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('982e2ea25519446c9decdc9aef4da63c', '1', '内容管理-内容管理-内容发布', '1', '2017-10-10 17:27:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3237, '');
INSERT INTO `sys_log` VALUES ('9856a2179e8a4f5ea9983c5b52c7f4bb', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 14:28:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('98d01e208f664002a93e8476e719abe2', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:25:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE6B58BE8AF95266B6579776F7264733D2669636F6E3D69636F6E2D656D6F7469636F6E2D736D696C65266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D366438636636643662633538343433653961623265313462396236386564663626687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D26697341756469743D3026736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE88F9CE58D953126706172656E742E69643D323430366566656433626537346531356236666630393039656365316230643926696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('98fae2316e5e45028944276eb95d9e1b', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 13:40:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('98fd200ba0614c2bb2b910ce1f262b2f', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-09-30 14:27:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D33, '');
INSERT INTO `sys_log` VALUES ('994383b2a15345b5af0034b3c936908d', '1', '内容管理-内容管理', '1', '2017-09-30 19:58:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9960eb4d16da48a68d7f19beecaf7774', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:23:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('99bfa9f7f463426da18f1acc4bb72031', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-09-30 14:31:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', 0x706172656E742E69643D6561363137333261633330643437306161326339656663386163336235393030, '');
INSERT INTO `sys_log` VALUES ('9a7819ad410a48aca41cd7611e75c064', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:23:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9afd473292484b61953b2aa63ffc18a8', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 20:30:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9be8b23739624023bfb0955fd60281dd', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 13:50:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D33, '');
INSERT INTO `sys_log` VALUES ('9c150905af2d4ce7b8de9b558aee77ef', '1', '系统登录', '1', '2017-09-30 21:19:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('9c7c4ede00da4806adbf6618fcbedc8b', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:58:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('9cfaf390ebc84ce78a8c12f782e831f3', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:44:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('9d034f5833d74bcd8e4885463c5e3426', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 19:58:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9d4d5e9c545c45378c37cadb2dbf1e70', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 19:58:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('9d8d22c1f90c49cf933b4cd5736d1895', '1', '内容管理-栏目设置-切换站点', '1', '2017-10-10 17:34:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F39, '');
INSERT INTO `sys_log` VALUES ('9df51e00a7b440769c8e3feb53d50b20', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:23:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e16a140603749af96300e6779878f9f', '1', '在线办公-通知通告-我的通告', '1', '2017-10-09 10:32:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3238, '');
INSERT INTO `sys_log` VALUES ('9e329406bfdf4827958df100c5bea6be', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 17:36:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('9e70a9158cd843a18386d8d89fa30570', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:12:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e865ae994e241ecab176c416d64d3ea', '1', '内容管理-内容管理', '1', '2017-10-10 17:27:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e92b577a7bf4e05890b69563df520fe', '1', '系统登录', '1', '2017-10-10 16:44:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('9e9ad09f8cc94414a1070ac91abafe93', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:51:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('a037ce887916488285d02c178a2d11b9', '1', '内容管理-内容管理', '1', '2017-09-30 13:14:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a0d3e9a680264fb4bea4afa8a49b341c', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 21:44:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('a162ea11299c41d49e0645a9f76cfdef', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 10:26:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('a242d0e683b143238b77c4a210173a71', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 14:12:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('a30c525483314181b32367ba5db39794', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:24:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a33917f929c448fca121ecdf1b48c2e2', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 10:20:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a43496c0bd9643b198464ba8ea940cf4', '1', '内容管理-内容管理', '1', '2017-10-09 10:20:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a4a5510cedf24a6eb12fd09a480da0b8', '1', '代码生成-代码生成-生成方案配置', '1', '2017-10-10 16:57:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genScheme', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3231, '');
INSERT INTO `sys_log` VALUES ('a57d7c5c21264a6d93d8ce44eff63ea3', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:33:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('a5bcb762eb4940dab5eee4a8b71867c3', '1', '我的面板-个人信息-个人信息', '1', '2017-10-09 10:30:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3137, '');
INSERT INTO `sys_log` VALUES ('a5e4acbee6a54234a0e6b983289ae2e2', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-01 20:15:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('a64485a21a3c470db1463bad94aecf26', '1', '我的面板-个人信息-个人信息', '1', '2017-10-09 10:20:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('a64849bf1bb84e148c77a0140df81f0b', '1', '内容管理-内容管理', '1', '2017-10-01 10:26:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a6da2fa245174a1b9214bf8eacee535b', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:07:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('a743d32d12f041d1b32fc4fd9fcc1312', '1', '我的面板-个人信息-个人信息', '1', '2017-10-10 17:30:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7f3a479060c44c79bec6f802df4c5e3', '1', '系统登录', '1', '2017-09-30 10:37:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7f44744c414457387060fc976bd9ee5', '1', '内容管理-内容管理', '1', '2017-10-01 10:24:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a81dc1166435431894a62caed2ddf7b5', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-10 17:27:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('a83451b93b344ca683dee1808e7ce2cd', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 20:15:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('a85703f5155741c59521d72b1d9c81a0', '1', '系统设置-系统设置-角色管理', '1', '2017-10-10 17:37:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3134, '');
INSERT INTO `sys_log` VALUES ('a87a8f1df8624f2ea45d4cffb4239e59', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 12:53:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('a88e5f75950f4abea15799c7ec929757', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:45:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('a890d9489aeb4838b5c4464fa3fc7c28', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-01 10:22:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/save', 'POST', 0x636F707972696768743D0D0A09436F7079726967687420C2A92032303137205A756F202D20506F776572656420427920486C736F6674746563680D0A266B6579776F7264733DE5A881E6B5B7E69E97E4B89A26637573746F6D496E646578566965773D266E616D653DE5A881E6B5B7E7AB99E782B9266C6F676F3D2F7573657266696C65732F312F696D616765732F636D732F736974652F323031372F31302F6C6F676F2D696E766572742E706E67266465736372697074696F6E3DE5A881E6B5B7E69E97E4B89A267468656D653D62617369632669643D31267469746C653DE5A881E6B5B7E69E97E4B89A, '');
INSERT INTO `sys_log` VALUES ('a8a2fdacadf349858a5fa1211b059c09', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 12:43:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('a8c0ebcc85e54454918ac6ccf2ea8857', '1', '内容管理-内容管理', '1', '2017-09-30 20:06:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a9a5139bd01f423ea1e22c362749ce9e', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:24:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D69636F6E2D656E76656C6F70652D6C6574746572266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313626687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D353026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE4B88BE8BDBDE5B7A5E585B726706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('ab03219e8d834f4e843c1ffb93d74c74', '1', '系统登录', '1', '2017-09-30 14:27:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('ab80ea91676e4a4980d2211e76d7e2da', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:05:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('ab852680fff1486b8960dc2dfd436e83', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:48:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('ac011ba6197547f4be3d897055802aa3', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-01 10:27:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/save', 'POST', 0x636F707972696768743D0D0A09436F7079726967687420C2A92032303137205A756F202D20506F776572656420427920486C736F6674746563680D0A266B6579776F7264733DE5A881E6B5B7E69E97E4B89A26637573746F6D496E646578566965773D266E616D653DE5A881E6B5B7E69E97E4B89AE7B3BBE7BB9F266C6F676F3D2F7573657266696C65732F312F696D616765732F636D732F736974652F323031372F31302F6C6F676F352E6A7067266465736372697074696F6E3DE5A881E6B5B7E69E97E4B89A267468656D653D62617369632669643D31267469746C653DE5A881E6B5B7E69E97E4B89A, '');
INSERT INTO `sys_log` VALUES ('ac29b7eafc9842b89d4adb030898e700', '1', '内容管理-栏目设置-站点设置', '1', '2017-09-30 14:07:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ac9e82d6360d4373b93914dc20b21c80', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 19:59:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('aebaaebe9ab54e22b1be0e126f1e9706', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-09-30 14:34:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/assign', 'GET', 0x69643D3336366438316339666337313437636139633836393737633962646666653162, '');
INSERT INTO `sys_log` VALUES ('af1f8e9348d840b5a1a0d1cd891c8d7b', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:20:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D36, '');
INSERT INTO `sys_log` VALUES ('b07d1b0df5c949269219fea8b09d59c1', '1', '系统设置-日志查询-日志查询', '1', '2017-10-10 17:39:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/log', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3136, '');
INSERT INTO `sys_log` VALUES ('b0b1085f00a246f980b4a486bba8a0a7', '1', '系统设置-机构用户-区域管理-查看', '1', '2017-10-10 16:52:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/area/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('b0dc075a7b324b3196febe4dc91e791e', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-10-09 10:22:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('b1334a96fedd42549b8ee71fd240c6f4', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 20:32:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE7BD91E7AB99E7AE80E4BB8B266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE6B58BE8AF9526706172656E742E69643D3326637573746F6D436F6E74656E74566965773D2669643D323430366566656433626537346531356236666630393039656365316230643926687265663D2F66726F6E742F722F686F6D6526696E4D656E753D3126696E4C6973743D302673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('b18841cd129947e8a45ea4daa473d98b', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:24:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b1eb35c306734b53b1b5d9550c84c6c8', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 13:50:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('b369b404b6464adc825907bad5451cbc', '1', '我的面板-个人信息-个人信息', '1', '2017-10-10 16:44:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('b38f19b6450c49f2825cfe1ee86922ff', '1', '系统登录', '1', '2017-09-30 10:07:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('b3ee6cc7e0bd4efead28c8bd4a313145', '1', '在线办公-流程管理-模型管理', '1', '2017-10-09 10:32:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/act/model', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3334, '');
INSERT INTO `sys_log` VALUES ('b42ada71a1bd4b75a0e7b7b27449e574', '1', '系统设置-系统设置-菜单管理-修改', '1', '2017-09-30 14:31:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/save', 'POST', 0x706172656E742E6E616D653DE58A9FE883BDE88F9CE58D95266E616D653DE5898DE58FB0E69D83E99990E88F9CE58D952669636F6E3D26706172656E742E69643D31267065726D697373696F6E3D2669643D26687265663D26736F72743D353033302672656D61726B733D267461726765743D26697353686F773D31, '');
INSERT INTO `sys_log` VALUES ('b4fb9a5b92664f7ba74a8758c5a3a14d', '1', '系统登录', '1', '2017-10-10 17:29:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('b611f62889ab4ff89c5f3497cc4ceee4', '1', '内容管理-内容管理', '1', '2017-09-30 14:00:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b6e0301f877c4e7ea2ff14810a65a983', '1', '系统设置-系统设置-字典管理', '1', '2017-10-09 10:22:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/dict/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('b74d998752c54cbf988cde8e7a22b31b', '1', '内容管理-内容管理-公共留言-查看', '1', '2017-10-10 16:50:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/guestbook/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3131267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('b7c106dbaf9045ca84ee3637c944d0be', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-09-30 14:30:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/usertorole', 'POST', 0x5F5F5F74302E383733353036343431313235363430383D2669643D32, '');
INSERT INTO `sys_log` VALUES ('b7e0a02d05cd442993063eeaba598f2a', '1', '系统登录', '1', '2017-09-30 21:55:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b80851fea5774dd2b4391d725aab8b69', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-10 17:34:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('b8428774693a4e028309d6bcdd735095', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-09-30 14:02:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('b951acd821cb4b2e8d63a77b59deca38', '2', '', '1', '2017-10-01 21:04:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/front/r/home', 'GET', '', 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A20505743363033333A20556E61626C6520746F20636F6D70696C6520636C61737320666F72204A53500A0A505743363139373A20416E206572726F72206F63637572726564206174206C696E653A203120696E20746865206A73702066696C653A202F5745422D494E462F76696577732F6572726F722F3530302E6A73700A505743363139393A2047656E65726174656420736572766C6574206572726F723A0A5468652074797065206A6176612E6C616E672E4368617253657175656E63652063616E6E6F74206265207265736F6C7665642E20497420697320696E6469726563746C79207265666572656E6365642066726F6D207265717569726564202E636C6173732066696C65730A0A0D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E44656661756C744572726F7248616E646C65722E6A617661634572726F722844656661756C744572726F7248616E646C65722E6A6176613A313037290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6A617661634572726F72284572726F72446973706174636865722E6A6176613A323830290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E67656E6572617465436C61737328436F6D70696C65722E6A6176613A333530290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E636F6D70696C6528436F6D70696C65722E6A6176613A343131290D0A096174206F72672E6170616368652E6A61737065722E4A7370436F6D70696C6174696F6E436F6E746578742E636F6D70696C65284A7370436F6D70696C6174696F6E436F6E746578742E6A6176613A353932290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333434290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E696E636C75646528446973706174636865722E6A6176613A313932290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323031290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A);
INSERT INTO `sys_log` VALUES ('b998ca5d5d0e499697539ac681966b04', '1', '内容管理-内容管理', '1', '2017-09-30 20:08:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b9cdf7c919c64264ad8fad2af2287e01', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:08:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('ba2b37f0209942cb8b20234f78c40280', '1', '内容管理-内容管理', '1', '2017-09-30 21:19:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ba7a527c4a3f481bb85741925e4439bd', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 19:58:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('bb3950338b8c4567b81a679a9d52eb0c', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-09-30 14:33:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/users', 'GET', 0x6F666669636549643D31, '');
INSERT INTO `sys_log` VALUES ('bc35d6286cb547e6b31dd995ea37adb4', '1', '系统登录', '1', '2017-09-30 13:10:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('bd1438a15d274984b379713e6dffa951', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:23:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE7BD91E7AB99E7AE80E4BB8B266B6579776F7264733D2669636F6E3D69636F6E2D6D616769632D77616E64266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D383530333030373663316666343534393938313939373934393861613734396326687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D26697341756469743D3026736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE6B58BE8AF953226706172656E742E69643D3326696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('bd16b2541561465f81adb270c449c27e', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-10-10 16:51:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('bdfa9bd6732a40918dcd499ae1648b2a', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:12:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('be7ef117f57547f28fb015211ad304a1', '1', '在线办公-流程管理-流程管理', '1', '2017-10-09 10:32:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/act/process', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3335, '');
INSERT INTO `sys_log` VALUES ('beb3aba0484d4605b96db20a81e806a1', '1', '代码生成-生成示例-主子表', '1', '2017-10-09 10:29:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/test/testDataMain', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3135, '');
INSERT INTO `sys_log` VALUES ('bed43b84b8ca42519e54df999476f0e0', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:11:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('bf0b0f2ae1724dcca03a5d7eee20c8ba', '1', '系统设置-机构用户-机构管理', '1', '2017-09-30 14:00:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('bf4be37402e3452b94383f5fcf7554cb', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 14:00:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('bfc3d91e97fb4e65914af845b8925462', '1', '在线办公-个人办公-我的任务', '1', '2017-10-09 10:32:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/act/task/todo/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3331, '');
INSERT INTO `sys_log` VALUES ('c003990c0915494e969a79be001b8c38', '1', '内容管理-内容管理', '1', '2017-10-10 17:47:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c143f0d70a8f4efeaaa4e7dab105a1dd', '1', '我的面板-个人信息-修改密码', '1', '2017-10-10 17:30:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c2e97068d03f40618a18180e2c838d7e', '1', '系统登录', '1', '2017-09-30 13:34:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c2ff1ed9e52c4a21a4319c24c121667d', '2', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2017-10-10 16:46:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/form', 'GET', 0x69643D3231, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A343032290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A333237290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313236290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323039290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A4361757365642062793A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E6765744265616E50726F7065727479284265616E454C5265736F6C7665722E6A6176613A353437290D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E67657456616C7565284265616E454C5265736F6C7665722E6A6176613A323439290D0A096174206A617661782E656C2E436F6D706F73697465454C5265736F6C7665722E67657456616C756528436F6D706F73697465454C5265736F6C7665722E6A6176613A313433290D0A09617420636F6D2E73756E2E656C2E7061727365722E41737456616C75652E67657456616C75652841737456616C75652E6A6176613A313338290D0A09617420636F6D2E73756E2E656C2E56616C756545787072657373696F6E496D706C2E67657456616C75652856616C756545787072657373696F6E496D706C2E6A6176613A323036290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E50616765436F6E74657874496D706C2E6576616C7561746545787072657373696F6E2850616765436F6E74657874496D706C2E6A6176613A393834290D0A096174206F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73702E5F6A737053657276696365286F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73703A333731290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E487474704A7370426173652E7365727669636528487474704A7370426173652E6A6176613A3933290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333733290D0A092E2E2E203639206D6F72650D0A);
INSERT INTO `sys_log` VALUES ('c3249996d4af4a35bc8cf6690d523bc3', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:24:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D69636F6E2D656E76656C6F70652D6F70656E266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313526687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D353026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE982AEE4BBB6E5A484E7908626706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('c3428615a5634cb786a26a39dc57bc79', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:05:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('c367f48d7b934525905a012936af087c', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 08:58:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('c37510aa125f4d52883ad17ee63cd8ff', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 14:00:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c3777d3cdff648c688ba50854cab61d8', '1', '系统登录', '1', '2017-09-30 12:59:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('c3b77966d91842ec9397d510c7d84638', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:04:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F37, '');
INSERT INTO `sys_log` VALUES ('c49f9faa38cf4c72a6482b1a3d82b3c3', '1', '内容管理-内容管理', '1', '2017-10-10 16:45:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3664386366366436626335383434336539616232653134623962363865646636, '');
INSERT INTO `sys_log` VALUES ('c4f0e616713d4929ad5156184da20a20', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-09-30 14:29:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/form', 'GET', 0x69643D3239, '');
INSERT INTO `sys_log` VALUES ('c5588af701a6455e8311a1db2f8c887c', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 20:35:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('c5fa5bb39c5c46c7999f907c68892c34', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-09 10:31:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3232, '');
INSERT INTO `sys_log` VALUES ('c69763db22644924b1751ef33cb2aaf4', '1', '内容管理-内容管理', '1', '2017-10-01 10:20:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c6b79e74e83b4ba5ad91a44fd79008aa', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 08:56:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('c6c3214c2be5404ca181cf80169ae370', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-09 10:20:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('c6f58f0b46d64576bc53d6e33dc2b122', '1', '内容管理-内容管理', '1', '2017-10-09 10:20:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c7405b85ed0147778002b00522d27944', '1', '系统设置-系统设置-菜单管理', '1', '2017-10-10 17:37:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3133, '');
INSERT INTO `sys_log` VALUES ('c803215d38f74f9283248d586042007f', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-09-30 14:07:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('c82f9f76aa254bfbb7f97205c7ce370c', '1', '内容管理-内容管理-评论管理-查看', '1', '2017-10-10 16:49:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/comment/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3130267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('c8337f71980d4256aaa7b5a3a546d24d', '1', '内容管理-内容管理', '1', '2017-10-01 20:15:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c898690b3bb044a59a2d9f3f9b9f5c9b', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-10 16:47:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F38, '');
INSERT INTO `sys_log` VALUES ('c8ed3f11f6ed4037a0f0a86a62a56ff3', '1', '内容管理-内容管理', '1', '2017-10-10 16:45:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c922ffbf22814d79b602187ed4c694de', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-09-30 14:00:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/list', 'GET', 0x706172656E744964733D2669643D, '');
INSERT INTO `sys_log` VALUES ('c99a618dfddf4674804fab18e8cbddbd', '1', '系统登录', '1', '2017-10-10 17:41:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/tree', 'GET', 0x706172656E7449643D3739, '');
INSERT INTO `sys_log` VALUES ('ca892416b85246dca1fb80d1770493d2', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 17:35:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('caf5f371bc0345188d474e1cd3ff9431', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:26:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('cb6519229c0b4dcebde1af48690b4307', '1', '内容管理-统计分析-信息量统计', '1', '2017-10-10 16:46:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/stats/article', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('cbf818b4456b4931ba1188dd215241e4', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:03:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('cc88d7b810984fa383e6acf2ab1f014f', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:25:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3865366539326562326563653435353762623831633863653833313165363862, '');
INSERT INTO `sys_log` VALUES ('ccc6e80307f6412ca6e667507a6fa70b', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 14:12:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE6B58BE8AF95266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE88F9CE58D953226706172656E742E69643D323430366566656433626537346531356236666630393039656365316230643926637573746F6D436F6E74656E74566965773D2669643D26687265663D26696E4D656E753D3026696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('cd1b0906d0194dbea8eafa27fb00b296', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:24:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D69636F6E2D66697265266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313326687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D353026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE6B58FE8A788E8BE85E58AA926706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('cdad2d7f03664d8781c5c4e145e4a23d', '1', '内容管理-内容管理', '1', '2017-09-30 13:49:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cdaf653dea6e41aea7f1d1014f15f416', '1', '系统登录', '1', '2017-09-30 12:38:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('cf6a1405642b485098cb7e8ff587ecfd', '1', '系统设置-机构用户-用户管理', '1', '2017-10-01 21:03:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('cfa16c2118c74131a2c4a6b89a5c14c7', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 14:29:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cfc414063d394ca4ae5ce5edc16c0bf3', '1', '系统设置-系统设置-菜单管理-修改', '1', '2017-09-30 20:35:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/save', 'POST', 0x706172656E742E6E616D653DE58A9FE883BDE88F9CE58D95266E616D653DE5898DE58FB0E69D83E99990E88F9CE58D952669636F6E3D26706172656E742E69643D31267065726D697373696F6E3D2669643D656136313733326163333064343730616132633965666338616333623539303026687265663D26736F72743D353033302672656D61726B733D267461726765743D26697353686F773D30, '');
INSERT INTO `sys_log` VALUES ('d099d4dcef614f37b6f2e2a8df41c981', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 12:36:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('d1816c689ac740aaaa9f19275223bdf9', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:05:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('d2a71988de5c4a49a19975da8d0cc996', '1', '内容管理-统计分析-信息量统计', '1', '2017-10-09 10:31:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/stats/article', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3233, '');
INSERT INTO `sys_log` VALUES ('d2c2cdbf48ab4cc29b79fee1793e7f01', '1', '系统设置-系统设置-菜单管理-修改', '1', '2017-09-30 14:32:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/save', 'POST', 0x706172656E742E6E616D653DE5898DE58FB0E69D83E99990E88F9CE58D95266E616D653DE7BD91E7BB9CE5B7A5E585B7E58FAFE8A781E69D83E999902669636F6E3D26706172656E742E69643D6561363137333261633330643437306161326339656663386163336235393030267065726D697373696F6E3D77686C782E776C626A2E766965772669643D656466316638326338323933346566616135656365663738323139383133383926687265663D26736F72743D33302672656D61726B733D267461726765743D26697353686F773D30, '');
INSERT INTO `sys_log` VALUES ('d2e9de7bea574087906d363805bbae23', '1', '系统设置-机构用户-区域管理', '1', '2017-10-10 17:36:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/area/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3132, '');
INSERT INTO `sys_log` VALUES ('d34c7ca836cd451caaedee0c065f039f', '1', '系统设置-系统设置-字典管理', '1', '2017-10-10 16:54:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/dict/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3137, '');
INSERT INTO `sys_log` VALUES ('d39446742e09471d98a98d8604873c6c', '1', '内容管理-栏目设置-切换站点', '1', '2017-09-30 13:34:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('d3aab13c93a04a27bc7f93c7d7af6e23', '1', '内容管理-内容管理', '1', '2017-09-30 20:08:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d40266b57db64efbb45e076c6cf10085', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 09:03:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('d4146cd20df1460a8612d8ae95947307', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:24:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE8BDAFE4BBB6E4BB8BE7BB8D266B6579776F7264733D2669636F6E3D69636F6E2D67686F7374266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE5B882E59CBAE983A826637573746F6D436F6E74656E74566965773D2669643D313126687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D34266D6F64756C653D61727469636C6526697341756469743D3026736F72743D333026616C6C6F77436F6D6D656E743D312676696577436F6E6669673D267461726765743D266E616D653DE7BD91E7BB9CE5B7A5E585B726706172656E742E69643D313026696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('d424445c54cf407da792dd80040e4687', '1', '内容管理-内容管理', '1', '2017-10-01 20:16:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d45d4109b5ea41cbbea030c9e0225b73', '1', '内容管理-内容管理', '1', '2017-10-01 21:02:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d50c284ceefa48788e6d4343205673e8', '1', '内容管理-内容管理-公共留言-查看', '1', '2017-10-10 17:32:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/guestbook/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35267374617475733D32, '');
INSERT INTO `sys_log` VALUES ('d5cca3aad7fd434b9d2aeaa4ddd8baf7', '2', '内容管理-内容管理-内容发布-文章模型', '1', '2017-09-30 13:49:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D32, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A20505743363033333A20556E61626C6520746F20636F6D70696C6520636C61737320666F72204A53500A0A505743363139373A20416E206572726F72206F63637572726564206174206C696E653A203120696E20746865206A73702066696C653A202F5745422D494E462F76696577732F6572726F722F3530302E6A73700A505743363139393A2047656E65726174656420736572766C6574206572726F723A0A5468652074797065206A6176612E6C616E672E4368617253657175656E63652063616E6E6F74206265207265736F6C7665642E20497420697320696E6469726563746C79207265666572656E6365642066726F6D207265717569726564202E636C6173732066696C65730A0A0D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E44656661756C744572726F7248616E646C65722E6A617661634572726F722844656661756C744572726F7248616E646C65722E6A6176613A313037290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6A617661634572726F72284572726F72446973706174636865722E6A6176613A323830290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E67656E6572617465436C61737328436F6D70696C65722E6A6176613A333530290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E636F6D70696C6528436F6D70696C65722E6A6176613A343131290D0A096174206F72672E6170616368652E6A61737065722E4A7370436F6D70696C6174696F6E436F6E746578742E636F6D70696C65284A7370436F6D70696C6174696F6E436F6E746578742E6A6176613A353932290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333434290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A333237290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313236290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323039290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A);
INSERT INTO `sys_log` VALUES ('d69dfba907954a51944042da8829ac98', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 10:24:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('d714ed22cfc840bc9d340b982ea3632a', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:32:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('d779d4f8c9154331a44a17eaa710cbd3', '1', '系统设置-日志查询-日志查询', '1', '2017-10-09 10:22:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/log', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F37, '');
INSERT INTO `sys_log` VALUES ('d797377e4165491b9766d9e190d96bd1', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 14:12:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D33, '');
INSERT INTO `sys_log` VALUES ('d9bdadef4b504549851aa7881390f09b', '1', '内容管理-栏目设置-切换站点', '1', '2017-10-01 08:56:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/select', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('d9bf5a5b85c049bea9161633c40676b7', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:08:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('da290d5059b94fb5a746f99ef2c2260f', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:03:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('da29e26e185a49b2a87a660b062bf0c8', '1', '内容管理-内容管理', '1', '2017-09-30 21:45:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('da5366c4951e4fc097bd6de042d5aaf1', '1', '内容管理-内容管理', '1', '2017-09-30 20:09:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('da7965d3c4d34cab99fc5158af98faf9', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-10-10 16:53:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/assign', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('da99bab0810e4f3c8d22fb9b364bfeeb', '1', '内容管理-栏目设置-栏目管理', '1', '2017-10-01 10:24:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('db866e145b7e4d3fa3a826101270039e', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 14:11:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D33, '');
INSERT INTO `sys_log` VALUES ('dba948721a2d44e09520660cb50e82f8', '1', '系统设置-机构用户-用户管理', '1', '2017-10-10 17:35:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3130, '');
INSERT INTO `sys_log` VALUES ('dbf0ccebc6ef4bcea22cb14c96428eaf', '1', '内容管理-内容管理', '1', '2017-09-30 14:27:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('dc1b6da7240249319b4b6f47221ce039', '2', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2017-10-10 16:46:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/form', 'GET', 0x69643D3337, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A343032290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A333237290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313236290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323039290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A4361757365642062793A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E6765744265616E50726F7065727479284265616E454C5265736F6C7665722E6A6176613A353437290D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E67657456616C7565284265616E454C5265736F6C7665722E6A6176613A323439290D0A096174206A617661782E656C2E436F6D706F73697465454C5265736F6C7665722E67657456616C756528436F6D706F73697465454C5265736F6C7665722E6A6176613A313433290D0A09617420636F6D2E73756E2E656C2E7061727365722E41737456616C75652E67657456616C75652841737456616C75652E6A6176613A313338290D0A09617420636F6D2E73756E2E656C2E56616C756545787072657373696F6E496D706C2E67657456616C75652856616C756545787072657373696F6E496D706C2E6A6176613A323036290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E50616765436F6E74657874496D706C2E6576616C7561746545787072657373696F6E2850616765436F6E74657874496D706C2E6A6176613A393834290D0A096174206F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73702E5F6A737053657276696365286F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73703A333731290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E487474704A7370426173652E7365727669636528487474704A7370426173652E6A6176613A3933290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333733290D0A092E2E2E203639206D6F72650D0A);
INSERT INTO `sys_log` VALUES ('dcf0e47b9ff145d79f2c4d445e13bf40', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 20:30:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('dd1e5c089f9c42c280b03910da2d3347', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 14:28:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('dd25f9dff71a4337b6293928bccdfb18', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:23:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D34, '');
INSERT INTO `sys_log` VALUES ('dda1d64fa2c4412da4a8f6267763670b', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-09-30 14:28:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D33, '');
INSERT INTO `sys_log` VALUES ('ddc5af5bb6f140db8c280db22c1a7c4e', '1', '内容管理-内容管理', '1', '2017-09-30 20:30:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ddd41b6040b548b9a0b1bc358254123d', '1', '系统登录', '1', '2017-09-30 14:00:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('deb6935245754690aeed8e304ed4d0de', '1', '系统设置-系统设置-菜单管理-修改', '1', '2017-09-30 14:32:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/save', 'POST', 0x706172656E742E6E616D653DE5898DE58FB0E69D83E99990E88F9CE58D95266E616D653DE7BD91E7BB9CE5B7A5E585B7E58FAFE8A781E69D83E999902669636F6E3D26706172656E742E69643D6561363137333261633330643437306161326339656663386163336235393030267065726D697373696F6E3D77686C782E776C626A2E766965772669643D26687265663D26736F72743D33302672656D61726B733D267461726765743D26697353686F773D31, '');
INSERT INTO `sys_log` VALUES ('dee9f732d09a45b1b2686159899aaa26', '1', '我的面板-个人信息-修改密码', '1', '2017-10-09 10:32:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('df8f49f4f8704657bd95d6a369ab1a5f', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:20:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3130, '');
INSERT INTO `sys_log` VALUES ('dfee37af5e26424dbb11193cc4ac1a64', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 10:20:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('dff979822f15464f89a9b08734968768', '1', '系统登录', '1', '2017-09-30 09:29:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('e03a66f7a4a74d5eb8286f60b4c8e8de', '1', '内容管理-内容管理', '1', '2017-09-30 21:45:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e03de632c84b426e9486d544085d294a', '1', '系统设置-系统设置-菜单管理', '1', '2017-09-30 14:31:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e0a883338d2f473cbe262b8eea392c91', '2', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2017-10-10 16:46:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/form', 'GET', 0x63617465676F72792E69643D31332663617465676F72792E6E616D653DE6B58FE8A788E8BE85E58AA92669643D, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A343032290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A333237290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313236290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323039290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A4361757365642062793A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E6765744265616E50726F7065727479284265616E454C5265736F6C7665722E6A6176613A353437290D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E67657456616C7565284265616E454C5265736F6C7665722E6A6176613A323439290D0A096174206A617661782E656C2E436F6D706F73697465454C5265736F6C7665722E67657456616C756528436F6D706F73697465454C5265736F6C7665722E6A6176613A313433290D0A09617420636F6D2E73756E2E656C2E7061727365722E41737456616C75652E67657456616C75652841737456616C75652E6A6176613A313338290D0A09617420636F6D2E73756E2E656C2E56616C756545787072657373696F6E496D706C2E67657456616C75652856616C756545787072657373696F6E496D706C2E6A6176613A323036290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E50616765436F6E74657874496D706C2E6576616C7561746545787072657373696F6E2850616765436F6E74657874496D706C2E6A6176613A393834290D0A096174206F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73702E5F6A737053657276696365286F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73703A333731290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E487474704A7370426173652E7365727669636528487474704A7370426173652E6A6176613A3933290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333733290D0A092E2E2E203639206D6F72650D0A);
INSERT INTO `sys_log` VALUES ('e0e1e4e3c9294ec3bc860c8da8bc5986', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:28:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('e12eb7015a7447778f738ce34ecbcb7b', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 13:34:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F34, '');
INSERT INTO `sys_log` VALUES ('e228177e193e429ca5f7a7d03ecba796', '1', '代码生成-代码生成-业务表配置', '1', '2017-09-30 13:07:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('e29f9661e0f547378e87d60806ab53f3', '1', '内容管理-内容管理', '1', '2017-09-30 21:22:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e2f6ff72ead8478db8fa58f13625be6e', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:23:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE7BB84E7BB87E69CBAE69E84266B6579776F7264733D2669636F6E3D69636F6E2D686F7572676C617373266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D3426687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D61727469636C6526697341756469743D3126736F72743D343026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE58685E983A8E69CBAE69E8426706172656E742E69643D3226696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('e302ec9f1b994627a48a9158cc54a5b7', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:24:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3135, '');
INSERT INTO `sys_log` VALUES ('e30eb657d36b44eea591f33720956291', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-09 10:36:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e326f017258c4202aa54e3c7fd320cce', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:20:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('e3ce2aa7e5f847aaafcb6c05d536f970', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 12:52:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('e3db8dd06527477caed79ebb7950854a', '2', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2017-10-10 16:46:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/form', 'GET', 0x63617465676F72792E69643D31372663617465676F72792E6E616D653DE6909CE7B4A2E5B7A5E585B72669643D, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A343032290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A333237290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313236290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323039290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A4361757365642062793A206A617661782E656C2E50726F70657274794E6F74466F756E64457863657074696F6E3A2054686520636C6173732027636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E41727469636C652720646F6573206E6F742068617665207468652070726F7065727479202779696A69616E4E6577734964272E0D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E6765744265616E50726F7065727479284265616E454C5265736F6C7665722E6A6176613A353437290D0A096174206A617661782E656C2E4265616E454C5265736F6C7665722E67657456616C7565284265616E454C5265736F6C7665722E6A6176613A323439290D0A096174206A617661782E656C2E436F6D706F73697465454C5265736F6C7665722E67657456616C756528436F6D706F73697465454C5265736F6C7665722E6A6176613A313433290D0A09617420636F6D2E73756E2E656C2E7061727365722E41737456616C75652E67657456616C75652841737456616C75652E6A6176613A313338290D0A09617420636F6D2E73756E2E656C2E56616C756545787072657373696F6E496D706C2E67657456616C75652856616C756545787072657373696F6E496D706C2E6A6176613A323036290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E50616765436F6E74657874496D706C2E6576616C7561746545787072657373696F6E2850616765436F6E74657874496D706C2E6A6176613A393834290D0A096174206F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73702E5F6A737053657276696365286F72672E6170616368652E6A73702E5745425F30303264494E462E76696577732E6D6F64756C65732E636D732E61727469636C65466F726D5F6A73703A333731290D0A096174206F72672E6170616368652E6A61737065722E72756E74696D652E487474704A7370426173652E7365727669636528487474704A7370426173652E6A6176613A3933290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333733290D0A092E2E2E203639206D6F72650D0A);
INSERT INTO `sys_log` VALUES ('e405f5e2fc9b4860883f00f2b7ed2783', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:08:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('e47a5c3b9ba4480c9ce81c07c08b236a', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 10:37:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('e4d02a20fa6b4c90976bcf14614ec996', '1', '系统登录', '1', '2017-10-01 21:02:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('e4d29e5109284494af875845c99134ae', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-01 08:58:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/save', 'POST', 0x636F707972696768743D0D0A09436F7079726967687420C2A92032303137205A756F202D20506F776572656420427920486C736F6674746563680D0A266B6579776F7264733DE5A881E6B5B7E69E97E4B89A26637573746F6D496E646578566965773D266E616D653DE9BB98E8AEA4E7AB99E782B9266C6F676F3D266465736372697074696F6E3DE5A881E6B5B7E69E97E4B89A267468656D653D62617369632669643D31267469746C653DE5A881E6B5B7E69E97E4B89A, '');
INSERT INTO `sys_log` VALUES ('e5b9a1da60d6455a95fd0d2d5fde9f5c', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 10:24:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('e5c6df7286e84346b1bbdf50cb7158e7', '1', '内容管理-内容管理', '1', '2017-09-30 13:13:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e6a2cf27f9bf45f9ab96043f84ab0855', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 14:12:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x696D6167653D26706172656E742E6E616D653DE7BD91E7AB99E7AE80E4BB8B266F66666963652E69643D33266B6579776F7264733D266D6F64756C653D26697341756469743D30266465736372697074696F6E3D26736F72743D333026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A8266E616D653DE6B58BE8AF9526706172656E742E69643D3326637573746F6D436F6E74656E74566965773D2669643D26687265663D26696E4D656E753D3026696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('e767be8c86234fd88b968a0cbdb1c19b', '1', '在线办公-通知通告-我的通告', '1', '2017-10-10 16:45:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/oa/oaNotify/self', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('e793b844996a42448dfca9b45837f7f1', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 21:03:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/form', 'GET', 0x69643D34, '');
INSERT INTO `sys_log` VALUES ('e7a96ad5d1254f82bd7ba3a3ea708563', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:30:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('e7dad4dc75f240f69f7475edc8cd1ae2', '1', '我的面板-个人信息-个人信息', '1', '2017-10-10 17:29:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('e7f881a5d11b4a9fb8aeb15d8944b453', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-01 21:03:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e866fbe4ade043d8a6303fbe44f26295', '1', '内容管理-内容管理', '1', '2017-09-30 21:44:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e89a069903d845ee8358a4e2ff5fb6de', '1', '我的面板-个人信息-个人信息', '1', '2017-10-01 20:15:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('e89cba5aa1574c9f85df2d5b47df1f89', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 08:56:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('e8fee77c911045cfa4947a6cb0d11d31', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-09-30 14:33:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/assign', 'GET', 0x69643D3336366438316339666337313437636139633836393737633962646666653162, '');
INSERT INTO `sys_log` VALUES ('e8ff034a6c5241f49ffe96b0c61d8bd9', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:28:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('e9282ef51efd48eda60768b1361cb856', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:14:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e978421283b34ee787f944696ac5bf3e', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-01 10:27:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('e984ef65db22482cbe335a17b281767d', '1', '内容管理-内容管理', '1', '2017-10-01 10:20:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e99ae36319e545108117cf5e1c0a9e95', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-10 17:34:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F38, '');
INSERT INTO `sys_log` VALUES ('e9bbda2a458d458a900ae78dc51d6d34', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:14:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('ea9d406d676344009d7a634702e9f037', '1', '内容管理-内容管理', '1', '2017-09-30 14:12:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eb02677ce23c4e1c9dfeb4a2f8727ea6', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-01 10:27:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');
INSERT INTO `sys_log` VALUES ('ebc6526e9f9648dda9c3b148b90881a9', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:12:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ebcd330a7a064c528cfeb16fc5995165', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 14:27:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('ecf8e7179cd549639acde4df2764b099', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:32:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('ed1cd5bec6d142c49054c6f052fb347a', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 21:56:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('ed4c7ada23da4d8faa74f808564073bd', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2017-09-30 14:28:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/article/', 'GET', 0x63617465676F72792E69643D32, '');
INSERT INTO `sys_log` VALUES ('edc99aa734754b4ab61caafae6f10498', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 13:14:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('ee668b4ae54c44f99116fb8d87f041df', '1', '内容管理-内容管理', '1', '2017-09-30 20:11:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eeb51f299c5848fc9025e37a5a442451', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-09-30 21:19:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eed83426aab94323bfeac9bd194c059b', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:59:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ef5b06c654614de9a63d1cff039cae27', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-10-01 20:17:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D33, '');
INSERT INTO `sys_log` VALUES ('efb0c38c5d694eeabb7d4783490a804d', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 11:10:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('f0aaa707fb6e479aaff933e2d77ad688', '1', '系统设置-系统设置-角色管理', '1', '2017-09-30 14:33:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f112b63f0fb7432b921a18dc1fa4acd8', '1', '系统登录', '1', '2017-09-30 20:08:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('f14282dc5ec34a508c1f27b64884eb02', '1', '代码生成-生成示例-单表', '1', '2017-10-10 16:58:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/test/testData', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3232, '');
INSERT INTO `sys_log` VALUES ('f159ac5862e04ad9a7e349a40c0df19d', '1', '系统设置-系统设置-角色管理', '1', '2017-10-09 10:21:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('f1d985587cf6446bb93b4d59af63d45b', '1', '内容管理-内容管理', '1', '2017-10-09 10:31:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f21476565d6740cd8e4463778afb30e9', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-01 08:56:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/delete', 'GET', 0x69643D32, '');
INSERT INTO `sys_log` VALUES ('f25d4043974547cbb1b611066dff1556', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 17:27:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f271f53af702457bb091ea3bdec53c62', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 21:19:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('f3562a8caaa043dd8b12e33e437a0e9e', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:23:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f4914b0deaee4aaf8067a5c4146eab99', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:06:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('f582d3e471a04b6a8c5f4aa2e906542c', '1', '内容管理-栏目设置-站点设置-修改', '1', '2017-10-10 17:28:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/save', 'POST', 0x636F707972696768743D0D0A09436F7079726967687420C2A92032303137205A756F202D20506F776572656420427920486C736F6674746563680D0A266B6579776F7264733D26637573746F6D496E646578566965773D266E616D653DE5A881E6B5B7E69C8DE58AA1E4B89AE58F91E5B195E5B180E9878DE782B9E69C8DE58AA1E4B89AE4BC81E4B89AE79B91E6B58BE5B9B3E58FB0266C6F676F3D266465736372697074696F6E3D267468656D653D62617369632669643D31267469746C653DE5A881E6B5B7E69C8DE58AA1E4B89AE58F91E5B195E5B180E9878DE782B9E69C8DE58AA1E4B89AE4BC81E4B89AE79B91E6B58BE5B9B3E58FB0, '');
INSERT INTO `sys_log` VALUES ('f65117e258fb42d3888e29a3cda1b54e', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:13:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f6a3fc92d6c84ef5aa213c8f8a384c37', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 14:03:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3132, '');
INSERT INTO `sys_log` VALUES ('f75e26faab2c4c8da9db95813faa500e', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:20:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F33, '');
INSERT INTO `sys_log` VALUES ('f77aa42aaf214980a7693b2c131fef92', '1', '系统设置-机构用户-用户管理', '1', '2017-09-30 13:07:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/index', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('f79c804fe9d14ee8890652b30bcfa902', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-10-10 17:35:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f84d2d36c8444567a1117b9ab8f7f148', '1', '系统登录', '1', '2017-09-30 14:56:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('f885f0ef94e440cbae91ffbc81ebd8bc', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 20:03:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F35, '');
INSERT INTO `sys_log` VALUES ('f8923594034d41b1b117811d948b0f37', '1', '系统登录', '1', '2017-09-30 14:11:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x706172656E742E69643D33, '');
INSERT INTO `sys_log` VALUES ('f89e1afb15824afbb8fccf486d553e01', '1', '内容管理-内容管理', '1', '2017-09-30 20:32:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f8af9b40082b4304888085538c6dcba3', '2', '', '1', '2017-10-01 21:04:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/front/r/home', 'GET', '', 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A20505743363033333A20556E61626C6520746F20636F6D70696C6520636C61737320666F72204A53500A0A505743363139373A20416E206572726F72206F63637572726564206174206C696E653A203120696E20746865206A73702066696C653A202F5745422D494E462F76696577732F6572726F722F3530302E6A73700A505743363139393A2047656E65726174656420736572766C6574206572726F723A0A5468652074797065206A6176612E6C616E672E4368617253657175656E63652063616E6E6F74206265207265736F6C7665642E20497420697320696E6469726563746C79207265666572656E6365642066726F6D207265717569726564202E636C6173732066696C65730A0A0D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E44656661756C744572726F7248616E646C65722E6A617661634572726F722844656661756C744572726F7248616E646C65722E6A6176613A313037290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6A617661634572726F72284572726F72446973706174636865722E6A6176613A323830290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E67656E6572617465436C61737328436F6D70696C65722E6A6176613A333530290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E636F6D70696C6528436F6D70696C65722E6A6176613A343131290D0A096174206F72672E6170616368652E6A61737065722E4A7370436F6D70696C6174696F6E436F6E746578742E636F6D70696C65284A7370436F6D70696C6174696F6E436F6E746578742E6A6176613A353932290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333434290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343730290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333634290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A343031290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E446973706174636865722E696E636C75646528446973706174636865722E6A6176613A313932290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A323031290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A323637290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323231290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393532290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383730290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393631290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383532290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373037290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383337290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383230290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A353131290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323231290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3838290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31323132290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E536572766C657448616E646C65722E68616E646C6528536572766C657448616E646C65722E6A6176613A333939290D0A096174206F72672E6D6F72746261792E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A323136290D0A096174206F72672E6D6F72746261792E6A657474792E736572766C65742E53657373696F6E48616E646C65722E68616E646C652853657373696F6E48616E646C65722E6A6176613A313832290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E436F6E7465787448616E646C65722E68616E646C6528436F6E7465787448616E646C65722E6A6176613A373636290D0A096174206F72672E6D6F72746261792E6A657474792E7765626170702E576562417070436F6E746578742E68616E646C6528576562417070436F6E746578742E6A6176613A343530290D0A096174206F72672E6D6F72746261792E6A657474792E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313532290D0A096174206F72672E6D6F72746261792E6A657474792E5365727665722E68616E646C65285365727665722E6A6176613A333236290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C65526571756573742848747470436F6E6E656374696F6E2E6A6176613A353432290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C6574652848747470436F6E6E656374696F6E2E6A6176613A393238290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A353439290D0A096174206F72672E6D6F72746261792E6A657474792E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323132290D0A096174206F72672E6D6F72746261792E6A657474792E48747470436F6E6E656374696F6E2E68616E646C652848747470436F6E6E656374696F6E2E6A6176613A343034290D0A096174206F72672E6D6F72746261792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A343130290D0A096174206F72672E6D6F72746261792E7468726561642E517565756564546872656164506F6F6C24506F6F6C5468726561642E72756E28517565756564546872656164506F6F6C2E6A6176613A353832290D0A);
INSERT INTO `sys_log` VALUES ('f8ccbd276c674d9fa8606200ffa650e4', '1', '系统登录', '1', '2017-09-30 11:10:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('f8db9a3cb4514c0f9d6e4788f8a8ee72', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 21:22:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('f8e3538ce66f4e28bc9bfef21d9f294f', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:27:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('f9098ae6bd954fc0842b766d7713adbc', '1', '内容管理-内容管理-内容发布', '1', '2017-09-30 20:30:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F32, '');
INSERT INTO `sys_log` VALUES ('f955ce1a70dc4a19a7b653bb6a4c0cab', '1', '内容管理-内容管理', '1', '2017-09-30 14:28:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/none/', 'GET', 0x63617465676F72792E69643D3234303665666564336265373465313562366666303930396563653162306439, '');
INSERT INTO `sys_log` VALUES ('f99d9da7f886499fb9f8f767c96d410c', '1', '内容管理-内容管理', '1', '2017-10-01 20:16:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f9c5c80811a54a199a6faadfaefd064d', '1', '内容管理-统计分析-信息量统计', '1', '2017-10-10 17:33:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/stats/article', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F36, '');
INSERT INTO `sys_log` VALUES ('f9f1710abbe1465ea4c32cb0d966b39b', '1', '内容管理-栏目设置-站点设置', '1', '2017-10-01 10:22:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/', 'GET', 0x7265706167653D, '');
INSERT INTO `sys_log` VALUES ('fa83f604b26a42c89f9013edda3b2174', '1', '代码生成-代码生成-业务表配置', '1', '2017-10-10 17:41:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/gen/genTable', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F3138, '');
INSERT INTO `sys_log` VALUES ('fb5436f5733f4be39fd687e293a1f5c7', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-10-10 17:36:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/office/list', 'GET', 0x706172656E744964733D2669643D, '');
INSERT INTO `sys_log` VALUES ('fbbf0c8d86ea4bd7819f7d298341b369', '1', '内容管理-栏目设置-栏目管理', '1', '2017-09-30 21:56:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fc7aa11818fa4091a7e3c18a54454af2', '1', '我的面板-个人信息-个人信息', '1', '2017-09-30 20:06:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/user/info', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F30, '');
INSERT INTO `sys_log` VALUES ('fcf1050a6124463da64b3cbf450c29e8', '1', '系统登录', '1', '2017-10-01 10:20:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('fcf45e34fbc342e09184df0dbd4e5222', '1', '内容管理-内容管理-内容发布', '1', '2017-10-01 10:26:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/', 'GET', 0x7461625061676549643D6A65726963686F746162696672616D655F31, '');
INSERT INTO `sys_log` VALUES ('fd04514479c845b295a2db41d209884c', '1', '内容管理-内容管理', '1', '2017-10-10 17:31:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fd9893473c844968b47ecd022747fb77', '1', '系统登录', '1', '2017-10-01 08:56:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('fdbb0ea5f704489d8c8a50f29735ceac', '1', '系统登录', '1', '2017-10-10 16:54:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ff376423cbbf412884a697efe12a6045', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2017-09-30 20:30:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/form', 'GET', 0x69643D3664386366366436626335383434336539616232653134623962363865646636, '');
INSERT INTO `sys_log` VALUES ('ff77df132c0246babfc3ee9e71c3945e', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2017-09-30 21:23:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/category/save', 'POST', 0x706172656E742E6E616D653DE7BB84E7BB87E69CBAE69E84266B6579776F7264733D2669636F6E3D69636F6E2D67726164756174696F6E266465736372697074696F6E3D26637573746F6D4C697374566965773D266F66666963652E6E616D653DE7BBBCE59088E983A826637573746F6D436F6E74656E74566965773D2669643D3526687265663D2F66726F6E742F722F686F6D6526696D6167653D266F66666963652E69643D33266D6F64756C653D61727469636C6526697341756469743D3126736F72743D353026616C6C6F77436F6D6D656E743D302676696577436F6E6669673D267461726765743D266E616D653DE59CB0E696B9E69CBAE69E8426706172656E742E69643D3226696E4D656E753D3126696E4C6973743D312673686F774D6F6465733D30, '');
INSERT INTO `sys_log` VALUES ('ffb6479de68d4fc9a9e3c9284e9318dc', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-10-01 08:56:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '/a/cms/site/form', 'GET', 0x69643D31, '');

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) collate utf8_bin default NULL COMMENT '描述',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) collate utf8_bin default NULL COMMENT '链接',
  `target` varchar(20) collate utf8_bin default NULL COMMENT '目标',
  `icon` varchar(100) collate utf8_bin default NULL COMMENT '图标',
  `is_show` char(1) collate utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) collate utf8_bin default NULL COMMENT '权限标识',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', null, 'leaf', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ea61732ac30d470aa2c9efc8ac3b5900', '1', '0,1,', '前台权限菜单', '5030', '', '', '', '0', '', '1', '2017-09-30 14:31:34', '1', '2017-09-30 20:35:20', '', '0');
INSERT INTO `sys_menu` VALUES ('edf1f82c82934efaa5ecef7821981389', 'ea61732ac30d470aa2c9efc8ac3b5900', '0,1,ea61732ac30d470aa2c9efc8ac3b5900,', '网络工具可见权限', '30', '', '', '', '0', 'whlx.wlbj.view', '1', '2017-09-30 14:32:37', '1', '2017-09-30 14:32:53', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) collate utf8_bin default NULL COMMENT '区域编码',
  `type` char(1) collate utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) collate utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) collate utf8_bin default NULL COMMENT '联系地址',
  `zip_code` varchar(100) collate utf8_bin default NULL COMMENT '邮政编码',
  `master` varchar(100) collate utf8_bin default NULL COMMENT '负责人',
  `phone` varchar(200) collate utf8_bin default NULL COMMENT '电话',
  `fax` varchar(200) collate utf8_bin default NULL COMMENT '传真',
  `email` varchar(200) collate utf8_bin default NULL COMMENT '邮箱',
  `USEABLE` varchar(64) collate utf8_bin default NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) collate utf8_bin default NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) collate utf8_bin default NULL COMMENT '副负责人',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '山东省总公司', '10', '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '历城区分公司', '0', '4', '201000', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '历下区分公司', '40', '5', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '高新区分公司', '50', '6', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '济南市分公司', '20', '3', '200000', '1', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) collate utf8_bin default NULL COMMENT '归属机构',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) collate utf8_bin default NULL COMMENT '英文名称',
  `role_type` varchar(255) collate utf8_bin default NULL COMMENT '角色类型',
  `data_scope` char(1) collate utf8_bin default NULL COMMENT '数据范围',
  `is_sys` varchar(64) collate utf8_bin default NULL COMMENT '是否系统数据',
  `useable` varchar(64) collate utf8_bin default NULL COMMENT '是否可用',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('366d81c9fc7147ca9c86977c9bdffe1b', '2', '威海林业前台菜单权限', 'whlyfront', 'user', '8', '1', '1', '1', '2017-09-30 14:33:48', '1', '2017-09-30 14:33:48', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) collate utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) collate utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY  (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '76');
INSERT INTO `sys_role_menu` VALUES ('1', '77');
INSERT INTO `sys_role_menu` VALUES ('1', '78');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '80');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '83');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '85');
INSERT INTO `sys_role_menu` VALUES ('1', '86');
INSERT INTO `sys_role_menu` VALUES ('1', '87');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '72');
INSERT INTO `sys_role_menu` VALUES ('2', '73');
INSERT INTO `sys_role_menu` VALUES ('2', '74');
INSERT INTO `sys_role_menu` VALUES ('2', '75');
INSERT INTO `sys_role_menu` VALUES ('2', '76');
INSERT INTO `sys_role_menu` VALUES ('2', '77');
INSERT INTO `sys_role_menu` VALUES ('2', '78');
INSERT INTO `sys_role_menu` VALUES ('2', '79');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '80');
INSERT INTO `sys_role_menu` VALUES ('2', '81');
INSERT INTO `sys_role_menu` VALUES ('2', '82');
INSERT INTO `sys_role_menu` VALUES ('2', '83');
INSERT INTO `sys_role_menu` VALUES ('2', '84');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('2', '86');
INSERT INTO `sys_role_menu` VALUES ('2', '87');
INSERT INTO `sys_role_menu` VALUES ('2', '88');
INSERT INTO `sys_role_menu` VALUES ('2', '89');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '90');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '74');
INSERT INTO `sys_role_menu` VALUES ('3', '75');
INSERT INTO `sys_role_menu` VALUES ('3', '76');
INSERT INTO `sys_role_menu` VALUES ('3', '77');
INSERT INTO `sys_role_menu` VALUES ('3', '78');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '83');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '86');
INSERT INTO `sys_role_menu` VALUES ('3', '87');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');
INSERT INTO `sys_role_menu` VALUES ('366d81c9fc7147ca9c86977c9bdffe1b', '1');
INSERT INTO `sys_role_menu` VALUES ('366d81c9fc7147ca9c86977c9bdffe1b', 'ea61732ac30d470aa2c9efc8ac3b5900');
INSERT INTO `sys_role_menu` VALUES ('366d81c9fc7147ca9c86977c9bdffe1b', 'edf1f82c82934efaa5ecef7821981389');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) collate utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) collate utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY  (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) collate utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) collate utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) collate utf8_bin default NULL COMMENT '工号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) collate utf8_bin default NULL COMMENT '邮箱',
  `phone` varchar(200) collate utf8_bin default NULL COMMENT '电话',
  `mobile` varchar(200) collate utf8_bin default NULL COMMENT '手机',
  `user_type` char(1) collate utf8_bin default NULL COMMENT '用户类型',
  `photo` varchar(1000) collate utf8_bin default NULL COMMENT '用户头像',
  `login_ip` varchar(100) collate utf8_bin default NULL COMMENT '最后登陆IP',
  `login_date` datetime default NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) collate utf8_bin default NULL COMMENT '是否可登录',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', '2017-10-10 17:47:59', '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'zuo', '17bb8b6645336059e60a9918cb80c35d43b84650e11088c36cb7cbe3', '0003', '综合部', '', '', '', '', '', null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-10-01 21:03:36', '', '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'zqb', '997bef7d9ecf65a65060400a4b292470eb0cc9ddeb601bfe7b29525f', '0004', '市场部', '', '', '', '', '', null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-10-01 21:04:00', '', '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-09-30 14:34:12', null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) collate utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) collate utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('1', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('10', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('11', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('12', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('3', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('4', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('5', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('8', '366d81c9fc7147ca9c86977c9bdffe1b');
INSERT INTO `sys_user_role` VALUES ('9', '1');
INSERT INTO `sys_user_role` VALUES ('9', '366d81c9fc7147ca9c86977c9bdffe1b');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) collate utf8_bin default NULL COMMENT '归属用户',
  `office_id` varchar(64) collate utf8_bin default NULL COMMENT '归属部门',
  `area_id` varchar(64) collate utf8_bin default NULL COMMENT '归属区域',
  `name` varchar(100) collate utf8_bin default NULL COMMENT '名称',
  `sex` char(1) collate utf8_bin default NULL COMMENT '性别',
  `in_date` date default NULL COMMENT '加入日期',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) collate utf8_bin default NULL COMMENT '业务主表ID',
  `name` varchar(100) collate utf8_bin default NULL COMMENT '名称',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) collate utf8_bin default NULL COMMENT '归属用户',
  `office_id` varchar(64) collate utf8_bin default NULL COMMENT '归属部门',
  `area_id` varchar(64) collate utf8_bin default NULL COMMENT '归属区域',
  `name` varchar(100) collate utf8_bin default NULL COMMENT '名称',
  `sex` char(1) collate utf8_bin default NULL COMMENT '性别',
  `in_date` date default NULL COMMENT '加入日期',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data_main
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------

-- ----------------------------
-- Table structure for whly_account
-- ----------------------------
DROP TABLE IF EXISTS `whly_account`;
CREATE TABLE `whly_account` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) collate utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) collate utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) collate utf8_bin default NULL COMMENT '工号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) collate utf8_bin default NULL COMMENT '邮箱',
  `phone` varchar(200) collate utf8_bin default NULL COMMENT '电话',
  `mobile` varchar(200) collate utf8_bin default NULL COMMENT '手机',
  `user_type` char(1) collate utf8_bin default NULL COMMENT '用户类型',
  `photo` varchar(1000) collate utf8_bin default NULL COMMENT '用户头像',
  `login_ip` varchar(100) collate utf8_bin default NULL COMMENT '最后登陆IP',
  `login_date` datetime default NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) collate utf8_bin default NULL COMMENT '是否可登录',
  `create_by` varchar(64) collate utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of whly_account
-- ----------------------------
INSERT INTO `whly_account` VALUES ('1', '1', '2', 'thinkgem', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '最高管理员', '0');
INSERT INTO `whly_account` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `whly_account` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
