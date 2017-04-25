package com.thinkgem.jeesite.modules.cms.utils;

import java.util.Arrays;
import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;

public class YijianUtil {
	private static final List<String> yijianRoleId=Arrays.asList("c735238c56a54c1f905b1446488c21ba","d01b136db7c647a098a84a642ab1f551");
	public static boolean containRole(User user){
		boolean contain=false;
		for(String str:user.getRoleIdList()){
			contain=yijianRoleId.contains(str);
			break;
		}
		return contain;
		
	}
}
