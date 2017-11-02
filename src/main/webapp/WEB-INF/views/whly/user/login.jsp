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


        <style>
/* 1366*768 */
/* 1920*1080 */
@media screen and (max-width:1400px) {
	html {
		overflow: hidden;
		font-size: 16px
	}
	.login {
		background:
			url("/static/${whlyPage}/assets/global/img/login/bg.png")
			no-repeat 100% 100% !important;
		background-size: 100% 100% !important;
		overflow: hidden;
	}
	.login .content {
		background: rgba(0, 0, 0, 0);
		/* margin-top:0; */
		margin-top: 200px;
	}
	#loginForm {
		width: 18rem;
		height: 12rem;
		/* background:#dd0; */
		/* margin-top:230px; */
		margin-top: 2.4rem;
		margin-left: 1rem;
	}
	.control-label, .input-label {
		display: inline-block;
		color: #fff;
		width: 60px;
		text-align: left;
		padding-left: 8px;
	}
	.login .content .form-control {
		display: inline-block;
		width: 12rem;
		height: 1.6rem;
		background: linear-gradient(to bottom, #ccc, #fff);
	}
	.login .content .form-signin .form-group {
		margin-bottom: 10px;
	}
	.login .content .form-signin .form-group2 {
		margin-bottom: 0;
	}
	.login .content .form-actions {
		height: 66px;
		padding: 5px 30px;
		border: 0;
	}
	.login .content .form-actions #rememberMe {
		margin-left: 8px;
		margin-top: 8px;
		float: left;
	}
	.login .content .form-actions .rememberMe {
		float: left;
	}
	.login .content .form-actions .btn {
		margin-top: 20px;
		margin-left: 60px;
		background:
			url("/static/${whlyPage}/assets/global/img/login/loginBtn.png")
			no-repeat 100% 100%;
		background-size: 100% 100%;
		padding: 5px 15px !important;
		float: left;
		border: 0;
		outline: none;
	}
	.login .content .check {
		color: #fff;
		font-size: 12px;
		float: left;
		margin-top: 5px;
		margin-left: 5px;
	}
	.alert {
		padding: 2px 10px;
		/* margin-top:-34px; */
		margin-top: -45px;
		margin-bottom: 4px;
	}
	.validateCode {
		margin-top: 8px;
	}
	.validateCode .mid {
		margin-top: 0 !important;
		color: #fff !important;
	}
	.loginBg{
		position: absolute;
		top: 10.5em;
		left: 50%;
		transform: translateX(-50%);
		height: 24em;
		width: 30em;
		background: url(/static/whly/assets/global/img/login/bg_login.png);
		background-size: 100% 100%;
	}
}

