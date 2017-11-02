package com.thinkgem.jeesite.modules.sys.security;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * 
 * @className WhlyFormAuthenticationFilter.java
 * @time   2017年9月30日 上午10:56:57
 * @author zuoqb
 * @todo   表单验证（包含验证码）过滤类-威海林业前台
 */
@Service
public class WhlyFormAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {

	public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";
	public static final String DEFAULT_MOBILE_PARAM = "mobileLogin";
	public static final String DEFAULT_MESSAGE_PARAM = "message";

	private String captchaParam = DEFAULT_CAPTCHA_PARAM;
	private String mobileLoginParam = DEFAULT_MOBILE_PARAM;
	private String messageParam = DEFAULT_MESSAGE_PARAM;
	@Autowired
	private SystemService systemService;

	public AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String type=request.getParameter("type");
		if (password==null){
			password = "";
		}
		boolean rememberMe = isRememberMe(request);
		String host = StringUtils.getRemoteAddr((HttpServletRequest)request);
		String captcha = getCaptcha(request);
		boolean mobile = isMobileLogin(request);
		Map<String, Object> params=new HashMap<String, Object>();
    	params.put("loginName",username);
    	switch (Integer.valueOf(type)) {
		case 1:
			params.put("parentId","be9e0da458064360b214c9ca69327859");
			break;
		case 2:
			params.put("parentId","cc0cbec49fe5449da652f8db57d473ab");
			break;
		case 3:
			params.put("parentId","d2c1c37069fa4ce189bc4a3529cc7a65");
			break;
		case 4:
			params.put("parentId","ebc16b9cafd84d53a8222eae5d4340d6");
			break;
		default:
			params.put("parentId","be9e0da458064360b214c9ca69327859");
		}
    	List<User> userlist = systemService.checkUser(params);
    	if(userlist!=null&&userlist.size()>0){
    		return new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host, captcha, mobile);
    	}else{
    		return new UsernamePasswordToken("", password.toCharArray(), rememberMe, host, captcha, mobile);
    	}
	}

	public String getCaptchaParam() {
		return captchaParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	public String getMobileLoginParam() {
		return mobileLoginParam;
	}
	
	protected boolean isMobileLogin(ServletRequest request) {
        return WebUtils.isTrue(request, getMobileLoginParam());
    }
	
	public String getMessageParam() {
		return messageParam;
	}
	
	/**
	 * 登录成功之后跳转URL
	 */
	public String getSuccessUrl() {
		return super.getSuccessUrl();
	}
	
	@Override
	protected void issueSuccessRedirect(ServletRequest request,
			ServletResponse response) throws Exception {
//		Principal p = UserUtils.getPrincipal();
//		if (p != null && !p.isMobileLogin()){
			 WebUtils.issueRedirect(request, response, getSuccessUrl(), null, true);
//		}else{
//			super.issueSuccessRedirect(request, response);
//		}
	}

	/**
	 * 登录失败调用事件
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token,
			AuthenticationException e, ServletRequest request, ServletResponse response) {
		String className = e.getClass().getName(), message = "";
		if (IncorrectCredentialsException.class.getName().equals(className)
				|| UnknownAccountException.class.getName().equals(className)){
			message = "用户或密码或模块选择错误, 请重试.";
		}
		else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "msg:")){
			message = StringUtils.replace(e.getMessage(), "msg:", "");
		}
		else{
			message = "系统出现点问题，请稍后再试！";
			e.printStackTrace(); // 输出到控制台
		}
        request.setAttribute(getFailureKeyAttribute(), className);
        request.setAttribute(getMessageParam(), message);
        return true;
	}
	
}