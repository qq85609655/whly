/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.blogger.web.blogger;

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
import com.thinkgem.jeesite.modules.blogger.entity.blogger.TbBlogger;
import com.thinkgem.jeesite.modules.blogger.service.blogger.TbBloggerService;

/**
 * 微博配置Controller
 * @author zuoqb
 * @version 2017-05-23
 */
@Controller
@RequestMapping(value = "${adminPath}/blogger/blogger/tbBlogger")
public class TbBloggerController extends BaseController {

	@Autowired
	private TbBloggerService tbBloggerService;
	
	@ModelAttribute
	public TbBlogger get(@RequestParam(required=false) String id) {
		TbBlogger entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbBloggerService.get(id);
		}
		if (entity == null){
			entity = new TbBlogger();
		}
		return entity;
	}
	
	@RequiresPermissions("blogger:blogger:tbBlogger:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbBlogger tbBlogger, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbBlogger> page = tbBloggerService.findPage(new Page<TbBlogger>(request, response), tbBlogger); 
		model.addAttribute("page", page);
		return "modules/blogger/blogger/tbBloggerList";
	}

	@RequiresPermissions("blogger:blogger:tbBlogger:view")
	@RequestMapping(value = "form")
	public String form(TbBlogger tbBlogger, Model model) {
		model.addAttribute("tbBlogger", tbBlogger);
		return "modules/blogger/blogger/tbBloggerForm";
	}

	@RequiresPermissions("blogger:blogger:tbBlogger:edit")
	@RequestMapping(value = "save")
	public String save(TbBlogger tbBlogger, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbBlogger)){
			return form(tbBlogger, model);
		}
		tbBloggerService.save(tbBlogger);
		addMessage(redirectAttributes, "保存微博配置成功");
		return "redirect:"+Global.getAdminPath()+"/blogger/blogger/tbBlogger/?repage";
	}
	
	@RequiresPermissions("blogger:blogger:tbBlogger:edit")
	@RequestMapping(value = "delete")
	public String delete(TbBlogger tbBlogger, RedirectAttributes redirectAttributes) {
		tbBloggerService.delete(tbBlogger);
		addMessage(redirectAttributes, "删除微博配置成功");
		return "redirect:"+Global.getAdminPath()+"/blogger/blogger/tbBlogger/?repage";
	}

}