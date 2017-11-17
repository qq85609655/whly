/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.reportstatistics.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 上报统计图用Entity
 * @author zyl
 * @version 2017-11-09
 */
public class ReportStatistics extends DataEntity<ReportStatistics> {
	
	private static final long serialVersionUID = 1L;
	private String year;		// 当前年
	private String month;		// 当前月
	private Date yearMonth;		// 上报时间 year+month
	private String totalIncome;		// 营业总额（万）
	private String totalProfit;		// 利润总额（万）
	private String totalTax;		// 税收总额（万）
	private String empQuantity;		// 从业人员（人）
	private String employeeCompensation;		// 应付职工薪酬 （万）
	private String loanAmount;		// 贷款金额 （万）
	private String orderQuantity;	// 订单数量 （个）
	private String operatingCosts;	// 营业成本（万元）
	private String status;			// 状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED
	private String companyId;		// 企业编号
	private String companyName;		// 企业名称
	private Area area;				// 地区编号
	private String areaName;		// 地区名称
	private String typeId;			// 行业编号
	private String typeName;		// 行业标签名
	private String preYear;			//上一年
	private String preMonth;		//上个月
	private String statisticsType;	//统计类型
	private String name; 			//返回前台的字段名字
	private String queryType;		//查询类型 ：1、同比 2、环比
	private String parentId;
	private String dictType;  //字典里的 type  cx
	

	
	
	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatisticsType() {
		return statisticsType;
	}

	public void setStatisticsType(String statisticsType) {
		this.statisticsType = statisticsType;
	}

	public ReportStatistics() {
		super();
	}

	public ReportStatistics(String id){
		super(id);
	}

	@Length(min=0, max=11, message="年长度必须介于 0 和 11 之间")
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	@Length(min=0, max=11, message="月长度必须介于 0 和 11 之间")
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(Date yearMonth) {
		this.yearMonth = yearMonth;
	}
	
	public String getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(String totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	public String getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(String totalProfit) {
		this.totalProfit = totalProfit;
	}
	
	public String getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(String totalTax) {
		this.totalTax = totalTax;
	}
	
	@Length(min=0, max=11, message="从业人员（人）长度必须介于 0 和 11 之间")
	public String getEmpQuantity() {
		return empQuantity;
	}

	public void setEmpQuantity(String empQuantity) {
		this.empQuantity = empQuantity;
	}
	
	public String getEmployeeCompensation() {
		return employeeCompensation;
	}

	public void setEmployeeCompensation(String employeeCompensation) {
		this.employeeCompensation = employeeCompensation;
	}
	
	public String getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(String loanAmount) {
		this.loanAmount = loanAmount;
	}
	
	@Length(min=0, max=12, message="订单数量 （个）长度必须介于 0 和 12 之间")
	public String getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	
	public String getOperatingCosts() {
		return operatingCosts;
	}

	public void setOperatingCosts(String operatingCosts) {
		this.operatingCosts = operatingCosts;
	}
	
	@Length(min=0, max=10, message="状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED长度必须介于 0 和 10 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=1, max=64, message="企业编号长度必须介于 1 和 64 之间")
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
	@Length(min=1, max=100, message="企业名称长度必须介于 1 和 100 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@NotNull(message="地区编号不能为空")
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=1, max=100, message="地区名称长度必须介于 1 和 100 之间")
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	@Length(min=1, max=64, message="行业编号长度必须介于 1 和 64 之间")
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	@Length(min=1, max=100, message="行业标签名长度必须介于 1 和 100 之间")
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	

	public String getPreYear() {
		return preYear;
	}

	public void setPreYear(String preYear) {
		this.preYear = preYear;
	}

	public String getPreMonth() {
		return preMonth;
	}

	public void setPreMonth(String preMonth) {
		this.preMonth = preMonth;
	}

	public ReportStatistics(String year, String month, Date yearMonth, String totalIncome, String totalProfit,
			String totalTax, String empQuantity, String employeeCompensation, String loanAmount, String orderQuantity,
			String operatingCosts, String status, String companyId, String companyName, Area area, String areaName,
			String typeId, String typeName) {
		super();
		this.year = year;
		this.month = month;
		this.yearMonth = yearMonth;
		this.totalIncome = totalIncome;
		this.totalProfit = totalProfit;
		this.totalTax = totalTax;
		this.empQuantity = empQuantity;
		this.employeeCompensation = employeeCompensation;
		this.loanAmount = loanAmount;
		this.orderQuantity = orderQuantity;
		this.operatingCosts = operatingCosts;
		this.status = status;
		this.companyId = companyId;
		this.companyName = companyName;
		this.area = area;
		this.areaName = areaName;
		this.typeId = typeId;
		this.typeName = typeName;
	}
	
}