/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.hailian.whly.frontnotification.entity.FrontNotification;
import com.hailian.whly.frontnotification.service.FrontNotificationService;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.utils.ResultJson;

/**
 * 新闻公告Controller
 * @author zyl
 * @version 2017-11-02
 */
@Controller
@RequestMapping(value = "${adminPath}/frontnotification/frontNotification")
public class FrontNotificationController extends BaseController {

	@Autowired
	private FrontNotificationService frontNotificationService;
	
	@ModelAttribute
	public FrontNotification get(@RequestParam(required=false) String id) {
		FrontNotification entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = frontNotificationService.get(id);
		}
		if (entity == null){
			entity = new FrontNotification();
		}
		return entity;
	}
	
	@RequestMapping(value = "getfrontNotification")
	@ResponseBody
	public ResultJson getfrontNotification(FrontNotification frontNotification, HttpServletRequest request, HttpServletResponse response, Model model) {
		ResultJson json = new ResultJson();
		List<FrontNotification> list = frontNotificationService.getfrontNotification(frontNotification);
		json.success(list);
		return json;
	}
	
/*	@RequiresPermissions("frontnotification:frontNotification:view")*/
	@RequestMapping(value = {"list", ""})
	public String list(FrontNotification frontNotification, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FrontNotification> page = frontNotificationService.findPage(new Page<FrontNotification>(request, response), frontNotification); 
		model.addAttribute("page", page);
		return "whly/frontnotification/frontNotificationList";
	}

	/*@RequiresPermissions("frontnotification:frontNotification:view")*/
	@RequestMapping(value = "form")
	public String form(FrontNotification frontNotification, Model model) {
		model.addAttribute("frontNotification", frontNotification);
		return "whly/frontnotification/frontNotificationForm";
	}

//	@RequiresPermissions("frontnotification:frontNotification:edit")
	@RequestMapping(value = "save")
	public String save(FrontNotification frontNotification, Model model, RedirectAttributes redirectAttributes) {
		/*if (!beanValidator(model, frontNotification)){
			return form(frontNotification, model);
		}*/
		frontNotificationService.save(frontNotification);
		addMessage(redirectAttributes, "保存新闻公告成功");
		return "redirect:"+Global.getAdminPath()+"/frontnotification/frontNotification/?repage";
	}
	
//	@RequiresPermissions("frontnotification:frontNotification:edit")
	@RequestMapping(value = "delete")
	public String delete(FrontNotification frontNotification, RedirectAttributes redirectAttributes) {
		frontNotificationService.delete(frontNotification);
		addMessage(redirectAttributes, "删除新闻公告成功");
		return "redirect:"+Global.getAdminPath()+"/frontnotification/frontNotification/?repage";
	}

}