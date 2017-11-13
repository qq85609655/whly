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
		.content{
		            overflow: hidden;
		
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
            left: 0;
            top: 0;
        }

        @media ( min-width : 1600px) {
            .container {
                width: 1480px;
            }
            body {
                font-size: 2.4em;
            }
        }


    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <h1 class="text-center">${fnc:getSite(1).title}入口</h1>
         <c:forEach items="${companyEnum}" var="company" varStatus="status">
	    	<c:choose>
		       <c:when test="${status.index==0 ||status.index==2 }">
		       		<c:choose>
		       			<c:when test="${comPanyType==company.type }">
		       				<div class="col-md-5 col-md-offset-1" onclick="loginPage()">
					            <div class="chooseBox "><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
		       			</c:when>
			       		<c:otherwise>
			       			<div class="col-md-5 col-md-offset-1 forbid" >
					            <div class="chooseBox disable"><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
			       		</c:otherwise>
		       		</c:choose>
		       </c:when>
		       <c:otherwise>
		       		  <c:choose>
		       			<c:when test="${comPanyType==company.type }">
		       				<div class="col-md-5 " onclick="loginPage()">
					            <div class="chooseBox "><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
		       			</c:when>
			       		<c:otherwise>
			       			<div class="col-md-5 forbid" >
					            <div class="chooseBox disable"><a href="javascript:void(0);">${company.name }</a></div>
					        </div>
			       		</c:otherwise>
		       		</c:choose>
		       </c:otherwise>
	    	</c:choose>
	    </c:forEach>
       <!--  <div class="row">
            <div class="col-md-5 col-md-offset-1">
                <div class="chooseBox"><a href="#">重点服务业企业监测</a></div>
            </div>
            <div class="col-md-5">
                <div class="chooseBox"><a href="#">限额以下服务业企业监测板块</a></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 col-md-offset-1">
                <div class="chooseBox disable"><a href="#">年度扶持项目监测</a></div>
            </div>
            <div class="col-md-5">
                <div class="chooseBox "><a href="#">其它</a></div>
            </div>
        </div> -->
    </div>
</div>
<script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
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
    });
    function loginPage(type){
		window.location.href="${whlyPath}/home";
	}
</script>
</body>
</html>