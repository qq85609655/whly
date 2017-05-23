<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微博配置管理</title>
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
		<li class="active"><a href="${ctx}/blogger/blogger/tbBlogger/">微博配置列表</a></li>
		<shiro:hasPermission name="blogger:blogger:tbBlogger:edit"><li><a href="${ctx}/blogger/blogger/tbBlogger/form">微博配置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbBlogger" action="${ctx}/blogger/blogger/tbBlogger/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>微博地址</th>
				<th>标题</th>
				<th>简介</th>
				<th>专题分类</th>
				<th>头像</th>
				<shiro:hasPermission name="blogger:blogger:tbBlogger:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbBlogger">
			<tr>
				<td><a href="${ctx}/blogger/blogger/tbBlogger/form?id=${tbBlogger.id}">
					${tbBlogger.name}
				</a></td>
				<td>
					<a href="${tbBlogger.url}" target="_blank">${tbBlogger.url}</a>
				</td>
				<td>
					${tbBlogger.title}
				</td>
				<td>
					${tbBlogger.desc}
				</td>
				<td>
					${fns:getDictLabel(tbBlogger.type, 'topic_type', '')}
				</td>
				<td>
						<img style="width:120px;height:120px" src="${tbBlogger.img}">
				</td>
				<shiro:hasPermission name="blogger:blogger:tbBlogger:edit"><td>
    				<a href="${ctx}/blogger/blogger/tbBlogger/form?id=${tbBlogger.id}">修改</a>
					<a href="${ctx}/blogger/blogger/tbBlogger/delete?id=${tbBlogger.id}" onclick="return confirmx('确认要删除该微博配置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>