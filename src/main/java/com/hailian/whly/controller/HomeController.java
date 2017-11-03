package com.hailian.whly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/home")
public class HomeController extends BaseController {
	@Autowired
	private SystemService systemService;
	/**
	 * 
	 * @time   2017年10月1日 下午8:43:04
	 * @author zuoqb
	 * @todo   首页
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping({"","/index"})
	public String home(){
		List<Menu> menuList = systemService.findAllFrontMenu();
		boolean canSh=false;
		for(Menu m:menuList){
			if(m!=null&&Global.getWhlyShMenuId().equals(m.getId())){
				//包含数据审核 则去掉数据查看功能
				canSh=true;
				break;
			}
		}
		if(!canSh){
			return whlyPage+"/home/news";
		}else{
			return whlyPage+"/home/home";
		}
	}
}
