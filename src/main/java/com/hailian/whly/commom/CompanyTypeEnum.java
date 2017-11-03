 package com.hailian.whly.commom;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @className CompanyTypeEnum.java
 * @time   2017年11月3日 下午9:55:35
 * @author zuoqb
 * @todo   公司类型枚举
 */
 public enum CompanyTypeEnum{
   ZDFW("重点服务业企业监测","front_hylx","be9e0da458064360b214c9ca69327859"), 
   XEYX("限额以下服务业企业监测板块","front_xe","cc0cbec49fe5449da652f8db57d473ab"), 
   NDFC("年度扶持项目监测板块","","ebc16b9cafd84d53a8222eae5d4340d6"),
   OTHER("其他","","d2c1c37069fa4ce189bc4a3529cc7a65");
   private String name;
   private String type;
   private String rootId;

	private CompanyTypeEnum(String name,String type,String rootId) {
		this.name = name;
		this.type = type;
		this.rootId=rootId;
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
