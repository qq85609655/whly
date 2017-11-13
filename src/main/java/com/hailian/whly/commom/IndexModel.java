package com.hailian.whly.commom;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @className IndexModel.java
 * @time   2017年11月12日 上午11:07:02
 * @author zuoqb
 * @todo   指标基础对应
 */
public class IndexModel implements Serializable {
	private static final long serialVersionUID = 24792471223632115L;
	private String name;//指标名称
	private String filed;//对应MODEL中指标字段
	private List<IndexModel> values=new ArrayList<IndexModel>();
	//重点服务业企业监测板块指标
	public final static List<IndexModel> zdfuIndexs = new ArrayList<IndexModel>() {
		{
			add(new IndexModel("营业总额", "totalIncome"));
			add(new IndexModel("利润总额", "totalProfit"));
			add(new IndexModel("税收总额", "totalTax"));
			add(new IndexModel("营业成本", "operatingCosts"));
			add(new IndexModel("从业人员", "empQuantity"));
			add(new IndexModel("应付职工薪酬", "employeeCompensation"));
			add(new IndexModel("贷款金额", "loanAmount"));
			add(new IndexModel("订单数量", "orderQuantity"));
		}
	};
	//限额以下服务业企业监测板块指标
	public final static List<IndexModel> xefxIndexs = new ArrayList<IndexModel>() {
		{
			add(new IndexModel("营业总额", "totalIncome"));
			add(new IndexModel("利润总额", "totalProfit"));
			add(new IndexModel("营业成本", "operatingCosts"));
			add(new IndexModel("从业人员", "empQuantity"));
		}
	};

	public List<IndexModel> getValues() {
		return values;
	}

	public void setValues(List<IndexModel> values) {
		this.values = values;
	}

	public IndexModel(String name, String filed) {
		super();
		this.name = name;
		this.filed = filed;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFiled() {
		return filed;
	}

	public void setFiled(String filed) {
		this.filed = filed;
	}
}
