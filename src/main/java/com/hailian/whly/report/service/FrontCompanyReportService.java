/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	
	public FrontCompanyReport get(String id) {
		if(id==null && id.trim()=="") {
			return null;
		}
		List<FrontReportQuestion> list = dao.findQuestion(id);
		FrontCompanyReport frontCompanyReport = dao.get(id);
		frontCompanyReport.setQuestion(list);
		if(UserUtils.getUser().getCompany()!=null) {
			frontCompanyReport.setCompanyName(UserUtils.getUser().getCompany().getName());
		}
		return frontCompanyReport;
	}
	
	public List<FrontCompanyReport> findList(FrontCompanyReport frontCompanyReport) {
		if(frontCompanyReport.getYear()!=null && !frontCompanyReport.getYear().isEmpty()) {
			frontCompanyReport.setMonth(frontCompanyReport.getYear().substring(5, 7));
			frontCompanyReport.setYear(frontCompanyReport.getYear().substring(0, 4));
		}
		return super.findList(frontCompanyReport);
	}
	
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
	public void save(FrontCompanyReport frontCompanyReport) {
		try {
			User user = UserUtils.getUser();   //获取登录用户信息
			if(user.getCompany()==null) {
				return;
			}
 			Calendar c = Calendar.getInstance();	//获取时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date time= sdf.parse(sdf.format(new Date()));
			/*String year = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);*/
			List<FrontReportQuestion> list = frontCompanyReport.getQuestion();  //获取用户填写的所有问题信息
			Office office = dao.findOfficeById(user.getCompany().getId());
			String reportId = UUID.randomUUID().toString();
			frontCompanyReport.setCompanyId(user.getCompany().getId());  		//企业ID
			frontCompanyReport.setTypeId(office.getIndustyId());		//企业类型ID
			frontCompanyReport.setArea(user.getCompany().getArea()); 	//地区ID
			frontCompanyReport.setOperator(user.getName());  		//操作人
			frontCompanyReport.setId(reportId);		//上报id
			frontCompanyReport.setStatus("SUBMIT");	//状态
			/*frontCompanyReport.setYear(year);		//年
			frontCompanyReport.setMonth(month);		//月
*/			frontCompanyReport.setInsertTime(time);	//提交时间
			frontCompanyReport.setReportTime(time);	//上报时间
			frontCompanyReport.setUpdateTime(time);	//更改时间
			frontCompanyReport.setDelFlag("0");
			dao.insert1(frontCompanyReport);
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
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(readOnly = false)
	public void update(FrontCompanyReport frontCompanyReport) {
		try {
			if(frontCompanyReport.getId()!=null && frontCompanyReport.getId().trim()!=null) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				Date time = sdf.parse(sdf.format(new Date()));
				User user = UserUtils.getUser();   //获取登录用户信息
				//修改上报信息
				dao.updateReport(frontCompanyReport);
				for(FrontReportQuestion question: frontCompanyReport.getQuestion()) {
					if(question.getId()!=null && question.getId().trim()!="") {
						//修改所有问题信息
						question.setUpdateDate(time);
						dao.updateQuestion(question);
					} else {
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
		if (reportList == null && reportList.size() == 0) {
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