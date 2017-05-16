/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statisticsconfig.web;

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
import com.thinkgem.jeesite.modules.statisticsconfig.entity.TbStatisticsConfig;
import com.thinkgem.jeesite.modules.statisticsconfig.service.TbStatisticsConfigService;

/**
 * 新闻数量配置Controller
 * @author zuoqb
 * @version 2017-05-16
 */
@Controller
@RequestMapping(value = "${adminPath}/statisticsconfig/tbStatisticsConfig")
public class TbStatisticsConfigController extends BaseController {

	@Autowired
	private TbStatisticsConfigService tbStatisticsConfigService;
	
	@ModelAttribute
	public TbStatisticsConfig get(@RequestParam(required=false) String id) {
		TbStatisticsConfig entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbStatisticsConfigService.get(id);
		}
		if (entity == null){
			entity = new TbStatisticsConfig();
		}
		return entity;
	}
	
	@RequiresPermissions("statisticsconfig:tbStatisticsConfig:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbStatisticsConfig tbStatisticsConfig, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbStatisticsConfig> page = tbStatisticsConfigService.findPage(new Page<TbStatisticsConfig>(request, response), tbStatisticsConfig); 
		model.addAttribute("page", page);
		return "modules/statisticsconfig/tbStatisticsConfigList";
	}

	@RequiresPermissions("statisticsconfig:tbStatisticsConfig:view")
	@RequestMapping(value = "form")
	public String form(TbStatisticsConfig tbStatisticsConfig, Model model) {
		model.addAttribute("tbStatisticsConfig", tbStatisticsConfig);
		return "modules/statisticsconfig/tbStatisticsConfigForm";
	}

	@RequiresPermissions("statisticsconfig:tbStatisticsConfig:edit")
	@RequestMapping(value = "save")
	public String save(TbStatisticsConfig tbStatisticsConfig, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbStatisticsConfig)){
			return form(tbStatisticsConfig, model);
		}
		tbStatisticsConfigService.save(tbStatisticsConfig);
		addMessage(redirectAttributes, "保存新闻数量配置成功");
		return "redirect:"+Global.getAdminPath()+"/statisticsconfig/tbStatisticsConfig/?repage";
	}
	
	@RequiresPermissions("statisticsconfig:tbStatisticsConfig:edit")
	@RequestMapping(value = "delete")
	public String delete(TbStatisticsConfig tbStatisticsConfig, RedirectAttributes redirectAttributes) {
		tbStatisticsConfigService.delete(tbStatisticsConfig);
		addMessage(redirectAttributes, "删除新闻数量配置成功");
		return "redirect:"+Global.getAdminPath()+"/statisticsconfig/tbStatisticsConfig/?repage";
	}

}