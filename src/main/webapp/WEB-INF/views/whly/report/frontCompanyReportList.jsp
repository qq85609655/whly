<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>企业上报管理</title>
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
		<li class="active"><a href="${ctx}/report/frontCompanyReport/">企业上报列表</a></li>
		<shiro:hasPermission name="report:frontCompanyReport:edit"><li><a href="${ctx}/report/frontCompanyReport/form">企业上报添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="frontCompanyReport" action="${ctx}/report/frontCompanyReport/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>年：</label>
				<input name="year" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${frontCompanyReport.year}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>月：</label>
				<input name="month" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${frontCompanyReport.month}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>上报时间 year+month：</label>
				<input name="reportTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${frontCompanyReport.reportTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<%-- <li><label>上报企业：</label>
				<sys:treeselect id="companyId" name="companyId" value="${frontCompanyReport.companyId}" labelName="" labelValue="${frontCompanyReport.}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li> --%>
			<li><label>地区：</label>
				<sys:treeselect id="area" name="area.id" value="${frontCompanyReport.area.id}" labelName="area.name" labelValue="${frontCompanyReport.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>利润总额（万）：</label>
				<form:input path="totalProfit" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>插入时间：</label>
				<input name="beginInsertTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${frontCompanyReport.beginInsertTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endInsertTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${frontCompanyReport.endInsertTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
		<%-- 	<li><label>状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>年</th>
				<th>月</th>
				<th>上报时间 year+month</th>
				<th>上报企业</th>
				<th>行业类型</th>
				<th>地区</th>
				<th>从业人员（人）</th>
				<th>营业总额（万）</th>
				<th>利润总额（万）</th>
				<th>税收总额（万）</th>
				<th>插入时间</th>
				<th>更新时间</th>
				<th>操作人</th>
				<th>状态 未提交-UNSUBMIT 已提交-SUBMIT            审核通过-PASSED 未通过-UNPASSED</th>
				<th>原因</th>
				<th>备注</th>
				<th>废弃</th>
				<shiro:hasPermission name="report:frontCompanyReport:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="frontCompanyReport">
			<tr>
				<td><a href="${ctx}/report/frontCompanyReport/form?id=${frontCompanyReport.id}">
					${frontCompanyReport.year}
				</a></td>
				<td>
					${frontCompanyReport.month}
				</td>
				<td>
					<fmt:formatDate value="${frontCompanyReport.reportTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				</td>
				<td>
					${fns:getDictLabel(frontCompanyReport.typeId, 'front_hylx', '')}
				</td>
				<td>
					${frontCompanyReport.area.name}
				</td>
				<td>
					${frontCompanyReport.empQuantity}
				</td>
				<td>
					${frontCompanyReport.totalIncome}
				</td>
				<td>
					${frontCompanyReport.totalProfit}
				</td>
				<td>
					${frontCompanyReport.totalTax}
				</td>
				<td>
					<fmt:formatDate value="${frontCompanyReport.insertTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${frontCompanyReport.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${frontCompanyReport.operator}
				</td>
				<td>
				<%-- 	${fns:getDictLabel(frontCompanyReport.status, '', '')} --%>
				</td>
				<td>
					${frontCompanyReport.reason}
				</td>
				<td>
					${frontCompanyReport.remarks}
				</td>
				<td>
					<fmt:formatDate value="${frontCompanyReport.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="report:frontCompanyReport:edit"><td>
    				<a href="${ctx}/report/frontCompanyReport/form?id=${frontCompanyReport.id}">修改</a>
					<a href="${ctx}/report/frontCompanyReport/delete?id=${frontCompanyReport.id}" onclick="return confirmx('确认要删除该企业上报吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>