package com.hailian.whly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 
 * @className WhlyTestController.java
 * @time   2017年9月30日 上午9:05:03
 * @author zuoqb
 * @todo   测试类
 */
@Controller
@RequestMapping("${whlyPath}/test")
public class WhlyTestController extends BaseController {
	@Autowired
	private WhlyAccountService whlyAccountService;

	@RequestMapping("/ui")
	public String ui(HttpServletRequest request, HttpServletResponse response,Model model) {
		return whlyPage+"/test/ui";
	}
	@RequestMapping("/news")
	public String news(HttpServletRequest request, HttpServletResponse response,Model model) {
		return whlyPage+"/test/news";
	}

}
