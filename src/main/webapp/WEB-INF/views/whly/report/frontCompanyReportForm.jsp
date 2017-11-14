<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<style>

	.btn.blue:not(.btn-outline) {
		background:#81bde7;
		border:0;
	}
	.btn-success {
		background:#88ccd2;
		border:0;
	}
	.btn-danger {
		background:#d89ea2;
		border:0;
	}
	.col-md-10 {
   		width: 84.33333%;
	}
</style>
<script type="text/javascript">
	$(function() {
		if("${message}"!=""){
			alert("${message}");
		}
		//返回上一页点击事件
		$("#return").click(returnBack);
		//判断能不能输入文本
		judgeInput();
		//增加按钮
		$("#add").click(addRemarks);
		//删除按钮
		$("#delete").click(deleteRemarks);
		
		// 根据当前登录用户企业所属类型 来页面展示的内容
		contentShow();
	
	});
	
	// 根据当前登录用户企业所属类型 来页面展示的内容
	function contentShow() {
		var type = $('#companyParentType').val();
		if(type == "1") {
			$('.type_emphasis').show();
		} else if(type == "2") {
			$('.type_quota').show();
			$('.input_quota').removeAttr('required');
		}
	}
	
    function returnBack() {
    	if($("#from_hid").val()=="sh"){
    		window.location.href=whlyPath+"/report/frontCompanyReport/list?menuId=${menuId}";
    	}else if($("#from_hid").val()=="view"){
    		window.location.href=whlyPath+"/report/frontCompanyReport/viewlist?menuId=${menuId}";
    	}
    }

	function judgeInput() {
		var redirectAttributes = $('#redirectAttributes').attr('value');
		if(redirectAttributes) {
			alert(redirectAttributes);
		}
		var id = $("#reportId").val();
		var data = {
				id: id
		};
		if(id!=null && id!="") {
			$.ajax({
				type : 'POST',
				data : data,
				url : whlyPath + '/report/frontCompanyReport/getfrontCompanyReportById',
				dataType : 'json'
			}).done(function(result, status, xhr) {
				var companyName = $("#companyName").val();
                var question = result.data.question;
               	var divs = $('#remarks').find("div");
				if(companyName!=null && result.data.companyName == companyName && result.data.status != 'PASSED') {
					$("#action").attr('action', whlyPath + '/report/frontCompanyReport/update?menuId=${menuId}');
					//$("#company").attr('value',result.data.companyName);
					$("#totalIncome").attr('value',result.data.totalIncome);
					$("#operatingCosts").attr('value',result.data.operatingCosts);
					$("#totalProfit").attr('value',result.data.totalProfit);
					$("#totalTax").attr('value',result.data.totalTax);
					$("#employeeCompensation").attr('value',result.data.employeeCompensation);
					$("#loanAmount").attr('value',result.data.loanAmount);
	                $("#empQuantity").attr('value',result.data.empQuantity);
	                $("#orderQuantity").attr('value',result.data.orderQuantity);
	                $('#submit').css("display","block");
	                if(question) {
	                	 for(var i=0; i<question.length; i++) {
	 	                	if(question[i]!=null && question[i]!="" && question[i]) {
	 		            		var remarks = '<div class="form-group">'+
	 		            						'<label>'+ (i + 1) +'、标题</label> ' +
	 		            						'<input type="hidden" name="question['+ i +'].id" value="'+ question[i].id +'"> ' +
	 		            						'<input class="form-control spinner" type="text" placeholder="" value="'+ question[i].title +'" name="question['+ i +'].title">'+
	 		            						'<label>内容</label>'+
	 		            						'<textarea class="form-control" rows="3" name="question['+ i +'].content">'+ question[i].content +'</textarea>'+
	 		            					'</div>'
	 		            		$("#remarks").append(remarks);
	 	                	} 
	 	                }
	                }
				} else {
					/* $('#add').attr("style","display:none;");
					$('#delete').attr("style","display:none;");
					$('#submit').attr("style","display:none;"); */
					$('#add').remove();
					$('#delete').remove();
					$('#submit').remove();
					//$("#company").attr('value',result.data.companyName).attr('readonly','true');
					$("#totalIncome").attr('value',result.data.totalIncome).attr('readonly','true');
					$("#operatingCosts").attr('value',result.data.operatingCosts).attr('readonly','true');
					$("#totalProfit").attr('value',result.data.totalProfit).attr('readonly','true');
					$("#totalTax").attr('value',result.data.totalTax).attr('readonly','true');
					$("#employeeCompensation").attr('value',result.data.employeeCompensation).attr('readonly','true');
					$("#loanAmount").attr('value',result.data.loanAmount).attr('readonly','true');
	                $("#empQuantity").attr('value',result.data.empQuantity).attr('readonly','true');
	                $("#orderQuantity").attr('value',result.data.orderQuantity).attr('readonly','true');
	                if(question) {
	                	for(var i=0; i<question.length; i++) {
		                	if(question[i]!=null && question[i]!="" && question[i]) {
			            		var remarks = '<div class="form-group">'+
			            						'<label>'+ (i + 1) +'、标题</label> ' +
			            						'<input type="hidden" name="question['+ i +'].id" value="'+ question[i].id +'"> ' +
			            						'<input class="form-control spinner" type="text" placeholder="" readonly value="'+ question[i].title +'" name="question['+ i +'].title">'+
			            						'<label>内容</label>'+
			            						'<textarea class="form-control" rows="3" readonly name="question['+ i +'].content">'+ question[i].content +'</textarea>'+
			            					'</div>'
			            		$("#remarks").append(remarks);
		                	} 
		                }
	                }
				}
                
			}).fail(function(xhr, status, error) {
				
			});
		} else {
			$("#action").attr('action', whlyPath + '/report/frontCompanyReport/save?menuId=${menuId}');
			$("#return").attr("style","display:none;");
			$("#submit").attr("style","display:block;");
			addRemarks();
		}
	}
	
	function addRemarks() {
		var divs = $('#remarks').find("div");
		var remarks = '<div class="form-group">'+
						'<label>'+ (divs.length + 1) +'、标题</label> '+
						'<input class="form-control spinner" type="text" placeholder="" required name="question['+ divs.length +'].title">'+
						'<label>内容</label>'+
						'<textarea class="form-control" rows="3" required name="question['+ divs.length +'].content"></textarea>'+
					'</div>'
		$("#remarks").append(remarks);
	}
	
	function deleteRemarks() {
		var divs = $('#remarks').find("div").last();
		divs.last().remove();
	}
	
