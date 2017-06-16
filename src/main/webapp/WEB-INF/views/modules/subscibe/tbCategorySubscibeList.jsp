<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订阅日志管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/subscibe/tbCategorySubscibe/">订阅日志列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tbCategorySubscibe" action="${ctx}/subscibe/tbCategorySubscibe/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label style="width:83px;">用户名/邮箱：</label>
				<form:input path="categery" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>定制日期：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbCategorySubscibe.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbCategorySubscibe.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户名</th>
				<th>邮箱</th>
				<th>定制内容</th>
				<th>定制日期</th>
				<%-- <shiro:hasPermission name="subscibe:tbCategorySubscibe:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbCategorySubscibe">
			<tr>
				<td>
					<a href="${ctx}/subscibe/tbCategorySubscibe/form?userId=${tbCategorySubscibe.userId}">${tbCategorySubscibe.nickName}</a>
				</td>
				<td>
					${tbCategorySubscibe.email}
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