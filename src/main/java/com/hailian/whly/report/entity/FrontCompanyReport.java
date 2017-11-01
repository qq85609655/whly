/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.entity;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.sys.entity.Area;

/**
 * 企业上报Entity
 * @author zqb
 * @version 2017-10-22
 */
public class FrontCompanyReport extends DataEntity<FrontCompanyReport> {
	
	private static final long serialVersionUID = 1L;
	private String id;         	 //ID
	private String year;			// 年
	private String month;			// 月
	private Date reportTime;		// 上报时间 year+month
	private String companyId;		// 上报企业
	private String companyName;		// 上报企业名字
	private String companyParentId; // 上报企业父亲的ID
	private String typeId;			// 行业类型ID
	private String description;  	// 行业类型
	private Area area;				// 地区
	private String empQuantity;		// 从业人数（人）
	private String totalIncome;		// 营业收入（万）
	private String totalProfit;		// 营业利润（万）
	private String totalTax;		// 企业税费（万）
	private String operatingCosts;  // 营业成本（万）
	private String employeeCompensation; // 应付职工薪酬 （万）
	private String loanAmount;      // 贷款金额 （万）
	private String orderQuantity;   // 订单数量 （个） 
	private Date insertTime;		// 插入时间
	private Date updateTime;		// 更新时间
	private String operator;		// 操作人
	private String status;		// 状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED
	private String reason;		// 原因
	private Date beginInsertTime;	// 开始 插入时间
	private Date endInsertTime;		// 结束 插入时间
	private String name;
	private String count;
	private List<FrontReportQuestion> question; // 问题信息
	private List<FrontReportHistory> histroy; 	// 上报日志信息
	private String statusName;
	
	private String from;
	
	
	public String getCompanyParentId() {
		return companyParentId;
	}

	public void setCompanyParentId(String companyParentId) {
		this.companyParentId = companyParentId;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	@ExcelField(title="上报企业", type=1, align=1, sort=4)
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public List<FrontReportQuestion> getQuestion() {
		return question;
	}

	public void setQuestion(List<FrontReportQuestion> question) {
		this.question = question;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public FrontCompanyReport() {
		super();
	}

	public FrontCompanyReport(String id){
		super(id);
	}

	@Length(min=0, max=11, message="年长度必须介于 0 和 11 之间")
	@ExcelField(title="年", type=1, align=2, sort=2)
	public String getYear() {
		return year;
	}
	
	public void setYear(String year) {
		this.year = year;
	}
	
	@Length(min=0, max=64, message="行业类型长度必须介于 0 和 64 之间")
	@ExcelField(title="所属行业", type=1, align=2, sort=5)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Length(min=0, max=11, message="月长度必须介于 0 和 11 之间")
	@ExcelField(title="月", type=1, align=2, sort=3)
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="上报时间", type=1, align=2, sort=2)
	public Date getReportTime() {
		return reportTime;
	}

	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
	
	@Length(min=0, max=64, message="上报企业长度必须介于 0 和 64 之间")
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
	@Length(min=0, max=64, message="行业类型长度必须介于 0 和 64 之间")
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	@ExcelField(title="所属地域", type=1, align=2, sort=6)
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=11, message="从业人数（人）长度必须介于 0 和 11 之间")
	@ExcelField(title="从业人数(人)", type=1, align=2, sort=14)
	public String getEmpQuantity() {
		return empQuantity;
	}

	public void setEmpQuantity(String empQuantity) {
		this.empQuantity = empQuantity;
	}
	
	@ExcelField(title="营业收入(万元)", type=1, align=2, sort=7)
	public String getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(String totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	@ExcelField(title="营业利润(万元)", type=1, align=2, sort=8)
	public String getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(String totalProfit) {
		this.totalProfit = totalProfit;
	}
	
	@ExcelField(title="企业税费(万元)", type=1, align=2, sort=9)
	public String getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(String totalTax) {
		this.totalTax = totalTax;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=0, max=20, message="操作人长度必须介于 0 和 20 之间")
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	@Length(min=0, max=10, message="状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED长度必须介于 0 和 10 之间")
	//@ExcelField(title="状态", type=1, align=2, sort=1)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=500, message="原因长度必须介于 0 和 500 之间")
	public String getReason() {
		return reason;
	}
	
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@ExcelField(title="营业成本", type=1, align=2, sort=10)
	public String getOperatingCosts() {
		return operatingCosts;
	}

	public void setOperatingCosts(String operatingCosts) {
		this.operatingCosts = operatingCosts;
	}
	
	@ExcelField(title="应付职工薪酬", type=1, align=2, sort=11)
	public String getEmployeeCompensation() {
		return employeeCompensation;
	}

	public void setEmployeeCompensation(String employeeCompensation) {
		this.employeeCompensation = employeeCompensation;
	}
	
	@ExcelField(title="贷款金额", type=1, align=2, sort=12)
	public String getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(String loanAmount) {
		this.loanAmount = loanAmount;
	}
	
	@ExcelField(title="订单数量", type=1, align=2, sort=13)
	public String getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public Date getBeginInsertTime() {
		return beginInsertTime;
	}

	public void setBeginInsertTime(Date beginInsertTime) {
		this.beginInsertTime = beginInsertTime;
	}
	
	public Date getEndInsertTime() {
		return endInsertTime;
	}

	public void setEndInsertTime(Date endInsertTime) {
		this.endInsertTime = endInsertTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public List<FrontReportHistory> getHistroy() {
		return histroy;
	}

	public void setHistroy(List<FrontReportHistory> histroy) {
		this.histroy = histroy;
	}

	
		
}