/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.reportstatistics.service;

import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.hailian.whly.commom.CompanyTypeEnum;
import com.hailian.whly.commom.IndexModel;
import com.hailian.whly.reportstatistics.entity.ReportStatistics;
import com.hailian.whly.reportstatistics.dao.ReportStatisticsDao;

/**
 * 上报统计图用Service
 * @author zyl
 * @version 2017-11-09
 */
@Service
@Transactional(readOnly = true)
public class ReportStatisticsService extends CrudService<ReportStatisticsDao, ReportStatistics> {
	
	@Autowired
	private ReportStatisticsDao dao;
	
	public ReportStatistics get(String id) {
		return super.get(id);
	}
	
	public List<ReportStatistics> findList(ReportStatistics reportStatistics) {
		return super.findList(reportStatistics);
	}
	
	public Page<ReportStatistics> findPage(Page<ReportStatistics> page, ReportStatistics reportStatistics) {
		return super.findPage(page, reportStatistics);
	}
	
	@Transactional(readOnly = false)
	public void save(ReportStatistics reportStatistics) {
		super.save(reportStatistics);
	}
	
	@Transactional(readOnly = false)
	public void delete(ReportStatistics reportStatistics) {
		super.delete(reportStatistics);
	}
	
	public List<ReportStatistics> getStatic(ReportStatistics reportStatistics) {
		String year = reportStatistics.getYear().substring(0, 4);
		String month = reportStatistics.getYear().substring(5, 7);
		List<ReportStatistics> list = dao.getStaitic(reportStatistics);
		List<ReportStatistics> data = new ArrayList<ReportStatistics>();
		for(ReportStatistics rs1: list) {
			if(rs1.getYear().equals(year) && Integer.parseInt(rs1.getMonth())<=Integer.parseInt(month)) {
				for(ReportStatistics rs2: list) {
					if(Integer.parseInt(year)-Integer.parseInt(rs2.getYear())==1 && rs2.getMonth().equals(rs1.getMonth())) {
						data.add(this.data(rs1,rs2));
					}
				}
			}
		}
		if(data.size() != Integer.parseInt(month)) {
			for(int i=0; i<Integer.parseInt(month); i++) {
				if( i>=data.size() || Integer.parseInt(data.get(i).getMonth()) != i+1) {
					ReportStatistics rs = new ReportStatistics(year, String.valueOf(i+1), null, "0", "0", "0", "0", "0", "0", "0", "0", null, null, null, null, null, null, null);
					data.add(i, rs);
				}
			}
		}
		return data;
	}
	
	public ReportStatistics data(ReportStatistics rs1, ReportStatistics rs2) {
		
		String totalIncome = this.compute(rs1.getTotalIncome(), rs2.getTotalIncome());
		String totalProfit = this.compute(rs1.getTotalProfit(), rs2.getTotalProfit());		// 利润总额（万）
		String totalTax = this.compute(rs1.getTotalTax(), rs2.getTotalTax());		// 税收总额（万）
		String empQuantity = this.compute(rs1.getEmpQuantity(), rs2.getEmpQuantity());		// 从业人员（人）
		String employeeCompensation = this.compute(rs1.getEmployeeCompensation(), rs2.getEmployeeCompensation());		// 应付职工薪酬 （万）
		String loanAmount = this.compute(rs1.getLoanAmount(), rs2.getLoanAmount());		// 贷款金额 （万）
		String orderQuantity = this.compute(rs1.getOrderQuantity(), rs2.getOrderQuantity());		// 订单数量 （个）
		String operatingCosts = this.compute(rs1.getOperatingCosts(), rs2.getOperatingCosts());		// 营业成本（万元）
		ReportStatistics rs = new ReportStatistics(rs1.getYear(), rs1.getMonth(), rs1.getYearMonth(), totalIncome, totalProfit, totalTax, empQuantity, employeeCompensation, loanAmount, orderQuantity, operatingCosts, null, null, null, null, null, null, null);
		return rs;
	}
	public String compute(String rs1, String rs2) {
		if(rs1==null || rs2==null) {
			return "0";
		}
		DecimalFormat df = new DecimalFormat("######0.00");
		String result = df.format((Double.parseDouble(rs1) - Double.parseDouble(rs2))/Double.parseDouble(rs2) * 100);
		
		return result;
	}
	
