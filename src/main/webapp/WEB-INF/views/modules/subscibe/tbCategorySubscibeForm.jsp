<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人订阅历史</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	function GetRequest() {
	    var url = location.search; //获取url中"?"符后的字串
	    var theRequest = new Object ();
	    if (url.indexOf("?") != -1) {
	        var str;
	        if(url.split("?")>2){
	            str=url.substr(1).split("?")[1];
	        }else{
	            str=url.substr(1).split("?")[0];
	        }
	        strs = str.split("&");
	        for(var i = 0; i < strs.length; i ++) {
	            theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);
	        }
	    }
	    
	    return theRequest;
	}
	var Request=GetRequest();
	var userId = Request["userId"];
	
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#usId").val(userId);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class=""><a href="${ctx}/subscibe/tbCategorySubscibe/">订阅日志列表</a></li>
		<li class="active"><a href="#">个人订阅历史</a></li>
	</ul>
		<form:form id="searchForm" modelAttribute="tbCategorySubscibe" action="${ctx}/subscibe/tbCategorySubscibe/form" method="post" class="breadcrumb form-search">
	     <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		 <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		 <input id="usId" name="userId" type="hidden" value=""/>
	    </form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户名</th>
				<th>定制内容</th>
				<th>定制日期</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbCategorySubscibe">
			<tr>
				<td>
					${tbCategorySubscibe.nickName}
				</td>
				<td>
					${tbCategorySubscibe.categery}
				</td>
				<td>
					<fmt:formatDate value="${tbCategorySubscibe.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>