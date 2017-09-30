package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;

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
	@Autowired
	private CategoryService categoryService;
	/**
	 * 
	 * @time   2017年9月30日 下午7:32:00
	 * @author zuoqb
	 * @todo   全局路由转发
	 * @param  @param url
	 * @param  @param model
	 * @param  @param response
	 * @param  @param menuId
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/{url}")
	public String index(@PathVariable("url") String url ,Model model, HttpServletResponse response,String menuId){
		if(StringUtils.isEmpty(url)){
			url="home";
		}
		model.addAttribute("url", url);
		model.addAttribute("whlyPath", whlyPath);
		//左侧菜单
		model.addAttribute("categoryList", categoryService.findByUserWhly(true, null,response));
		Category menu=categoryService.get(menuId);
		String menusIds=null;//当前所选菜单全部父级id 包含自己
		if(menu!=null){
			menusIds=","+menu.getParentIds()+menu.getId()+",";
		}
		model.addAttribute("menusIds", menusIds);
		//获取当前菜单层级名称
		List<Category> topMenu=categoryService.getMenuName(menusIds,response);
		model.addAttribute("topMenu", topMenu);
		return whlyPage+"/index";
	}

	

}
