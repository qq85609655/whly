/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.entity;


import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;


/**
 * 问题Entity
 * @author zyl
 * @version 2017-10-26
 */
public class FrontReportQuestion extends DataEntity<FrontReportQuestion> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Date month;         //上报所属年月
	private String title;		//标题
	private String content;		//内容
	private String companyId;	//企业ID
	private String reportId;	//企业上报ID
	private String operator;	//操作人
	private Date createDate;	//插入时间
	private Date updateDate;	//更新时间
	private String remarks;		//备注
	
	
	public Date getMonth() {
		return month;
	}
	public void setMonth(Date month) {
		this.month = month;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	
	
	
	
	
	
	
	
		
}