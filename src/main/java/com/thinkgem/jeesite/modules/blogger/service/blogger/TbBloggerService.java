/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.blogger.service.blogger;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.blogger.entity.blogger.TbBlogger;
import com.thinkgem.jeesite.modules.blogger.dao.blogger.TbBloggerDao;

/**
 * 微博配置Service
 * @author zuoqb
 * @version 2017-05-23
 */
@Service
@Transactional(readOnly = true)
public class TbBloggerService extends CrudService<TbBloggerDao, TbBlogger> {

	public TbBlogger get(String id) {
		return super.get(id);
	}
	
	public List<TbBlogger> findList(TbBlogger tbBlogger) {
		return super.findList(tbBlogger);
	}
	
	public Page<TbBlogger> findPage(Page<TbBlogger> page, TbBlogger tbBlogger) {
		return super.findPage(page, tbBlogger);
	}
	
	@Transactional(readOnly = false)
	public void save(TbBlogger tbBlogger) {
		super.save(tbBlogger);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbBlogger tbBlogger) {
		super.delete(tbBlogger);
	}
	
}