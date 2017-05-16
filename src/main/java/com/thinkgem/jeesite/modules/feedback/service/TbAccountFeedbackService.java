/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.feedback.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.feedback.entity.TbAccountFeedback;
import com.thinkgem.jeesite.modules.feedback.dao.TbAccountFeedbackDao;

/**
 * 反馈记录Service
 * @author wcl
 * @version 2017-05-11
 */
@Service
@Transactional(readOnly = true)
public class TbAccountFeedbackService extends CrudService<TbAccountFeedbackDao, TbAccountFeedback> {

	public TbAccountFeedback get(String id) {
		return super.get(id);
	}
	
	public List<TbAccountFeedback> findList(TbAccountFeedback tbAccountFeedback) {
		return super.findList(tbAccountFeedback);
	}
	
	public Page<TbAccountFeedback> findPage(Page<TbAccountFeedback> page, TbAccountFeedback tbAccountFeedback) {
		return super.findPage(page, tbAccountFeedback);
	}
	
	@Transactional(readOnly = false)
	public void save(TbAccountFeedback tbAccountFeedback) {
		super.save(tbAccountFeedback);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbAccountFeedback tbAccountFeedback) {
		super.delete(tbAccountFeedback);
	}
	
}