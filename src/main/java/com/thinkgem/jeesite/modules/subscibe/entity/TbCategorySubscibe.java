/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.subscibe.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 订阅日志Entity
 * @author wcl
 * @version 2017-05-12
 */
public class TbCategorySubscibe extends DataEntity<TbCategorySubscibe> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// user_id
	private String categery;		// 定制内容
	private Date beginCreateDate;		// 开始 定制日期
	private Date endCreateDate;		// 结束 定制日期
	private String nickName;   //昵称
	private String email;	 // 邮箱
	private String userId;
	private String flag;
	public TbCategorySubscibe() {
		super();
	}

	public TbCategorySubscibe(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=255, message="定制内容长度必须介于 0 和 255 之间")
	public String getCategery() {
		return categery;
	}

	public void setCategery(String categery) {
		this.categery = categery;
	}
	
	public Date getBeginCreateDate() {
		return beginCreateDate;
	}

	public void setBeginCreateDate(Date beginCreateDate) {
		this.beginCreateDate = beginCreateDate;
	}
	
	public Date getEndCreateDate() {
		return endCreateDate;
	}

	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
		
}