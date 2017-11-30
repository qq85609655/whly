/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.hailian.whly.frontnotification.entity.FrontNotification;
import com.hailian.whly.frontnotification.service.FrontNotificationService;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.service.FrontCompanyReportService;
import com.hailian.whly.report.utils.ResultJson;

/**
 * 新闻公告Controller
 * @author zyl
 * @version 2017-11-02
 */
@Controller
@RequestMapping(value = "${whlyPath}/report/frontNotificationList")
public class FrontNotificationListController extends BaseController {

	@Autowired
	private FrontNotificationService frontNotificationService;
	@Autowired
	private FrontCompanyReportService frontCompanyReportService;
	
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
		frontNotification.setCompanyType(UserUtils.getUser().getCompany().getParentId());
		List<FrontNotification> list = frontNotificationService.getfrontNotification(frontNotification);
		json.success(list);
		return json;
	}
	
	@RequestMapping({"/listData"})
	@ResponseBody
	public ResultJson listData(FrontNotification frontNotification, HttpServletRequest request, HttpServletResponse response, Model model) {
		ResultJson json = new ResultJson();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time= sdf.format(new Date());
		Office company = UserUtils.getUser().getCompany();
		if(company.getArea() != null && !company.getArea().getId().isEmpty()) {
			frontNotification.setCompanyType(company.getParentId());
		} else {
			frontNotification.setCompanyType(company.getId());
		}
		if(!frontNotification.getCategoryType().equals("3")) { 
			frontNotification.setCompanyType(frontCompanyReportService.getCompanyParentId());
		}
		Page<FrontNotification> page = frontNotificationService.findPage(new Page<FrontNotification>(request, response), frontNotification);
		if(frontNotification.getCategoryType().equals("3")) { //查看邮件用
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("page", page);
			data.put("time", time);
			json.success(data);
		} else {
			json.success(page);
		}
		return json;
	}
	
	@RequestMapping(value = {"listPage", ""})
	public String listPage(FrontNotification frontNotification,HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time= sdf.format(new Date());
			model.addAttribute("time", time);
			if(frontNotification.getCategoryType()==null || frontNotification.getCategoryType().equals("")) {
				model.addAttribute("categoryType","1");
			} else {
				model.addAttribute("categoryType", frontNotification.getCategoryType());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() +"/home/moreNews";
	}
	
	//获取系统公告列表
	@RequestMapping(value = {"listNoticePage", ""})
	public String listNoticePage(FrontNotification frontNotification,HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time= sdf.format(new Date());
			model.addAttribute("time", time);
			frontNotification.setCategoryType("2");
			model.addAttribute("categoryType", frontNotification.getCategoryType());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() +"/home/moreNews";
	}
	
	@RequestMapping(value = {"listMailPage", ""})
	public String listMailPage(FrontNotification frontNotification,HttpServletRequest request, HttpServletResponse response, Model model) {
		return Global.getWhlyPage() +"/frontnotification/mailMessage";
	}
	
	//根据左边菜单查询条件跳转页面
	@RequestMapping(value = {"vagueWordsList", ""})
	public String vagueWordsList(FrontNotification frontNotification,HttpServletRequest request, HttpServletResponse response, Model model) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time= sdf.format(new Date());
		model.addAttribute("time", time);
		model.addAttribute("vagueWords", frontNotification.getVagueWords());
		return Global.getWhlyPage() +"/home/news";
	}

}