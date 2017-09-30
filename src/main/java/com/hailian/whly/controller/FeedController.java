package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hailian.whly.entity.WhlyAccount;
import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/feed")
public class FeedController extends BaseController {
	@Autowired
	private WhlyAccountService whlyAccountService;
	
	@ModelAttribute
	public WhlyAccount get(@RequestParam(required=false) String id) {
		WhlyAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = whlyAccountService.get(id);
		}
		if (entity == null){
			entity = new WhlyAccount();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(WhlyAccount whlyAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WhlyAccount> page = whlyAccountService.findPage(new Page<WhlyAccount>(request, response), whlyAccount); 
		model.addAttribute("page", page);
		return whlyPage+"/feedList";
	}

	@RequestMapping(value = "form")
	public String form(WhlyAccount whlyAccount, Model model) {
		model.addAttribute("whlyAccount", whlyAccount);
		return whlyPage+"/feedForm";
	}

	@RequestMapping(value = "save")
	public String save(WhlyAccount whlyAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, whlyAccount)){
			return form(whlyAccount, model);
		}
		whlyAccountService.save(whlyAccount);
		addMessage(redirectAttributes, "保存微博配置成功");
		return "redirect:"+Global.getWhlyPath()+"/feed/list?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(WhlyAccount whlyAccount, RedirectAttributes redirectAttributes) {
		whlyAccountService.delete(whlyAccount);
		addMessage(redirectAttributes, "删除微博配置成功");
		return "redirect:"+Global.getWhlyPath()+"/feed/list?repage";
	}

}
