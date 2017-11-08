package com.hailian.whly.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import org.springframework.ui.Model;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

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
	public String home(Model model){
		//UserUtils.removeCache(UserUtils.CACHE_FRONT_MENU_LIST);
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
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time= sdf.format(new Date());
			model.addAttribute("time", time);
			return whlyPage+"/home/news";
		}else{
			return whlyPage+"/home/home";
		}
	}
}
