<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻公告管理</title>
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
		<li class="active"><a href="${ctx}/frontnotification/frontNotification/">新闻公告列表</a></li>
		<li><a href="${ctx}/frontnotification/frontNotification/form">新闻公告发布</a></li>
		<%-- <shiro:hasPermission name="frontnotification:frontNotification:edit"><li><a href="${ctx}/frontnotification/frontNotification/form">新闻公告添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="frontNotification" action="${ctx}/frontnotification/frontNotification/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>发布类型：</label>
				<form:select path="categoryType" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('front_pr')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>发布者：</label>
				<form:input path="createName" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${frontNotification.createDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="width:65px;">发布类型</th>
				<th style="width:300px;">标题</th>
				<th>关键字</th>
				<th>摘要</th>
				<th style="width:50px;">点击数</th>
				<th style="width:70px;">发布者</th>
				<th style="width:70px;">备注信息</th>
				<th style="width:70px;">创建时间</th>
				<th style="width:70px;">操作</th>
				<%-- <shiro:hasPermission name="frontnotification:frontNotification:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="frontNotification">
			<tr>
				<td>
					${fns:getDictLabel(frontNotification.categoryType, 'front_pr', '')}
				</td>
				<td>
					${frontNotification.title}
				</td>
				<td>
					${frontNotification.keywords}
				</td>
				<td>
					${frontNotification.description}
				</td>
				<td>
					${frontNotification.hits}
				</td>
				<td>
					${frontNotification.createName}
				</td>
				<td>
					${frontNotification.remarks}
				</td>
				<td>
					<fmt:formatDate value="${frontNotification.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
    				<a href="${ctx}/frontnotification/frontNotification/form?id=${frontNotification.id}">修改</a>
					<a href="${ctx}/frontnotification/frontNotification/delete?id=${frontNotification.id}" onclick="return confirmx('确认要删除该新闻公告吗？', this.href)">删除</a>
				</td>
				<%-- <shiro:hasPermission name="frontnotification:frontNotification:edit"><td>
    				<a href="${ctx}/frontnotification/frontNotification/form?id=${frontNotification.id}">修改</a>
					<a href="${ctx}/frontnotification/frontNotification/delete?id=${frontNotification.id}" onclick="return confirmx('确认要删除该新闻公告吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>