/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.maillog.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.maillog.entity.TbMailLog;

/**
 * 邮件日志DAO接口
 * @author wcl
 * @version 2017-05-11
 */
@MyBatisDao
public interface TbMailLogDao extends CrudDao<TbMailLog> {
	
}