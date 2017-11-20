/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.hailian.whly.interceptor;

import java.util.ArrayList;
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
	private static final String PATH=Global.getWhlyPath();
	/**
	 *不需要特殊处理路径equals
	 */
	@SuppressWarnings("serial")
	public final static List<String> passUrlsEquals= new ArrayList<String>(){{
		add(PATH+"/login");
		add(PATH+"/logout");
		add(PATH+"/ajax/checkUser");
	}};
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		if(!isAjax(request)&&!isPassStartWith(request.getRequestURI())){
			if(UserUtils.getUser()==null||StringUtils.isBlank(UserUtils.getUser().getId())){
				   response.sendRedirect(Global.getWhlyPath() + "/login");
				   return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		//排除ajax之外  处理请求
		if(!isAjax(request)&&!isPassStartWith(request.getRequestURI())){
			dealMenu(request, modelAndView);
		}
	}
	/**
	 * 
	 * @time   2017年11月3日 下午9:26:18
	 * @author zuoqb
	 * @todo   处理菜单
	 * @param  @param request
	 * @param  @param modelAndView
	 * @return_type   void
	 */
	private void dealMenu(HttpServletRequest request, ModelAndView modelAndView) {
		String pcid=request.getParameter("pcid");
		if(StringUtils.isNotBlank(pcid)){
			UserUtils.putCache("selected_pcid", pcid);
		}else{
			pcid=(String) UserUtils.getCache("selected_pcid");
		};
		String menuId=request.getParameter("menuId");
		//处理菜单
		Map<String,Object> model=modelAndView.getModel();
		model.put("pcid", pcid);
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
	/**
	 * 
	 * @time   2017年11月3日 下午9:24:48
	 * @author zuoqb
	 * @todo  判断请求是否是ajax
	 * @param  @param request
	 * @param  @return
	 * @return_type   boolean
	 */
	public boolean isAjax(HttpServletRequest request){
		return "XMLHttpRequest".equals(request.getHeader("x-requested-with"));
	}
	/**
	 * 
	 * @time   2017年11月3日 下午9:19:33
	 * @author zuoqb
	 * @todo   是否放行，不需要特殊处理
	 * @param  @param action_key
	 * @param  @return
	 * @return_type   boolean
	 */
	private boolean isPassStartWith(String action_key){
		for (String string : passUrlsEquals) {
			if(action_key.startsWith(string)){
				return true;
			}
		}
		return false;
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
	}

}
