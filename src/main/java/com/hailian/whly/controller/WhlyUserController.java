package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * @className WhlyLoginController.java
 * @time   2017年9月29日 上午11:27:46
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/user")
public class WhlyUserController extends BaseController {
	@Autowired
	private SystemService systemService;
	
	/**
	 * 
	 * @time   2017年11月2日 
	 * @author 陈新
	 * @todo   个人
	 * @param  @return
	 * @return_type   String
	 */

	//user个人信息
	@RequestMapping(value = "userInfo")
	public String info(User user, HttpServletResponse response, Model model) {
		User currentUser = UserUtils.getUser();
		model.addAttribute("user", currentUser);
		model.addAttribute("Global", new Global());
		return whlyPage+"/user/userInfo";
	}
	/*
	 * 重写修改用户信息
	 */
	@RequestMapping(value = "saveUserInfo")
	public String saveUserInfo(User user, HttpServletResponse response, Model model) {
		User currentUser = UserUtils.getUser();
		currentUser.setEmail(user.getEmail());
		currentUser.setPhone(user.getPhone());
		currentUser.setMobile(user.getMobile());
		currentUser.setPhoto(user.getPhoto());
		systemService.updateUserInfo(currentUser);
		model.addAttribute("message", "保存用户信息成功");
	
		model.addAttribute("user", currentUser);
		model.addAttribute("Global", new Global());
		return whlyPage+"/user/userInfo";
	}
	
	//user修改密码
	@RequestMapping(value = "modifyPwd")
	public String modifyPwd(String oldPassword, String newPassword, Model model) {
		User user = UserUtils.getUser();
//		String path=whlyPage+"/user/login";
		String path="redirect:/front/logout";
		if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)){
//			if(Global.isDemoMode()){
//				model.addAttribute("message", "演示模式，不允许操作！");
//				return "modules/sys/userModifyPwd";
//			}
			if (SystemService.validatePassword(oldPassword, user.getPassword())){
				systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
				model.addAttribute("message", "修改密码成功");
			}else{
				model.addAttribute("message", "修改密码失败，旧密码错误");
				path=whlyPage+"/user/userPassword";
			}
		}
		model.addAttribute("user", user);
		return path;
	}
	//进入修改密码页面
	@RequestMapping("userPwdPage")
	public String modifyPage(){
		return whlyPage+"/user/userPassword";
	}
	
}
