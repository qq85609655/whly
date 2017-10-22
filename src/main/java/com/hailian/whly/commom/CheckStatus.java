 package com.hailian.whly.commom;

/**
 * 
 * @className CheckStatus.java
 * @time   2017年10月22日 下午7:58:36
 * @author zuoqb
 * @todo   TODO
 */
 public enum CheckStatus{
   SUBMIT("已提交"), 
   PASSED("已审核"), 
   UNPASSED("未通过");

   private String value;

	private CheckStatus(String value) {
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

	public static CheckStatus getMatchByOrdinal(Integer ordinal) {
		for (CheckStatus flag : values()) {
			if (flag.getKey().equals(ordinal)) {
				return flag;
			}
		}
		return null;
	}
}
