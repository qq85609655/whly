<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<script type="text/javascript">
	var step = 1;
	$(function() {
		/* $("#previous").click(previousStep); //上一步点击事件
		$("#next").click(nextStep);  *///下一步点击事件 
	});
	//上一步
	function previousStep() {
		if(step>1) {
			step--;
		}
		updatePage(step);
	}
	//下一步
	function nextStep() {
		if(step<4) {
			step++;
		}
		updatePage(step);
	}
	function updatePage(step) {
		//改变当前显示的步数
		updateStepNumber(step);
		//改变当前进度条
		updateProgress(step);
		//改变当前主要显示内容
		updateMain(step);
		//改变当前操作的菜单
		updateMenu(step);
		//判断是否是首末页
		judgeFirstLast(step);
	} 
	//判断是否是首末页
	function judgeFirstLast(step) {
		$('#previous').attr("style","display:none;");
		$('#next').attr("style","display:none;");
		$('#submit').attr("style","display:none;");
		if(step==1) {
			$('#next').attr("style","");
		}
		if(step>1 && step<4) {
			$('#previous').attr("style","");
			$('#next').attr("style","");
		}
		if(step==4) {
			$('#previous').attr("style","");
			$('#submit').attr("style","");
		}
	}
	//改变当前操作的菜单选中
	function updateMenu(step) {
		for(var i=1;i<=4;i++) {
			$("#li"+i).attr("class","");
		}
		$("#li"+step).attr("class","active");
	}
	//改变当前主要显示内容
	function updateMain(step) {
		var Main = null;
		for(var i=1;i<=4;i++) {
			$("#tab"+i).attr("style","display:none;");
		}
		$("#tab"+step).attr("style","");
	}
	//改变当前进度条
	function updateProgress(step,max) {
		var progress = step/max*100 +"%";
		

		if(progress!=null) {
			$("#progress").attr("style","width:"+progress+";"); //修改当前进度条百分比
		}
	}
	//改变当前显示的步数
	function updateStepNumber(step,max) {
		var stepNumber = null;
		if(step==1) {
			stepNumber = "第一步";
		} else if(step==2) {
			stepNumber = "第二步";
		} else if(step==3) {
			stepNumber = "第三步";
		} else if(step==4) {
			stepNumber = "第四步";
		}
		var progress = step/max*100 +"%";
		if(progress!=null) {
			$("#progress").attr("style","width:"+progress+";"); //修改当前进度条百分比
		}
		if(stepNumber!=null) {
			$("#stepNumber").html("第"+ step + "步"); //修改当前步数的文本
		}
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
											<ul class="nav nav-pills nav-justified steps ">
												<li onclick="updateStepNumber(1,4)" id="li1" class="active"><a
													href="#tab1" data-toggle="tab" class="step"> <span
														class="number"> 1 </span> <span class="desc"> <i
															class="fa fa-check"></i> 填报
													</span>
												</a></li>
												<li onclick="updateStepNumber(2,4)" id="li2"><a
													href="#tab2" data-toggle="tab" class="step"> <span
														class="number"> 2 </span> <span class="desc"> <i
															class="fa fa-check"></i> 提交
													</span>
												</a></li>
												<li onclick="updateStepNumber(3,4)" id="li3"><a
													href="#tab3" data-toggle="tab" class="step active"> <span
														class="number"> 3 </span> <span class="desc"> <i
															class="fa fa-check"></i> 审核
													</span>
												</a></li>
												<li onclick="updateStepNumber(4,4)" id="li4"><a
													href="#tab4" data-toggle="tab" class="step"> <span
														class="number"> 4 </span> <span class="desc"> <i
															class="fa fa-check"></i> 通过
													</span>
												</a></li>
											</ul>
										</div>
										<div id="bar" class="progress progress-striped"
											role="progressbar">
											<div class="progress-bar progress-bar-success" id="progress"
												style="width: 25%"></div>
										</div>
										<div class="tab-content">
											<div class="tab-pane active" id="tab1">
												<div class="row">
													<div class="col-md-6 col-md-offset-3">
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
																			<li><a href="javascript:;"> <i
																					class="fa fa-pencil"></i> Edit
																			</a></li>
																			<li><a href="javascript:;"> <i
																					class="fa fa-trash-o"></i> Delete
																			</a></li>
																			<li><a href="javascript:;"> <i
																					class="fa fa-ban"></i> Ban
																			</a></li>
																			<li class="divider"></li>
																			<li><a href="javascript:;"> Make admin </a></li>
																		</ul>
																	</div>
																</div>
															</div>
															<div class="portlet-body form">
																<div class="form-body">
																	<div class="form-group">
																		<label>营业收入（万元）</label>
																		<div class="input-group">
																			<span class="input-group-addon" id="sizing-addon1">￥</span>
																			<input readonly type="text" class="form-control"
																				aria-describedby="sizing-addon1">
																		</div>
																	</div>
																	<div class="form-group">
																		<label>利润总额（万元）</label>
																		<div class="input-group">
																			<span class="input-group-addon" id="sizing-addon1">￥</span>
																			<input readonly type="text" class="form-control"
																				aria-describedby="sizing-addon1">
																		</div>
																	</div>
																	<div class="form-group">
																		<label>税收总额（万元）</label>
																		<div class="input-group">
																			<span class="input-group-addon" id="sizing-addon1">￥</span>
																			<input readonly type="text" class="form-control"
																				aria-describedby="sizing-addon1">
																		</div>
																	</div>
																	<div class="form-group">
																		<label>从业人员</label>
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input readonly type="text" class="form-control">
																		</div>
																	</div>

																</div>
															</div>
															<div class="table-scrollable">
																<table
																	class="table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer"
																	id="sample_1" role="grid"
																	aria-describedby="sample_1_info">
																	<thead>
																		<tr role="row">
																			<th class="sorting_asc" tabindex="0"
																				aria-controls="sample_1" rowspan="1" colspan="1"
																				aria-sort="ascending"
																				aria-label=" year : activate to sort column descending"
																				style="width: 30%;">标题</th>
																			<th class="sorting_asc" tabindex="0"
																				aria-controls="sample_1" rowspan="1" colspan="1"
																				aria-sort="ascending"
																				aria-label=" month : activate to sort column descending"
																				style="width: 70%;">内容</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${page.list}"
																			var="frontCompanyReport">
																			<tr class="gradeX odd" role="row">

																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane " id="tab2">
												<div class="portlet light bordered">
													<div class="portlet-title">
														<div class="caption">
															<i class="icon-social-dribbble font-green"></i> <span
																class="caption-subject font-green bold uppercase">2017年8月</span>
														</div>
														<!--  <div class="actions">
				                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
				                                            <i class="icon-cloud-upload"></i>
				                                        </a>
				                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
				                                            <i class="icon-wrench"></i>
				                                        </a>
				                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
				                                            <i class="icon-trash"></i>
				                                        </a>
				                                    </div> -->
													</div>
													<div class="portlet-body">
														<div class="table-scrollable">
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>指标</th>
																		<th>本月（万元）</th>
																		<th>同比增速（%）</th>
																		<th>本月（万元|人）</th>
																		<th>环比增速（%）</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>营业收入合计</td>
																		<td>3520</td>
																		<td>4.1</td>
																		<td>450</td>
																		<td>-18.8</td>
																	</tr>
																	<tr>
																		<td>利润总额</td>
																		<td>247</td>
																		<td>-48.6</td>
																		<td>10</td>
																		<td>-88.6</td>
																	</tr>
																	<tr>
																		<td>税收总额</td>
																		<td>128</td>
																		<td>-7.2</td>
																		<td>10</td>
																		<td>0</td>
																	</tr>
																	<tr>
																		<td>从业人员</td>
																		<td></td>
																		<td></td>
																		<td>476</td>
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="form-actions text-center">
														<div class="col-md-8 col-md-offset-2">
															<div class="form-group">
																<label>审核意见</label>
																<textarea class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane " id="tab3">
												<div class="portlet light bordered">
													<div class="portlet-title">
														<div class="caption">
															<i class="icon-social-dribbble font-green"></i> <span
																class="caption-subject font-green bold uppercase">2017年8月</span>
														</div>
														<!--  <div class="actions">
				                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
				                                            <i class="icon-cloud-upload"></i>
				                                        </a>
				                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
				                                            <i class="icon-wrench"></i>
				                                        </a>
				                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
				                                            <i class="icon-trash"></i>
				                                        </a>
				                                    </div> -->
													</div>
													<div class="portlet-body">
														<div class="table-scrollable">
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>指标</th>
																		<th>本月（万元）</th>
																		<th>同比增速（%）</th>
																		<th>本月（万元|人）</th>
																		<th>环比增速（%）</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>营业收入合计</td>
																		<td>3520</td>
																		<td>4.1</td>
																		<td>450</td>
																		<td>-18.8</td>
																	</tr>
																	<tr>
																		<td>利润总额</td>
																		<td>247</td>
																		<td>-48.6</td>
																		<td>10</td>
																		<td>-88.6</td>
																	</tr>
																	<tr>
																		<td>税收总额</td>
																		<td>128</td>
																		<td>-7.2</td>
																		<td>10</td>
																		<td>0</td>
																	</tr>
																	<tr>
																		<td>从业人员</td>
																		<td></td>
																		<td></td>
																		<td>476</td>
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="form-actions text-center">
														<button type="button" class="btn btn-success">批准</button>
														<button type="button" class="btn btn-danger">不批准</button>
														<br> <br>
														<div class="col-md-8 col-md-offset-2">
															<div class="form-group">
																<label>审核意见</label>
																<textarea class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane " id="tab4">44444444</div>
											<!-- <div class="form-actions">
											<div class="row">
												<div class="col-md-offset-5 col-md-9">
													<div class="btn default button-previous"
														id="previous" style="display: none"> <i class="fa fa-angle-left"></i> 上一步
													</div> <div 
														class="btn btn-outline green button-next" id="next">
														下一步 <i class="fa fa-angle-right"></i> 
													</div> <a href="javascript:;" class="btn green button-submit"
														id="submit" style="display: none"> 提交 <i
														class="fa fa-check"></i>
													</a>
												</div>
											</div>
										</div> -->
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
