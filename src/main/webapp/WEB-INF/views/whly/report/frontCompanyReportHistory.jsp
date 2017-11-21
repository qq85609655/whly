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
.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width:111px;
	/* display:block; */
}
</style>
<script type="text/javascript">
	$(function() {
		//删除多余元素
		$("#sample_1_length").remove();
		$("#sample_1_filter").remove();
		$("#sample_1_info").remove();
		$("#sample_1_paginate").remove();
		// 根据当前登录用户企业所属类型 来页面展示的内容
		contentShow();
		
		//设置表格宽度
		style();
	});
	
	function style() {
		$(".table-striped").css("tableLayout","fixed");
		$(".table-striped .width_1").css("width","60px");
		$(".table-striped .width_2").css("width","120px");
		$(".table-striped .width_3").css("width","150px");
		$(".table-striped .width_9").css("width","80px");
	}
	
	// 根据当前登录用户企业所属类型 来页面展示的内容
	function contentShow() {
		var type = $('#companyParentType').val();
		if(type == "1") {
			$('.type_emphasis').show();
		} else if(type == "2") {
			$('.type_quota').show();
		} else if(type == "3") {
			$('.type_support').show();
		}
	}
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
						<input type="hidden" value="${companyParentType}" id="companyParentType">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-dark">
									<i class="icon-settings font-dark"></i> <span
										class="caption-subject bold uppercase"> 上报历史列表-<span style="color:red">${front.companyName }(${front.year }/${front.month })</span></span>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-bordered table-hover" style="table-layout: fixed;"
									id="sample_1">
									<thead>
										<tr role="row">
											<th class="width_1">状态</th>
											<th class="width_2">操作人</th>
											<th class="width_2">操作时间</th>
											<th class="type_emphasis type_quota width_2" style="display:none;">营业收入 (万元)</th>
											<th class="type_emphasis type_quota width_2" style="display:none;">营业利润 (万元)</th>
											<th class="type_emphasis width_2" style="display:none;">企业税费 (万元)</th>
											<th class="type_emphasis type_quota width_2" style="display:none;">营业成本 (万元)</th>
											<th class="type_emphasis width_2" style="display:none;">应付职工薪酬 (万元)</th>
											<th class="type_emphasis width_2" style="display:none;">贷款金额 (万元)</th>
											<th class="type_emphasis width_2" style="display:none;">订单数量 (个)</th>
											<th class="type_emphasis type_quota width_2" style="display:none;">从业人数(人)</th>
											<th class="type_support width_2" style="display:none;">项目名称</th>
											<th class="type_support width_2" style="display: none;">建设地点</th>
											<th class="type_support width_3" style="display: none;">项目主要内容</th>
											<th class="type_support width_3" style="display: none;">项目预期结果</th>
											<th class="type_support width_2" style="display:none;">总投资金额 (万元)</th>
											<th class="type_support width_2" style="display:none;">贷款金额 (万元)</th>
											<th class="type_support width_3" style="display:none;">起止年限</th>
											<th class="width_2">所属行业</th>
											<th class="width_1">所属地域</th>
											<th class="width_2">反馈内容</th>
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
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReportHistory.totalIncome}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReportHistory.totalProfit}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReportHistory.totalTax}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReportHistory.operatingCosts}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReportHistory.employeeCompensation}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReportHistory.loanAmount}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReportHistory.orderQuantity}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReportHistory.empQuantity}</td>
												<td class="type_support" style="display:none;">${frontCompanyReportHistory.projectName}</td>
												<td class="type_support" style="display: none;">${frontCompanyReportHistory.address}</td>
												<td class="type_support ellipsis"
													title="${frontCompanyReportHistory.projectContent}"
													style="display: none;">${frontCompanyReportHistory.projectContent}</td>
												<td class="type_support ellipsis"
													title="${frontCompanyReportHistory.projectDesiredEffect}"
													style="display: none;">${frontCompanyReportHistory.projectDesiredEffect}</td>
												<td class="type_support" style="display:none;">${frontCompanyReportHistory.totalInvestment}</td>
												<td class="type_support" style="display:none;">${frontCompanyReportHistory.bankLoanAmount}</td>
												<td class="type_support" style="display:none;">${frontCompanyReportHistory.yearLimit}</td>
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
