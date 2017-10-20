<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
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
										<span class="step-title"> 第三步 </span>
									</span>
								</div>
								<div class="actions">
									<a class="btn btn-circle btn-icon-only btn-default"
										href="javascript:;"> <i class="icon-cloud-upload"></i>
									</a> <a class="btn btn-circle btn-icon-only btn-default"
										href="javascript:;"> <i class="icon-wrench"></i>
									</a> <a class="btn btn-circle btn-icon-only btn-default"
										href="javascript:;"> <i class="icon-trash"></i>
									</a>
								</div>
							</div>
							<div class="portlet-body form">
								<form class="form-horizontal" action="#" id="submit_form"
									method="POST" novalidate="novalidate">
									<div class="form-wizard">
										<div class="form-body">
											<ul class="nav nav-pills nav-justified steps">
												<li ><a href="#tab1" data-toggle="tab"
													class="step" aria-expanded="true"> <span class="number">
															1 </span> <span class="desc"> <i class="fa fa-check"></i>
															填报
													</span>
												</a></li>
												<li><a href="#tab2" data-toggle="tab" class="step">
														<span class="number"> 2 </span> <span class="desc">
															<i class="fa fa-check"></i> 提交
													</span>
												</a></li>
												<li class="active"><a href="#tab3" data-toggle="tab"
													class="step active"> <span class="number"> 3 </span> <span
														class="desc"> <i class="fa fa-check"></i> 审核
													</span>
												</a></li>
												<li><a href="#tab4" data-toggle="tab" class="step">
														<span class="number"> 4 </span> <span class="desc">
															<i class="fa fa-check"></i> 通过
													</span>
												</a></li>
											</ul>
											<div id="bar" class="progress progress-striped"
												role="progressbar">
												<div class="progress-bar progress-bar-success"
													style="width: 75%;"></div>
											</div>
										</div>

										<div class="tab-pane active" id="tab1">
											
											<div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-social-dribbble font-green"></i>
                                        <span class="caption-subject font-green bold uppercase">2017年8月</span>
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
                                                    <th> 指标 </th>
                                                    <th> 本月（万元）</th>
                                                    <th> 同比增速（%） </th>
                                                    <th> 本月（万元|人） </th>
                                                    <th> 环比增速（%） </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td> 营业收入合计 </td>
                                                    <td> 3520 </td>
                                                    <td> 4.1 </td>
                                                    <td> 450 </td>
                                                    <td>-18.8</td>
                                                </tr>
                                                <tr>
                                                    <td> 利润总额 </td>
                                                    <td> 247 </td>
                                                    <td> -48.6 </td>
                                                    <td> 10 </td>
                                                    <td>-88.6</td>
                                                </tr>
                                                <tr>
                                                    <td> 税收总额 </td>
                                                    <td> 128 </td>
                                                    <td> -7.2 </td>
                                                    <td> 10 </td>
                                                    <td>0 </td>
                                                </tr>
                                                <tr>
                                                    <td> 从业人员 </td>
                                                    <td>  </td>
                                                    <td>  </td>
                                                    <td> 476</td>
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
