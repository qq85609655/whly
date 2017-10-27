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
<script type="text/javascript">
	$(function() {
		
		//返回上一页点击事件
		$("#return").click(returnBack);
		//判断能不能输入文本
		judgeInput();
		//增加按钮
		$("#add").click(addRemarks);
		//删除按钮
		$("#delete").click(deleteRemarks);
	
	});
	
    function returnBack() {
        window.history.back();
    }

	function judgeInput() {
		var id = $("#companyId").val();
		var data = {
				id: id
		};
		if(id!=null && id!="") {
			$.ajax({
				type : 'POST',
				data : data,
				url : '<%=basePath%>front/report/frontCompanyReport/getfrontCompanyReportById',
				dataType : 'json'
			}).done(function(result, status, xhr) {
				$("#company").attr('value',result.data.operator).attr('readonly','true');
				$("#totalIncome").attr('value',result.data.totalIncome).attr('readonly','true');
				$("#operatingCosts").attr('value',result.data.operatingCosts).attr('readonly','true');
				$("#totalProfit").attr('value',result.data.totalProfit).attr('readonly','true');
				$("#totalTax").attr('value',result.data.totalTax).attr('readonly','true');
				$("#employeeCompensation").attr('value',result.data.employeeCompensation).attr('readonly','true');
				$("#loanAmount").attr('value',result.data.loanAmount).attr('readonly','true');
                $("#empQuantity").attr('value',result.data.empQuantity).attr('readonly','true');
                $("#orderQuantity").attr('value',result.data.orderQuantity).attr('readonly','true');
                console.info('result',result);
                
			}).fail(function(xhr, status, error) {
				
			});
		} else {
			$("#return").attr("style","display:none;");
			$("#company").attr('value',11111111).attr('readonly','true');
		}
	}
	
	function addRemarks() {
		var remarks = '<div class="form-group">'+
						'<label>标题</label> <input class="form-control spinner" type="text" placeholder="">'+
						'<label>内容</label>'+
						'<textarea class="form-control" rows="3"></textarea>'+
					'</div>'
		$("#remarks").append(remarks);
	}
	
	function deleteRemarks() {
		var divs = $('#remarks').find("div");
		divs.last().remove();
	}
	
</script>
</head>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- BEGIN 顶部菜单  -->
	<%@ include file="../include/topmenu.jsp"%>
	<!-- END 顶部菜单  -->
	<!-- 不能删除下面一行 否则手机端样式错乱 -->
	<div class="clearfix"></div>
	<!-- 内容 -->
	<div class="page-container">
		<!-- BEGIN 左侧部分 -->
		<%@ include file="../include/leftmenu.jsp"%>
		<!-- END 左侧部分 -->

		<!-- BEGIN 右侧内容 -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- page 菜单-->
				<%@ include file="../include/topBar.jsp"%>

				<!-- 主体部分START-->
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<!-- BEGIN SAMPLE FORM PORTLET-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-red-sunglo">
									<i class="icon-settings font-red-sunglo"></i> <span
										class="caption-subject bold uppercase">
										营业收入、利润总额、税收总额请填写企业单月数据，不要填写累计数据</span>
								</div>
								<div class="actions">
									<div class="btn-group">

										<ul class="dropdown-menu pull-right">
											<li><a href="javascript:;"> <i class="fa fa-pencil"></i>
													Edit
											</a></li>
											<li><a href="javascript:;"> <i class="fa fa-trash-o"></i>
													Delete
											</a></li>
											<li><a href="javascript:;"> <i class="fa fa-ban"></i>
													Ban
											</a></li>
											<li class="divider"></li>
											<li><a href="javascript:;"> Make admin </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="portlet-body form">
								<form  modelAttribute="frontCompanyReport" action="${whlyPath}/report/frontCompanyReport/save?menuId=b3ce9351d95a4f90904022a2f1bf8134" method="post">
									<div class="form-body">
										<div class="form-group col-md-6">
											<label>公司名称</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-home"></i>
												</span> <input type="text" class="form-control"
													placeholder="请输入公司名称" name="company" id="company">
											</div>
										</div>

										<div class="form-group col-md-6">
											<label>营业收入（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input type="text" class="form-control"
													placeholder="单位：（万元）" name="totalIncome" id="totalIncome">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>营业成本 （万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input type="text" class="form-control" name="operatingCosts" id="operatingCosts"
													placeholder="单位：（万元）" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>营业利润（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input type="text" class="form-control" name="totalProfit" id="totalProfit"
													placeholder="单位：（万元）" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>企业税费（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input type="text" class="form-control" name="totalTax" id="totalTax"
													placeholder="单位：（万元）" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>应付职工薪酬（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input type="text" class="form-control" name="employeeCompensation"
													id="employeeCompensation" placeholder="单位：（万元）"
													aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>贷款金额（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input type="text" class="form-control" name="loanAmount" id="loanAmount"
													placeholder="单位：（万元）" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>从业人数 （人）</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-user"></i>
												</span> <input type="text" class="form-control" name="empQuantity"
													id="empQuantity" placeholder="单位：（人）">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label>订单数量（个）</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-reorder"></i>
												</span> <input type="text" class="form-control spinner"
													id="orderQuantity"  name="orderQuantity" placeholder="单位：（个）">
											</div>
										</div>
										<div class="form-group col-md-6"> 
											<button type="button" class="btn default pull-right"
												id="return">返回</button>
											<button type="submit" class="btn blue pull-right">提交</button>
										</div>
										<input type="hidden" value="${frontCompanyReport.id}"
											id="companyId">
									</div>
									<div style="height:380px;"></div>
									<div class="form-actions" id="remarks" >
										<button type="button" class="btn btn-success" id="add">新增</button>
										<button type="button" class="btn btn-danger" id="delete">删除</button>
										<div class="form-group">
											<label>标题</label> <input class="form-control spinner"
												type="text" placeholder=""> <label>内容</label>
											<textarea class="form-control" rows="3"></textarea>
										</div>

									</div>
								</form>
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->

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
