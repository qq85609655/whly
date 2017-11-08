/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.service;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.hailian.whly.frontnotification.entity.FrontNotification;
import com.hailian.whly.report.dao.FrontCompanyReportDao;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.frontnotification.dao.FrontNotificationDao;

/**
 * 新闻公告Service
 * @author zyl
 * @version 2017-11-02
 */
@Service
@Transactional(readOnly = true)
public class FrontNotificationService extends CrudService<FrontNotificationDao, FrontNotification> {

	@Autowired
	private FrontNotificationDao dao;
	
	public FrontNotification get(String id) {
		return super.get(id);
	}
	
	public List<FrontNotification> findList(FrontNotification frontNotification) {
		return super.findList(frontNotification);
	}
	
	public Page<FrontNotification> findPage(Page<FrontNotification> page, FrontNotification frontNotification) {
		return super.findPage(page, frontNotification);
	}
	
	@Transactional(readOnly = false)
	public void save(FrontNotification frontNotification) {
		if (frontNotification.getContent().trim()!=null){
			frontNotification.setContent(StringEscapeUtils.unescapeHtml4(frontNotification.getContent().trim()));
		}
		User user = UserUtils.getUser();
		if(frontNotification.getId().trim().equals("") || frontNotification.getId()==null) {
			frontNotification.setCreateName(user.getName());
			frontNotification.setCompanyType(UserUtils.getUser().getCompany().getParentId());
			frontNotification.setHits("0");
		}
		super.save(frontNotification);
	}
	
	@Transactional(readOnly = false)
	public void delete(FrontNotification frontNotification) {
		super.delete(frontNotification);
	}

	public List<FrontNotification> getfrontNotification(FrontNotification frontNotification) {
		List<FrontNotification> list = dao.getfrontNotification(frontNotification);
		return list;
	}
	
}