/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.web;

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

import com.hailian.whly.commom.CheckStatus;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.service.FrontCompanyReportService;
import com.hailian.whly.report.utils.ResultJson;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 企业上报Controller
 * @author zqb
 * @version 2017-10-22
 */
@Controller
@RequestMapping(value = "${whlyPath}/report/frontCompanyReport")
public class FrontCompanyReportController extends BaseController {
	

	@Autowired
	private FrontCompanyReportService frontCompanyReportService;
	
	//@ModelAttribute
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
		model.addAttribute("status", CheckStatus.getAllStatus());
		model.addAttribute("front", frontCompanyReport);
		Page<FrontCompanyReport> page = frontCompanyReportService.findPage(new Page<FrontCompanyReport>(request, response), frontCompanyReport);
		model.addAttribute("page", page);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return Global.getWhlyPage()+"/report/frontCompanyReportList";
	}
	
	/*@RequiresPermissions("report:frontCompanyReport:view")*/
	@RequestMapping(value = "form")
	public String form(FrontCompanyReport frontCompanyReport, Model model) {
		if(UserUtils.getUser().getCompany()!=null) {
			frontCompanyReport.setCompanyName(UserUtils.getUser().getCompany().getName());
			frontCompanyReport.setOperator(UserUtils.getUser().getName());
		}
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		return Global.getWhlyPage()+"/report/frontCompanyReportForm";
	}
	
	//根据上报ID查询所有问题
	@RequestMapping(value = "getfrontCompanyReportById")
	@ResponseBody
	public ResultJson getfrontCompanyReportById(FrontCompanyReport frontCompanyReport, Model model, HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		FrontCompanyReport front = frontCompanyReportService.get(frontCompanyReport.getId());
		json.success(front);
		return json;
	}
	
	//@RequiresPermissions("report:frontCompanyReport:edit")
	@RequestMapping(value = "save")
	public String save(FrontCompanyReport frontCompanyReport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, frontCompanyReport)){
			return form(frontCompanyReport, model);
		}
		frontCompanyReportService.save(frontCompanyReport);
		addMessage(redirectAttributes, "保存企业上报成功");
		frontCompanyReport.setId("");
		if(UserUtils.getUser().getCompany()!=null) {
			frontCompanyReport.setCompanyName(UserUtils.getUser().getCompany().getName());
		}
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		return Global.getWhlyPage()+"/report/frontCompanyReportForm";
	}
	
	//@RequiresPermissions("report:frontCompanyReport:edit")
	@RequestMapping(value = "update")
	public String update(FrontCompanyReport frontCompanyReport, Model model, RedirectAttributes redirectAttributes) {
		frontCompanyReportService.update(frontCompanyReport);
		addMessage(redirectAttributes, "更改企业上报成功");
		frontCompanyReport.setId("");
		if(UserUtils.getUser().getCompany()!=null) {
			frontCompanyReport.setCompanyName(UserUtils.getUser().getCompany().getName());
		}
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		return Global.getWhlyPage()+"/report/frontCompanyReportForm";
	}
	
	@RequiresPermissions("report:frontCompanyReport:edit")
	@RequestMapping(value = "delete")
	public String delete(FrontCompanyReport frontCompanyReport, RedirectAttributes redirectAttributes) {
		frontCompanyReportService.delete(frontCompanyReport);
		addMessage(redirectAttributes, "删除企业上报成功");
		return "redirect:"+Global.getWhlyPath()+"/report/frontCompanyReport/?repage";
	}
	
	
	@RequestMapping(value = "/export")
    public String exportFile(FrontCompanyReport frontCompanyReport,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "企业信息"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            List<FrontCompanyReport> list = frontCompanyReportService.findList(frontCompanyReport);
            new ExportExcel("企业信息", FrontCompanyReport.class).setDataList(list).write(response, fileName).dispose();  
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出数据失败！失败信息："+e.getMessage());
		}
		return "redirect:" +Global.getWhlyPath()+"/report/frontCompanyReport/?repage";
		
    }

}