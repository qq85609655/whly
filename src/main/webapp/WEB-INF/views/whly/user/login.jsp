<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.thinkgem.jeesite.modules.sys.security.WhlyFormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${fnc:getSite(1).title}</title>
    <style>
        * {
            font-family: 微软雅黑, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        input,textarea,select{*font-size:100%;}
        html, body {
            height: 100%;
            color: #fff;
        }
        body{
            padding-top: 6em;
            background: url(/static/${whlyPage}/assets/global/img/login/bg.png) no-repeat;
            background-size: 100% 100%;
        }
        div.bgSplit{
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            top: 5em;
            width: 1%;
            height: 13em;
            background: url(/static/${whlyPage}/assets/global/img/login/bgSplit.png) no-repeat;
            background-size: 100% 100%;
        }
        div.content {
            transform-origin: 50% 0;
            width: 32em;
            /*height: 14em;*/
            margin: 0 auto;
            padding: 1.5em 0 1em;
            background-image: url(/static/${whlyPage}/assets/global/img/login/bg_login.png);
            background-size: 100% 100%;
            border-radius: .6em;
            /*box-shadow: 0.2em 0.2em 1em 0.3em rgba(0, 0, 0, .5);*/
        }

        h2 {
            margin:1.2em 0 1.88em;
            text-align: center;
            font-size: 1.4em;
            letter-spacing: .04em;
            font-family: 华文宋体 宋体, serif;
            color: rgba(255, 255, 255, .88);
            text-shadow: 0.1em 0.1em 0.1em rgba(0, 0, 0, .3)
        }
        form{
            position: relative;
            display: inline-block;
            vertical-align: top;
        }
        .formGroup {
            margin-left: 2.7em;
            margin-bottom: .6em;
        }
        .formGroup.submitBtn{
            margin-bottom: 0;
        }
        div#messageBox {
            position: absolute;
            top: -2.2em;
            /* width: 86%; */
            left: 18.5%;
            /* padding: 0.2em 1em .25em; */
            margin-bottom: 1em;
            color: #ffcc66;
            font-size: .8em;
            /* background-color: #f2dede; */
            /* border-color: #ebccd1; */
        }


        .validateCode a {
            color: #fff;
        }

        label:not(.error),a {
            font-size: .8em;
            letter-spacing: .2em;
        }

        .username>input,
        .password>input {
            width: 9.8em;
            border-color: #fff;
        }
        .formGroup.rememberGroup{
            margin-top: -.2em;
        }
        label.rememberme{
            display: inline-block;
            transform: scale(.8) translateX(-14%);
        }
        input[type="checkbox"] {
            width: 1em;
            height: 1em;
            position: relative;
            top: .2em;
        }

        #submitBtn {
            /*background: linear-gradient(to bottom, #3dc2ff 0%, #159ee9 50%, #1b44c1 90%, #1485c6 100%);*/
            margin: 0 0 4em 6em;
            width: 5em;
            height: 2.5em;
            background: url(/static/${whlyPage}/assets/global/img/login/loginBtn.png);
            background-size: 100% 100%;
            border: none;
            color: white;
            cursor: pointer;
        }

        .telephone{
            display: inline-block;
            width: 20em;
            padding-left: 2em;
            margin-top: -.2em;
            font-size: .7em;
            letter-spacing: .1em;
        }
        .telephone>h4{
            padding-left: 1em;
            transform: scale(.95) translateX(-3%);
        }
        .telephone>p{
            padding-left: 2em;
            margin-top: .6em;
            letter-spacing: .12em;
            line-height: 1.4em;
            transform-origin: 50% 0;
            transform: scale(.8) translateX(-13%);
        }
        footer{
            margin-top: 0.5em;
            position: absolute;
            left: 50%;
            width: 100%;
            transform: translateX(-50%);
            text-shadow: 0.1em 0.1em 0.1em rgba(0, 0, 0, .3);
            
        }
        footer>h1{
            font-size: .75em;
            font-weight: normal;
            width:49%;
            float:left;
            text-align:right;
            padding-right:.5em;
        }
        footer>p.mainTelephone{
            font-size: .75em;
            width:49%;
            float:left;
            text-align:left;
            padding-left:.5em;
        }
    </style>
</head>
<body class="login">

