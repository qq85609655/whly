/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.entity;


import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 状态Entity
 * @author zyl
 * @version 2017-10-25
 */
public class FrontStatus extends DataEntity<FrontStatus> {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;  // 枚举 key
	private String value; // 枚举 value
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
		
}