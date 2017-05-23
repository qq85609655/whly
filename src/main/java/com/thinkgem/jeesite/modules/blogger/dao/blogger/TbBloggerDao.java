/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.blogger.dao.blogger;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.blogger.entity.blogger.TbBlogger;

/**
 * 微博配置DAO接口
 * @author zuoqb
 * @version 2017-05-23
 */
@MyBatisDao
public interface TbBloggerDao extends CrudDao<TbBlogger> {
	
}