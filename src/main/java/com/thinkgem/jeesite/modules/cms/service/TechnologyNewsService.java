/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.dao.TechnologyNewsDao;
import com.thinkgem.jeesite.modules.cms.entity.TechnologyNews;

/**
 * 文章Service
 * @author ThinkGem
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class TechnologyNewsService {

	@Autowired
	private TechnologyNewsDao technologyNewsDao;
	
	/**
	 * 保存或者更新新闻
	 */

	@Transactional(readOnly = false)
	public void save(TechnologyNews news) {
		if(StringUtils.isBlank(news.getId())){
			technologyNewsDao.saveNews(news);
		}else{
			technologyNewsDao.updateNews(news);
		}
	}
	

	
}
