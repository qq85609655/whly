<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<style>
/****************************table*******************************/
.table .gradeX td {
	
}

.table .gradeX td:last-child a {
	color: #333;
	padding: 0;
	font-size: 12px;
}

/*************************pagination***********************/
.pagination {
	/*background:#d00;*/
	width: 100%;
}

.pagination  ul li {
	list-style: none;
	float: left;
	margin: 0 1%;
}

.pagination  ul li a {
	float: left;
	width: 100%;
	color: #333;
}

.pagination  ul li:first-child {
	margin-left: 15%;
}

.pagination  ul .active a {
	text-decoration: underline;
}

.pagination  ul .disabled a {
	color: #ccc;
}

.pagination  ul .controls {
	margin-left: 5%;
	margin-top: -.3%;
}

.pagination  ul .controls input {
	width: 2em;
	outline: none;
}

.pagination  ul .controls a {
	color: #333;
}

.pagination  ul .controls a:hover {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function() {
		//删除多余元素
		$("#sample_1_length").remove();
		$("#sample_1_filter").remove();
		$("#sample_1_info").remove();
		$("#sample_1_paginate").remove();
	
	});
</script>
</head>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white ">
	<div class="bootbox modal fade bootbox-alert in" tabindex="-1"
		role="dialog" style="display: none; padding-right: 16px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="bootbox-close-button close"
						data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
					<div class="bootbox-body">Hello world!</div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="ok" type="button" class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>
	<!-- BEGIN 顶部菜单  -->
	<%@ include file="../include/topmenu.jsp"%>
	<!-- END 顶部菜单  -->
	<!-- 不能删除下面一行 否则手机端样式错乱 -->
	<div class="clearfix"></div>
	<!-- 内容 -->
	<div class="page-container " id="main">
		<!-- modal-backdrop fade in -->
		<!-- BEGIN 左侧部分 -->
		<%@ include file="../include/leftmenu.jsp"%>
		<!-- END 左侧部分 -->

		<!-- BEGIN 右侧内容 -->
		<div class="page-content-wrapper ">
			<div class="page-content">
				<!-- page 菜单-->
				<%@ include file="../include/topBar.jsp"%>
				<!-- 主体部分START-->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-dark">
									<i class="icon-settings font-dark"></i> <span
										class="caption-subject bold uppercase"> 上报历史列表-<span style="color:red">${front.companyName }(${front.year }/${front.month })</span></span>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-bordered table-hover"
									id="sample_1">
									<thead>
										<tr role="row">
											<th>状态</th>
											<th>操作人</th>
											<th>操作时间</th>
											<th>营业收入 (万元)</th>
											<th>营业利润 (万元)</th>
											<th>企业税费 (万元)</th>
											<!-- <th>营业成本 (万元)</th>
											<th>应付职工薪酬 (万元)</th>
											<th>贷款金额 (万元)</th>
											<th>订单数量 (个)</th> -->
											<th>从业人数(人)</th>
											<th>所属行业</th>
											<th>所属地域</th>
											<th>反馈内容</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page}" var="frontCompanyReportHistory">
											<tr class="gradeX odd" role="row">
											<c:choose>
												<c:when test="${frontCompanyReportHistory.status=='SUBMIT'}">
													<td>已提交</td>
												</c:when>
												<c:when test="${frontCompanyReportHistory.status=='PASSED'}">
													<td>已审核</td>
												</c:when>
												<c:otherwise>   
												   <td>未通过</td>
												</c:otherwise> 
											</c:choose>
												<td>${frontCompanyReportHistory.operator}</td>
												<td>${frontCompanyReportHistory.updateTime}</td>
												<td>${frontCompanyReportHistory.totalIncome}</td>
												<td>${frontCompanyReportHistory.totalProfit}</td>
												<td>${frontCompanyReportHistory.totalTax}</td>
												<%-- <td>${frontCompanyReportHistory.operatingCosts}</td>
												<td>${frontCompanyReportHistory.employeeCompensation}</td>
												<td>${frontCompanyReportHistory.loanAmount}</td>
												<td>${frontCompanyReportHistory.orderQuantity}</td> --%>
												<td>${frontCompanyReportHistory.empQuantity}</td>
												<td>${frontCompanyReportHistory.description}</td>
												<td>${frontCompanyReportHistory.areaName}</td>
												<td>${frontCompanyReportHistory.reason}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>

			<!-- 主体部分END-->

			<div class="clearfix"></div>
		</div>
	</div>
	</div>

	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<!-- <%@ include file="../include/footer.jsp"%> -->
	<!-- js必须引用在body前面 -->
</body>
</html>
