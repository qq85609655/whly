/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.subscibe.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.subscibe.entity.TbCategorySubscibe;
import com.thinkgem.jeesite.modules.subscibe.dao.TbCategorySubscibeDao;

/**
 * 订阅日志Service
 * @author wcl
 * @version 2017-05-12
 */
@Service
@Transactional(readOnly = true)
public class TbCategorySubscibeService extends CrudService<TbCategorySubscibeDao, TbCategorySubscibe> {

	public TbCategorySubscibe get(String id) {
		return super.get(id);
	}
	
	public List<TbCategorySubscibe> findList(TbCategorySubscibe tbCategorySubscibe) {
		return super.findList(tbCategorySubscibe);
	}
	
	public Page<TbCategorySubscibe> findPage(Page<TbCategorySubscibe> page, TbCategorySubscibe tbCategorySubscibe) {
		return super.findPage(page, tbCategorySubscibe);
	}
	
	@Transactional(readOnly = false)
	public void save(TbCategorySubscibe tbCategorySubscibe) {
		super.save(tbCategorySubscibe);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbCategorySubscibe tbCategorySubscibe) {
		super.delete(tbCategorySubscibe);
	}
	
}