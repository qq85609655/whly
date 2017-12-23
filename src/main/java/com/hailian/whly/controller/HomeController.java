package com.hailian.whly.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.commom.CheckStatus;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.service.FrontCompanyReportService;
import com.thinkgem.jeesite.common.config.Global;

import org.springframework.ui.Model;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/home")
public class HomeController extends BaseController {
	@Autowired
	private SystemService systemService;
	@Autowired
	private FrontCompanyReportService frontCompanyReportService;
	/**
	 * 
	 * @time   2017年10月1日 下午8:43:04
	 * @author zuoqb
	 * @todo   首页
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping({"","/index"})
	public String home(Model model,FrontCompanyReport frontCompanyReport,HttpServletRequest request, HttpServletResponse response){
		UserUtils.removeCache(UserUtils.CACHE_FRONT_MENU_LIST);
		/*List<Menu> menuList = systemService.findAllFrontMenu();
		boolean canSh=false;
		for(Menu m:menuList){
			if(m!=null&&Global.getWhlyShMenuId().equals(m.getId())){
				//包含数据审核 则去掉数据查看功能
				canSh=true;
				break;
			}
		}*/
		model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
		boolean canSh = systemService.findUserCanSh();
		if(!canSh){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time= sdf.format(new Date());
			model.addAttribute("time", time);
			return whlyPage+"/home/news";
		}else{
			try {
				/*Office company= UserUtils.getUser().getCompany();
				if(company.getArea() != null && !company.getArea().getId().isEmpty()) {
					frontCompanyReport.setCompanyParentId(company.getParentId());
				} else {
					frontCompanyReport.setCompanyParentId(company.getId());
				}*/
				frontCompanyReport.setCompanyParentId(request.getParameter("pcid"));
				Page<FrontCompanyReport> page = frontCompanyReportService
						.findHomePage(new Page<FrontCompanyReport>(request, response), frontCompanyReport);
				model.addAttribute("page", page);
				model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
				model.addAttribute("frontCompanyReport", frontCompanyReport);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return whlyPage+"/home/home";
		}
	}
}
