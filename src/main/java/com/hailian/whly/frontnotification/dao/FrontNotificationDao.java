/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.hailian.whly.frontnotification.entity.FrontNotification;

/**
 * 新闻公告DAO接口
 * @author zyl
 * @version 2017-11-02
 */
@MyBatisDao
public interface FrontNotificationDao extends CrudDao<FrontNotification> {
	
}