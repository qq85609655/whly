/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.feedback.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 反馈记录Entity
 * @author wcl
 * @version 2017-05-11
 */
public class TbAccountFeedback extends DataEntity<TbAccountFeedback> {
	
	private static final long serialVersionUID = 1L;
	private String content;		// 反馈内容
	private String createId;		// 反馈人主键（tb_front_account主键）
	private String status;		// 处理状态
	private String dealUser;		// 处理人信息
	private Date dealDate;		// 处理时间
	private String delFalg;		// 删除标示 0：未删除 1：已删除
	private Date beginCreateDate;		// 开始 反馈时间
	private Date endCreateDate;		// 结束 反馈时间
	private String nickName;   //昵称
	private String email;	 // 邮箱
	public TbAccountFeedback() {
		super();
	}

	public TbAccountFeedback(String id){
		super(id);
	}

	@Length(min=0, max=255, message="反馈内容长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=11, message="反馈人主键（tb_front_account主键）长度必须介于 0 和 11 之间")
	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}
	
	@Length(min=0, max=2, message="处理状态长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=255, message="处理人信息长度必须介于 0 和 255 之间")
	public String getDealUser() {
		return dealUser;
	}

	public void setDealUser(String dealUser) {
		this.dealUser = dealUser;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}
	
	@Length(min=0, max=2, message="删除标示 0：未删除 1：已删除长度必须介于 0 和 2 之间")
	public String getDelFalg() {
		return delFalg;
	}

	public void setDelFalg(String delFalg) {
		this.delFalg = delFalg;
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
		
}