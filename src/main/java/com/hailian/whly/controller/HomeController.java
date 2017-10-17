package com.hailian.whly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;

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
	private CategoryService categoryService;
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
		return whlyPage+"/home/home";
	}

}
