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
	var step = 1;
	$(function() {
		
		//返回上一页点击事件
		$("#return").click(returnBack);
		
		loadingContent();
	});

	function returnBack() {
		window.history.back();
	}

	//改变当前显示的步数
	function updateStepNumber(step, max) {
		var progress = step / max * 100 + "%";
		if (progress != null) {
			$("#progress").attr("style", "width:" + progress + ";"); //修改当前进度条百分比
		}
		if (stepNumber != null) {
			$("#stepNumber").html("第" + step + "步"); //修改当前步数的文本
		}
	}
	
	function loadingContent() {
		var redirectAttributes = $('#redirectAttributes').attr('value');
		if(redirectAttributes) {
			alert(redirectAttributes);
		}
		var companyName = $('#companyName').attr('value');
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var time = year + '年' + month + '月'; //设置显示时间
		var id = $("#reportId").val();
		var data = {
				reportId: id
		};
		$.ajax({
			type : 'POST',
			data : data,
			url : '<%=basePath%>front/taskmange/examine/list',
			dataType : 'json'
		}).done(function(result, status, xhr) {
			var data = result.data;
			var thisMonth = null; //本年本月的上报信息
			var lastMonth = null; //本年上月的上报信息
			var lastYear = null;  //上年本月的上报信息
			console.info(result);
			if(data!=null && data!="") {
				for (var i = 0; i < data.length; i++) {
					if(data.id!='本年本月' && data.id!='上年本月' && data.id!='本年上月' ) {
						var li = menuLi.replace('[start]',i+1).replace('[max]',data.length).replace('[href]','#tab'+(i+1)).replace('[number]',i+1).replace('[name]',data[i].operation);
						if(i==0) {
							li = li.replace('[class]','active');
						}
						$('#menu').append(li);
					}
					if(data[i].operation == "提交" || data[i].operation == "更新") {
						var question = data[i].frontCompanyReport.question;
						var remarksDiv = "";
						for (var j = 0; j < question.length; j++) {
							remarksDiv = remarksDiv + remarks.replace('[number]', j+1).replace('[value]', question[j].title).replace('[textarea]',question[j].content);
							
						}
						var report = data[i].frontCompanyReport;
						var mainDiv = fromDiv.replace('[id]', 'tab'+(i+1)).replace('[time]', time).replace('[question]', remarksDiv).replace('[公司名称]',companyName);
						mainDiv = mainDiv.replace('[营业收入]', report.totalIncome).replace('[营业成本]', report.operatingCosts).replace('[营业利润]',report.totalProfit).replace('[企业税费]',report.totalTax).replace('[应付职工薪酬]',report.employeeCompensation).replace('[贷款金额]',report.loanAmount).replace('[从业人数]',report.empQuantity).replace('[订单数量]',report.orderQuantity);
						if(i==0) {
							mainDiv = mainDiv.replace('[class]','active');
						}
						$('#tab').append(mainDiv);
					}
					if(data[i].id == '本年本月') {
						thisMonth = data[i].frontCompanyReport;
					}
					if(data[i].id == '本年上月') {
						lastMonth = data[i].frontCompanyReport;
					}
					if(data[i].id == '上年本月') {
						lastYear = data[i].frontCompanyReport;
					}
				}
				
				var body = statementBody.replace('[name]','营业收入').replace('[value]', thisMonth.totalIncome).replace('[year]',yearOnYear(thisMonth.totalIncome, lastMonth.totalIncome));
				
				/* （本期数－同期数）÷同期数×100% */
				var statement1 = statement.replace('[time]', time);
				
				
			}
               
		}).fail(function(xhr, status, error) {
			
		});
		
		function yearOnYear(now, last) {
			now = parseFloat(now).toFixed(4);
			last = parseFloat(last).toFixed(4);
			return ((now-last) / last*100)+'%';
		}
		
		var statementBody = '<tr> ' +
							'	<td>[name]</td>' +
							'	<td>[value]</td>' +
							'	<td>[year]</td>' +
							'	<td>[lastYear]</td>' +
							'</tr>' ;
		
		var statement = '<div class="tab-pane " id="tab7"> ' +
							'<div class="portlet light bordered">' +
							'	<div class="portlet-title">' +
							'		<div class="caption">' +
							'			<i class="icon-social-dribbble font-green"></i> <span' +
							'				class="caption-subject font-green bold uppercase">[time]</span>' +
							'		</div>' +
							'	</div>' +
							'	<div class="portlet-body">' +
							'		<div class="table-scrollable">' +
							'			<table class="table table-hover">' +
							'				<thead>' +
							'					<tr>' +
							'						<th>指标</th>' +
							'						<th>本月（万元|人）</th>' +
							'						<th>同比增速（%）</th>' +
							'						<th>环比增速（%）</th>' +
							'					</tr>' +
							'				</thead>' +
							'				<tbody>[tbody]' +
							'				</tbody>' +
							'			</table>' +
							'		</div>' +
							'	</div>' +
							'	<div class="form-actions text-center">' +
							'		<button type="button" class="btn btn-success">批准</button>' +
							'		<button type="button" class="btn btn-danger">不批准</button>' +
							'		<br> <br>' +
							'	<div class="col-md-8 col-md-offset-2">' +
							'			<div class="form-group">' +
							'				<label>审核意见</label>' +
							'				<textarea class="form-control" ></textarea>' +
							'			</div>' +
							'		</div>' +
							'	</div>' +
							'</div>' +
						'</div>' ;
		
		var remarks = '<div class="form-group ">'+
						'<label>[number]、标题</label> ' +
						'<input class="form-control spinner" type="text" readonly  placeholder="" value="[value]">'+
						'<label>内容</label>'+
						'<textarea class="form-control" rows="3" readonly >[textarea]</textarea>'+
					'</div>';
		
		var fromDiv = '<div class="row tab-pane [class]" id="[id]"> ' +
						'<div class="col-md-10 col-md-offset-1">' +
						'<!-- BEGIN SAMPLE FORM PORTLET-->' +
						'<div class="portlet light bordered">' +
						'	<div class="portlet-title">' +
						'		<div class="caption font-red-sunglo">' +
						'			<i class="icon-settings font-red-sunglo"></i> <span' +
						'				class="caption-subject bold uppercase">' +
						'				营业收入、营业成本、营业利润、企业税费、应付职工薪酬、贷款金额是企业单月数据</span>' +
						'				<span class="caption-subject bold uppercase" style="margin-left:235px;">[time]</span>' +
						'		</div>' +
						'	</div>' +
						'	<div class="portlet-body form">' +
						'			<div class="form-body">' +
						'				<div class="form-group col-md-6">' +
						'					<label>公司名称</label>' +
						'					<div class="input-group">' +
						'						<span class="input-group-addon"> <i ' +
						'							class="fa fa-home"></i> ' +
						'						</span> <input type="text" class="form-control" ' +
						'							placeholder="公司名称"  readonly value="[公司名称]"> ' +
						'					</div>' +
						'				</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>营业收入（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control"' +
				'									placeholder="营业收入" readonly value="[营业收入]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>营业成本 （万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" ' +
				'									placeholder="营业成本" readonly value="[营业成本]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>营业利润（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" ' +
				'									placeholder="营业利润" readonly value="[营业利润]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>企业税费（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" ' +
				'									placeholder="企业税费" readonly value="[企业税费]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>应付职工薪酬（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" placeholder="应付职工薪酬"' +
				'									readonly value="[应付职工薪酬]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>贷款金额（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control"  ' +
				'									readonly placeholder="贷款金额" value="[贷款金额]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>从业人数 （人）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-user"></i>' +
				'								</span> <input type="text" class="form-control"' + 
				'									readonly  placeholder="从业人数" value="[从业人数]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6">' +
				'							<label>订单数量（个）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-reorder"></i>' +
				'								</span> <input type="text" class="form-control spinner"' +
				'									  readonly  placeholder="订单数量" value="[订单数量]">' +
				'							</div>' +
				'						</div>' +
				'					</div>' +
				'					<div style="height:380px;"></div>' +
				'					<div class="form-actions"  >' +
				'						[question]' +
				'					</div>' +
				'			</div>' +
				'		</div>' +
				'	</div>' +
				'</div>';
		
		
		var menuLi = '<li onclick="updateStepNumber([start],[max])" class="[class]"><a'+
					'	href="[href]" data-toggle="tab" class="step"> <span '+
					'	class="number"> [number]</span> <span class="desc"> <i '+
					'		class="fa fa-check"></i> [name] '+
					'</span></a></li>';
		
		
		
		
		
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
					<div class="col-md-12">

						<div class="portlet light bordered" id="form_wizard_1">
							<div class="portlet-title">
								<div class="caption">
									<i class=" icon-layers font-red"></i> <span
										class="caption-subject font-red bold uppercase"> 数据审核 -
										<span class="step-title" id="stepNumber"> 第1步 </span>
									</span>
								</div>
							</div>
							<div class="portlet-body form">
								<form class="form-horizontal" action="#" id="submit_form"
									method="POST" novalidate="novalidate">
									<div class="form-wizard">
										<div class="form-body">
											<ul class="nav nav-pills nav-justified steps " id="menu">
												<li onclick="updateStepNumber(3,4)" id="li3"><a
													href="#tab7" data-toggle="tab" class="step "> <span
														class="number"> 0</span> <span class="desc"> <i
															class="fa fa-check"></i> 审核
													</span>
												</a></li>
											</ul>
										</div>
										<div id="bar" class="progress progress-striped"
											role="progressbar">
											<div class="progress-bar progress-bar-success" id="progress"
												style="width: 0%"></div>
										</div>
										<div class="tab-content" id="tab">
											
										</div>
										<input type="hidden" value="${frontCompanyReport.id}"
											name="id">
										<input type="hidden" value="${frontCompanyReport.id}"
											id="reportId">
										<input type="hidden" value="${frontCompanyReport.companyName}"
											id="companyName">
										<input type="hidden" value="${redirectAttributes}"
											id="redirectAttributes">
										<div class="form-group col-md-11">
											<br>
											<button type="button" class="btn green pull-right"
												style="width: 100px;" id="return">返回</button>
											<button type="submit" class="btn blue pull-right"
												style="display: none; width: 100px;" id="submit">提交</button>
										</div>
									</div>
								</form>

							</div>
						</div>
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
