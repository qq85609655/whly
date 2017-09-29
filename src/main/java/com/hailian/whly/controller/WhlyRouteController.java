package com.hailian.whly.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 
 * @className WhlyRouteController.java
 * @time   2017年9月29日 下午5:07:38
 * @author zuoqb
 * @todo   整体页面路由
 */
@Controller
@RequestMapping("${whlyPath}/r")
public class WhlyRouteController extends BaseController {

	@RequestMapping("/{url}")
	public String index(@PathVariable("url") String url,Model model){
		if(StringUtils.isEmpty(url)){
			url="home";
		}
		model.addAttribute("url", url);
		model.addAttribute("whlyPath", whlyPath);
		return whlyPage+"/index";
	}

}