	/**
	 *
	 * @time   2017年11月16日 上午10:12:55 
	 * @author zhouyl
	 * @Description   占比分析
	 * @param  @param reportStatistics
	 * @param  @return List<IndexModel>
	 */
	public List<IndexModel> getProportionQytb(ReportStatistics reportStatistics){
		dealTongBiDate(reportStatistics);
		List<ReportStatistics> dataList = dao.getProportionQytb(reportStatistics);
		//根据大类 获取对应指标然后 筛选数据
		List<IndexModel> indexsList = dealDataByIndexs(dataList, reportStatistics);
		return indexsList;
	}
	
	/**
	 * 
	 * @time   2017年11月12日 下午12:25:05
	 * @author zuoqb
	 * @todo  同比增速、环比增速
	 * @param  @param reportStatistics
	 * @param  @return
	 * @return_type   List<IndexModel>
	 */
	public List<IndexModel> getStaiticQytb(ReportStatistics reportStatistics){
		dealTongBiDate(reportStatistics);
		List<ReportStatistics> dataList = dao.getStaiticQytb(reportStatistics);
		//根据大类 获取对应指标然后 筛选数据
		List<IndexModel> indexsList = dealDataByIndexs(dataList, reportStatistics);
		return indexsList;
	}
	
	/**
	 * 
	 * @time   2017年11月12日 下午12:28:33
	 * @author zuoqb
	 * @todo   同比统计时  日期处理
	 * @param  @param reportStatistics
	 * @return_type   void
	 */
	private void dealTongBiDate(ReportStatistics reportStatistics) {
		String selectDate=reportStatistics.getYear();
		String year = selectDate.substring(0, 4);
		String month = selectDate.substring(5, 7);
		reportStatistics.setYear(year);
		reportStatistics.setMonth(month);
		//设置上一年 
		reportStatistics.setPreYear(String.valueOf(Integer.parseInt(year)-1));
	}
	/**
	 * 
	 * @time   2017年11月12日 下午12:27:08
	 * @author zuoqb
	 * @todo   根据当前登录人所属大类的指标处理数据
	 * @param  @param dataList
	 * @param  @return
	 * @return_type   List<IndexModel>
	 */
	private List<IndexModel> dealDataByIndexs(List<ReportStatistics> dataList, ReportStatistics reportStatistics) {
		List<IndexModel> indexsList=CompanyTypeEnum.getIndexsByCtype();
		for(IndexModel index:indexsList){
			List<IndexModel> values=new ArrayList<IndexModel>();
			String filedKey=index.getFiled();
			//遍历结果集 组装数据
			for(ReportStatistics r: dataList){
				IndexModel m = null;
				if(reportStatistics.getStatisticsType().equals("MONTH")) {
					m=new IndexModel(r.getName()+"月", "");
				} else {
					m=new IndexModel(r.getName(), "");
				}
				try {
					//根据属性反射值
					Field field=ReportStatistics.class.getDeclaredField(filedKey);
					field.setAccessible(true);
					String value=String.valueOf(field.get(r)).replaceAll(",", "");
					if("null".equals(value)||StringUtils.isBlank(value)){
						value="0";
					}
					m.setFiled(value);
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				values.add(m);
			}
			index.setValues(values);
		}
		return indexsList;
	}
	//地区从业数据
	public List<ReportStatistics> getAreaEnploymentNumberAnalysis(ReportStatistics reportStatistics){
		dealTongBiDate(reportStatistics);
		return dao.getAreaEnploymentNumberAnalysis(reportStatistics);
		
	}
	//行业从业数据
		public List<ReportStatistics> getIndustryEnploymentNumberAnalysis(ReportStatistics reportStatistics){
			dealTongBiDate(reportStatistics);
			return dao.getIndustryEnploymentNumberAnalysis(reportStatistics);
			
		}
}