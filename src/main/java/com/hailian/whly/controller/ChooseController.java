package com.hailian.whly.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.restlet.engine.adapter.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.commom.CompanyTypeEnum;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
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
	@Autowired
	private OfficeService officeService;
	@RequestMapping({"","/index"})
	public String choose(Model model,HttpServletRequest requst){
		String backmk=requst.getParameter("backmk");
		if("backmk".equals(backmk)){
			UserUtils.clearCache(UserUtils.getUser2());
			UserUtils.removeCache("selected_pcid");
		}
		if("1".equals(UserUtils.getUser2().getCompany().getId())){
			//可以看全部模块
			model.addAttribute("canSeeAll",true);
			String pcid=(String) UserUtils.getCache("selected_pcid");
			if(StringUtils.isNotBlank(pcid)){
				UserUtils.getUser().setCompany(officeService.get(pcid));
			}
		}else{
			model.addAttribute("comPanyType", UserUtils.getUser().getCompany().getIndustyType().getType());
		}
		model.addAttribute("companyEnum",CompanyTypeEnum.getAllCompany());
		return whlyPage+"/home/choose";
	}
}
