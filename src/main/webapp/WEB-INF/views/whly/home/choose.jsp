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
  		<style>
  			html,body,ul,li,ol,dl,dd,dt,p,h1,h2,h3,h4,h5,h6,form,fieldset,legend,img{ margin:0; padding:0; }
			ul,ol,li{list-style:none;}
			a,u{text-decoration:none;}
			img{display:block;border:0;}
			i,em{font-style:normal;}
			b,strong{font-weight:100;}
			h1,h2,h3,h4,h5,h6{font-size:16px;font-weight:100;}
			.clearfix:after{content:".";clear:both;display:block;height:0;overflow:hidden;visibility: hidden;}
			html,body{
				height:100%;
				
			}
			
			body {
				background: url(/static/${whlyPage}/assets/global/img/choose/bg.png) no-repeat 100% 100%;
				background-size: 100% 100%;
				position: relative;
			}
			
			h1 {
				position: absolute;
				width:60%;
				height:7%;
				left: 0;right: 0;
				margin:9% auto;
			}
			h1 a {
				display: block;
				height: 100%;
				width: 100%;
			}
			h1 a img  {
				display: block;
				height: 100%;
				width: 100%;
			}
			
			
			.content {
				width:75%;
				height:35%;
				position: absolute;
				left: 0;right: 0;
				margin:20% auto;
				margin-bottom: 0;
			}
			.content .plate {
				float: left;
				width:19%;
				/*height:90%;*/
				margin-left:6.5%;
				cursor: pointer;
			}
			.content .disabled {
				cursor: not-allowed;
			}
			.content .ml0 {
				margin-left: 0;
			}
			.content .plate img {
				display: block;
				width:65%;
				height: 70%;
				margin:2% auto;
			}
			.content .plate p {
				color:#fff;
				font-size: 22px;
				text-align: center;
				width: 70%;
				margin:7% auto;
				letter-spacing: 3px;
			}
			  		
  		</style>
</head>
<body>
<!DOCTYPE html>
<html>
	<body id="demo1">
		<h1>
			<a href="##">
				<img src="/static/${whlyPage}/assets/global/img/choose/logo.png" alt="" />
			</a>
		</h1>
		
		<div class="content">
			<c:forEach items="${companyEnum}" var="company" varStatus="status">
				<div 
				<c:if test="${comPanyType==company.type }">onclick="loginPage()"</c:if>
				class="plate <c:if test="${status.index==0 }">ml0</c:if> 
				<c:if test="${comPanyType!=company.type }">disabled</c:if> ">
					<img src="/static/${whlyPage}/assets/global/img/choose/${company.rootId }.png" alt="" />
					<p>${company.name }</p>
				</div>
			</c:forEach>
		</div>
	</body>
</html>

<script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script>
/**
 * 已知图片的宽度和高度的等比例缩放
 */

 function knowImgSize(id) {
    var idWidth = $(id).width(),  // 容器的宽度和高度
        idHeight = $(id).height();

    $(id + ' img').each(function(index,img){
        var img_w = $(this).width(),
            img_h = $(this).height();

        // 如果图片自身宽度大于容器的宽度的话 那么高度等比例缩放
        if(img_w > idWidth) {
            
            var height = img_h * idWidth / img_w;
            $(this).css({"width":idWidth, "height":height});
        }
    });

 }

 // 初始化
 $(function(){
    knowImgSize("#demo1");
 });
    function loginPage(type){
		window.location.href="${whlyPath}/home";
	}
</script>
</body>
</html>