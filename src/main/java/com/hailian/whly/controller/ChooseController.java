package com.hailian.whly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.commom.CompanyTypeEnum;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/choose")
public class ChooseController extends BaseController {
	@Autowired
	private SystemService systemService;
	@RequestMapping({"","/index"})
	public String choose(Model model){
		model.addAttribute("comPanyType", UserUtils.getUser().getCompany().getIndustyType().getType());
		model.addAttribute("companyEnum",CompanyTypeEnum.getAllCompany());
		return whlyPage+"/home/choose";
	}
}
