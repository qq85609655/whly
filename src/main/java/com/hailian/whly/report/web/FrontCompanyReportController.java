/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.web;

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

import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.service.FrontCompanyReportService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 企业上报Controller
 * @author zqb
 * @version 2017-10-22
 */
@Controller
@RequestMapping(value = "${adminPath}/report/frontCompanyReport")
public class FrontCompanyReportController extends BaseController {

	@Autowired
	private FrontCompanyReportService frontCompanyReportService;
	
	@ModelAttribute
	public FrontCompanyReport get(@RequestParam(required=false) String id) {
		FrontCompanyReport entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = frontCompanyReportService.get(id);
		}
		if (entity == null){
			entity = new FrontCompanyReport();
		}
		return entity;
	}
	
	/*@RequiresPermissions("report:frontCompanyReport:view")*/
	@RequestMapping(value = {"list", ""})
	public String list(FrontCompanyReport frontCompanyReport, HttpServletRequest request, HttpServletResponse response, Model model) {
	try {
		Page<FrontCompanyReport> page = frontCompanyReportService.findPage(new Page<FrontCompanyReport>(request, response), frontCompanyReport); 
		model.addAttribute("page", page);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return "whly/report/frontCompanyReportList";
	}

	@RequiresPermissions("report:frontCompanyReport:view")
	@RequestMapping(value = "form")
	public String form(FrontCompanyReport frontCompanyReport, Model model) {
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		return "whly/report/frontCompanyReportForm";
	}

	@RequiresPermissions("report:frontCompanyReport:edit")
	@RequestMapping(value = "save")
	public String save(FrontCompanyReport frontCompanyReport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, frontCompanyReport)){
			return form(frontCompanyReport, model);
		}
		frontCompanyReportService.save(frontCompanyReport);
		addMessage(redirectAttributes, "保存企业上报成功");
		return "redirect:"+Global.getAdminPath()+"/report/frontCompanyReport/?repage";
	}
	
	@RequiresPermissions("report:frontCompanyReport:edit")
	@RequestMapping(value = "delete")
	public String delete(FrontCompanyReport frontCompanyReport, RedirectAttributes redirectAttributes) {
		frontCompanyReportService.delete(frontCompanyReport);
		addMessage(redirectAttributes, "删除企业上报成功");
		return "redirect:"+Global.getAdminPath()+"/report/frontCompanyReport/?repage";
	}

}