/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statisticsconfig.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.statisticsconfig.entity.TbStatisticsConfig;
import com.thinkgem.jeesite.modules.statisticsconfig.dao.TbStatisticsConfigDao;

/**
 * 新闻数量配置Service
 * @author zuoqb
 * @version 2017-05-16
 */
@Service
@Transactional(readOnly = true)
public class TbStatisticsConfigService extends CrudService<TbStatisticsConfigDao, TbStatisticsConfig> {

	public TbStatisticsConfig get(String id) {
		return super.get(id);
	}
	
	public List<TbStatisticsConfig> findList(TbStatisticsConfig tbStatisticsConfig) {
		return super.findList(tbStatisticsConfig);
	}
	
	public Page<TbStatisticsConfig> findPage(Page<TbStatisticsConfig> page, TbStatisticsConfig tbStatisticsConfig) {
		return super.findPage(page, tbStatisticsConfig);
	}
	
	@Transactional(readOnly = false)
	public void save(TbStatisticsConfig tbStatisticsConfig) {
		super.save(tbStatisticsConfig);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbStatisticsConfig tbStatisticsConfig) {
		super.delete(tbStatisticsConfig);
	}
	
}