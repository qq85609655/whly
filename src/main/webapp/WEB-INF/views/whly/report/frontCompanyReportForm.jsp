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
	/* .portlet.light.bordered{
		min-height:1000px;
		_height:1000px;
	} */
	.fl {
		float:left!important;
	}
	.col-md-6.type_support {
		width: 47.5%;
	}
	.button_1 {
		width: 100px;
	    margin-right: 6%;
	    margin-top: 3%;
	}
</style>
<script type="text/javascript">
	$(function() {
		
		//返回上一页点击事件
		$("#return").click(returnBack);
		//当前用户所登录的模块
		var type = $('#companyParentType').val();
		if(type == '3') { // 扶持项目模块
			supportJudgeInput();
		} else {
			//判断能不能输入文本
			judgeInput();
		}
		//增加按钮
		$("#add").click(addRemarks);
		//删除按钮
		$("#delete").click(deleteRemarks);
		
		// 根据当前登录用户企业所属类型 来页面展示的内容
		contentShow();
	
		//如果有信息，则弹出
		if($('#message').val()){
			alert($('#message').val());
		}
	});
	
	// 根据当前登录用户企业所属类型 来页面展示的内容
	function contentShow() {
		var type = $('#companyParentType').val();
		if(type == "1") {
			$('.type_emphasis').show();
			$('.input_emphasis').attr('required','true');
			$('.type_support').remove();
		} else if(type == "2") {
			$('.type_quota').show();
			$('.input_quota').attr('required','true');
			$('.input_quota1').remove();
		} else if(type == "3") {
			$('.type_support').show();
			$('.input_support').attr('required','true');
			$('.type_emphasis').remove();
		}
	}
	
    function returnBack() {
    	if($("#from_hid").val()=="sh"){
    		window.location.href=whlyPath+"/report/frontCompanyReport/list?menuId=${menuId}";
    	}else if($("#from_hid").val()=="view"){
    		window.location.href=whlyPath+"/report/frontCompanyReport/viewlist?menuId=${menuId}";
    	}
    }

    function supportJudgeInput() {
    	var companyId = $("#companyId").val();
		var data = {
				companyId: companyId
		};
		$.ajax({
			type : 'POST',
			data : data,
			url : whlyPath + '/report/frontCompanyReport/getfrontCompanyprojectById',
			dataType : 'json'
		}).done(function(result, status, xhr) {
            console.info(result);
            var result = result.data[0];
            //$('#submit').attr("style","display:block;");
			$('#add').remove();
			$('#delete').remove();
			//$('#submit').remove();
            $("#projectName").attr('value',result.projectName).attr('readonly','true');
            $("#totalInvestment").attr('value',result.totalInvestment).attr('readonly','true');
            $("#bankLoanAmount").attr('value',result.bankLoanAmount).attr('readonly','true');
           	$("#projectContent").html(result.projectContent).attr('readonly','true');
            $("#projectDesiredEffect").html(result.projectDesiredEffect).attr('readonly','true');
            $("#yearLimit").attr('value',result.yearLimit).attr('readonly','true');
            judgeInput();
		}).fail(function(xhr, status, error) {
			
		});
    }
    
	function judgeInput() {
		var type = $('#companyParentType').val();
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
               	console.info(result.data);
				if(companyName!=null && result.data.companyName == companyName && result.data.status != 'PASSED') {
					$("#action").attr('action', whlyPath + '/report/frontCompanyReport/update?menuId=${menuId}');
					if(type == '3') {
						$("#monthInvestment").attr('value',result.data.monthInvestment);
						$("#projectEvolve").html(result.data.projectEvolve);
					} else {
						$("#company").attr('value',result.data.companyName);
						$("#totalIncome").attr('value',result.data.totalIncome);
						$("#operatingCosts").attr('value',result.data.operatingCosts);
						$("#totalProfit").attr('value',result.data.totalProfit);
						$("#totalTax").attr('value',result.data.totalTax);
						$("#employeeCompensation").attr('value',result.data.employeeCompensation);
						$("#loanAmount").attr('value',result.data.loanAmount);
		                $("#empQuantity").attr('value',result.data.empQuantity);
		                $("#orderQuantity").attr('value',result.data.orderQuantity);
					}
	                $('#submit').attr("style","display:block;");
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
					$('#add').remove();
					$('#delete').remove();
					$('#submit').remove();
	                if(type == "3") {
		                $("#monthInvestment").attr('value',result.data.monthInvestment).attr('readonly','true');
		                $("#projectEvolve").html(result.data.projectEvolve).attr('readonly','true');
	                } else {
	                	$("#company").attr('value',result.data.companyName).attr('readonly','true');
						$("#totalIncome").attr('value',result.data.totalIncome).attr('readonly','true');
						$("#operatingCosts").attr('value',result.data.operatingCosts).attr('readonly','true');
						$("#totalProfit").attr('value',result.data.totalProfit).attr('readonly','true');
						$("#totalTax").attr('value',result.data.totalTax).attr('readonly','true');
						$("#employeeCompensation").attr('value',result.data.employeeCompensation).attr('readonly','true');
						$("#loanAmount").attr('value',result.data.loanAmount).attr('readonly','true');
		                $("#empQuantity").attr('value',result.data.empQuantity).attr('readonly','true');
		                $("#orderQuantity").attr('value',result.data.orderQuantity).attr('readonly','true');
	                }
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
			//$("#return").attr("style","display:none;");
			$("#submit").attr("style","display:block;");
			if(type != '3') {
				addRemarks();
			}
		}
	}
	
	function addRemarks() {
		var divs = $('#remarks').find("div");
		var remarks = '<div class="form-group">'+
						'<label>'+ (divs.length + 1) +'、标题</label> '+
						'<input class="form-control spinner" type="text" placeholder=""  name="question['+ divs.length +'].title">'+
						'<label>内容</label>'+
						'<textarea class="form-control" rows="3"  name="question['+ divs.length +'].content"></textarea>'+
					'</div>'
		$("#remarks").append(remarks);
	}
	
	//取消button-loading状态
	function loadingCancel(id) {
		 $('#'+ id).button('loading').delay(2000).queue(function() {
         	$('#'+ id).button('reset');
         	$('#'+ id).dequeue(); 
        });
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
										<span class="caption-subject bold uppercase col-md-10 type_support" style="display:none;">
										请填写项目申报信息</span> 
									<div style="float: right;font-size: 15px;" class="actions">${topMonth.info }</div>
								</div>
							</div>
							<div class="portlet-body" >
								<form  modelAttribute="frontCompanyReport" action="${whlyPath}/report/frontCompanyReport/save?menuId=${menuId}"  id="action"  method="post">
									<div class="form-body">
										<input type="hidden" value="${frontCompanyReport.id}" id="reportId">
										<input type="hidden" value="${frontCompanyReport.companyId}" id="companyId">
										<input type="hidden" value="${companyName}" id="companyName">
										<input type="hidden" value="${frontCompanyReport.id}" name="id">
										<input type="hidden" value="${companyParentType}" id="companyParentType">
										<input type="hidden" value="${message}" id="message">
										<input type="hidden" name="frontCompanyReport.year" value="${topMonth.year }">
										<input type="hidden" name="frontCompanyReport.month" value="${topMonth.month }">
										<input type="hidden" id="from_hid" name="frontCompanyReport.from" value="${frontCompanyReport.from }">
										<input type="hidden" value="${companyParentType}" id="companyParentType">
										<div class="row">
											<div class="form-group col-md-6 type_emphasis">
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
													<input  class="form-control input_emphasis input_quota"
														placeholder="请输入营业收入"  type="number"  name="totalIncome" id="totalIncome">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
												<label>营业成本 （万元）</label>
												<div class="input-group">
													<span class="input-group-addon" >￥</span>
													<input  type="number" class="form-control input_emphasis input_quota" name="operatingCosts" id="operatingCosts"
														placeholder="请输入营业成本" aria-describedby="sizing-addon1">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
												<label>营业利润（万元）</label>
												<div class="input-group">
													<span class="input-group-addon" >￥</span>
													<input  type="number" class="form-control  input_emphasis input_quota" name="totalProfit" id="totalProfit"
														placeholder="请输入营业利润" aria-describedby="sizing-addon1">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota1" style="display:none;">
												<label>企业税费（万元）</label>
												<div class="input-group">
													<span class="input-group-addon" >￥</span>
													<input  type="number" class="form-control input_emphasis " name="totalTax" id="totalTax"
														placeholder="请输入企业税费" aria-describedby="sizing-addon1">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota1" style="display:none;">
												<label>应付职工薪酬（万元）</label>
												<div class="input-group">
													<span class="input-group-addon" >￥</span>
													<input  type="number" class="form-control input_emphasis " name="employeeCompensation"
														id="employeeCompensation" placeholder="请输入应付职工薪酬"
														aria-describedby="sizing-addon1">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota1" style="display:none;">
												<label>贷款金额（万元）</label>
												<div class="input-group">
													<span class="input-group-addon" >￥</span>
													<input  type="number" class="form-control input_emphasis" name="loanAmount" id="loanAmount"
														placeholder="请输入贷款金额" aria-describedby="sizing-addon1">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">
												<label>从业人数 （人）</label>
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-user"></i>
													</span> <input  type="number" class="form-control  input_emphasis input_quota" name="empQuantity"
														id="empQuantity" placeholder="请输入从业人数">
												</div>
											</div>
											<div class="form-group col-md-6 type_emphasis type_quota1" style="display:none;">
												<label>订单数量（个）</label>
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-reorder"></i>
													</span> <input  type="number" class="form-control spinner input_emphasis"
														id="orderQuantity"  name="orderQuantity" placeholder="请输入订单数量">
												</div>
											</div>
											<!-- 年度扶持项目监测 -->
											<div class="form-group col-md-6 type_support" style="display:none;">
												<label>公司名称</label>
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-reorder"></i>
													</span> <input  type="text" class="form-control spinner input_support"
														  readonly value="${frontCompanyReport.companyName }" placeholder="项目名称">
												</div>
											</div>
											<div class="form-group col-md-6 type_support" style="display:none;">
												<label>项目名称</label>
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-reorder"></i>
													</span> <input  type="text" class="form-control spinner input_support"
														 id="projectName" name="projectName" placeholder="项目名称">
												</div>
											</div>
											<div class="form-group col-md-6 type_support" style="display:none;">
												<label>起止年限</label>
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-reorder"></i>
													</span> <input  type="text" class="form-control spinner input_support"
														 id="yearLimit" name="yearLimit" placeholder="起止年限">
												</div>
											</div>
											<div class="form-group col-md-6 type_support" style="display:none;">
												<label>当月完成投资金额（万元）</label>
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-reorder"></i>
													</span> <input  type="number" class="form-control spinner input_support"
														  id="monthInvestment" name="monthInvestment" placeholder="请输入当月完成投资金额">
												</div>
											</div>
											<div class="form-group col-md-12 type_support" style="display:none;">
												<label style="color:red;">项目建设进展情况</label>
												<div class="input-group" >
	                                                <textarea  id="projectEvolve" class="input_support" name="projectEvolve" rows="6"  cols="130"></textarea>
	                                            </div>
											</div>
											<div class="form-group col-md-12 type_support" style="display:none;">
												<label>项目主要内容</label>
												<div class="input-group" >
	                                                <textarea  id="projectContent" class="input_support" name="projectContent" rows="6"  cols="130"></textarea>
	                                            </div>
											</div>
											<div class="form-group col-md-12 type_support" style="display:none;">
												<label>项目预期效果</label>
												<div class="input-group">
													<textarea id="projectDesiredEffect"  class="input_support" name="projectDesiredEffect" rows="6"  cols="130"></textarea>
												</div>
											</div>
											
											<div class="form-group">
												<br> 
												<!-- <button type="button" class="btn blue pull-right"
													id="return">返回</button> -->
												<button type="submit"  class="btn blue demo-loading-btn pull-right button_1" style="display:none" id="submit" onclick="loadingCancel('submit')">提交</button>
											</div>
										</div>
									</div>
									<div style="height:20px;display:none;" class="type_emphasis" ></div> 
									<div style="height:20px;display:none;" class="type_quota" ></div>
									<div class="form-actions" id="remarks" >
										<button type="button" class="btn btn-success type_emphasis" id="add">新增</button>
										<button type="button" class="btn btn-danger type_emphasis" id="delete" style="margin-left: 5px;">删除</button>
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
