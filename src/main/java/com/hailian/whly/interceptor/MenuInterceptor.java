/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;

/**
 * 
 * @className MenuInterceptor.java
 * @time   2017年10月1日 下午8:26:12
 * @author zuoqb
 * @todo  威海林业 菜单处理拦截器
 */
public class MenuInterceptor extends BaseService implements HandlerInterceptor {
	@Autowired
	private CategoryService categoryService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		//排除ajax之外  处理请求
		if(!request.getRequestURI().startsWith(Global.getWhlyPath()+"/ajax")){
			String menuId=request.getParameter("menuId");
			//处理菜单
			Map<String,Object> model=modelAndView.getModel();
			model.put("categoryList", categoryService.findByUserWhly(true, null,response));
			Category menu=null;
			String menusIds=null;//当前所选菜单全部父级id 包含自己
			List<Category> list=categoryService.findByUser(true, null,response);
			for(Category c:list){
				if(c.getId().equals(menuId)){
					menu=c;
				}
			}
			if(menu!=null){
				menusIds=","+menu.getParentIds()+menu.getId()+",";
			}
			model.put("menusIds", menusIds);
			//获取当前菜单层级名称
			List<Category> topMenu=categoryService.getMenuName(menusIds,response);
			model.put("topMenu", topMenu);
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
	}

}
