<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<style>
.dashboard-stat.blue {
	background: #81c7f7;
}

.dashboard-stat.blue .more {
	background: #6ebcf1;
}

.dashboard-stat.red {
	background: #81c7f7;
}

.dashboard-stat.red .more {
	background: #6ebcf1;
}

.dashboard-stat.green {
	background: #81c7f7;
}

.dashboard-stat.green .more {
	background: #6ebcf1;
}

.dashboard-stat.purple {
	background: #81c7f7;
}

.dashboard-stat.purple .more {
	background: #6ebcf1;
}

.page-bar .page-breadcrumb>li>i {
	font-size: 11px;
}

.positioncx {
	margin-top: 3px;
}
</style>
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
				<div class="profile-content">
					<div class="row">
						<div class="col-md-12">
							<div class="portlet light ">
								<div class="portlet-title tabbable-line">
									<div class="caption caption-md">
										<i class="icon-globe theme-font hide"></i>
										<!-- <span class="caption-subject font-blue-madison bold uppercase">企业账户</span> -->
									</div>
									<!--    <ul class="nav nav-tabs">
                                                    <li class="active">
                                                        <a href="#tab_1_1" data-toggle="tab">个人信息</a>
                                                    </li>
                                                   
                                                    <li>
                                                        <a href="/front/user/userPwdPage" >修改密码</a>
                                                    </li>
                                                   
                                                </ul> -->
								</div>
								<div class="portlet-body">
									<div class="tab-content">
										<!-- PERSONAL INFO TAB -->
										<div class="tab-pane active" id="tab_1_1">
											<form role="form" action="${whlyPath }/user/saveUserInfo"
												onsubmit="return checkSubmit(this)" type="post">
												<!-- <sys:message content="${message}"/> -->
												<input type="hidden" value="${user.company.area.id}" id="companyHide">
												<div id="messageBox"
													class="alert alert-danger ${empty message ? 'display-hide' : ''}">
													<button class="close" data-close="alert" class="close">×</button>
													<span id="loginError">${message}</span>
												</div>
												<div class="control-group">
													<label class="control-label">头像:</label>
													<div class="controls">
														<input type="hidden" id="nameImage" name="photo"
															htmlEscape="false" maxlength="255" class="input-xlarge"
															value="${user.photo}" />
														<sys:ckfinder input="nameImage" type="images"
															uploadPath="/photo" selectMultiple="false" maxWidth="100"
															maxHeight="100" />
													</div>
												</div>


												<div class="form-group company" style="clear: both" >
													<label class="control-label positioncx"
														style="float: left;">归属公司:&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-home"></i></span> <label class="form-control"
														style="float: left; width: 60%">${user.company.name}</label>
												</div>
												<br class="company"></br>
												<div class="form-group company" style="clear: both">
													<label class="control-label positioncx"
														style="float: left;">归属部门:&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-industry"></i></span> <label class="form-control"
														style="float: left; width: 60%">${user.office.name}</label>
												</div>
												<br  class="company"></br>
												<div class="form-group" style="clear: both">
													<label class="control-label positioncx"
														style="float: left;">姓名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<%-- <span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-user"></i></span> <label class="form-control"
														style="float: left; width: 60%">${user.name}</label> --%>
															<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-user"></i></span> <input type="text"
														value="${user.name}" id="name" name="name" class="form-control"
														style="float: left; width: 60%" />
												</div>
												<br></br>
													<div class="form-group" style="clear: both">
													<label class="control-label positioncx"
														style="float: left;">登录名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-user"></i></span> <input type="text"
														value="${user.loginName}" id="loginName" name="loginName" class="form-control"
														style="float: left; width: 60%" />
												</div>
												<br></br>
												<div class="form-group" style="clear: both">
													<label class="control-label positioncx"
														style="float: left;" id="email">邮箱:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-envelope"></i></span> <input type="text"
														value="${user.email}" id="emailValue" name="email"
														class="form-control" style="float: left; width: 60%"
														onblur="checkEmail(this)" />
												</div>
												<br></br>
												<div class="form-group" style="clear: both">
													<label class="control-label positioncx"
														style="float: left;">电话:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-phone"></i></span> <input type="text"
														value="${user.phone}" name="phone" class="form-control"
														style="float: left; width: 60%" />
												</div>
												<br></br>
												<div class="form-group" style="clear: both">
													<label class="control-label positioncx"
														style="float: left;">手机:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<span class="input-group-addon"
														style="width: 50px; float: left; height: 34px;"> <i
														class="fa fa-mobile-phone"></i></span> <input type="text"
														value="${user.mobile}" name="mobile" class="form-control"
														style="float: left; width: 60%" />
												</div>
												<br></br>

												<div class="margiv-top-10" style="clear: both">
													<!-- <a href="javascript:;" class="btn green"> 保存 </a> -->
													<input type="submit" value="保存" class="btn green" />
												</div>
											</form>
										</div>
										<!-- END PERSONAL INFO TAB -->
										<!-- CHANGE AVATAR TAB -->

										<!-- END CHANGE AVATAR TAB -->
										<!-- CHANGE PASSWORD TAB -->

										<!-- END CHANGE PASSWORD TAB -->
										<!-- PRIVACY SETTINGS TAB -->

										<!-- END PRIVACY SETTINGS TAB -->
									</div>
								</div>
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
	<!-- 陈新  单独邮箱校验-->

	<script type="text/javascript">
		var email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var ss = "邮箱:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		var flag = true;
		function checkEmail(obj) {

			if (!email.test(obj.value.trim())) {
				$("#messageBox").css("display", "block");
				$("#loginError").html("邮箱错误");
				$(window).scrollTop(0);
				/* $("#email")
						.html(
								"<font color='red'>"
										+ "邮箱:*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
										+ "</font>"); */
				flag = false;
			} else {
				$("#messageBox").css("display", "none");
				$("#loginError").html("");
				$("#email").html(ss);

			}
		}

		function checkSubmit(obj) {
			flag = true;
			if($("#name").val()==""){
				$("#messageBox").css("display", "block");
				$("#loginError").html("请输入用户名！");
				$(window).scrollTop(0);
				return false;
			}
			if($("#loginName").val()==""){
				$("#messageBox").css("display", "block");
				$("#loginError").html("请输入登陆名！");
				$(window).scrollTop(0);
				return false;
			}
			var email = document.getElementById("emailValue");
			checkEmail(email);
			return flag;

		}
		
		$(function() {
			var companyHide = $('#companyHide').val();
			console.info(companyHide);
			if(!companyHide) {
				$('.company').hide();
			}
		});
		
	</script>
</body>
</html>
