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
.btn.green:not(.btn-outline) {
	background:#84d3da;
	border:0;
}


.control-label {
    margin-top: 1px;
    font-weight: 400;
    text-align: right;
    padding: 6px 0px;
}

</style>
<script type="text/javascript">
			$(function() {
				//重置按钮
				$("#reset").click(resetFrom);
				//导出按钮
				$("#export").click(Export);
				//删除多余元素
				$("#sample_1_length").remove();
				$("#sample_1_filter").remove();
				$("#sample_1_info").remove();
				$("#sample_1_paginate").remove();
				//时间检索条件 X 按钮
				$("#clearDate").click(clearDate);
				// 根据当前登录用户企业所属类型 来页面展示的内容
				contentShow();
				
			});
			
			//清空时间
			function clearDate() {
				$('#timeQuery').attr('value','');
			}
			
			// 根据当前登录用户企业所属类型 来页面展示的内容
			function contentShow() {
				var type = $('#companyParentType').val();
				if(type == "1") {
					$('.type_emphasis').show();
				} else if(type == "2") {
					$('.type_quota').show();
				}
			}
			
			//取消button-loading状态
			function loadingCancel(id) {
				 $('#'+ id).button('loading').delay(3000).queue(function() {
	             	$('#'+ id).button('reset');
	             	$('#'+ id).dequeue(); 
	            });
			}
			
        	//重置表单
			function resetFrom() {
				$("#timeQuery").val("");
				$("#staticQuery").val("");
				$("#regionQuery").val("");
				$("#industryQuery").val("");
				$("#nameQuery").val("");
				$("#month").val("");
				location.replace(whlyPath + '/report/frontCompanyReport/list?menuId=${menuId}');
				loadingCancel('reset');
			}
			
			//导出
			function Export() {
				$("#searchForm").attr("action", whlyPath + '/report/frontCompanyReport/export').submit();
				$("#searchForm").attr("action", whlyPath + '/report/frontCompanyReport/list?menuId=${menuId}');
				loadingCancel('export');
			}
        	
        	//分页
			function page(n,s){
				$("#pageNo").val(n);
				$("#pageSize").val(s);
				$("#searchForm").submit();
	        	return false;
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
				<div class="portlet-body">
					<form:form id="searchForm" modelAttribute="frontCompanyReport"
						action="${whlyPath}/report/frontCompanyReport/list?menuId=${menuId }"
						method="post" class="breadcrumb form-search">
						<input id="pageNo" name="pageNo" type="hidden"
							value="${page.pageNo}" />
						<input id="pageSize" name="pageSize" type="hidden"
							value="${page.pageSize}" />
						<input type="hidden" value="${companyParentType}" id="companyParentType">
						<input type="hidden" value="${month}" id="month">
						<input type="hidden" value="1" name="month">
						<div class="row form-body">
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">时间：</label>
								<div class="col-md-8">
									<div class="input-group date date-picker"
										data-date-format="yyyy年mm月">
										<input type="text" class="form-control" readonly name="year"
											value="${front.year }" id="timeQuery"> <span
											class="input-group-btn" >
											<button class="btn default date-reset" type="button" id="clearDate">
                                                <i class="fa fa-times"></i>
                                            </button>
											<button class="btn default date-set" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">状态：</label>
								<div class="col-md-8">
									<c:set var="status3" scope="session" value="${front.status}" />
									<select class="form-control" id="staticQuery" name="status">
										<option value="" label="全部" />
										<c:forEach items="${status}" var="status">
											<c:if test="${status.code == status3}">
												<option value="${status.code }" selected>${status.value }</option>
											</c:if>
											<c:if test="${status.code != status3}">
												<option value="${status.code }">${status.value }</option>
											</c:if>
										</c:forEach>
									</select>

								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">地区：</label>
								<div class="col-md-8">
									<form:select path="area.id" name="area.id" class="form-control"
										id="industryQuery">
										<form:option value="" label="全部" />
										<form:options
											items="${fnc:getArea('d233fe3d43da4d10ba0a7039746a47dd')}"
											itemLabel="name" itemValue="id" htmlEscape="false" />
									</form:select>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">行业：</label>
								<div class="col-md-8">
									<form:select path="typeId" class="form-control" name="typeId"
										id="industryQuery">
										<form:option value="" label="全部" />
										<c:set var="industyTypeLable" value="${industyTypeLable}"/>
										<form:options items="${fns:getDictList(industyTypeLable)}"
											itemLabel="label" itemValue="id" htmlEscape="false" />
									</form:select>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">企业名称：</label>
								<div class="col-md-8">
									<input class="form-control" type="text" placeholder=""
										name="companyName" value="${front.companyName }" id="nameQuery">
								</div>
							</div>
							<div class="form-group col-md-4">
								<button class="btn demo-loading-btn green col-md-3" id="query" onclick="loadingCancel('query')"  type="submit" 
									style="margin-left: 15px;">检索</button>
									<div class="col-md-1"></div>
									<button class="btn green demo-loading-btn col-md-3" type="button" id="export">导出</button>
								<div class="col-md-1"></div>
								<button class="btn green demo-loading-btn col-md-3" id="reset" type="button" >重置</button>
							</div>
						</div>
					</form:form>
				</div>
				<!-- 主体部分START-->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-dark">
									<i class="icon-settings font-dark"></i> <span
										class="caption-subject bold uppercase"> 数据列表</span>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-bordered table-hover"
									id="sample_1">
									<thead>
										<tr role="row">
											<th>操作</th>
											<th>状态</th>
											<th>年</th>
											<th>月份</th>
											<th>上报企业名称</th>
											<th>所属行业</th>
											<th>所属地域</th>
											<th class="type_emphasis type_quota" style="display:none;">营业收入 (万元)</th>
											<th class="type_emphasis type_quota" style="display:none;">营业利润 (万元)</th>
											<th class="type_emphasis " style="display:none;">企业税费 (万元)</th>
											<th class="type_emphasis type_quota" style="display:none;">营业成本 (万元)</th>
											<th class="type_emphasis " style="display:none;">应付职工薪酬 (万元)</th>
											<th class="type_emphasis " style="display:none;">贷款金额 (万元)</th>
											<th class="type_emphasis " style="display:none;">订单数量 (个)</th>
											<th class="type_emphasis type_quota" style="display:none;">从业人数(人)</th>
											<th>上报时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="frontCompanyReport">
											<tr class="gradeX odd" role="row">
											<td>
												<%-- 	<shiro:hasPermission name="report:frontCompanyReport:edit">
													</shiro:hasPermission> --%>
														<a style="color:#337ab7;" target="_blank"  href="${whlyPath}/report/frontCompanyReport/form?menuId=${menuId }&id=${frontCompanyReport.id}&from=sh">查看</a>
														<a style="color:#337ab7;" target="_blank"  href="${whlyPath}/taskmange/examine/form?menuId=${menuId }&id=${frontCompanyReport.id}&from=sh">审核</a>
														<a style="color:#337ab7;" target="_blank" href="${whlyPath}/report/frontCompanyReport/history?menuId=${menuId }&id=${frontCompanyReport.id}&from=sh">历史</a>
												<%-- 	<shiro:hasPermission name="report:frontCompanyReport:history">
													</shiro:hasPermission> --%>
												</td> 
												<td>${frontCompanyReport.statusName}</td>
												<td>${frontCompanyReport.year}</td>
												<td>${frontCompanyReport.month}</td>
												<td>${frontCompanyReport.companyName}</td>
												<td>${frontCompanyReport.description}</td>
												<td>${frontCompanyReport.area.name}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReport.totalIncome}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReport.totalProfit}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReport.totalTax}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReport.operatingCosts}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReport.employeeCompensation}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReport.loanAmount}</td>
												<td class="type_emphasis " style="display:none;">${frontCompanyReport.orderQuantity}</td>
												<td class="type_emphasis type_quota" style="display:none;">${frontCompanyReport.empQuantity}</td>
												<td><fmt:formatDate
														value="${frontCompanyReport.reportTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												
												
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="pagination">${page}</div>
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
	<%@ include file="../include/footer.jsp"%>
	<!-- js必须引用在body前面 -->
</body>
</html>

