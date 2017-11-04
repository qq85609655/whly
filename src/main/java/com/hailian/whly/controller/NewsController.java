package com.hailian.whly.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String news(Model model){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time= sdf.format(new Date());
		model.addAttribute("time", time);
		return whlyPage+"/home/news";
	}
}
