/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.entity;


import java.util.Date;
import java.util.List;

import com.thinkgem.jeesite.common.persistence.DataEntity;


/**
 * 上报日志Entity
 * @author zyl
 * @version 2017-10-28
 */
public class FrontReportHistory extends DataEntity<FrontReportHistory> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String reportId;  	//上报信息ID
	private String description;	//上报信息 JSON格式
	private Date operateTime;	//操作时间
	private String operation;	//操作类型 提交 驳回 通过 更新
	private String operator;	//操作人
	private Date createDate;	//创建时间
	private Date updateDate;	//更改时间
	FrontCompanyReport frontCompanyReport; //上报信息
	
	
	public FrontCompanyReport getFrontCompanyReport() {
		return frontCompanyReport;
	}
	public void setFrontCompanyReport(FrontCompanyReport frontCompanyReport) {
		this.frontCompanyReport = frontCompanyReport;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getDesciption() {
		return description;
	}
	public void setDesciption(String description) {
		this.description = description;
	}
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
	
	
	
		
}