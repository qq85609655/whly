/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.maillog.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.maillog.entity.TbMailLog;
import com.thinkgem.jeesite.modules.maillog.service.TbMailLogService;

/**
 * 邮件日志Controller
 * @author wcl
 * @version 2017-05-11
 */
@Controller
@RequestMapping(value = "${adminPath}/maillog/tbMailLog")
public class TbMailLogController extends BaseController {

	@Autowired
	private TbMailLogService tbMailLogService;
	
	@ModelAttribute
	public TbMailLog get(@RequestParam(required=false) String id) {
		TbMailLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbMailLogService.get(id);
		}
		if (entity == null){
			entity = new TbMailLog();
		}
		return entity;
	}
	
	@RequiresPermissions("maillog:tbMailLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbMailLog tbMailLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbMailLog> page = tbMailLogService.findPage(new Page<TbMailLog>(request, response), tbMailLog); 
		model.addAttribute("page", page);
		return "modules/maillog/tbMailLogList";
	}

	@RequiresPermissions("maillog:tbMailLog:view")
	@RequestMapping(value = "form")
	public String form(TbMailLog tbMailLog, Model model) {
		model.addAttribute("tbMailLog", tbMailLog);
		return "modules/maillog/tbMailLogForm";
	}

	@RequiresPermissions("maillog:tbMailLog:edit")
	@RequestMapping(value = "save")
	public String save(TbMailLog tbMailLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbMailLog)){
			return form(tbMailLog, model);
		}
		tbMailLogService.save(tbMailLog);
		addMessage(redirectAttributes, "保存邮件日志成功");
		return "redirect:"+Global.getAdminPath()+"/maillog/tbMailLog/?repage";
	}
	
	@RequiresPermissions("maillog:tbMailLog:edit")
	@RequestMapping(value = "delete")
	public String delete(TbMailLog tbMailLog, RedirectAttributes redirectAttributes) {
		tbMailLogService.delete(tbMailLog);
		addMessage(redirectAttributes, "删除邮件日志成功");
		return "redirect:"+Global.getAdminPath()+"/maillog/tbMailLog/?repage";
	}

}