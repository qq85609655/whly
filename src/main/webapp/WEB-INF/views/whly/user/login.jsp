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
            /*background: linear-gradient(to bottom, #0168B3, #6EBBFF) !important;*/
            /*padding-top: 3em;*/
        }
        body{
            font-size: 110%;
            padding-top: 6em;
            background: url("/static/${whlyPage}/assets/global/img/login/bg.png") no-repeat;
            background-size: 100% 100%;
        }
        div.content {
            transform-origin: 50% 0;
            width: 24em;
            /*height: 14em;*/
            margin: 0 auto;
            padding: 1.5em 0 1em;
            background-image: url("/static/${whlyPage}/assets/global/img/login/bg_login.png");
            background-size: 100% 100%;
            border-radius: .6em;
            /*box-shadow: 0.2em 0.2em 1em 0.3em rgba(0, 0, 0, .5);*/
        }

        h2 {
            margin-bottom: 1.8em;
            text-align: center;
            /*font-weight: normal;*/
            font-size: 1.4em;
            letter-spacing: .04em;
            font-family: 华文宋体 宋体, serif;
            color: rgba(255, 255, 255, .88);
            text-shadow: 0.1em 0.1em 0.1em rgba(0, 0, 0, .3)
        }

        .formGroup {
            margin-left: 4.6em;
            margin-bottom: .6em;
        }
        .formGroup.submitBtn{
            margin-bottom: 0;
        }
        div#messageBox {
            position: absolute;
            top: -2.2em;
            width: 94%;
            left: 3%;
            padding: .3em 1em;
            margin-bottom: 1em;
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
		.display-hide {
			display:none;
		}
        .validateCode a {
            color: #fff;
        }

        label,a {
            font-size: .76em;
            letter-spacing: .2em;
        }

        .username>input,
        .password>input {
            width: 9.8em;
        }

        input[type="checkbox"] {
            width: 1em;
            height: 1em;
            position: relative;
            top: .2em;
        }

        #submitBtn {
            /*background: linear-gradient(to bottom, #3dc2ff 0%, #159ee9 50%, #1b44c1 90%, #1485c6 100%);*/
            margin-left: 6em;
            margin-top: 1em;
            width: 5em;
            height: 2.5em;
            background: url(/static/${whlyPage}/assets/global/img/login/loginBtn.png);
            background-size: 100% 100%;
            border: none;
            color: white;

        }

        @media ( min-width: 1600px) {
            .container {
                /*width: 1480px;*/
            }

            body {
                /*font-size: 2.4em;*/
            }
        }
    </style>
</head>
<body class="login">

<!-- BEGIN LOGIN -->
<div class="content">
    <h2 class="text-center">${fnc:getSite(1).title}</h2>
    <form id="loginForm" class="form-horizontal form-signin" action="${whlyPath }/login" method="post"
          novalidate="novalidate">
        <div id="messageBox" class="${empty message ? 'display-hide' : ''}">
            <!--                     <button class="close" data-close="alert" class="close">×</button>
             --> <span id="loginError">用户或密码错误, 请重试！</span>
        </div>
        <div class="formGroup username">
            <label for="username" class="visible-ie8 visible-ie9">用户名:</label>
            <input class="placeholder-no-fix" type="text"
                   autocomplete="off" id="username" name="username" value="${username}">
        </div>
        <div class="formGroup password">
            <label for="password" class="visible-ie8 visible-ie9">密&emsp;码:</label>
            <input class="placeholder-no-fix" type="password"
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
        if(window_w>800){
            $content.css("transform","scale("+window_w/1200+")");
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