</script>
 <%-- <script src="/static/${whlyPage}/assets/pages/scripts/form-validation-md.min.js" type="text/javascript"></script> --%>
<!-- <script>
$.ready(function() {  
	 $("#form").validate({  
	        submitHandler:function(form){  
	            alert("submitted");     
	            form.submit();  
	        }      
	    });  
	});  
</script> -->

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
								<div class="caption font-red-sunglo col-md-12">
									<i class="icon-settings font-red-sunglo"></i> <span class="caption-subject bold uppercase col-md-10 type_quota" style="display:none;">
										营业收入、营业成本 、营业利润、从业人数请填写企业单月数据，不要填写累计数据</span>
										<span class="caption-subject bold uppercase col-md-10 type_emphasis" style="display:none;">
										营业收入、营业成本、营业利润、企业税费、应付职工薪酬、贷款金额请填写企业单月数据，不要填写累计数据</span> 
									<div style="float: right;font-size: 15px;" class="actions">${topMonth.info }</div>
								</div>
							</div>
							<div class="portlet-body ">
								<form  modelAttribute="frontCompanyReport" action="${whlyPath}/report/frontCompanyReport/save?menuId=${menuId}"  id="action"  method="post">
									<input type="hidden" name="frontCompanyReport.year" value="${topMonth.year }">
									<input type="hidden" name="frontCompanyReport.month" value="${topMonth.month }">
									<input type="hidden" id="from_hid" name="frontCompanyReport.from" value="${frontCompanyReport.from }">
									<input type="hidden" value="${companyParentType}" id="companyParentType">
									<div class="form-body">
										<div class="form-group col-md-6 ">
											<label>公司名称</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-home"></i>
												</span> <input type="text" class="form-control" id="company"
													placeholder="公司名称"   readonly value="${frontCompanyReport.companyName }" name="companyName">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
											<label>营业收入（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input  class="form-control"
													placeholder="请输入营业收入" required type="text"  name="totalIncome" id="totalIncome">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
											<label>营业成本 （万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input required type="number" class="form-control" name="operatingCosts" id="operatingCosts"
													placeholder="请输入营业成本" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
											<label>营业利润（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input required type="number" class="form-control" name="totalProfit" id="totalProfit"
													placeholder="请输入营业利润" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis" style="display:none;">
											<label>企业税费（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input required type="number" class="form-control input_quota" name="totalTax" id="totalTax"
													placeholder="请输入企业税费" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis" style="display:none;">
											<label>应付职工薪酬（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input required type="number" class="form-control input_quota" name="employeeCompensation"
													id="employeeCompensation" placeholder="请输入应付职工薪酬"
													aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis" style="display:none;">
											<label>贷款金额（万元）</label>
											<div class="input-group">
												<span class="input-group-addon" >￥</span>
												<input required type="number" class="form-control input_quota" name="loanAmount" id="loanAmount"
													placeholder="请输入贷款金额" aria-describedby="sizing-addon1">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
											<label>从业人数 （人）</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-user"></i>
												</span> <input required type="number" class="form-control" name="empQuantity"
													id="empQuantity" placeholder="请输入从业人数">
											</div>
										</div>
										<div class="form-group col-md-6 type_emphasis" style="display:none;">
											<label>订单数量（个）</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-reorder"></i>
												</span> <input required type="number" class="form-control spinner input_quota"
													id="orderQuantity"  name="orderQuantity" placeholder="请输入订单数量">
											</div>
										</div>
										<div class="form-group col-md-6">
											<br> 
											<button type="button" class="btn blue pull-right"
												id="return">返回</button>
											<button type="submit"  class="btn blue demo-loading-btn pull-right" style="margin-right: 0.3em;display:none" id="submit">提交</button>
										</div>
										<input type="hidden" value="${frontCompanyReport.id}" id="reportId">
										<input type="hidden" value="${companyName}" id="companyName">
										<input type="hidden" value="${frontCompanyReport.id}" name="id">
										<input type="hidden" value="${redirectAttributes}" id="redirectAttributes">
										<input type="hidden" value="${companyParentType}" id="companyParentType">
									</div>
									<div style="height:380px;display:none;" class="type_emphasis" ></div> 
									<div style="height:250px;display:none;" class="type_quota" ></div>
									<div class="form-actions" id="remarks" >
										<button type="button" class="btn btn-success" id="add">新增</button>
										<button type="button" class="btn btn-danger" id="delete" style="margin-left: 5px;">删除</button>
										<span class="col-md-12" style="height:7px;"></span>
										
									
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
