package com.hailian.whly.report.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hailian.whly.report.dao.FrontCompanyReportDao;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportHistory;
import com.hailian.whly.report.entity.FrontReportQuestion;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 企业上报Service
 * @author zqb
 * @version 2017-10-22
 */
@Service
@Transactional(readOnly = true)
public class FrontCompanyReportService extends CrudService<FrontCompanyReportDao, FrontCompanyReport> {
	
	@Autowired
	private FrontCompanyReportDao dao;
	
	@Transactional(readOnly = true)
	public FrontCompanyReport get(String id) {
		if(id==null && id.trim()=="") {
			return null;
		}
		FrontCompanyReport frontCompanyReport = dao.get(id);
		List<FrontReportQuestion> list = dao.findQuestion(id);
		frontCompanyReport.setQuestion(list);
		return frontCompanyReport;
	}
	
	@Transactional(readOnly = true)
	public List<FrontCompanyReport> findReportById(FrontCompanyReport frontCompanyReport) {
		List<FrontCompanyReport> report = null;
		if(UserUtils.getUser().getCompany()!=null) {
			frontCompanyReport.setCompanyId(UserUtils.getUser().getCompany().getId());
			report = dao.findReport(frontCompanyReport);
		}
		return report;
	}
	
	@Transactional(readOnly = false)
	public List<FrontCompanyReport> findList(FrontCompanyReport frontCompanyReport) {
		if(frontCompanyReport.getYear()!=null && !frontCompanyReport.getYear().isEmpty()) {
			frontCompanyReport.setMonth(frontCompanyReport.getYear().substring(5, 7));
			frontCompanyReport.setYear(frontCompanyReport.getYear().substring(0, 4));
		}
		return super.findList(frontCompanyReport);
	}
	
	@Transactional(readOnly = false)
	public Page<FrontCompanyReport> findPage(Page<FrontCompanyReport> page, FrontCompanyReport frontCompanyReport) {
		String year = frontCompanyReport.getYear();
		String static1 = frontCompanyReport.getStatus();
		if(frontCompanyReport.getYear()!=null && !frontCompanyReport.getYear().isEmpty()) {
			frontCompanyReport.setMonth(frontCompanyReport.getYear().substring(5, 7));
			frontCompanyReport.setYear(frontCompanyReport.getYear().substring(0, 4));
		}
		Page<FrontCompanyReport> page1 = super.findPage(page, frontCompanyReport);
		frontCompanyReport.setYear(year);
		frontCompanyReport.setStatus(static1);
		return page1;
	}
	
