/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.frontnotification.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 新闻公告Entity
 * @author zyl
 * @version 2017-11-02
 */
public class FrontNotification extends DataEntity<FrontNotification> {
	
	private static final long serialVersionUID = 1L;
	private String categoryType;		// 内容类型 企业新闻 | 系统公告
	private String title;		// 标题
	private String content;		// 内容
	private String color;		// 标题颜色
	private String keywords;		// 关键字
	private String description;		// 描述、摘要
	private String weight;		 // 置顶
	private String hits;		 // 点击数
	private String createName;   // 创建人名字
	private String companyType;  //所属企业类型：重点服务业企业监测板块、限额以下服务业企业监测板块 、年度扶持项目监测板块、其他
	private String reportId;     //上报ID  邮件用
	private String companyId;	 //上报企业ID  邮件用
	private String vagueWords;	 //模糊词  用于左菜单搜索
	
	
	
	public String getVagueWords() {
		return vagueWords;
	}

	public void setVagueWords(String vagueWords) {
		this.vagueWords = vagueWords;
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

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public FrontNotification() {
		super();
	}

	public FrontNotification(String id){
		super(id);
	}

	@Length(min=0, max=64, message="创建人名字长度必须介于 0 和 64 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	@Length(min=1, max=64, message="发布类型长度必须介于 1 和 64 之间")
	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	
	@Length(min=1, max=255, message="标题长度必须介于 1 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=50000, message="内容长度必须介于 0 和 50000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=50, message="标题颜色长度必须介于 0 和 50 之间")
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	@Length(min=0, max=255, message="关键字长度必须介于 0 和 255 之间")
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	@Length(min=0, max=255, message="描述、摘要长度必须介于 0 和 255 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Length(min=0, max=11, message="置顶长度必须介于 0 和 11 之间")
	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	@Length(min=0, max=11, message="点击数长度必须介于 0 和 11 之间")
	public String getHits() {
		return hits;
	}

	public void setHits(String hits) {
		this.hits = hits;
	}
	
	
}