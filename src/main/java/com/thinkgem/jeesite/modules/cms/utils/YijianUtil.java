package com.thinkgem.jeesite.modules.cms.utils;

import java.util.Arrays;
import java.util.List;

import com.thinkgem.jeesite.common.utils.CookieUtils;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

public class YijianUtil {
	private static final List<String> yijianRoleId=Arrays.asList("c735238c56a54c1f905b1446488c21ba","d01b136db7c647a098a84a642ab1f551");
	public static boolean containRole(User user){
		boolean contain=false;
		//根据机构判断站点
		if("66be1c424f224c6d8ec7968c758084fc".equals(user.getCompany().getId())){
			contain=true;
		}
		/*for(String str:user.getRoleIdList()){
			contain=yijianRoleId.contains(str);
			break;
		}*/
		return contain;
		
	}
}
