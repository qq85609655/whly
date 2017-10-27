/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hailian.whly.commom.CheckStatus;
import com.hailian.whly.report.dao.FrontCompanyReportDao;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportQuestion;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

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
		List<FrontReportQuestion> list = dao.findQuestion(id);
		FrontCompanyReport frontCompanyReport = dao.get(id);
		frontCompanyReport.setQuestion(list);
		return frontCompanyReport;
	}
	
	public List<FrontCompanyReport> findList(FrontCompanyReport frontCompanyReport) {
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
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date time= sdf.parse(sdf.format(new Date()));
			String year = String.valueOf(c.get(Calendar.YEAR));
			String month = String.valueOf(c.get(Calendar.MONTH)+1);
			List<FrontReportQuestion> list = frontCompanyReport.getQuestion();
			String reportId = UUID.randomUUID().toString();
			frontCompanyReport.setId(reportId);
			frontCompanyReport.setStatus("SUBMIT");
			frontCompanyReport.setYear(year);
			frontCompanyReport.setMonth(month);
			frontCompanyReport.setInsertTime(time);
			frontCompanyReport.setReportTime(time);
			frontCompanyReport.setUpdateTime(time);
			int i = dao.insert1(frontCompanyReport);
			for(FrontReportQuestion front: list) {
				front.setId(UUID.randomUUID().toString());
				front.setMonth(time);
				front.setReportId(reportId); //上报ID
				front.setCreateDate(time);
				front.setUpdateDate(time);
				front.setCompanyId(""); // 企业ID
				front.setOperator("");	// 操作人
				front.setDelFlag("0");
				dao.addQuestion(front);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
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
	};
}