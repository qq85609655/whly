/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statisticsconfig.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 新闻数量配置Entity
 * @author zuoqb
 * @version 2017-05-16
 */
public class TbStatisticsConfig extends DataEntity<TbStatisticsConfig> {
	
	private static final long serialVersionUID = 1L;
	private String category;		// 二级分类
	private String multiple;		// 倍数
	private String accumulate;		// 每s累加量
	
	public TbStatisticsConfig() {
		super();
	}

	public TbStatisticsConfig(String id){
		super(id);
	}

	@Length(min=0, max=255, message="二级分类长度必须介于 0 和 255 之间")
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getMultiple() {
		return multiple;
	}

	public void setMultiple(String multiple) {
		this.multiple = multiple;
	}
	
	@Length(min=0, max=20, message="每s累加量长度必须介于 0 和 20 之间")
	public String getAccumulate() {
		return accumulate;
	}

	public void setAccumulate(String accumulate) {
		this.accumulate = accumulate;
	}
	
}