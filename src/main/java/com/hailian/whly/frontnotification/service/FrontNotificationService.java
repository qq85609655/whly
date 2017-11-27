/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
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
	
	@Autowired
	private SystemService systemService;
	
	public FrontNotification get(String id) {
		return super.get(id);
	}
	
	public List<FrontNotification> findList(FrontNotification frontNotification) {
		return super.findList(frontNotification);
	}
	
	public Page<FrontNotification> findPage(Page<FrontNotification> page, FrontNotification frontNotification) {
		String type = frontNotification.getCategoryType();
		boolean canSh = systemService.findUserCanSh();
		//管理员查看邮件  
		if(type!=null && type.equals("3") && canSh) {
			frontNotification.setKeywords("1");
			Area area= new Area();
			area.setId(UserUtils.getUser().getCompany().getArea().getId());
			frontNotification.setArea(area);
		} else if(type!=null && type.equals("3") && !canSh ) { //普通企业查看邮件 
			frontNotification.setCompanyId(UserUtils.getUser().getCompany().getId());
			frontNotification.setKeywords("2");
		}
		return super.findPage(page, frontNotification);
	}
	
	@Transactional(readOnly = false)
	public void save(FrontNotification frontNotification) {
		if (frontNotification.getContent()!=null && !frontNotification.getContent().isEmpty()){
			frontNotification.setContent(StringEscapeUtils.unescapeHtml4(frontNotification.getContent()));
		}
		User user = UserUtils.getUser();
		if(frontNotification.getId()==null || frontNotification.getId().isEmpty()) {
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

	
	/**
	 *
	 * @time   2017年11月9日 上午10:03:53 
	 * @author zhouyl
	 * @Description   获取单条新闻或者公告
	 * @param  @param frontNotification
	 * @param  @return List<FrontNotification>
	 */
	public List<FrontNotification> getfrontNotification(FrontNotification frontNotification) {
		List<FrontNotification> list = dao.getfrontNotification(frontNotification);
		return list;
	}
	
	
}