package com.hailian.whly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;

/**
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/news")
public class NewsController extends BaseController {
	@RequestMapping({"","/index"})
	public String news(){
		return whlyPage+"/home/news";
	}
}
