/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.hailian.whly.report.entity.FrontCompanyReport;

/**
 * 企业上报DAO接口
 * @author zqb
 * @version 2017-10-22
 */
@MyBatisDao
public interface FrontCompanyReportDao extends CrudDao<FrontCompanyReport> {
	
}