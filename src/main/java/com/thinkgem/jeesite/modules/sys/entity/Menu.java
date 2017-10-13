/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.cms.entity.Category;

/**
 * 菜单Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class Menu extends DataEntity<Menu> {

	private static final long serialVersionUID = 1L;
	private Menu parent;	// 父级菜单
	private String parentIds; // 所有父级编号
	private String name; 	// 名称
	private String href; 	// 链接
	private String target; 	// 目标（ mainFrame、_blank、_self、_parent、_top）
	private String icon; 	// 图标
	private Integer sort; 	// 排序
	private String isShow; 	// 是否在菜单中显示（1：显示；0：不显示）
	private String permission; // 权限标识
	private String userId;
	private String frontRootMenuId;//前台默认菜单ID
	private String frontRootRoleId;//前台默认角色ID
	private String idJoin;
	private List<Menu> childList = Lists.newArrayList(); 	// 拥有子分类列表
	public String getFrontRootMenuId() {
		return frontRootMenuId;
	}

	public void setFrontRootMenuId(String frontRootMenuId) {
		this.frontRootMenuId = frontRootMenuId;
	}

	
	public String getIdJoin() {
		return idJoin;
	}

	public void setIdJoin(String idJoin) {
		this.idJoin = idJoin;
	}

	public List<Menu> getChildList() {
		return childList;
	}

	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}

	public String getFrontRootRoleId() {
		return frontRootRoleId;
	}

	public void setFrontRootRoleId(String frontRootRoleId) {
		this.frontRootRoleId = frontRootRoleId;
	}

	public Menu(){
		super();
		this.sort = 30;
		this.isShow = "1";
	}
	
	public Menu(String id){
		super(id);
	}
	
	@JsonBackReference
	@NotNull
	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	@Length(min=1, max=2000)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min=0, max=2000)
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Length(min=0, max=20)
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	
	@Length(min=0, max=100)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@NotNull
	public Integer getSort() {
		return sort;
	}
	
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@Length(min=1, max=1)
	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	@Length(min=0, max=200)
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}

	@JsonIgnore
	public static void sortList(List<Menu> list, List<Menu> sourcelist, String parentId, boolean cascade){
		for (int i=0; i<sourcelist.size(); i++){
			Menu e = sourcelist.get(i);
			if (e.getParent()!=null && e.getParent().getId()!=null
					&& e.getParent().getId().equals(parentId)){
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						Menu child = sourcelist.get(j);
						if (child.getParent()!=null && child.getParent().getId()!=null
								&& child.getParent().getId().equals(e.getId())){
							sortList(list, sourcelist, e.getId(), true);
							break;
						}
					}
				}
			}
		}
	}
	
	@JsonIgnore
	public static List<Menu> sortFrontList(List<Menu> sourcelist, String parentId, boolean cascade){
		List<Menu> list=new ArrayList<Menu>();
		for (int i=0; i<sourcelist.size(); i++){
			//先找一级菜单
			Menu e = sourcelist.get(i);
			if (e.getParent()!=null && e.getParent().getId()!=null
					&& e.getParent().getId().equals(parentId)){
				e.setIdJoin(","+e.getId()+",");
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						Menu child = sourcelist.get(j);
						if (child.getParent()!=null && child.getParent().getId()!=null
								&& child.getParent().getId().equals(e.getId())){
							e.setChildList(sortFrontList(sourcelist, e.getId(), true));
							break;
						}
					}
				}
			}
		}
		return list;
	}

	@JsonIgnore
	public static List<Menu> getMenuName(List<Menu> sourcelist,String menusIds){
		List<Menu> topMenuName=new ArrayList<Menu>();
		if(StringUtils.isBlank(menusIds)){
			//默认展示前台第一个菜单
			for(Menu c:sourcelist){
				if(c.getParentId().equals(Global.getFrontRootMenu())){
					topMenuName.add(c);
				}
			}
		}else{
			String[] ids=menusIds.split(",");
			for(String id:ids){
				if(!getRootId().equals(id)&&!"0".equals(id)&&!Global.getFrontRootMenu().equals(id)){
					for(Menu c:sourcelist){
						if(c.getId().equals(id)){
							topMenuName.add(c);
						}
					}
				}
			}
		}
		return topMenuName;
	}
	@JsonIgnore
	public static String getRootId(){
		return "1";
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return name;
	}
}