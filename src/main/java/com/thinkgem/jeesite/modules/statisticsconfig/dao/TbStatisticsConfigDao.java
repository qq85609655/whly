/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statisticsconfig.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.statisticsconfig.entity.TbStatisticsConfig;

/**
 * 新闻数量配置DAO接口
 * @author zuoqb
 * @version 2017-05-16
 */
@MyBatisDao
public interface TbStatisticsConfigDao extends CrudDao<TbStatisticsConfig> {
	
}