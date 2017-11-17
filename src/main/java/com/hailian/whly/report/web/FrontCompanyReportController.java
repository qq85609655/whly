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
				Calendar c = Calendar.getInstance(); // 获取时间
				String year1 = String.valueOf(c.get(Calendar.YEAR));
				String month = String.valueOf(c.get(Calendar.MONTH) + 1);
				frontCompanyReport.setYear(year1 + "年" + month + "月");
			}
			if ((frontCompanyReport.getYear() == null || frontCompanyReport.getYear().trim().equals(""))
					&& frontCompanyReport.getMonth() != null) {
				frontCompanyReport.setMonth("");
			}
			model.addAttribute("front", frontCompanyReport);
			String companyParentId = UserUtils.getUser().getCompany().getParentId();
			frontCompanyReport.setCompanyParentId(companyParentId);
			Page<FrontCompanyReport> page = frontCompanyReportService
					.findPage(new Page<FrontCompanyReport>(request, response), frontCompanyReport);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Global.getWhlyPage() + "/report/frontCompanyReportList";
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
				topMonth = frontCompanyReportService.getTopReportMonth();
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
		Calendar now = Calendar.getInstance();
		Integer year = Integer.valueOf(now.get(1));
		Integer month = Integer.valueOf(now.get(2) + 1);
		Map<String, Object> topMonth = frontCompanyReportService.getTopReportMonth();
		frontCompanyReport.setYear(topMonth.get("year") + "");
		frontCompanyReport.setMonth(topMonth.get("month") + "");
		if ((Integer.valueOf(frontCompanyReport.getYear()) >= year.intValue())
				&& (Integer.valueOf(frontCompanyReport.getMonth()) >= month.intValue())) {
			addMessage(redirectAttributes, "对不起，该月月报已经上报！请下月再提交上报信息。");
			return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/form";
		} else {
			frontCompanyReportService.saveReport(frontCompanyReport);
			addMessage(redirectAttributes, "上报成功，请等待审核。");
			/*
			 * frontCompanyReport.setId(""); if(UserUtils.getUser().getCompany()!=null) {
			 * frontCompanyReport.setCompanyName(UserUtils.getUser().getCompany().getName())
			 * ; }
			 */
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
	public String exportFile(FrontCompanyReport frontCompanyReport, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "企业上报信息" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			List<FrontCompanyReport> list = frontCompanyReportService.findList(frontCompanyReport);
			new ExportExcel("企业上报信息", FrontCompanyReport.class).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出企业上报数据失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + Global.getWhlyPath() + "/report/frontCompanyReport/?repage";

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
				temp.put("companyName", json.get("companyName"));
				temp.put("month", json.get("month"));
				temp.put("year", json.get("year"));
				temp.put("reportTime", json.get("reportTime"));
				temp.put("status", json.get("status"));
				temp.put("insertTime", json.get("insertTime"));
				temp.put("updateTime", sdf.format(page.get(i).getUpdateDate()));

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
			model.addAttribute("front", frontCompanyReport);
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
