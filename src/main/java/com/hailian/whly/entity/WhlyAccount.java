package com.hailian.whly.entity;

import com.hailian.whly.commom.WhlyDataEntity;


public class WhlyAccount extends WhlyDataEntity<WhlyAccount>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8896976639973040621L;
	private String id;
	private String loginName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
}
