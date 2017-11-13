<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.thinkgem.jeesite.modules.sys.security.WhlyFormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
        <title>${fnc:getSite(1).title}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
     <link href="/static/${whlyPage}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style>
* {
	font-family: 微软雅黑, sans-serif;
}

.display-hide, .display-none {
	display: none;
}

html, body {
	height: 100%;
	color: #fff;
	/* background: linear-gradient(to bottom, rgba(13, 141, 171, 0.94), #50a7df)
		!important; */
     background: linear-gradient(to bottom, rgba(6, 143, 202, 0.94), #95d0f7) !important;
}

div.content {
	margin-top: 2em;
	padding: 1em;
	background-image:
		url("/static/whly/assets/global/img/login/bg_login.png");
	background-size: 100% 100%;
	border-radius: 1em;
	box-shadow: 0.2em 0.2em 1em 0.3em rgba(0, 0, 0, .5);
}

h2 {
	margin-bottom: 1.2em;
	font-size: 1.6em;
	text-shadow: 0.1em 0.1em 0.1em rgba(0, 0, 0, .6)
}

div#messageBox {
	padding: .4em 1em;
	margin-bottom: 2em;
}

.validateCode a {
	color: #fff;
}

.form-group {
	margin-bottom: .8em;
}
label.col-sm-3{
	position: relative;
    left: 1em;
}
input[type="text"],
input[type="password"] {
	height: 1.6em;
	border-radius: 0;
}

input[type="checkbox"] {
	margin-left: -2em;
	padding-top: .1em;
	width: 1.2em;
	height: 1em;
	/*padding-right: 5em;*/
}

#submitBtn {
	background: linear-gradient(to bottom, #3dc2ff 0%, #159ee9 50%, #1b44c1 90%, #1485c6
		100%);
}

@media ( min-width : 1600px) {
	.container {
		/*width: 1480px;*/
	}
	body {
		/*font-size: 2.4em;*/
	}
	label.rememberme{
		padding-left: 1.9em;
	}
}
label{
    font-weight: 400;
}
label.col-sm-3.control-label{
	left:1.45em;
	font-size:1em;
	padding-top: .2em;
}
label.rememberme{
	font-size:0.9em;
    padding-left: 1.8em;
}
</style>
</head>
<script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
 <script src="/static/${whlyPage}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
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

<!-- BEGIN LOGIN -->
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
            <div class="content">
                <h2 class="text-center">${fnc:getSite(1).title}</h2>
                <form id="loginForm" class="form-horizontal form-signin" action="/front/login" method="post" >
                      <div  id="messageBox" class="alert alert-danger ${empty message ? 'display-hide' : ''}">
<!--                     <button class="close" data-close="alert" class="close">×</button>
 -->                    <span id="loginError">${message}</span>
                </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label visible-ie8 visible-ie9">用户名:</label>
                        <div class="col-sm-7">
                            <input class="form-control form-control-solid placeholder-no-fix" type="text"
                                   autocomplete="off" id="username" name="username"  value="${username}">


                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: .5em;">
                        <label for="password" class="col-sm-3 control-label visible-ie8 visible-ie9 col-md-3">密 码:</label>
                        <div class="col-sm-7">
                            <input class="form-control form-control-solid placeholder-no-fix" type="password"
                                   autocomplete="off" id="password" name="password">

                        </div>
                    </div>
                      <c:if test="${isValidateCodeLogin}"><div class="validateCode">
                      <div class="form-group">
			<label class="col-sm-3 control-label input-label mid" for="validateCode">验证码:</label>
			<div class="col-sm-8">
			<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;color:#000; width:3em"/>
			</div>
		</div>
		</div></c:if>
                    <div class="form-group" style="margin-bottom: .5em;">
                        <div class="col-sm-offset-1 col-sm-9">
                            <div class="checkbox">
                                <label class="rememberme check">
                                    <input type="checkbox" id="rememberMe" name="rememberMe" title="下次不需要再登录" value="1">&nbsp;记住密码
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-7 pull-center">
                            <button type="submit" id="submitBtn" class="btn btn-primary green uppercase ">登 录</button>
                        </div>
                    </div>
                </form>
            </div>


        </div>
    </div>
</div>
<!--<script src="/static/whly/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
<!--<script src="/static/whly/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>-->
<!--<script src="/static/whly/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>-->

<script>
    function contentPosition() {
        var window_h=window.innerHeight
            || document.documentElement.clientHeight
            || document.body.clientHeight;
        var $content = $(".content");
        var content_h = $content.height();
        $content.css("margin-top",(window_h-content_h)/3);
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