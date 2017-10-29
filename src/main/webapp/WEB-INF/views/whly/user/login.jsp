<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.thinkgem.jeesite.modules.sys.security.WhlyFormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>${fnc:getSite(1).title}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="/static/${whlyPage}/assets/global/css/fonts.googleapis.com.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="/static/${whlyPage}/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="/static/${whlyPage}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="/static/${whlyPage}/assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
   		<script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <!-- END HEAD -->
	<script>
	$(document).ready(function() {
		$("#loginForm").validate({
			rules: {
				validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
			},
			messages: {
				username: {required: "请填写用户名."},password: {required: "请填写密码."},
				validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
			},
			errorLabelContainer: "#messageBox",
			errorPlacement: function(error, element) {
				error.appendTo($("#loginError").parent());
			} 
		});
	});
	// 如果在框架或在对话框中，则弹出提示并跳转到首页
	if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
		alert('未登录或登录超时。请重新登录，谢谢！');
		top.location = "${whlyPath}/home";
	}
	</script>

    <body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="index.html">
                <img src="${fnc:getSite(1).logo}" alt="" /> </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form id="loginForm" class="form-signin" action="${whlyPath}/login" method="post">
                <h3 class="form-title font-green">${fnc:getSite(1).name}</h3>
                <div  id="messageBox" class="alert alert-danger ${empty message ? 'display-hide' : ''}">
                    <button class="close" data-close="alert" class="close">×</button>
                    <span id="loginError">${message}</span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">登录名</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="登录名" id="username"  value="${username}" name="username" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" id="password" name="password" /> </div>
                    
                    <c:if test="${isValidateCodeLogin}"><div class="validateCode">
			<label class="input-label mid" for="validateCode">验证码</label>
			<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
		</div></c:if>
                <div class="form-actions">
                    <button type="submit" class="btn green uppercase">登 录</button>
                    <label class="rememberme check">
                        <input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''} title="下次不需要再登录" value="1" />记住我（公共场所慎用） </label>
                  <!--   <a href="javascript:;" id="forget-password" class="forget-password">忘记密码?</a> -->
                </div>
                <!-- 第三方登陆 -->
               <!--  <div class="login-options">
                    <h4>Or login with</h4>
                    <ul class="social-icons">
                        <li>
                            <a class="social-icon-color facebook" data-original-title="facebook" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color twitter" data-original-title="Twitter" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color googleplus" data-original-title="Goole Plus" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color linkedin" data-original-title="Linkedin" href="javascript:;"></a>
                        </li>
                    </ul>
                </div> -->
             <!--    <div class="create-account">
                    <p>
                        <a href="javascript:;" id="register-btn" class="uppercase">创建账号</a>
                    </p>
                </div> -->
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="" method="post">
                <h3 class="font-green">忘记密码 ?</h3>
                <p> 输入注册邮箱重置密码. </p>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn btn-default">返回</button>
                    <button type="submit" class="btn btn-success uppercase pull-right">提交</button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->
            <!-- BEGIN REGISTRATION FORM -->
            <form class="register-form" action="index.html" method="post">
                <h3 class="font-green">注册</h3>
                <p class="hint">请填写一下个人信息: </p>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">姓名</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="姓名" name="fullname" /> </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">邮箱</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="邮箱" name="email" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">手机号</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="手机号" name="address" /> </div>
               
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">登录名</label>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="登录名" name="username" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="密码" name="password" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">确认密码</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="确认密码" name="rpassword" /> </div>
                <div class="form-group margin-top-20 margin-bottom-20">
                    <label class="check">
                        <input type="checkbox" name="tnc" />我同意
                        <a href="javascript:;">协议 </a>
                    </label>
                    <div id="register_tnc_error"> </div>
                </div>
                <div class="form-actions">
                    <button type="button" id="register-back-btn" class="btn btn-default">返回</button>
                    <button type="submit" id="register-submit-btn" class="btn btn-success uppercase pull-right">注册</button>
                </div>
            </form>
            <!-- END REGISTRATION FORM -->
        </div>
        <div class="copyright"> ${fnc:getSite(1).copyright}</div>
        <!-- BEGIN CORE PLUGINS -->
        <script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="/static/${whlyPage}/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="/static/${whlyPage}/assets/pages/scripts/login.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>
<script>
$(function(){
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	           $("#loginForm").submit();//处理事件
	     }
		}
	});  
</script>
</html>