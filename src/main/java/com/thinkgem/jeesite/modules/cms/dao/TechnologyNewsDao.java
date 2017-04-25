/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import com.qst.entity.NewsEntity;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.TechnologyNews;

/**
 * 
 * @className TechnologyNewsDao.java
 * @time   2017年4月24日 下午3:19:01
 * @author zuoqb
 * @todo   TechnologyNewsDAO接口
 */
@MyBatisDao
public interface TechnologyNewsDao{
	
	public TechnologyNews getNewsById(TechnologyNews news);
	public int saveNews(TechnologyNews news);
	public int updateNews(TechnologyNews news);
	
}
