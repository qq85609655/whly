/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.maillog.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 邮件日志Entity
 * @author wcl
 * @version 2017-05-11
 */
public class TbMailLog extends DataEntity<TbMailLog> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 邮件标题
	private String content;		// 发送内容
	private String mailUse;		// 邮件用途
	private String sendUser;		// 发送者
	private String toUser;		// 接收人
	private Date created;		// 发送时间
	private String status;		// 发送状态
	private String errorMsg;		// 错误信息
	private Date beginCreated;		// 开始 发送时间
	private Date endCreated;		// 结束 发送时间
	
	public TbMailLog() {
		super();
	}

	public TbMailLog(String id){
		super(id);
	}

	@Length(min=0, max=255, message="邮件标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=255, message="发送内容长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=255, message="邮件用途长度必须介于 0 和 255 之间")
	public String getMailUse() {
		return mailUse;
	}

	public void setMailUse(String mailUse) {
		this.mailUse = mailUse;
	}
	
	@Length(min=0, max=255, message="发送者长度必须介于 0 和 255 之间")
	public String getSendUser() {
		return sendUser;
	}

	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	
	@Length(min=0, max=255, message="接收人长度必须介于 0 和 255 之间")
	public String getToUser() {
		return toUser;
	}

	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	
	@Length(min=0, max=2, message="发送状态长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	public Date getBeginCreated() {
		return beginCreated;
	}

	public void setBeginCreated(Date beginCreated) {
		this.beginCreated = beginCreated;
	}
	
	public Date getEndCreated() {
		return endCreated;
	}

	public void setEndCreated(Date endCreated) {
		this.endCreated = endCreated;
	}
		
}