<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
				//重置按钮
				$("#reset").click(resetFrom);
				//导出按钮
				$("#export").click(Export);
			
			});
			
			
        	//重置表单
			function resetFrom() {
				$("#timeQuery").val("");
				$("#staticQuery").val("");
				$("#regionQuery").val("");
				$("#industryQuery").val("");
				$("#nameQuery").val("");
				location.replace('<%=basePath%>front/report/frontCompanyReport/list?menuId=7e90ace61d63482a95ebf719877cd0be');
			}
			
			//导出
			function Export() {
				$("#searchForm").attr("action", '<%=basePath%>front/report/frontCompanyReport/export').submit();
				$("#searchForm").attr("action", '<%=basePath%>front/report/frontCompanyReport/list?menuId=7e90ace61d63482a95ebf719877cd0be');
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
					<!-- <form action="#" id="form_sample_3" class="form-horizontal"> -->
					<form:form id="searchForm" modelAttribute="frontCompanyReport"
						action="${whlyPath}/report/frontCompanyReport/list?menuId=7e90ace61d63482a95ebf719877cd0be"
						method="post" class="breadcrumb form-search">
						<input id="pageNo" name="pageNo" type="hidden"
							value="${page.pageNo}" />
						<input id="pageSize" name="pageSize" type="hidden"
							value="${page.pageSize}" />
						<div class="row form-body">
							<div class="form-group col-md-4">
								<label class="control-label col-md-4">时间：</label>
								<div class="col-md-8">
									<div class="input-group date date-picker"
										data-date-format="yyyy年mm月">
										<input type="text" class="form-control" readonly name="year"
											value="${front.year }" id="timeQuery"> <span
											class="input-group-btn">
											<button class="btn default" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label col-md-4">状态：</label>
								<div class="col-md-8">
									<%--  <select class="form-control" id="staticQuery" name="status" >
		                             	<option value="" label="全部"/>
		                             	<c:forEach items="${status}" var="status">
		                             		<option value="${status.code }" >${status.value }</option>
		                             		<c:if test="${status.value == status3}">
			                                 	<option value="${status.value }" selected>${status.value }</option>
		                             		</c:if>
		                             		<c:if test="${status.value != status3}">
			                                 	<option value="${status.value }" >${status.value }</option>
		                             		</c:if>
		                                </c:forEach>
		                             </select> --%>
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
								<label class="control-label col-md-4">地区：</label>
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

							<!--  <div class="form-group col-md-4">
	                             <label class="control-label col-md-4">地区：</label>
	                             <div class="col-md-8">
		                             <select class="form-control" id="regionQuery">
		                             	 <option value="" label="全部"/>
		                                 <option>环翠区</option>
		                                 <option>文登区</option>
		                                 <option>荣成市</option>
		                             </select>
	                             </div>
	                         </div> -->
						</div>
						<div class="row">
							<div class="form-group col-md-4">
								<label class="control-label col-md-4">行业：</label>
								<div class="col-md-8">
									<form:select path="typeId" class="form-control" name="typeId"
										id="industryQuery">
										<form:option value="" label="全部" />
										<form:options items="${fns:getDictList('front_hylx')}"
											itemLabel="label" itemValue="id" htmlEscape="false" />
									</form:select>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label col-md-4">企业名称：</label>
								<div class="col-md-8">
									<input class="form-control" type="text" placeholder=""
										name="companyName" value="${front.companyName }" id="nameQuery">
								</div>
							</div>
							<div class="form-group col-md-4">
								<button class="btn green col-md-3" id="query" type="submit"
									style="margin-left: 15px;">检索</button>
								<div class="col-md-1"></div>
								<button class="btn green col-md-3" type="button" id="export">导出</button>
								<div class="col-md-1"></div>
								<button class="btn green col-md-3" id="reset" type="button">重置</button>
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
							<!-- <div class="portlet-body"> -->
							<!-- <div class="table-toolbar">
                                        <div class="row">
                                        	
                                            <div class="col-md-6" style="">
                                                <div class="btn-group">
                                                    <button id="sample_editable_1_new" class="btn sbold green"> Add New
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="btn-group pull-right">
                                                    <button class="btn green  btn-outline dropdown-toggle" data-toggle="dropdown">工具栏
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-print"></i> 打印 </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-pdf-o"></i> 保存为PDF </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-excel-o"></i> 保存为Excel </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
							<!-- <div id="sample_1_wrapper" class="dataTables_wrapper no-footer">
									<div class="row">
										<div class="col-md-6 col-sm-12">
											<div class="dataTables_length" id="sample_1_length">
												<label>Show <select name="sample_1_length"
													aria-controls="sample_1"
													class="form-control input-sm input-xsmall input-inline">
														<option value="5">5</option>
														<option value="15">15</option>
														<option value="20">20</option>
														<option value="-1">All</option>
												</select>
												</label>
											</div>
										</div>
										<div class="col-md-6 col-sm-12">
											<div class="col-md-7"></div>
											<div id="sample_1_filter" class="dataTables_filter">
												<label>Search：<input type="search"
													class="form-control input-sm input-small input-inline"
													placeholder="" aria-controls="sample_1">
												</label>
											</div>
										</div>
									</div> -->
							<div class="portlet-body">
								<table class="table table-striped table-bordered table-hover"
									id="sample_1">
									<thead>
										<tr role="row">
											<th>状态</th>
											<th>年</th>
											<th>月份</th>
											<th>上报企业名称</th>
											<th>所属行业</th>
											<th>所属地域</th>
											<th>营业收入 (万元)</th>
											<th>营业利润 (万元)</th>
											<th>企业税费 (万元)</th>
											<th>营业成本 (万元)</th>
											<th>应付职工薪酬 (万元)</th>
											<th>贷款金额 (万元)</th>
											<th>订单数量 (个)</th>
											<th>从业人数(人)</th>
											<th>上报时间</th>
											<th>操作</th>
											<!-- <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Email : activate to sort column ascending" style="width:124px;"> 审批状态 </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Email : activate to sort column ascending" style="width: 227px;"> 所属行业 </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Points : activate to sort column ascending" style="width: 150px;"> 所属地域 </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Joined : activate to sort column ascending" style="width: 113px;"> 营业收入（万元） </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 124px;"> 利润总额（万元） </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 124px;"> 税收总额（万元） </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 124px;"> 从业人员 </th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="frontCompanyReport">
											<tr class="gradeX odd" role="row">
												<%-- <td class="center"></td>
															<td class="center"><a href="${ctx}/report/frontCompanyReport/form?id=${frontCompanyReport.id}">
																${frontCompanyReport.area.name}
															</a></td> --%>
												<c:forEach items="${status}" var="status1">
													<c:set var="key" scope="session" value="${status1.code}" />
													<c:if test="${frontCompanyReport.status == key}">
														<td>${status1.value}</td>
													</c:if>
												</c:forEach>
												<td>${frontCompanyReport.year}</td>
												<td>${frontCompanyReport.month}</td>
												<td>${frontCompanyReport.companyName}</td>
												<td>${frontCompanyReport.description}</td>
												<td>${frontCompanyReport.area.name}</td>
												<td>${frontCompanyReport.totalIncome}</td>
												<td>${frontCompanyReport.totalProfit}</td>
												<td>${frontCompanyReport.totalTax}</td>
												<td>${frontCompanyReport.operatingCosts}</td>
												<td>${frontCompanyReport.employeeCompensation}</td>
												<td>${frontCompanyReport.loanAmount}</td>
												<td>${frontCompanyReport.orderQuantity}</td>
												<td>${frontCompanyReport.empQuantity}</td>
												<td><fmt:formatDate
														value="${frontCompanyReport.reportTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><a
													href="${whlyPath}/report/frontCompanyReport/form?menuId=b3ce9351d95a4f90904022a2f1bf8134&id=${frontCompanyReport.id}">查看</a>
													<%-- <shiro:hasPermission name="report:frontCompanyReport:edit"> --%>
													<a
													href="${ctx}/report/frontCompanyReport/form?id=${frontCompanyReport.id}">审核</a>
													<%-- </shiro:hasPermission> --%> <a
													href="${ctx}/report/frontCompanyReport/form?id=${frontCompanyReport.id}">操作历史</a>
													<%-- <a
															href="${ctx}/report/frontCompanyReport/delete?id=${frontCompanyReport.id}"
															onclick="return confirmx('确认要删除该企业上报吗？', this.href)">删除</a> --%>
												</td>
											</tr>
										</c:forEach>
										<!--  <tr class="gradeX odd" role="row">
                                                <td><div class="checker"><span><input type="checkbox" class="checkboxes" value="1"></span></div> </td>
                                                <td><span class="label label-sm label-success"> 已审核  </span></td>
                                                <td class="sorting_1"> 文登市顺丰货运服务有限公司 </td>
                                                <td class="center">现代物流</td>
                                                <td class="center"> 文登区</td>
                                                <td class="center">43 </td>
                                                <td  class="center">2.6</td>
                                                <td  class="center">2.2</td>
                                                <td  class="center">8</td>
                                            </tr>
                                            <tr class="gradeX even" role="row">
                                                <td><div class="checker"><span><input type="checkbox" class="checkboxes" value="1"></span></div> </td>
                                                <td><span class="label label-sm label-warning"> 未审核  </span></td>
                                                <td class="sorting_1"> 文登市昆嵛酒店有限公司 </td>
                                                <td class="center">旅游休闲</td>
                                                <td class="center"> 南海新区</td>
                                                <td class="center">22.8</td>
                                                <td  class="center">0.8</td>
                                                <td  class="center">0.68</td>
                                                <td  class="center">45</td>
                                            </tr> -->

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
