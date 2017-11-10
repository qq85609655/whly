/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.reportstatistics.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.hailian.whly.reportstatistics.entity.ReportStatistics;
import com.hailian.whly.reportstatistics.dao.ReportStatisticsDao;

/**
 * 上报统计图用Service
 * @author zyl
 * @version 2017-11-09
 */
@Service
@Transactional(readOnly = true)
public class ReportStatisticsService extends CrudService<ReportStatisticsDao, ReportStatistics> {
	
	@Autowired
	private ReportStatisticsDao dao;
	
	public ReportStatistics get(String id) {
		return super.get(id);
	}
	
	public List<ReportStatistics> findList(ReportStatistics reportStatistics) {
		return super.findList(reportStatistics);
	}
	
	public Page<ReportStatistics> findPage(Page<ReportStatistics> page, ReportStatistics reportStatistics) {
		return super.findPage(page, reportStatistics);
	}
	
	@Transactional(readOnly = false)
	public void save(ReportStatistics reportStatistics) {
		super.save(reportStatistics);
	}
	
	@Transactional(readOnly = false)
	public void delete(ReportStatistics reportStatistics) {
		super.delete(reportStatistics);
	}
	
	public List<ReportStatistics> getStatic(ReportStatistics reportStatistics) {
		String year = reportStatistics.getYear().substring(0, 4);
		String month = reportStatistics.getYear().substring(5, 7);
		List<ReportStatistics> list = dao.getStaitic(reportStatistics);
		List<ReportStatistics> data = new ArrayList<ReportStatistics>();
		for(ReportStatistics rs1: list) {
			if(rs1.getYear().equals(year) && Integer.parseInt(rs1.getMonth())<=Integer.parseInt(month)) {
				for(ReportStatistics rs2: list) {
					if(Integer.parseInt(year)-Integer.parseInt(rs2.getYear())==1 && rs2.getMonth().equals(rs1.getMonth())) {
						data.add(this.data(rs1,rs2));
					}
				}
			}
		}
		if(data.size() != Integer.parseInt(month)) {
			for(int i=0; i<Integer.parseInt(month); i++) {
				if( i>=data.size() || Integer.parseInt(data.get(i).getMonth()) != i+1) {
					ReportStatistics rs = new ReportStatistics(year, String.valueOf(i+1), null, "0", "0", "0", "0", "0", "0", "0", "0", null, null, null, null, null, null, null);
					data.add(i, rs);
				}
			}
		}
		return data;
	}
	
	public ReportStatistics data(ReportStatistics rs1, ReportStatistics rs2) {
		
		String totalIncome = this.compute(rs1.getTotalIncome(), rs2.getTotalIncome());
		String totalProfit = this.compute(rs1.getTotalProfit(), rs2.getTotalProfit());		// 利润总额（万）
		String totalTax = this.compute(rs1.getTotalTax(), rs2.getTotalTax());		// 税收总额（万）
		String empQuantity = this.compute(rs1.getEmpQuantity(), rs2.getEmpQuantity());		// 从业人员（人）
		String employeeCompensation = this.compute(rs1.getEmployeeCompensation(), rs2.getEmployeeCompensation());		// 应付职工薪酬 （万）
		String loanAmount = this.compute(rs1.getLoanAmount(), rs2.getLoanAmount());		// 贷款金额 （万）
		String orderQuantity = this.compute(rs1.getOrderQuantity(), rs2.getOrderQuantity());		// 订单数量 （个）
		String operatingCosts = this.compute(rs1.getOperatingCosts(), rs2.getOperatingCosts());		// 营业成本（万元）
		ReportStatistics rs = new ReportStatistics(rs1.getYear(), rs1.getMonth(), rs1.getYearMonth(), totalIncome, totalProfit, totalTax, empQuantity, employeeCompensation, loanAmount, orderQuantity, operatingCosts, null, null, null, null, null, null, null);
		return rs;
	}
	public String compute(String rs1, String rs2) {
		if(rs1==null || rs2==null) {
			return "0";
		}
		DecimalFormat df = new DecimalFormat("######0.00");
		String result = df.format((Double.parseDouble(rs1) - Double.parseDouble(rs2))/Double.parseDouble(rs2) * 100);
		
		return result;
	}
	
}