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

h1 {
	margin: 2em 0 1.5em;
	text-shadow: 0.06em 0.06em 0.1em rgba(0, 0, 0, .6);
	font-size: 2.4em;
}

.chooseBox {
	position: relative;
	margin-bottom: 1em;
	line-height: 8em;
	font-weight: bold;
	background: linear-gradient(to right bottom, #fff 0%, #51d6ff 60%)
		no-repeat;
	text-align: center;
	font-size: 1.5em;
	box-shadow: .3em .3em .3em rgba(0, 0, 0, .5);
}

.chooseBox:hover {
	left: .1em;
	top: .1em;
}

.chooseBox.disable {
	cursor: not-allowed;
	background: linear-gradient(to right bottom,  #fff 0% , #ccc 60%) no-repeat;
 
}
.chooseBox.disable a{
	cursor: not-allowed;
}
.chooseBox.disable a:hover,
.chooseBox.disable a:link,
.chooseBox.disable a:active,
.chooseBox.disable a:visited{
	text-decoration: none;
	color:#337ab7
}


.disable:hover {
	left: .0;
	top: .0;
}

@media ( min-width : 1600px) {
	.container {
		width: 1480px;
	}
	body {
		font-size: 2.4em;
	}
}

.forbid {
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
</style>
</head>
<body>
<div class="container">
    <h1 class="text-center">威海市重点服务业企业监测平台入口</h1>
	    <c:forEach items="${companyEnum}" var="company" varStatus="status">
	    	<c:choose>
		       <c:when test="${status.index==0 ||status.index==2 }">
		       		<c:choose>
		       			<c:when test="${comPanyType==company.type }">
		       				<div class="col-md-4 col-md-offset-2" onclick="loginPage()">
					            <div class="chooseBox "><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
		       			</c:when>
			       		<c:otherwise>
			       			<div class="col-md-4 col-md-offset-2 forbid" >
					            <div class="chooseBox disable"><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
			       		</c:otherwise>
		       		</c:choose>
		       </c:when>
		       <c:otherwise>
		       		  <c:choose>
		       			<c:when test="${comPanyType==company.type }">
		       				<div class="col-md-4 " onclick="loginPage()">
					            <div class="chooseBox "><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
		       			</c:when>
			       		<c:otherwise>
			       			<div class="col-md-4 forbid" >
					            <div class="chooseBox disable"><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
			       		</c:otherwise>
		       		</c:choose>
		       </c:otherwise>
	    	</c:choose>
	    </c:forEach>
</div>
</body>
<script>
function loginPage(type){
	window.location.href="${whlyPath}/home";
}
</script>
</html>