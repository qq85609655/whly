/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.reportstatistics.dao;

import java.util.List;

import com.hailian.whly.reportstatistics.entity.ReportStatistics;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 上报统计图用DAO接口
 * @author zyl
 * @version 2017-11-09
 */
@MyBatisDao
public interface ReportStatisticsDao extends CrudDao<ReportStatistics> {
	
	
	/**
	 *
	 * @time   2017年11月10日 下午12:04:40 
	 * @author zhouyl
	 * @Description   地区
	 * @param  @param reportStatistics
	 * @param  @return List<ReportStatistics>
	 */
	public List<ReportStatistics> getStaitic(ReportStatistics reportStatistics);
	
	/**
	 *
	 * @time   2017年11月16日 上午10:10:20 
	 * @author zhouyl
	 * @Description   占比分析
	 * @param  @param reportStatistics
	 * @param  @return List<ReportStatistics>
	 */
	public List<ReportStatistics> getProportionQytb(ReportStatistics reportStatistics);
	
	/**
	 *
	 * @time   2017年11月16日 上午10:10:20 
	 * @author zhouyl
	 * @Description   总额分析
	 * @param  @param reportStatistics
	 * @param  @return List<ReportStatistics>
	 */
	public List<ReportStatistics> getAmountQytb(ReportStatistics reportStatistics);
	
	public List<ReportStatistics> getStaiticQytb(ReportStatistics reportStatistics);
	
	public List<ReportStatistics> getIndustryEnploymentNumberAnalysis(ReportStatistics reportStatistics);
	public List<ReportStatistics> getAreaEnploymentNumberAnalysis(ReportStatistics reportStatistics);

}