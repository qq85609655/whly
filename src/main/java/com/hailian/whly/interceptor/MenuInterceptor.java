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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 
 * @className MenuInterceptor.java
 * @time   2017年10月1日 下午8:26:12
 * @author zuoqb
 * @todo  威海林业 菜单处理拦截器
 */
public class MenuInterceptor extends BaseService implements HandlerInterceptor {
	@Autowired
	private SystemService systemService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		if(!"XMLHttpRequest".equals(request.getHeader("x-requested-with"))
				&&!request.getRequestURI().startsWith(Global.getWhlyPath()+"/login")
				&&!request.getRequestURI().startsWith(Global.getWhlyPath()+"/industry/login")
				&&!request.getRequestURI().startsWith(Global.getWhlyPath()+"/choose")
				&&!request.getRequestURI().startsWith(Global.getWhlyPath()+"/logout")
				&&!request.getRequestURI().startsWith(Global.getWhlyPath()+"/ajax/checkUser")){
			if(UserUtils.getUser()==null||StringUtils.isBlank(UserUtils.getUser().getId())){
				   response.sendRedirect(Global.getWhlyPath() + "/choose");
				   return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		//排除ajax之外  处理请求
		//if(!request.getRequestURI().startsWith(Global.getWhlyPath()+"/ajax")){
		if(!"XMLHttpRequest".equals(request.getHeader("x-requested-with"))
				&&!request.getRequestURI().startsWith(Global.getWhlyPath()+"/logout")){
			String menuId=request.getParameter("menuId");
			//处理菜单
			Map<String,Object> model=modelAndView.getModel();
			
			Menu menu=null;
			String menusIds=null;//当前所选菜单全部父级id 包含自己
			List<Menu> sourcelist = systemService.findAllFrontMenu();
			for(Menu c:sourcelist){
				if(c.getId().equals(menuId)){
					menu=c;
				}
			}
			if(menu!=null){
				menusIds=","+menu.getParentIds()+menu.getId()+",";
			}
			model.put("menusIds", menusIds);
			List<Menu> menuList = Menu.sortFrontList(sourcelist, Global.getFrontRootMenu(), true);
	        model.put("menuList", menuList);
	        model.put("menuId", menuId);
	      //获取当前菜单层级名称
			List<Menu> topMenu=Menu.getMenuName(sourcelist, menusIds);
			model.put("topMenu", topMenu);
	        
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
	}

}
