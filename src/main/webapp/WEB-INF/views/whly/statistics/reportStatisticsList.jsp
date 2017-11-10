<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>查询统计数据管理</title>
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
		<li class="active"><a href="${ctx}/reportstatistics/reportStatistics/">查询统计数据列表</a></li>
		<shiro:hasPermission name="reportstatistics:reportStatistics:edit"><li><a href="${ctx}/reportstatistics/reportStatistics/form">查询统计数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="reportStatistics" action="${ctx}/reportstatistics/reportStatistics/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>企业上报主键：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>年：</label>
				<form:input path="year" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>月：</label>
				<form:input path="month" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>上报时间 year+month：</label>
				<input name="yearMonth" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${reportStatistics.yearMonth}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>营业总额（万）：</label>
				<form:input path="totalIncome" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>利润总额（万）：</label>
				<form:input path="totalProfit" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>税收总额（万）：</label>
				<form:input path="totalTax" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>从业人员（人）：</label>
				<form:input path="empQuantity" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>应付职工薪酬 （万）：</label>
				<form:input path="employeeCompensation" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>贷款金额 （万）：</label>
				<form:input path="loanAmount" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>订单数量 （个）：</label>
				<form:input path="orderQuantity" htmlEscape="false" maxlength="12" class="input-medium"/>
			</li>
			<li><label>营业成本（万元）：</label>
				<form:input path="operatingCosts" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED：</label>
				<form:input path="status" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>企业编号：</label>
				<form:input path="companyId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>企业名称：</label>
				<form:input path="companyName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>地区编号：</label>
				<sys:treeselect id="area" name="area.id" value="${reportStatistics.area.id}" labelName="area.name" labelValue="${reportStatistics.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>地区名称：</label>
				<form:input path="areaName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>行业编号：</label>
				<form:input path="typeId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>行业标签名：</label>
				<form:input path="typeName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<shiro:hasPermission name="reportstatistics:reportStatistics:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="reportStatistics">
			<tr>
				<shiro:hasPermission name="reportstatistics:reportStatistics:edit"><td>
    				<a href="${ctx}/reportstatistics/reportStatistics/form?id=${reportStatistics.id}">修改</a>
					<a href="${ctx}/reportstatistics/reportStatistics/delete?id=${reportStatistics.id}" onclick="return confirmx('确认要删除该查询统计数据吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>