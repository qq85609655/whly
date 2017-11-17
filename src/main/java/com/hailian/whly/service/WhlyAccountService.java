package com.hailian.whly.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hailian.whly.dao.WhlyAccountDao;
import com.hailian.whly.entity.WhlyAccount;
import com.hailian.whly.report.dao.FrontCompanyReportDao;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportHistory;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.Menu;

@Service
@Transactional(readOnly = true)
public class WhlyAccountService extends CrudService<WhlyAccountDao, WhlyAccount>{
	
	@Autowired
	private FrontCompanyReportDao dao;
	
	public WhlyAccount get(String id) {
		return super.get(id);
	}
	
	public List<WhlyAccount> findList(WhlyAccount whlyAccount) {
		return super.findList(whlyAccount);
	}
	
	public Page<WhlyAccount> findPage(Page<WhlyAccount> page, WhlyAccount whlyAccount) {
		return super.findPage(page, whlyAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(WhlyAccount whlyAccount) {
		super.save(whlyAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(WhlyAccount whlyAccount) {
		super.delete(whlyAccount);
	}
	
	public List<FrontReportHistory> findHitsory(FrontReportHistory frontReportHistory) {
		List<FrontReportHistory> list = dao.findHistroy(frontReportHistory.getReportId());
		for(int i=0; i<list.size(); i++) {
			FrontCompanyReport frontCompanyReport = (FrontCompanyReport) JsonMapper.fromJsonString(list.get(i).getDescription(),FrontCompanyReport.class);
			list.get(i).setFrontCompanyReport(frontCompanyReport);
		}
		
		List<FrontCompanyReport> fcr = dao.findReportByReportId(frontReportHistory.getReportId()); //查询该企业所有的上报信息
		FrontCompanyReport frontCompanyReport = new FrontCompanyReport();
		frontCompanyReport.setId(frontReportHistory.getReportId());
		List<FrontCompanyReport> fcr1 = dao.findReport(frontCompanyReport);
		frontCompanyReport = fcr1.get(0);		//返回该企业本年本月的上报信息
		FrontReportHistory history = new FrontReportHistory(); 
		history.setId("本年本月");
		history.setFrontCompanyReport(frontCompanyReport);
		list.add(history);
		int year = Integer.parseInt((frontCompanyReport.getYear()));
		int month = Integer.parseInt((frontCompanyReport.getMonth()));
		boolean a = true;
		boolean b = true;
		for(FrontCompanyReport r: fcr) {
			if(r.getYear().equals(String.valueOf(year-1)) && r.getMonth().equals(String.valueOf(month)) && a) { //返回该企业去年本月的上报信息
				FrontReportHistory f1 = new FrontReportHistory();
				f1.setId("上年本月");
				f1.setFrontCompanyReport(r);
				list.add(f1);
				a = false; 
			}
			if(r.getYear().equals(String.valueOf(year)) && r.getMonth().equals(String.valueOf(month-1)) && b) { //返回该企业本年上月的上报信息
				FrontReportHistory f1 = new FrontReportHistory();
				f1.setId("本年上月");
				f1.setFrontCompanyReport(r);
				list.add(f1);
				b = false;
			}
		}
		if(a) {
			FrontReportHistory f1 = new FrontReportHistory();
			FrontCompanyReport f = new FrontCompanyReport();
			f1.setId("上年本月");
			f1.setFrontCompanyReport(f);
			list.add(f1);
		}
		if(b) {
			FrontReportHistory f1 = new FrontReportHistory();
			FrontCompanyReport f = new FrontCompanyReport();
			f1.setId("本年上月");
			f1.setFrontCompanyReport(f);
			list.add(f1);
		}
		return list;
	}
}