@media screen and (min-width:1400px) and (max-width:2000px) {
	html {
		overflow: hidden;
		font-size: 30px
	}
	body {
		font-size: 18px
	}
	.login {
		background: url("/static/${whlyPage}/assets/global/img/login/bg.png")
			no-repeat 100% 100% !important;
		background-size: 100% 100% !important;
		overflow: hidden;
	}
	.login .content {
		width: 490px;
		background: rgba(0, 0, 0, 0);
		/* margin-top:0; */
		margin-top: 200px;
		margin-left: 690px;
	}
	#loginForm {
		width: 18rem;
		height: 12rem;
		/* background:#dd0; */
		/* margin-top:230px; */
		margin-top: 6rem;
		margin-left: 1rem;
	}
	.control-label, .input-label {
		display: inline-block;
		color: #fff;
		width: 80px;
		text-align: left;
		padding-left: 8px;
		font-size: 22px;
	}
	.login .content .form-control {
		display: inline-block;
		width: 10rem;
		height: 1.6rem;
		background: linear-gradient(to bottom, #ccc, #fff);
		font-size: 22px;
	}
	.login .content .form-signin .form-group {
		margin-bottom: 10px;
	}
	.login .content .form-signin .form-group2 {
		margin-bottom: 0;
	}
	.login .content .form-actions {
		height: 66px;
		padding: 5px 30px;
		border: 0;
	}
	.login .content .form-actions #rememberMe {
		margin-left: 8px;
		margin-top: 8px;
		float: left;
		width: 32px;
		height: 25px;
	}
	.login .content .form-actions .rememberMe {
		font-size: 22px;
		float: left;
	}
	.login .content .form-actions .btn {
		margin-top: 20px;
		margin-left: 60px;
		background:
			url("/static/${whlyPage}/assets/global/img/login/loginBtn.png")
			no-repeat 100% 100%;
		background-size: 100% 100%;
		padding: 20px 50px !important;
		float: left;
		border: 0;
		outline: none;
		font-size: 22px;
	}
	.login .content .check {
		color: #fff;
		font-size: 12px;
		float: left;
		margin-top: 5px;
		margin-left: 5px;
	}
	.alert {
		padding: 2px 10px;
		/* margin-top:-34px; */
		margin-top: -45px;
		margin-bottom: 4px;
	}
	#validateCode {
		width: 80px !important;
		height: 40px !important;
		font-size: 24px;
	}
	.validateCode {
		margin-top: 8px;
		/* width:80px!important;
                    height:40px!important; */
	}
	.validateCode .mid {
		width: 100px;
		margin-top: 0 !important;
		color: #fff !important;
		font-size: 22px;
	}
	.loginBg {
		position: absolute;
		top: 14.5em;
		left: 50%;
		transform: translateX(-50%);
		height: 28em;
		width: 30em;
		background: url(/static/whly/assets/global/img/login/bg_login.png);
		background-size: 100% 100%;
	}
}
</style>
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
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
            },
           
		});
	});
	// 如果在框架或在对话框中，则弹出提示并跳转到首页
	if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
		alert('未登录或登录超时。请重新登录，谢谢！');
		top.location = "${whlyPath}/choose";
    }
    
    
	</script>

    <body class="login">
        <!-- BEGIN LOGO -->
        <!-- <div class="logo">
            <a href="index.html">
                <img src="${fnc:getSite(1).logo}" alt="" /> </a>
        </div> -->
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="loginBg"></div>
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form id="loginForm" class="form-signin" action="${whlyPath}/login" method="post">
             <input type="hidden" name="type" id="typeId" value="${type }"/>
                <!-- <h3 class="form-title font-green">${fnc:getSite(1).name}</h3> -->
                <div  id="messageBox" class="alert alert-danger ${empty message ? 'display-hide' : ''}">
                    <button class="close" data-close="alert" class="close">×</button>
                    <span id="loginError">${message}</span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">用户名:</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="" id="username"  value="${username}" name="username" /> </div>
                <div class="form-group form-group2">
                    <label class="control-label visible-ie8 visible-ie9">密&emsp;码:</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="" id="password" name="password" /> </div>
                   
                    <c:if test="${isValidateCodeLogin}"><div class="validateCode">
			<label class="input-label mid" for="validateCode">验证码:</label>
			<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
		</div></c:if>
                <div class="form-actions">
                     
                                <input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''} title="下次不需要再登录" value="1" />
                                <label class="rememberme check" for="rememberMe">记住密码</label>
                    <button type="submit" id="submitBtn"  class="btn green uppercase">登 录</button>
                   
                  <!--   <a href="javascript:;" id="forget-password" class="forget-password">忘记密码?</a> -->
                </div>
              
            </form>
            <!-- END LOGIN FORM -->
            
        </div>
        <!-- <div class="copyright"> ${fnc:getSite(1).copyright}</div> -->
        <!-- BEGIN CORE PLUGINS -->
        <script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    </body>
<script>
$(function(){
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	           $("#loginForm").submit();//处理事件
	    	//submitMethod();
	     }
		}
	}); 
</script>
</html>