package com.hailian.whly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 
 * @className WhlyTestController.java
 * @time   2017年9月30日 上午9:05:03
 * @author zuoqb
 * @todo   测试类
 */
@Controller
@RequestMapping("${whlyPath}/test")
public class WhlyTestController extends BaseController {
	@Autowired
	private WhlyAccountService whlyAccountService;

	@RequestMapping("/ui")
	public String ui(HttpServletRequest request, HttpServletResponse response,Model model) {
		return whlyPage+"/test/ui";
	}
	@RequestMapping("/news")
	public String news(HttpServletRequest request, HttpServletResponse response,Model model) {
		return whlyPage+"/test/news";
	}
	/* public Map<String, Object> getTopReportMonth()
			      throws Exception
			    {
			   90      LoginUser user = User.getCurrentUser();
			   91      Map result = new HashMap();
			   92      if (user == null) {
			   93        throw new BusinessException("当前登陆用户为空，请重新登录");
			      }
			   95      BdmCompany company = user.getCompany();
			   96      if (company == null) {
			   97        throw new BusinessException("当前登陆用户无所属企业，请重新登录");
			      }
			   99      Calendar now = Calendar.getInstance();
			  100      Integer year = Integer.valueOf(now.get(1));
			  101      Integer month = Integer.valueOf(now.get(2) + 1);
			  
			  103      CompanyMonthReport report = CompanyMonthReport.getTopMonthReport(company.getId());
			  104      if (report == null) {
			  105        result.put("year", year);
			  106        result.put("month", Integer.valueOf(month.intValue() - 1));
			  107        result.put("info", year + "年" + (month.intValue() - 1) + "月");
			  108        return result;
			      }
			  110      if (report.getMonth().equals(Integer.valueOf(12))) {
			  111        if ((report.getYear().equals(year)) && (report.getMonth().equals(Integer.valueOf(month.intValue() - 1)))) {
			  112          result.put("year", Integer.valueOf(report.getYear().intValue() + 1));
			  113          result.put("month", "01");
			  114          result.put("info", report.getYear().intValue() + 1 + "年01月");
			  115          return result;
			        }
			  117        result.put("year", Integer.valueOf(report.getYear().intValue() + 1));
			  118        result.put("month", "01");
			  119        result.put("info", report.getYear().intValue() + 1 + "年01月");
			  120        return result;
			      }
			  
			  123      if ((report.getYear().equals(year)) && (report.getMonth().intValue() >= month.intValue() - 2)) {
			  124        result.put("year", report.getYear());
			  125        result.put("month", Integer.valueOf(report.getMonth().intValue() + 1));
			  126        result.put("info", report.getYear() + "年" + (report.getMonth().intValue() + 1) + "月");
			  127        return result;
			      }
			  129      result.put("year", report.getYear());
			  130      result.put("month", Integer.valueOf(report.getMonth().intValue() + 1));
			  131      result.put("info", report.getYear() + "年" + (report.getMonth().intValue() + 1) + "月");
			  132      return result;
			    }*/
}