<!-- BEGIN LOGIN -->
<div class="content">
	<div class="bgSplit"></div>
    <h2 class="text-center">${fnc:getSite(1).title}</h2>
    <form id="loginForm" class="form-horizontal form-signin" action="${whlyPath }/login" method="post"
          novalidate="novalidate">
        <div id="messageBox" class="${empty message ? 'display-hide' : ''}" >
            <!--                     <button class="close" data-close="alert" class="close">×</button>
             --> <span id="loginError">${message}</span>
        </div>
        <div class="formGroup username">
            <label for="username" class="visible-ie8 visible-ie9">用户名:</label>
            <input class="placeholder-no-fix" type="text" required
                   autocomplete="off" id="username" name="username" value="${username}">
        </div>
        <div class="formGroup password">
            <label for="password" class="visible-ie8 visible-ie9">密&emsp;码:</label>
            <input class="placeholder-no-fix" type="password" required
                   autocomplete="off" id="password" name="password">
        </div>
         <c:if test="${isValidateCodeLogin}">
        <div class="formGroup ">
            <label class="col-sm-3 control-label mid " for="validateCode">验证码:</label>
            <sys:validateCode name="validateCode" imageCssStyle="font-weight:bold;width:45px;margin-bottom:0;" inputCssStyle="font-weight:bold;width:45px;margin-bottom:0;"/>
           <!--  <input type="text" id="validateCode" name="validateCode" maxlength="5" class="txt required"
                   style="font-weight:bold;width:45px;margin-bottom:0;" aria-required="true">
            <img src="" onclick="$('.validateCodeRefresh').click();"
                 class="mid validateCode" style="">
            <a href="javascript:"
               onclick="$('.validateCode').attr('src','/servlet/validateCodeServlet?'+new Date().getTime());"
               class="mid validateCodeRefresh" style="">看不清</a> -->
        </div>
        </c:if>
        <div class="formGroup">
            <div class="checkbox">
                <label class="rememberme check">
                    <input type="checkbox" id="rememberMe" name="rememberMe" title="下次不需要再登录" value="1">&nbsp;记住密码
                </label>
            </div>
        </div>
        <div class="formGroup submitBtn">
            <button type="submit" id="submitBtn" class="btn btn-primary green uppercase">登 录</button>
        </div>
    </form>
     <div class="telephone">
        <h4>办公联系电话</h4>
        <p>市服务业发展局：5889669
<!--
            <br>环翠服务业发展局：5803831
            <br>文登发改局：8452369
            <br>荣成发改局：7566508
            <br>乳山发改局：6653592
            <br>高区服务业管理处：5629029
            <br>经区服务业发展办：5983926
            <br>临港服务业发展办：5581796
            <br>南海新区经济发展局：8966959
-->
            环翠区：5803831；
            文登区：8452369；
            荣成区：7566508；
            乳山区：6653592；
            高区：5629029；
            经区：5983926；
            临港区：5581796；
            南海新区：8966959；

        </p>
    </div>
    <footer>
        <h1>山东渔翁信息技术股份有限公司</h1>
        <p class="mainTelephone">技术支持电话：<span>4006686188</span></p>
    </footer>
</div>

<script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<!--<script src="/static/whly/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
<script src="/static/whly/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/static/whly/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
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
		
		var message = $('#loginError').text();
		if(message) {
			setTimeout( 
				"$('#messageBox').show();"
			,300);
		}
		
	});
	// 如果在框架或在对话框中，则弹出提示并跳转到首页
	if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
		alert('未登录或登录超时。请重新登录，谢谢！');
		top.location = "${whlyPath}/choose";
    }
    
    
</script>
<script>
	function contentPosition() {
	    var window_h = window.innerHeight
	        || document.documentElement.clientHeight
	        || document.body.clientHeight;
	    var window_w = window.innerWidth
	        || document.documentElement.clientWidth
	        || document.body.clientWidth;
	    var $content = $(".content");
	
	//    根据窗口大小等比例缩放登录框
	    if(window_w>300){
	        $content.css("transform","scale("+window_w/1100+")");
	        if(window_w<500){
	            $content.css("transform-origin",window_w/12+"% 0");
	        }else{
	            $content.css("transform-origin","50% 0");
	        }
	    }
	
	    $("body").css({
	        "padding-top": window_h * 0.22
	    })
	}
	
	$(function () {
	    contentPosition();
	
	    $(window).resize(function () {
	        contentPosition();
	    });
	
	
	    document.onkeydown = function (e) {
	        var ev = document.all ? window.event : e;
	        if (ev.keyCode === 13) {
	            $("#loginForm").submit();//处理事件
	            //submitMethod();
	        }
	    }
	
    });
</script>
</body>
</html>
