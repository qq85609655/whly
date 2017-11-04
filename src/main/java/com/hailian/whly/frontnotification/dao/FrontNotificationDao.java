/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

import com.hailian.whly.frontnotification.entity.FrontNotification;
import com.hailian.whly.report.entity.FrontCompanyReport;

/**
 * 新闻公告DAO接口
 * @author zyl
 * @version 2017-11-02
 */
@MyBatisDao
public interface FrontNotificationDao extends CrudDao<FrontNotification> {
	
	/**
	 * 
	 * @time   2017年11月24日 下午01:41:00
	 * @author zhouyl
	 * @todo   传入 id 或者 发布类型 获取新闻公告
	 * @param  @param frontNotification
	 * @param  @return
	 * @return_type   List<FrontNotification>
	 */
	public List<FrontNotification> getfrontNotification(FrontNotification frontNotification);
	
	
}