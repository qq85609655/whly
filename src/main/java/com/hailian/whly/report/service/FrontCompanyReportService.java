/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hailian.whly.report.dao.FrontCompanyReportDao;
import com.hailian.whly.report.entity.FrontCompanyReport;
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
		return super.get(id);
	}
	
	public List<FrontCompanyReport> findList(FrontCompanyReport frontCompanyReport) {
		return super.findList(frontCompanyReport);
	}
	
	public Page<FrontCompanyReport> findPage(Page<FrontCompanyReport> page, FrontCompanyReport frontCompanyReport) {
		return super.findPage(page, frontCompanyReport);
	}
	
	@Transactional(readOnly = false)
	public void save(FrontCompanyReport frontCompanyReport) {
		super.save(frontCompanyReport);
	}
	
	@Transactional(readOnly = false)
	public void delete(FrontCompanyReport frontCompanyReport) {
		super.delete(frontCompanyReport);
	}
	public List<FrontCompanyReport> statisticsReportByDate(FrontCompanyReport entity){
		return dao.statisticsReportByDate(entity);
	};
	
}