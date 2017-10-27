/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportQuestion;

/**
 * 企业上报DAO接口
 * @author zqb
 * @version 2017-10-22
 */
@MyBatisDao
public interface FrontCompanyReportDao extends CrudDao<FrontCompanyReport> {
	
	/**
	 * 
	 * @time   2017年10月24日 上午11:11:21
	 * @author zuoqb
	 * @todo   按时间统计各月份上报数量
	 * @param  @param params
	 * @param  @return
	 * @return_type   List<FrontCompanyReport>
	 */
	public List<FrontCompanyReport> statisticsReportByDate(Map<String, Object> params);
	/**
	 * 
	 * @time   2017年10月24日 上午11:11:00
	 * @author zuoqb
	 * @todo   按照状态、时间统计数量
	 * @param  @param params
	 * @param  @return
	 * @return_type   List<FrontCompanyReport>
	 */
	public List<FrontCompanyReport> statisticsCountByStatus(Map<String, Object> params);
	/**
	 * 
	 * @time   2017年10月24日 上午11:11:00
	 * @author zuoqb
	 * @todo   按照行业类型统计数量
	 * @param  @param params
	 * @param  @return
	 * @return_type   List<FrontCompanyReport>
	 */
	public List<FrontCompanyReport> statisticsCountByType(Map<String, Object> params);
	/**
	 * 
	 * @time   2017年10月26日 上午10:18:00
	 * @author zhouyl
	 * @todo   添加
	 * @param  @param params
	 * @param  @return
	 * @return_type   int
	 */
	public int insert1(FrontCompanyReport frontCompanyReport);
	/**
	 * 
	 * @time   2017年10月27日 上午09:18:00
	 * @author zhouyl
	 * @todo   查询所有问题
	 * @param  @param params
	 * @param  @return
	 * @return_type   List<FrontReportQuestion>
	 */
	public List<FrontReportQuestion> findQuestion(String reportId);
	/**
	 * 
	 * @time   2017年10月27日 上午09:18:00
	 * @author zhouyl
	 * @todo   添加问题
	 * @param  @param params
	 * @param  @return
	 * @return_type   List<FrontReportQuestion>
	 */
	public int addQuestion(FrontReportQuestion frontReportQuestion);
	
}