/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.blogger.entity.blogger;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 微博配置Entity
 * @author zuoqb
 * @version 2017-05-23
 */
public class TbBlogger extends DataEntity<TbBlogger> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String url;		// 微博地址
	private String title;		// 标题
	private String desc;		// 简介
	private String type;		// 分类 ：0 软件与信息技术 1：高端智能 2蓝色生物 3 海工装备 4 节能技术与新材料
	private String img;		// 头像
	
	public TbBlogger() {
		super();
	}

	public TbBlogger(String id){
		super(id);
	}

	@Length(min=0, max=255, message="名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="微博地址长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=255, message="标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=255, message="简介长度必须介于 0 和 255 之间")
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Length(min=0, max=255, message="分类 ：0 软件与信息技术 1：高端智能 2蓝色生物 3 海工装备 4 节能技术与新材料长度必须介于 0 和 255 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=255, message="头像长度必须介于 0 和 255 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}