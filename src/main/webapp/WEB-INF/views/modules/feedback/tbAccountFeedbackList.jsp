<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>反馈记录管理</title>
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
		<li class="active"><a href="${ctx}/feedback/tbAccountFeedback/">反馈记录列表</a></li>
		<%-- <shiro:hasPermission name="feedback:tbAccountFeedback:edit"><li><a href="${ctx}/feedback/tbAccountFeedback/form">反馈记录添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="tbAccountFeedback" action="${ctx}/feedback/tbAccountFeedback/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>反馈时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAccountFeedback.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAccountFeedback.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>处理状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:option value="0" label="已处理"/>
					<form:option value="1" label="未处理"/>
				</form:select>
			</li>
			<li><label>处理人信息：</label>
				<form:input path="dealUser" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>反馈人</th>
				<th>反馈人邮箱</th>
				<th>反馈内容</th>
				<th>反馈时间</th>
				<th>处理状态</th>
				<th>处理人</th>
				<th>处理时间</th>
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbAccountFeedback">
			<tr>
				<td>
					${tbAccountFeedback.nickName}
				</td>
				<td>
					${tbAccountFeedback.email}
				</td>
				<td>
					${tbAccountFeedback.content}
				</td>
				<td>
					<fmt:formatDate value="${tbAccountFeedback.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<c:choose>
						<c:when test="${tbAccountFeedback.status=='0' }">已处理</c:when>
						<c:otherwise>未处理</c:otherwise>
					</c:choose>
				</td>
				<td>
					${tbAccountFeedback.dealUser}
				</td>
				<td>
					<fmt:formatDate value="${tbAccountFeedback.dealDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			<!-- 	<td>
				 	<a href="javascript:void(0);">重新发送</a>
    			</td> -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>