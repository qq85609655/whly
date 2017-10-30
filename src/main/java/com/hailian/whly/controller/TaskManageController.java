package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportHistory;
import com.hailian.whly.report.utils.ResultJson;
import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 
 * @className TaskManageController.java
 * @time   2017年10月19日 下午6:16:28
 * @author zuoqb
 * @todo   业务管理
 */
@Controller
@RequestMapping("${whlyPath}/taskmange")
public class TaskManageController extends BaseController {
	
	@Autowired
	WhlyAccountService whlyAccountService;
	
	/**
	 * 
	 * @time   2017年10月1日 下午8:43:04
	 * @author zuoqb
	 * @todo   数据审核列表
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping({"/examine/list"})
	@ResponseBody
	public ResultJson examineList(FrontReportHistory frontReportHistory, HttpServletRequest request, HttpServletResponse response, Model model){
		ResultJson json = new ResultJson();
		List<FrontReportHistory> list = whlyAccountService.findHitsory(frontReportHistory);
		json.success(list);
		return json;
	}
	/**
	 * 
	 * @time   2017年10月19日 下午6:27:11
	 * @author zuoqb
	 * @todo   企业上报
	 */
	@RequestMapping({"/company/report"})
	public String report(){
		return Global.getWhlyPage()+"/taskmange/report";
	}
	/**
	 * 
	 * @time   2017年10月19日 下午6:32:22
	 * @author zuoqb
	 * @todo   审核
	 * @param  @return
	 * @return_type   String
	 */
	@RequiresPermissions("report:frontCompanyReport:examine")
	@RequestMapping({"/examine/form"})
	public String examineForm(FrontCompanyReport frontCompanyReport, Model model, HttpServletRequest request, HttpServletResponse response){
		if(UserUtils.getUser()==null){
			return "redirect:" + whlyPath + "/login";
		}
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		return Global.getWhlyPage()+"/taskmange/examineForm";
	}
}
