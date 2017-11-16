/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.reportstatistics.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.hailian.whly.commom.IndexModel;
import com.hailian.whly.report.utils.ResultJson;
import com.hailian.whly.reportstatistics.entity.ReportStatistics;
import com.hailian.whly.reportstatistics.service.ReportStatisticsService;

/**
 * 上报统计图用Controller
 * @author zyl
 * @version 2017-11-09
 */
@Controller
@RequestMapping(value = "${whlyPath}/reportstatistics/reportStatistics")
public class ReportStatisticsController extends BaseController {

	@Autowired
	private ReportStatisticsService reportStatisticsService;
	
	@ModelAttribute
	public ReportStatistics get(@RequestParam(required=false) String id) {
		ReportStatistics entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = reportStatisticsService.get(id);
		}
		if (entity == null){
			entity = new ReportStatistics();
		}
		return entity;
	}
	
	@RequiresPermissions("reportstatistics:reportStatistics:view")
	@RequestMapping(value = {"list", ""})
	public String list(ReportStatistics reportStatistics, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ReportStatistics> page = reportStatisticsService.findPage(new Page<ReportStatistics>(request, response), reportStatistics); 
		model.addAttribute("page", page);
		return "whly/reportstatistics/reportStatisticsList";
	}

	@RequiresPermissions("reportstatistics:reportStatistics:view")
	@RequestMapping(value = "form")
	public String form(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("reportStatistics", reportStatistics);
		return "whly/reportstatistics/reportStatisticsForm";
	}
	
	@RequestMapping(value = "getStatic")
	@ResponseBody
	public ResultJson getStatic(ReportStatistics reportStatistics, Model model, HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		if(reportStatistics.getYear() == null || reportStatistics.getYear().isEmpty()) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			reportStatistics.setYear(sdf.format(new Date()));
		}
		List<ReportStatistics> list = reportStatisticsService.getStatic(reportStatistics);
		json.success(list);
		return json;
	}
	
	
	
	@RequiresPermissions("reportstatistics:reportStatistics:edit")
	@RequestMapping(value = "save")
	public String save(ReportStatistics reportStatistics, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, reportStatistics)){
			return form(reportStatistics, model);
		}
		reportStatisticsService.save(reportStatistics);
		addMessage(redirectAttributes, "保存查询统计数据成功");
		return "redirect:"+Global.getAdminPath()+"/reportstatistics/reportStatistics/?repage";
	}
	
	@RequiresPermissions("reportstatistics:reportStatistics:edit")
	@RequestMapping(value = "delete")
	public String delete(ReportStatistics reportStatistics, RedirectAttributes redirectAttributes) {
		reportStatisticsService.delete(reportStatistics);
		addMessage(redirectAttributes, "删除查询统计数据成功");
		return "redirect:"+Global.getAdminPath()+"/reportstatistics/reportStatistics/?repage";
	}
	
	/**
	 * 
	 * @time   2017年11月12日 下午12:25:28
	 * @author zuoqb
	 * @todo   统计企业同比增速
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @param request
	 * @param  @param response
	 * @param  @return
	 * @return_type   ResultJson
	 */
	@RequestMapping(value = "getStaiticQytb")
	@ResponseBody
	public ResultJson getStaiticQytb(ReportStatistics reportStatistics, Model model, HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		if(reportStatistics.getYear() == null || reportStatistics.getYear().isEmpty()) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			reportStatistics.setYear(sdf.format(new Date()));
		}
		reportStatistics.setParentId(UserUtils.getUser().getCompany().getParentId());
		List<IndexModel> data = reportStatisticsService.getStaiticQytb(reportStatistics);
		json.success(data);
		return json;
	}
	
	/**
	 *
	 * @time   2017年11月13日 下午5:21:25 
	 * @author zhouyl
	 * @Description   打开企业数据同比增速页面
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */
	@RequestMapping(value = "companyYearUpPage")
	public String companyYearUpPage(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
		model.addAttribute("queryType", "1");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/companyYearUp";
	}
	
	/**
	 *
	 * @time   2017年11月13日 下午6:06:54 
	 * @author zhouyl
	 * @Description   打开地区数据同比增速页面
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */
	@RequestMapping(value = "areaYearUpPage")
	public String areaYearUpPage(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
		model.addAttribute("queryType", "1");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/areaYearUp";
	}
	
	/**
	 *
	 * @time   2017年11月14日 上午11:19:30 
	 * @author zhouyl
	 * @Description   打开行业数据同比增速页面
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */
	@RequestMapping(value = "industryYearUpPage")
	public String industryYearUpPage(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
		model.addAttribute("queryType", "1");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/industryYearUp";
	}
	
	/**
	 *
	 * @time   2017年11月13日 下午5:21:25 
	 * @author zhouyl
	 * @Description   打开企业数据环比增速页面
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */
	@RequestMapping(value = "companyLoopUpPage")
	public String companyLoopUpPage(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
		model.addAttribute("queryType", "2");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/companyYearUp";
	}
	
	
	/**
	 *
	 * @time   2017年11月13日 下午6:06:54 
	 * @author zhouyl
	 * @Description   打开地区数据环比增速页面
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */
	@RequestMapping(value = "areaLoopUpPage")
	public String areaLoopUpPage(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
		model.addAttribute("queryType", "2");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/areaYearUp";
	}
	
	/**
	 *
	 * @time   2017年11月14日 上午11:19:30 
	 * @author zhouyl
	 * @Description   打开行业数据环比增速页面
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */
	@RequestMapping(value = "industryLoopUpPage")
	public String industryLoopUpPage(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
		model.addAttribute("queryType", "2");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/industryYearUp";
	}

	/**
	 *
	 * @time   2017年11月15日 
	 * @author chen xin
	 * @Description   打开行业从业人数分析
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */			//			"industryEnploymentNumberAnalysisPage"
	@RequestMapping(value = "industryEnploymentNumberAnalysisPage")
	public String industryEmploymentNumberAnalysis(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
	//	model.addAttribute("queryType", "1");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/industryEmploymentNumberAnalysis";
	}
	
	/**
	 * 
	 * @time   2017年11月16日
	 * @author chen xin
	 * @todo  行业从业人数分析数据
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @param request
	 * @param  @param response
	 * @param  @return
	 * @return_type   ResultJson
	 */
	@RequestMapping(value = "industryEnploymentNumberAnalysis")
	@ResponseBody
	public ResultJson getIndustryEnploymentNumberAnalysis(ReportStatistics reportStatistics, Model model, HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		if(reportStatistics.getYear() == null || reportStatistics.getYear().isEmpty()) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			reportStatistics.setYear(sdf.format(new Date()));
		}
		List<ReportStatistics> data = reportStatisticsService.getIndustryEnploymentNumberAnalysis(reportStatistics);
		json.success(data);
		return json;
	}
	
	/**
	 *
	 * @time   2017年11月15日 
	 * @author chen xin
	 * @Description   打开地区从业人数分析
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @return String
	 */			//			"industryEnploymentNumberAnalysisPage"
	@RequestMapping(value = "areaEnploymentNumberAnalysisPage")
	public String areaEmploymentNumberAnalysis(ReportStatistics reportStatistics, Model model) {
		model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
		if((reportStatistics.getYear()==null || reportStatistics.getYear().trim().isEmpty()) && reportStatistics.getMonth()==null) {
			Calendar c = Calendar.getInstance();	//获取时间
			String year1 = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			reportStatistics.setYear(year1 + "年" + month + "月");
		}
	//	model.addAttribute("queryType", "1");
		model.addAttribute("reportStatistics", reportStatistics);
		return Global.getWhlyPage() +"/statistics/areaEmploymentNumberAnalysis";
	}
	
	/**
	 * 
	 * @time   2017年11月16日
	 * @author chen xin
	 * @todo  地区从业人数分析数据
	 * @param  @param reportStatistics
	 * @param  @param model
	 * @param  @param request
	 * @param  @param response
	 * @param  @return
	 * @return_type   ResultJson
	 */
	@RequestMapping(value = "areaEnploymentNumberAnalysis")
	@ResponseBody
	public ResultJson getAreaEnploymentNumberAnalysis(ReportStatistics reportStatistics, Model model, HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		if(reportStatistics.getYear() == null || reportStatistics.getYear().isEmpty()) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			reportStatistics.setYear(sdf.format(new Date()));
		}
		List<ReportStatistics> data = reportStatisticsService.getAreaEnploymentNumberAnalysis(reportStatistics);
		json.success(data);
		return json;
	}
}