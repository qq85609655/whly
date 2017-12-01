package com.hailian.whly.report.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hailian.whly.commom.CheckStatus;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportHistory;
import com.hailian.whly.report.service.FrontCompanyReportService;
import com.hailian.whly.report.utils.ResultJson;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 企业上报Controller
 * 
 * @author zqb
 * @version 2017-10-22
 */
@Controller
@RequestMapping(value = "${whlyPath}/report/frontCompanyReport")
public class FrontCompanyReportController extends BaseController {

	@Autowired
	private FrontCompanyReportService frontCompanyReportService;

	// @ModelAttribute
	public FrontCompanyReport get(@RequestParam(required = false) String id) {
		FrontCompanyReport entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = frontCompanyReportService.get(id);
		}
		if (entity == null) {
			entity = new FrontCompanyReport();
		}
		return entity;
	}

	/**
	 * 
	 * @time 2017年10月30日 下午5:51:48
	 * @author zuoqb
	 * @todo 审核列表
	 * @param @param
	 *            frontCompanyReport
	 * @param @param
	 *            request
	 * @param @param
	 *            response
	 * @param @param
	 *            model
	 * @param @return
	 * @return_type String
	 */
	/* @RequiresPermissions("report:frontCompanyReport:view") */
	@RequestMapping(value = { "list", "" })
	public String list(FrontCompanyReport frontCompanyReport, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		try {
			model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
			model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
			model.addAttribute("status", CheckStatus.getAllStatus());
			if ((frontCompanyReport.getYear() == null || frontCompanyReport.getYear().trim().equals(""))
					&& frontCompanyReport.getMonth() == null) {
				Calendar now = Calendar.getInstance();
				Integer year1 = Integer.valueOf(now.get(1));
				Integer month = Integer.valueOf(now.get(2))+1;
				Integer day = Integer.valueOf(now.get(5));
				if(Integer.valueOf(month) == 1) {
					if(day <= 9) {
						month = 12;
						year1 = Integer.valueOf(year1) - 1;
					} 
				} else {
					if(day <= 9) {
						month = Integer.valueOf(month) - 1;
					} 
				}
				/*Calendar c = Calendar.getInstance(); // 获取时间
				String year1 = String.valueOf(c.get(Calendar.YEAR));
				String month = String.valueOf(c.get(Calendar.MONTH) + 1);*/
				frontCompanyReport.setYear(year1 + "年" + month + "月");
			}
			if ((frontCompanyReport.getYear() == null || frontCompanyReport.getYear().trim().equals(""))
					&& frontCompanyReport.getMonth() != null) {
				frontCompanyReport.setMonth("");
			}
			model.addAttribute("front", frontCompanyReport);
			Office company= UserUtils.getUser().getCompany();
			if(company.getArea() != null && !company.getArea().getId().isEmpty()) {
				frontCompanyReport.setCompanyParentId(company.getParentId());
			} else {
				frontCompanyReport.setCompanyParentId(company.getId());
			}
			if(company.getArea()!=null && frontCompanyReport.getArea().getId().equals("this")) {
				Area area= new Area();
				area.setId(company.getArea().getId());
				frontCompanyReport.setArea(area);
			} else {
				if(frontCompanyReport.getArea()!=null) {
					frontCompanyReport.getArea().setId(null);
				}
			}
			Page<FrontCompanyReport> page = frontCompanyReportService
					.findPage(new Page<FrontCompanyReport>(request, response), frontCompanyReport);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() + "/report/frontCompanyReportList";
	}
	
	@RequestMapping(value = { "listAll", "" })
	public String listAll(FrontCompanyReport frontCompanyReport, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		try {
			model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
			model.addAttribute("industyTypeLable", UserUtils.getUser().getCompany().getIndustyType().getType());
			model.addAttribute("status", CheckStatus.getAllStatus());
			if ((frontCompanyReport.getYear() == null || frontCompanyReport.getYear().trim().equals(""))
					&& frontCompanyReport.getMonth() != null) {
				frontCompanyReport.setMonth("");
			}
			model.addAttribute("front", frontCompanyReport);
			Office company= UserUtils.getUser().getCompany();
			if(company.getArea() != null && !company.getArea().getId().isEmpty()) {
				frontCompanyReport.setCompanyParentId(company.getParentId());
			} else {
				frontCompanyReport.setCompanyParentId(company.getId());
			}
			Page<FrontCompanyReport> page = frontCompanyReportService
					.findPage(new Page<FrontCompanyReport>(request, response), frontCompanyReport);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() + "/report/frontCompanyReportListAll";
	}

	/* @RequiresPermissions("report:frontCompanyReport:view") */
	@RequestMapping(value = "form")
	public String form(FrontCompanyReport frontCompanyReport, Model model) {
		if (UserUtils.getUser().getCompany() != null) {
			frontCompanyReport.setOperator(UserUtils.getUser().getName());
		}
		String from = frontCompanyReport.getFrom();
		Map<String, Object> topMonth = new HashMap<String, Object>();
		if (org.apache.commons.lang3.StringUtils.isBlank(frontCompanyReport.getId())) {
			frontCompanyReport.setCompanyName(UserUtils.getUser().getCompany().getName());
			try {
				Calendar now = Calendar.getInstance();
				Integer year = Integer.valueOf(now.get(1));
				Integer month = Integer.valueOf(now.get(2))+1;
				Integer day = Integer.valueOf(now.get(5));
				if(Integer.valueOf(month) == 1) {
					if(day <= 9) {
						month = 12;
						year = Integer.valueOf(year) - 1;
					} 
				} else {
					if(day <= 9) {
						month = Integer.valueOf(month) - 1;
					} 
				}
				topMonth.put("year", year);
				topMonth.put("month", month);
				topMonth.put("info", year + "年" + month + "月");
				//topMonth = frontCompanyReportService.getTopReportMonth();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else {
			frontCompanyReport = frontCompanyReportService.get(frontCompanyReport.getId());
		}
		frontCompanyReport.setFrom(from);
		model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		if(UserUtils.getUser().getCompany()!=null) {
			if(UserUtils.getUser().getCompany().getArea()!=null) {
				model.addAttribute("areaId", UserUtils.getUser().getCompany().getArea().getId());
			} else {
				model.addAttribute("areaId", "");
			}
		} else {
			model.addAttribute("areaId", "");
		}
		model.addAttribute("companyName", UserUtils.getUser().getCompany().getName());
		model.addAttribute("topMonth", topMonth);
		return Global.getWhlyPage() + "/report/frontCompanyReportForm";
	}

	// 根据上报ID查询所有问题
	@RequestMapping(value = "getfrontCompanyReportById")
	@ResponseBody
	public ResultJson getfrontCompanyReportById(FrontCompanyReport frontCompanyReport, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		FrontCompanyReport front = frontCompanyReportService.get(frontCompanyReport.getId());
		json.success(front);
		return json;
	}
	
	/**
	 *
	 * @time   2017年11月22日 下午3:52:32 
	 * @author zhouyl
	 * @Description   根据企业ID获取扶持项目
	 * @param  @param companyId
	 * @param  @param model
	 * @param  @param request
	 * @param  @param response
	 * @param  @return ResultJson
	 */
	@RequestMapping(value = "getfrontCompanyprojectById")
	@ResponseBody
	public ResultJson getfrontCompanyprojectById(String companyId, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		ResultJson json = new ResultJson();
		if(companyId == null || companyId.isEmpty()) {
			companyId = UserUtils.getUser().getCompany().getId();
		}
		List<FrontCompanyReport> front = frontCompanyReportService.getProjectById(companyId);
		json.success(front);
		return json;
	}
	
	
	// 获取待办数
	@RequestMapping(value = "getBancklogNumber")
	@ResponseBody
	public ResultJson getBancklogNumber(FrontCompanyReport frontCompanyReport, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		ResultJson json = new ResultJson();
		int bancklogNumber = frontCompanyReportService.getBancklogNumber(frontCompanyReport);
		json.success(bancklogNumber);
		return json;
	}

	/* @RequiresPermissions("report:frontCompanyReport:edit") */
	@RequestMapping(value = "save")
	public String save(FrontCompanyReport frontCompanyReport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, frontCompanyReport)) {
			return form(frontCompanyReport, model);
		}
		
		/*Map<String, Object> topMonth = frontCompanyReportService.getTopReportMonth();
		frontCompanyReport.setYear(topMonth.get("year") + "");
		frontCompanyReport.setMonth(topMonth.get("month") + "");*/
		//获取是否可以上报
		boolean reportPermission = frontCompanyReportService.findAlreadyReport();
		if ( !reportPermission) {
			Calendar now = Calendar.getInstance();
			Integer day = Integer.valueOf(now.get(5));
			if(day > 9) {
				addMessage(redirectAttributes, "对不起，该月月报已经上报！请于下月10号再提交上报信息。");
			} else {
				addMessage(redirectAttributes, "对不起，该月月报已经上报！请于本月10号再提交上报信息。");
			}
			return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/form";
		} else {
			frontCompanyReportService.saveReport(frontCompanyReport);
			addMessage(redirectAttributes, "上报成功，请等待审核。");
			model.addAttribute("frontCompanyReport", frontCompanyReport);
			return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/viewlist";
		}

	}

	/* @RequiresPermissions("report:frontCompanyReport:edit") */
	@RequestMapping(value = "update")
	public String update(FrontCompanyReport frontCompanyReport, Model model, RedirectAttributes redirectAttributes) {
		String from = frontCompanyReport.getFrom();
		String message = frontCompanyReportService.update(frontCompanyReport);
		addMessage(redirectAttributes, message);
		model.addAttribute("frontCompanyReport", frontCompanyReport);
		if ("sh".equals(from)) {
			return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/list";
		} else {
			return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/viewlist";
		}
	}

	/* @RequiresPermissions("report:frontCompanyReport:edit") */
	@RequestMapping(value = "delete")
	public String delete(FrontCompanyReport frontCompanyReport, RedirectAttributes redirectAttributes) {
		frontCompanyReportService.delete(frontCompanyReport);
		addMessage(redirectAttributes, "删除企业上报成功");
		return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/form";
	}

	/* @RequiresPermissions("report:frontCompanyReport:export") */
	@RequestMapping(value = "/export")
	public String exportFile(FrontCompanyReport frontCompanyReport,String exportType, String menuId, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes, Model model) {
		String url = "list";
		try {
			model.addAttribute("frontCompanyReport", frontCompanyReport);
			if(exportType!=null && !exportType.isEmpty()) {
				int[] i = {Integer.valueOf(exportType)};
				String fileName = "企业上报信息" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
				Office company= UserUtils.getUser().getCompany();
				if(company.getArea() != null && !company.getArea().getId().isEmpty()) {
					frontCompanyReport.setCompanyParentId(company.getParentId());
				} else {
					frontCompanyReport.setCompanyParentId(company.getId());
				}
				if(frontCompanyReport.getArea().getId().equals("this")) {
					Area area= new Area();
					area.setId(company.getArea().getId());
					frontCompanyReport.setArea(area);
				} else {
					url = "listAll";
				}
				if(frontCompanyReport.getYear() == null || frontCompanyReport.getYear().trim().isEmpty()) {
					frontCompanyReport.setMonth(null);
				}
				List<FrontCompanyReport> list = frontCompanyReportService.findList(frontCompanyReport);
				if(list == null || list.size() == 0) {
					model.addAttribute("message", "没有查询到上报信息，请更改检索条件！");
				} else {
					new ExportExcel("企业上报信息", FrontCompanyReport.class,1, i).setDataList(list).write(response, fileName).dispose();
				}
				
			} else {
				model.addAttribute("message", "导出企业上报数据失败！");
				//addMessage(redirectAttributes, "导出企业上报数据失败！");
			}
			
		} catch (Exception e) {
			model.addAttribute("message",  "导出企业上报数据失败！失败信息：" + e.getMessage());
			//addMessage(redirectAttributes, "导出企业上报数据失败！失败信息：" + e.getMessage());
		}
		return "forward:" + Global.getWhlyPath() + "/report/frontCompanyReport/" + url;
	}

	/* @RequiresPermissions("report:frontCompanyReport:history") */
	@RequestMapping(value = { "history", "" })
	public String history(FrontCompanyReport frontCompanyReport, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			String from = frontCompanyReport.getFrom();
			frontCompanyReport = frontCompanyReportService.get(frontCompanyReport.getId());
			frontCompanyReport.setFrom(from);
			model.addAttribute("status", CheckStatus.getAllStatus());
			model.addAttribute("front", frontCompanyReport);
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("reportId", frontCompanyReport.getId());
			List<FrontReportHistory> page = frontCompanyReportService.getHistory(param);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			for (int i = 0; i < page.size(); i++) {
				JSONObject json = new JSONObject(page.get(i).getDescription());

				json.get("status");
				HashMap<String, Object> temp = new HashMap<String, Object>();
				temp.put("id", json.get("id"));
				try {
					temp.put("month", json.get("month"));
				} catch (Exception e) {
					temp.put("month", "");
				}
				try {
					temp.put("year", json.get("year"));
				} catch (Exception e) {
					temp.put("year", "");
				}
				try {
					temp.put("reportTime", json.get("reportTime"));
				} catch (Exception e) {
					temp.put("reportTime", "");
				}
				try {
					temp.put("status", json.get("status"));
				} catch (Exception e) {
					temp.put("status", "");
				}
				try {
					temp.put("insertTime", json.get("insertTime"));
				} catch (Exception e) {
					temp.put("insertTime", "");
				}
				try {
					temp.put("updateTime", sdf.format(page.get(i).getUpdateDate()));
				} catch (Exception e) {
					temp.put("updateTime", "");
				}
				try {
					temp.put("companyName", json.get("companyName"));
				} catch (Exception e) {
					temp.put("companyName", "");
				}
				try {
					temp.put("empQuantity", json.get("empQuantity"));
				} catch (Exception e) {
					temp.put("empQuantity", "");
				}
				try {
					temp.put("totalProfit", json.get("totalProfit"));
				} catch (Exception e) {
					temp.put("totalProfit", "");
				}
				try {
					temp.put("totalIncome", json.get("totalIncome"));
				} catch (Exception e) {
					temp.put("totalIncome", "");
				}
				try {
					temp.put("totalTax", json.get("totalTax"));
				} catch (Exception e) {
					temp.put("totalTax", "");
				}
				try {
					temp.put("description", json.get("description"));
				} catch (Exception e) {
					temp.put("description", "");
				}
				try {
					temp.put("statusName", json.get("status"));
				} catch (Exception e) {
					temp.put("statusName", "");
				}
				
				try {
					temp.put("projectName", json.get("projectName"));
				} catch (Exception e) {
					temp.put("projectName", "");
				}
				try {
					temp.put("totalInvestment", json.get("totalInvestment"));
				} catch (Exception e) {
					temp.put("totalInvestment", "");
				}
				try {
					temp.put("bankLoanAmount", json.get("bankLoanAmount"));
				} catch (Exception e) {
					temp.put("bankLoanAmount", "");
				}
				try {
					temp.put("yearLimit", json.get("yearLimit"));
				} catch (Exception e) {
					temp.put("yearLimit", "");
				}
				try {
					temp.put("projectContent", json.get("projectContent"));
				} catch (Exception e) {
					temp.put("projectContent", "");
				}
				try {
					temp.put("address", json.get("address"));
				} catch (Exception e) {
					temp.put("address", "");
				}
				try {
					temp.put("projectDesiredEffect", json.get("projectDesiredEffect"));
				} catch (Exception e) {
					temp.put("projectDesiredEffect", "");
				}
				try {
					temp.put("projectEvolve", json.get("projectEvolve"));
				} catch (Exception e) {
					temp.put("projectEvolve", "");
				}
				try {
					temp.put("monthInvestment", json.get("monthInvestment"));
				} catch (Exception e) {
					temp.put("monthInvestment", "");
				}
				try {
					if (json.get("reason") == null
							|| org.apache.commons.lang3.StringUtils.isBlank(json.get("reason") + "")
							|| "null".equals(json.get("reason") + "")) {
						temp.put("reason", "");
					} else {
						temp.put("reason", json.get("reason"));
					}
				} catch (Exception e) {
					temp.put("reason", "");
				}
				temp.put("operator", page.get(i).getOperator());
				try {
					/*
					 * JSONObject area = new JSONObject(json.get("area"));
					 * temp.put("area",area.get("name"));
					 */
					Area area = (Area) JsonMapper.fromJsonString(json.get("area").toString(), Area.class);
					temp.put("areaName", area.getName());
				} catch (Exception e) {
					temp.put("area", "");
				}
				try {
					temp.put("type", json.get("type"));
				} catch (Exception e) {
					temp.put("type", "");
				}
				try {
					temp.put("flag", json.get("flag"));
				} catch (Exception e) {
					temp.put("flag", "");
				}

				try {
					temp.put("operatingCosts", json.get("operatingCosts"));
				} catch (Exception e) {
					temp.put("operatingCosts", "");
				}
				try {
					temp.put("employeeCompensation", json.get("employeeCompensation"));
				} catch (Exception e) {
					temp.put("employeeCompensation", "");
				}
				try {
					temp.put("loanAmount", json.get("loanAmount"));
				} catch (Exception e) {
					temp.put("loanAmount", "");
				}
				try {
					temp.put("orderQuantity", json.get("orderQuantity"));
				} catch (Exception e) {
					temp.put("orderQuantity", "");
				}
				list.add(temp);
			}
			model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
			model.addAttribute("page", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() + "/report/frontCompanyReportHistory";
	}

	/**
	 * 
	 * @time 2017年10月30日 下午5:51:27
	 * @author zuoqb
	 * @todo 查看列表
	 * @param @param
	 *            frontCompanyReport
	 * @param @param
	 *            request
	 * @param @param
	 *            response
	 * @param @param
	 *            model
	 * @param @return
	 * @return_type String
	 */
	@RequestMapping(value = { "viewlist", "" })
	public String viewlist(FrontCompanyReport frontCompanyReport, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			model.addAttribute("companyParentType", frontCompanyReportService.getCompanyParentType());
			model.addAttribute("status", CheckStatus.getAllStatus());
			model.addAttribute("companyName", UserUtils.getUser().getCompany().getName());
			frontCompanyReport.setCompanyId(UserUtils.getUser().getCompany().getId());
			Page<FrontCompanyReport> page = frontCompanyReportService
					.findPage(new Page<FrontCompanyReport>(request, response), frontCompanyReport);
			model.addAttribute("page", page);
			System.out.println(page.getList().size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() + "/report/frontCompanyReportListView";
	}

}
