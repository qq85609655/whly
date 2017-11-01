<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.thinkgem.jeesite.modules.sys.security.WhlyFormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${fnc:getSite(1).title}</title>
    <link href="/static/${whlyPage}/assets/global/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style>
        * {
            font-family: 微软雅黑, sans-serif;
        }
        html, body {
            height: 100%;
            color: #fff;
            background: linear-gradient(to bottom, lightblue, deepskyblue) no-repeat;
        }
        h1{
            margin: 2em 0 1.5em;
            text-shadow: 0.06em 0.06em 0.1em rgba(0,0,0,.6);
            font-size: 2.4em;
        }
        .chooseBox {
            position: relative;
            margin-bottom: 1em;
            line-height: 8em;
            font-weight: bold;
            background: linear-gradient(to right bottom,  #fff 0% , #51d6ff 60%) no-repeat;;
            text-align: center;
            font-size: 1.5em;
            box-shadow: .3em .3em .3em rgba(0,0,0,.5);
        }
        .chooseBox:hover{
            left:.1em;
            top:.1em;
        }
        @media (min-width: 1600px){
            .container {
                width: 1480px;
            }
            body{
                font-size: 2.4em;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">威海市重点服务业企业监测平台入口</h1>
    <div class="row">
        <div class="col-md-4 col-md-offset-2" onclick="loginPage(1)">
            <div class="chooseBox"><a href="#">重点服务业企业监测</a></div>
        </div>
        <div class="col-md-4"  onclick="loginPage(2)">
            <%-- <div class="chooseBox"><a href="${whlyPath}/industry/login">限额以下服务业企业监测</a></div> --%>
            <div class="chooseBox"><a href="#">限额以下服务业企业监测</a></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-2">
            <div class="chooseBox"><a href="#">年度扶持项目监测</a></div>
        </div>
        <div class="col-md-4">
            <div class="chooseBox"><a href="#">其它</a></div>
        </div>
    </div>
</div>
</body>
<script>
function loginPage(type){
	window.location.href="${whlyPath}/login?type="+type;
}
</script>
</html>