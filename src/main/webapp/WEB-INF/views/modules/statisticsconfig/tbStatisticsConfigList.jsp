<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻数量配置管理</title>
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
		<li class="active"><a href="${ctx}/statisticsconfig/tbStatisticsConfig/">新闻数量配置列表</a></li>
		<shiro:hasPermission name="statisticsconfig:tbStatisticsConfig:edit"><li><a href="${ctx}/statisticsconfig/tbStatisticsConfig/form">新闻数量配置添加</a></li></shiro:hasPermission>
	</ul>
	<%-- <form:form id="searchForm" modelAttribute="tbStatisticsConfig" action="${ctx}/statisticsconfig/tbStatisticsConfig/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>二级分类：</label>
				<form:select path="category" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('news_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form> --%>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<!-- <th>id</th> -->
				<th>二级分类</th>
				<th>倍数（实际数量*倍数）</th>
				<th>随机累计范围</th>
				<shiro:hasPermission name="statisticsconfig:tbStatisticsConfig:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbStatisticsConfig">
			<tr>
				<%-- <td><a href="${ctx}/statisticsconfig/tbStatisticsConfig/form?id=${tbStatisticsConfig.id}">
					${tbStatisticsConfig.id}
				</a></td> --%>
				<td><a href="${ctx}/statisticsconfig/tbStatisticsConfig/form?id=${tbStatisticsConfig.id}">
					${tbStatisticsConfig.category}
				</a></td>
				<td>
					${tbStatisticsConfig.multiple}
				</td>
				<td>
					${tbStatisticsConfig.accumulate}
				</td>
				<shiro:hasPermission name="statisticsconfig:tbStatisticsConfig:edit"><td>
    				<a href="${ctx}/statisticsconfig/tbStatisticsConfig/form?id=${tbStatisticsConfig.id}">修改</a>
					<a href="${ctx}/statisticsconfig/tbStatisticsConfig/delete?id=${tbStatisticsConfig.id}" onclick="return confirmx('确认要删除该新闻数量配置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>