/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 
 * @className TechnologyNews.java
 * @time   2017年4月24日 下午2:58:02
 * @author zuoqb
 * @todo   TODO
 */
public class TechnologyNews{

    public static final String DEFAULT_TEMPLATE = "frontViewArticle";
	private String id;
	private static final long serialVersionUID = 1L;
	private String oriId;//原表id  not null
	private String oriTable;//原表名称 not null
	private String titleSrc;//带标签标题 not null
	private String title;	// 标题
	private String titleOri;//转载后的原始无标签标题
	private String author;
	private String newsSection;//栏目名称
	private String publishDate;
	private String originaURL;// 外部链接 原始来源URL
	private String textSrc;// 描述、摘要 标签+正文
	private String created;//采集时间
	private String category1;//行业一级分类
	private String category2;//行业二级分类
	private String webName;//网站名称  not null
	private String countryZH;//国家名称not null
	private String countryEN;//国家名称en not null
	private String language;//中文：“中简”、英文：“English”
	private String gatherers;//采集人
	private String url;//网址
	private String programID;//采集程序编号
	private String taskID;//任务编号
	private String columnURL;//栏目的URL
	private Date insert;//插入数据的时间
	private String webKeywords;
	public String getWebKeywords() {
		return webKeywords;
	}
	public void setWebKeywords(String webKeywords) {
		this.webKeywords = webKeywords;
	}
	public String getOriId() {
		return oriId;
	}
	public void setOriId(String oriId) {
		this.oriId = oriId;
	}
	public String getOriTable() {
		return oriTable;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setOriTable(String oriTable) {
		this.oriTable = oriTable;
	}
	public String getTitleSrc() {
		return titleSrc;
	}
	public void setTitleSrc(String titleSrc) {
		this.titleSrc = titleSrc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleOri() {
		return titleOri;
	}
	public void setTitleOri(String titleOri) {
		this.titleOri = titleOri;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getNewsSection() {
		return newsSection;
	}
	public void setNewsSection(String newsSection) {
		this.newsSection = newsSection;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public String getOriginaURL() {
		return originaURL;
	}
	public void setOriginaURL(String originaURL) {
		this.originaURL = originaURL;
	}
	public String getTextSrc() {
		return textSrc;
	}
	public void setTextSrc(String textSrc) {
		this.textSrc = textSrc;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getWebName() {
		return webName;
	}
	public void setWebName(String webName) {
		this.webName = webName;
	}
	public String getCountryZH() {
		return countryZH;
	}
	public void setCountryZH(String countryZH) {
		this.countryZH = countryZH;
	}
	public String getCountryEN() {
		return countryEN;
	}
	public void setCountryEN(String countryEN) {
		this.countryEN = countryEN;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getGatherers() {
		return gatherers;
	}
	public void setGatherers(String gatherers) {
		this.gatherers = gatherers;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProgramID() {
		return programID;
	}
	public void setProgramID(String programID) {
		this.programID = programID;
	}
	public String getTaskID() {
		return taskID;
	}
	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}
	public String getColumnURL() {
		return columnURL;
	}
	public void setColumnURL(String columnURL) {
		this.columnURL = columnURL;
	}
	public Date getInsert() {
		return insert;
	}
	public void setInsert(Date insert) {
		this.insert = insert;
	}
	
	
	
	

	
}


