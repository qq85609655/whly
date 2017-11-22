 package com.hailian.whly.commom;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 
 * @className CompanyTypeEnum.java
 * @time   2017年11月3日 下午9:55:35
 * @author zuoqb
 * @todo   公司类型枚举
 */
 public enum CompanyTypeEnum{
   ZDFW("重点服务业企业监测","front_hylx","be9e0da458064360b214c9ca69327859",IndexModel.zdfuIndexs), 
   XEYX("限额以下服务业企业监测","front_xe","cc0cbec49fe5449da652f8db57d473ab",IndexModel.xefxIndexs), 
   NDFC("年度扶持项目监测","front_ndfc","ebc16b9cafd84d53a8222eae5d4340d6",IndexModel.fcxmIndexs),
   OTHER("其他","front_qt","d2c1c37069fa4ce189bc4a3529cc7a65",null);
   private String name;
   private String type;
   private String rootId;
   private List<IndexModel> indexs;
	private CompanyTypeEnum(String name,String type,String rootId,List<IndexModel> indexs) {
		this.name = name;
		this.type = type;
		this.rootId=rootId;
		this.indexs=indexs;
	}
	/**
	 * 
	 * @time   2017年11月12日 上午11:23:43
	 * @author zuoqb
	 * @todo   根据当前登录人获取对应指标集合
	 * @param  @return
	 * @return_type   List<IndexModel>
	 */
	public static List<IndexModel> getIndexsByCtype(){
		String comPanyType=UserUtils.getUser().getCompany().getIndustyType().getType();
		CompanyTypeEnum enums=CompanyTypeEnum.getMatchByType(comPanyType);
		return enums.getIndexs();
	}

	public Integer getKey() {
		return Integer.valueOf(ordinal());
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRootId() {
		return rootId;
	}

	public void setRootId(String rootId) {
		this.rootId = rootId;
	}

	public List<IndexModel> getIndexs() {
		return indexs;
	}

	public void setIndexs(List<IndexModel> indexs) {
		this.indexs = indexs;
	}

	public static CompanyTypeEnum getMatchByType(String type) {
		for (CompanyTypeEnum isHave : values()) {
			if (isHave.getType().equalsIgnoreCase(type)) {
				return isHave;
			}
		}
		return null;
	}
	public static CompanyTypeEnum getMatchByName(String name) {
		for (CompanyTypeEnum isHave : values()) {
			if (isHave.getName().equalsIgnoreCase(name)) {
				return isHave;
			}
		}
		return null;
	}
	public static CompanyTypeEnum getMatchByRootId(String rootId) {
		for (CompanyTypeEnum isHave : values()) {
			if (isHave.getRootId().equalsIgnoreCase(rootId)) {
				return isHave;
			}
		}
		return null;
	}
	public static List<CompanyTypeEnum> getAllCompany() {
		List<CompanyTypeEnum> allCompany=new ArrayList<CompanyTypeEnum>();
		for (CompanyTypeEnum entity : values()) {
			allCompany.add(entity);
		}
		return allCompany;
	}


	public static CompanyTypeEnum getMatchByOrdinal(Integer ordinal) {
		for (CompanyTypeEnum flag : values()) {
			if (flag.getKey().equals(ordinal)) {
				return flag;
			}
		}
		return null;
	}
}
