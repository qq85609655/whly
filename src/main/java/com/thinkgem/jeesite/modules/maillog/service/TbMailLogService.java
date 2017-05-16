/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.maillog.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.maillog.entity.TbMailLog;
import com.thinkgem.jeesite.modules.maillog.dao.TbMailLogDao;

/**
 * 邮件日志Service
 * @author wcl
 * @version 2017-05-11
 */
@Service
@Transactional(readOnly = true)
public class TbMailLogService extends CrudService<TbMailLogDao, TbMailLog> {

	public TbMailLog get(String id) {
		return super.get(id);
	}
	
	public List<TbMailLog> findList(TbMailLog tbMailLog) {
		return super.findList(tbMailLog);
	}
	
	public Page<TbMailLog> findPage(Page<TbMailLog> page, TbMailLog tbMailLog) {
		return super.findPage(page, tbMailLog);
	}
	
	@Transactional(readOnly = false)
	public void save(TbMailLog tbMailLog) {
		super.save(tbMailLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbMailLog tbMailLog) {
		super.delete(tbMailLog);
	}
	
}