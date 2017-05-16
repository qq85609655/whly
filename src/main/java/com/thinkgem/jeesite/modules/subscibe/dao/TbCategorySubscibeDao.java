/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.subscibe.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.subscibe.entity.TbCategorySubscibe;

/**
 * 订阅日志DAO接口
 * @author wcl
 * @version 2017-05-12
 */
@MyBatisDao
public interface TbCategorySubscibeDao extends CrudDao<TbCategorySubscibe> {
	
}