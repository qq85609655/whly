 package com.hailian.whly.commom;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @className CheckStatus.java
 * @time   2017年10月22日 下午7:58:36
 * @author zuoqb
 * @todo   TODO
 */
 public enum CheckStatus{
   SUBMIT("SUBMIT","已提交"), 
   PASSED("PASSED","已审核"), 
   UNPASSED("UNPASSED","未通过");

   private String code;
   private String value;

	private CheckStatus(String code,String value) {
		this.code = code;
		this.value = value;
	}

	public Integer getKey() {
		return Integer.valueOf(ordinal());
	}

	public String getValue() {
		return this.value;
	}

	public static CheckStatus getMatchByName(String name) {
		for (CheckStatus isHave : values()) {
			if (isHave.value.equalsIgnoreCase(name)) {
				return isHave;
			}
		}
		return null;
	}
	public static List<CheckStatus> getAllStatus() {
		List<CheckStatus> allStatus=new ArrayList<CheckStatus>();
		for (CheckStatus isHave : values()) {
			allStatus.add(isHave);
		}
		return allStatus;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public static CheckStatus getMatchByOrdinal(Integer ordinal) {
		for (CheckStatus flag : values()) {
			if (flag.getKey().equals(ordinal)) {
				return flag;
			}
		}
		return null;
	}
}
