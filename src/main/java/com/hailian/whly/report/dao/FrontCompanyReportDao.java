/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.hailian.whly.report.entity.FrontCompanyReport;
import com.hailian.whly.report.entity.FrontReportHistory;
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
	 * @time   2017年11月14日 下午2:16:32 
	 * @author zhouyl
	 * @Description   统计所有公司数量
	 * @param  @return List<FrontCompanyReport>
	 */
	public List<FrontCompanyReport> statisticsCountByOffice(String parentId);
	/**
	 * 
	 * @time   2017年10月26日 上午10:18:00
	 * @author zhouyl
	 * @todo   添加
	 * @param  @param frontCompanyReport
	 * @param  @return
	 * @return_type   int
	 */
	public int insert1(FrontCompanyReport frontCompanyReport);
	/**
	 * 
	 * @time   2017年10月27日 上午09:18:00
	 * @author zhouyl
	 * @todo   查询所有问题
	 * @param  @param reportId
	 * @param  @return
	 * @return_type   List<FrontReportQuestion>
	 */
	public List<FrontReportQuestion> findQuestion(String reportId);
	/**
	 * 
	 * @time   2017年10月27日 上午09:18:00
	 * @author zhouyl
	 * @todo   添加问题
	 * @param  @param frontReportQuestion
	 * @param  @return
	 * @return_type   int
	 */
	public int addQuestion(FrontReportQuestion frontReportQuestion);
	
	/**
	 * 
	 * @time   2017年10月27日 上午09:18:00
	 * @author zhouyl
	 * @todo   查询单条企业信息
	 * @param  @param companyId
	 * @param  @return
	 * @return_type   Office
	 */
	public Office findOfficeById(String companyId);
	
	/**
	 * 
	 * @time   2017年10月27日 上午16:29:00
	 * @author zhouyl
	 * @todo   修改上报信息
	 * @param  @param frontCompanyReport
	 * @param  @return
	 * @return_type   int
	 */
	public int updateReport(FrontCompanyReport frontCompanyReport);
	/**
	 * 
	 * @time   2017年10月28日 上午09:47:00
	 * @author zhouyl
	 * @todo   查询上报信息
	 * @param  @param frontCompanyReport
	 * @param  @return
	 * @return_type   int
	 */
	public List<FrontCompanyReport> findReport(FrontCompanyReport frontCompanyReport);
	
	/**
	 * 
	 * @time   2017年10月27日 下午16:29:00
	 * @author zhouyl
	 * @todo   修改问题信息
	 * @param  @param frontReportQuestion
	 * @param  @return
	 * @return_type   int
	 */
	public int updateQuestion(FrontReportQuestion frontReportQuestion);
	
	/**
	 * 
	 * @time   2017年10月28日 上午09:47:00
	 * @author zhouyl
	 * @todo   添加上报日志信息
	 * @param  @param frontReportHistroy
	 * @param  @return
	 * @return_type   int
	 */
	public int addHistroy(FrontReportHistory frontReportHistroy);
	
	/**
	 * 
	 * @time   2017年10月28日 上午09:47:00
	 * @author zhouyl
	 * @todo   查询上报日志信息
	 * @param  @param reportId
	 * @param  @return
	 * @return_type   List<FrontReportHistory> 
	 */
	public List<FrontReportHistory> findHistroy(String reportId);
	
	/**
	 * 
	 * @time   2017年10月28日 上午09:47:00
	 * @author zhouyl
	 * @todo   删除问题信息
	 * @param  @param questionId
	 * @param  @return
	 * @return_type   int
	 */
	public int deleteQuestion(String questionId);
	
	/**
	 * 
	 * @time   2017年10月29日 下午13:17:00
	 * @author zhouyl
	 * @todo   根据上报id查询该公司所有上报信息
	 * @param  @param id
	 * @param  @return
	 * @return_type   List<FrontCompanyReport>
	 */
	public List<FrontCompanyReport> findReportByReportId(String id);
	
	/**
	 * 
	 * @time   2017年11月08日 下午14:00:00
	 * @author zhouyl
	 * @todo   获取当前用户所在公司类型下所有已提交数量
	 * @param  @param id
	 * @param  @return
	 * @return_type   List<FrontCompanyReport>
	 */
	public int getBancklogNumber(FrontCompanyReport frontCompanyReport);
	
	
	/***
	 * @time 2017年10月28日13:40:05
	 * @author Tom
	 * @param reportId
	 * @return
	 */
	public List<FrontReportHistory> getHistory(HashMap<String, String> param);
	
	public List<FrontCompanyReport> getTopMonth(HashMap<String, String> param);
	
}
