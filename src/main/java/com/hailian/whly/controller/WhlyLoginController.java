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
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}")
public class WhlyLoginController extends BaseController {
	@Autowired
	private WhlyAccountService whlyAccountService;

	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response,Model model) {
		return whlyPage+"/user/login";
	}

}