	@Transactional(readOnly = false)
	public boolean saveReport(FrontCompanyReport frontCompanyReport) {
		try {
			User user = UserUtils.getUser();   //获取登录用户信息
			Calendar c = Calendar.getInstance();	//获取时间
			String year = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date time= sdf.parse(sdf.format(new Date()));
			if(user.getCompany()==null) {
				return false;
			}
		/*	List<FrontCompanyReport> Report = this.findReportById(frontCompanyReport);
			//如果本月已经上报则不能再上报
			for(FrontCompanyReport r: Report) {
				if(r.getYear().equals(year) && r.getMonth().equals(month)) {
					return false;
				}
			}*/
			List<FrontReportQuestion> list = frontCompanyReport.getQuestion();  //获取用户填写的所有问题信息
			Office office = dao.findOfficeById(user.getCompany().getId());
			String reportId = UUID.randomUUID().toString();
			frontCompanyReport.setCompanyId(user.getCompany().getId());  		//企业ID
			frontCompanyReport.setTypeId(office.getIndustyId());		//企业类型ID
			frontCompanyReport.setArea(user.getCompany().getArea()); 	//地区ID
			frontCompanyReport.setOperator(user.getName());  		//操作人
			frontCompanyReport.setId(reportId);		//上报id
			frontCompanyReport.setStatus("SUBMIT");	//状态
			frontCompanyReport.setYear(year);		//年
			frontCompanyReport.setMonth(month);		//月
			frontCompanyReport.setInsertTime(time);	//提交时间
			frontCompanyReport.setReportTime(time);	//上报时间
			frontCompanyReport.setUpdateTime(time);	//更改时间
			frontCompanyReport.setDelFlag("0");
			dao.insert1(frontCompanyReport);
			if(list!=null) {
				for(FrontReportQuestion front: list) {
					front.setId(UUID.randomUUID().toString());
					front.setMonth(time);
					front.setReportId(reportId); 	//上报ID
					front.setCreateDate(time);  	//插入时间
					front.setUpdateDate(time);		//更改时间
					front.setCompanyId(user.getCompany().getId()); // 企业ID
					front.setOperator(user.getName());	// 操作人
					front.setDelFlag("0");
					dao.addQuestion(front);
					
				}
			}
			
			//添加日志
			FrontCompanyReport frontCompanyReport2 = dao.get(frontCompanyReport);
			FrontReportHistory history = new FrontReportHistory();
			String desciption = JsonMapper.toJsonString(frontCompanyReport2);
			history.setId(UUID.randomUUID().toString());
			history.setDescription(desciption);
			history.setReportId(reportId);
			history.setOperateTime(time);
			history.setOperation("提交");
			history.setOperator(user.getName());
			history.setCreateDate(time);
			history.setUpdateDate(time);
			history.setRemarks("");   //备注
			history.setCreateBy(user);
			history.setDelFlag("0");
			dao.addHistroy(history);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	@Transactional(readOnly = false)
	public void update(FrontCompanyReport frontCompanyReport) {
		try {
 			if(frontCompanyReport.getId()!=null && frontCompanyReport.getId().trim()!=null && UserUtils.getUser()!=null) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date time = sdf.parse(sdf.format(new Date()));
				User user = UserUtils.getUser();   //获取登录用户信息
				String status = null;
				//修改上报信息
				if(frontCompanyReport.getStatus()!=null && frontCompanyReport.getStatus().trim()!="" ) {
					status = frontCompanyReport.getStatus();
					if(frontCompanyReport.getStatus().equals("通过")) {
						frontCompanyReport.setStatus("PASSED");
					} else if(frontCompanyReport.getStatus().equals("驳回")) {
						frontCompanyReport.setStatus("UNPASSED");
					}
				}
				frontCompanyReport.setUpdateTime(time);
				dao.updateReport(frontCompanyReport);
				List<FrontReportQuestion> list = dao.findQuestion(frontCompanyReport.getId());
				List<String> reportId = new ArrayList<String>();
				if(frontCompanyReport.getQuestion()!=null) {
					for(FrontReportQuestion question: frontCompanyReport.getQuestion()) {
						if(question!=null) {
							if(question.getId()!=null && question.getId().trim()!="") {
								reportId.add(question.getId());
								//修改所有问题信息
								question.setDelFlag("0");
								question.setUpdateDate(time);
								dao.updateQuestion(question);
							} else {
								//新建信息
								question.setId(UUID.randomUUID().toString());
								question.setMonth(time);
								question.setReportId(frontCompanyReport.getId()); 	//上报ID
								question.setCreateDate(time);  	//插入时间
								question.setUpdateDate(time);		//更改时间
								question.setCompanyId(user.getCompany().getId()); // 企业ID
								question.setOperator(user.getName());	// 操作人
								question.setDelFlag("0");
								dao.addQuestion(question);
							}
						}
					}
				}
				if(frontCompanyReport.getQuestion()==null && status==null) {
					reportId = null;
				}
				
				//删除用户已经删除的问题
				for(FrontReportQuestion question: list) {
					boolean onOff = false;
					if(reportId!=null) {
						for(String id: reportId) {
							if(!question.getId().equals(id)) {
								onOff = true;
							} else {
								onOff = false;
								break;
							}
						}
					}  else {
						onOff = true;
					}
					if(onOff) {
						question.setDelFlag("1");
						dao.updateQuestion(question);
					}
				}
				
				//添加日志
				FrontReportHistory history = new FrontReportHistory();
				history.setId(UUID.randomUUID().toString());
				history.setReportId(frontCompanyReport.getId());
				history.setOperateTime(time);
				if(status!=null && status.trim()!="") {
					history.setOperation(status);
				} else {
					history.setOperation("更新");
				}
				//查询该企业的上报信息保存到日志里面
				FrontCompanyReport frontCompanyReport2 = dao.get(frontCompanyReport);
				if(status==null) {
					frontCompanyReport2.setReason("");
					frontCompanyReport2.setStatus("SUBMIT");
				}
				List<FrontReportQuestion> question = dao.findQuestion(frontCompanyReport.getId());
				frontCompanyReport2.setQuestion(question);
				String desciption = JsonMapper.toJsonString(frontCompanyReport2);
				history.setDescription(desciption); //上报信息
				history.setOperator(user.getName());
				history.setCreateDate(time);
				history.setUpdateDate(time);
				history.setRemarks("");   //备注
				history.setCreateBy(user);
				history.setDelFlag("0");
				dao.addHistroy(history);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	};
	
	@Transactional(readOnly = false)
	public void delete(FrontCompanyReport frontCompanyReport) {
		super.delete(frontCompanyReport);
	}
	public List<FrontCompanyReport> statisticsReportByDate(Map<String, Object> params){
		return dao.statisticsReportByDate(params);
	};
	
	public List<FrontCompanyReport> statisticsCountByStatus(Map<String, Object> params){
		return dao.statisticsCountByStatus(params);
	};
	/**
	 * 
	 * @time   2017年10月24日 上午11:11:00
	 * @author zuoqb
	 * @todo   按照行业类型统计数量
	 * @param  @param params
	 * @param  @return
	 * @return_type   List<FrontCompanyReport>
	 */
	public List<FrontCompanyReport> statisticsCountByType(Map<String, Object> params){
		return dao.statisticsCountByType(params);
	}
	
	/**
	 * 2017-10-28 13:49:05
	 * 查询历史操作
	 * @author Tom
	 * @param params
	 * @return
	 */
	public List<FrontReportHistory> getHistory(HashMap<String, String> params){
		return dao.getHistory(params);
	}
	
	public List<FrontCompanyReport> getTopMonth(HashMap<String, String> param){
		return dao.getTopMonth(param);
	}

	@SuppressWarnings("null")
	public Map<String, Object> getTopReportMonth(){
		User user = UserUtils.getUser();
		Map<String, Object> result = new HashMap<String, Object>();
		/*if (user == null) {
			throw new Exception("当前登陆用户为空，请重新登录");
		}*/
		Office company = user.getCompany();
		/*if (company == null) {
			throw new Exception("当前登陆用户无所属企业，请重新登录");
		}*/
		Calendar now = Calendar.getInstance();
		Integer year = Integer.valueOf(now.get(1));
		Integer month = Integer.valueOf(now.get(2) + 1);
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("companyId", company.getId());
		List<FrontCompanyReport> reportList=null;
		try {
			reportList = getTopMonth(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (reportList == null || reportList.size() == 0) {
			result.put("year", year);
			result.put("month", Integer.valueOf(month.intValue() - 1));
			result.put("info", year + "年" + (month.intValue() - 1) + "月");
			return result;
		}
		FrontCompanyReport report = reportList.get(0);
		if (report.getMonth().equals(Integer.valueOf(12))) {
			if ((report.getYear().equals(year)) && (report.getMonth().equals(Integer.valueOf(month.intValue() - 1)))) {
				result.put("year", Integer.valueOf(report.getYear()) + 1);
				result.put("month", "01");
				result.put("info", Integer.valueOf(report.getYear()) + 1 + "年01月");
				return result;
			}
			result.put("year", Integer.valueOf(report.getYear()) + 1);
			result.put("month", "01");
			result.put("info", (Integer.valueOf(report.getYear()) + 1) + "年01月");
			return result;
		}

		if ((report.getYear().equals(year)) && (Integer.valueOf(report.getMonth()) >= month.intValue() - 2)) {
			result.put("year", report.getYear());
			result.put("month", Integer.valueOf(report.getMonth())+1);
			result.put("info", report.getYear() + "年" + (Integer.valueOf(report.getMonth())+1 ) + "月");
			return result;
		}
		result.put("year", report.getYear());
		result.put("month", Integer.valueOf(report.getMonth())+1);
		result.put("info", report.getYear() + "年" + (Integer.valueOf(report.getMonth()) + 1) + "月");
		return result;
	}

}
