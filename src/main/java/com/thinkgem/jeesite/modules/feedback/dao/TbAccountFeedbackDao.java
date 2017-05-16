/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.feedback.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.feedback.entity.TbAccountFeedback;

/**
 * 反馈记录DAO接口
 * @author wcl
 * @version 2017-05-11
 */
@MyBatisDao
public interface TbAccountFeedbackDao extends CrudDao<TbAccountFeedback> {
	
}