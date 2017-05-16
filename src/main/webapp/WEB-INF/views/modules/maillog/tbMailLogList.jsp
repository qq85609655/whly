<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>邮件日志管理</title>
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
		<li class="active"><a href="${ctx}/maillog/tbMailLog/">邮件日志列表</a></li>
		<%-- <shiro:hasPermission name="maillog:tbMailLog:edit"><li><a href="${ctx}/maillog/tbMailLog/form">邮件日志添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="tbMailLog" action="${ctx}/maillog/tbMailLog/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>邮件标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>邮件用途：</label>
				<form:select path="mailUse" class="input-medium">
					<form:option value="" label=""/>
					<form:option value="重置密码" label="重置密码"/>
					<form:option value="注册" label="注册"/>
					<form:option value="订阅" label="订阅"/>
					<%-- <form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/> --%>
				</form:select>
			</li>
			<li><label>发送时间：</label>
				<input name="beginCreated" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbMailLog.beginCreated}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreated" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbMailLog.endCreated}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>发送状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:option value="0" label="成功"/>
					<form:option value="1" label="失败"/>
<%-- 					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
 --%>				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>邮件标题</th>
				<th>发送内容</th>
				<th>邮件用途</th>
				<th>发送者</th>
				<th>接收人</th>
				<th>发送时间</th>
				<th>发送状态</th>
				<th>错误信息</th>
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbMailLog">
			<tr>
				<td><%-- <a href="${ctx}/maillog/tbMailLog/form?id=${tbMailLog.id}"> --%>
					${tbMailLog.title}
				<!-- </a> --></td>
				<td>
					${tbMailLog.content}
				</td>
				<td>
					${tbMailLog.mailUse}
				</td>
				<td>
					${tbMailLog.sendUser}
				</td>
				<td>
					${tbMailLog.toUser}
				</td>
				<td>
					<fmt:formatDate value="${tbMailLog.created}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<c:choose>
						<c:when test="${tbMailLog.status=='0' }">成功</c:when>
						<c:otherwise>失败</c:otherwise>
					</c:choose>
				</td>
				<td>
					<div title="${tbMailLog.errorMsg}" >${fn:substring(tbMailLog.errorMsg,0,20)}</div>
				</td>
				<!-- <td>
					<a href="javascript:void(0);">重新发送</a>
				</td> -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>