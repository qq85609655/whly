/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.subscibe.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.subscibe.entity.TbCategorySubscibe;
import com.thinkgem.jeesite.modules.subscibe.service.TbCategorySubscibeService;

/**
 * 订阅日志Controller
 * @author wcl
 * @version 2017-05-12
 */
@Controller
@RequestMapping(value = "${adminPath}/subscibe/tbCategorySubscibe")
public class TbCategorySubscibeController extends BaseController {

	@Autowired
	private TbCategorySubscibeService tbCategorySubscibeService;
	
	@ModelAttribute
	public TbCategorySubscibe get(@RequestParam(required=false) String id) {
		TbCategorySubscibe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbCategorySubscibeService.get(id);
		}
		if (entity == null){
			entity = new TbCategorySubscibe();
		}
		return entity;
	}
	
	@RequiresPermissions("subscibe:tbCategorySubscibe:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbCategorySubscibe tbCategorySubscibe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbCategorySubscibe> page = tbCategorySubscibeService.findPage(new Page<TbCategorySubscibe>(request, response), tbCategorySubscibe); 
		model.addAttribute("page", page);
		return "modules/subscibe/tbCategorySubscibeList";
	}

	@RequiresPermissions("subscibe:tbCategorySubscibe:view")
	@RequestMapping(value = "form")
	public String form(TbCategorySubscibe tbCategorySubscibe, HttpServletRequest request, HttpServletResponse response, Model model) {
		String userId = request.getParameter("userId");
		tbCategorySubscibe.setFlag("1");
		tbCategorySubscibe.setUserId(userId);
		Page<TbCategorySubscibe> page = tbCategorySubscibeService.findPage(new Page<TbCategorySubscibe>(request, response), tbCategorySubscibe); 
		model.addAttribute("page", page);
		return "modules/subscibe/tbCategorySubscibeForm";
	}


}