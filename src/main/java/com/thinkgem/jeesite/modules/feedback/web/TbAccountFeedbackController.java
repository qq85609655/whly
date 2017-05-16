/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.feedback.web;

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
import com.thinkgem.jeesite.modules.feedback.entity.TbAccountFeedback;
import com.thinkgem.jeesite.modules.feedback.service.TbAccountFeedbackService;

/**
 * 反馈记录Controller
 * @author wcl
 * @version 2017-05-11
 */
@Controller
@RequestMapping(value = "${adminPath}/feedback/tbAccountFeedback")
public class TbAccountFeedbackController extends BaseController {

	@Autowired
	private TbAccountFeedbackService tbAccountFeedbackService;
	
	@ModelAttribute
	public TbAccountFeedback get(@RequestParam(required=false) String id) {
		TbAccountFeedback entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbAccountFeedbackService.get(id);
		}
		if (entity == null){
			entity = new TbAccountFeedback();
		}
		return entity;
	}
	
	@RequiresPermissions("feedback:tbAccountFeedback:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbAccountFeedback tbAccountFeedback, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbAccountFeedback> page = tbAccountFeedbackService.findPage(new Page<TbAccountFeedback>(request, response), tbAccountFeedback); 
		model.addAttribute("page", page);
		return "modules/feedback/tbAccountFeedbackList";
	}

	@RequiresPermissions("feedback:tbAccountFeedback:view")
	@RequestMapping(value = "form")
	public String form(TbAccountFeedback tbAccountFeedback, Model model) {
		model.addAttribute("tbAccountFeedback", tbAccountFeedback);
		return "modules/feedback/tbAccountFeedbackForm";
	}

	@RequiresPermissions("feedback:tbAccountFeedback:edit")
	@RequestMapping(value = "save")
	public String save(TbAccountFeedback tbAccountFeedback, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbAccountFeedback)){
			return form(tbAccountFeedback, model);
		}
		tbAccountFeedbackService.save(tbAccountFeedback);
		addMessage(redirectAttributes, "保存反馈记录成功");
		return "redirect:"+Global.getAdminPath()+"/feedback/tbAccountFeedback/?repage";
	}
	
	@RequiresPermissions("feedback:tbAccountFeedback:edit")
	@RequestMapping(value = "delete")
	public String delete(TbAccountFeedback tbAccountFeedback, RedirectAttributes redirectAttributes) {
		tbAccountFeedbackService.delete(tbAccountFeedback);
		addMessage(redirectAttributes, "删除反馈记录成功");
		return "redirect:"+Global.getAdminPath()+"/feedback/tbAccountFeedback/?repage";
	}

}