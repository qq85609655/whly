<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta name="decorator" content="whly"/>
       <style>
       		.dashboard-stat.blue {
       			background:#81c7f7;
       		}
       		.dashboard-stat.blue .more {
       			background:#6ebcf1;
       		}
       		.dashboard-stat.red{
       			background:#81c7f7;
       		}
       		.dashboard-stat.red .more {
       			background:#6ebcf1;
       		}
       		.dashboard-stat.green {
       			background:#81c7f7;
       		}
       		.dashboard-stat.green .more {
       			background:#6ebcf1;
       		}
       		.dashboard-stat.purple {
       			background:#81c7f7;
       		}
       		.dashboard-stat.purple .more {
       			background:#6ebcf1;
       		}
       		.page-bar .page-breadcrumb > li > i {
       			font-size:11px;
       		}
       		.positioncx{
       			margin-top:5px;
       		}
       </style>
    </head>
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <!-- BEGIN 顶部菜单  -->
        <%@ include  file="../include/topmenu.jsp" %>
        <!-- END 顶部菜单  -->
        <!-- 不能删除下面一行 否则手机端样式错乱 -->
        <div class="clearfix"> </div>
        <!-- 内容 -->
        <div class="page-container">
            <!-- BEGIN 左侧部分 -->
           <%@ include  file="../include/leftmenu.jsp" %>
            <!-- END 左侧部分 -->
            
            <!-- BEGIN 右侧内容 -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!-- page 菜单-->
                    <%@ include  file="../include/topBar.jsp" %>
                    
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
                                                <!-- <ul class="nav nav-tabs">
                                                    <li >
                                                        <a href="/front/user/userInfo" >个人信息</a>
                                                    </li>
                                                   
                                                    <li class="active">
                                                        <a href="#tab_1_3" data-toggle="tab" >修改密码</a>
                                                    </li>
                                                   
                                                </ul> -->
                                            </div>
                                            <div class="portlet-body">
                                                <div class="tab-content">
                                                    <!-- PERSONAL INFO TAB -->
                                                    
                                                    <!-- END PERSONAL INFO TAB -->
                                                    <!-- CHANGE AVATAR TAB -->
                                                  
                                                    <!-- END CHANGE AVATAR TAB -->
                                                    <!-- CHANGE PASSWORD TAB -->
                                                    <div class="tab-pane active" id="tab_1_3">
                                                        <form action="/front/user/modifyPwd" id="inputForm" onsubmit="return check(this)">
                                                        <!-- <form action="/front/user/modifyPwd" id="inputForm" onsubmit="return check(this)"> -->
                                                       			 <div  id="messageBox" class="alert alert-danger ${empty message ? 'display-hide' : ''}">
                    												<button class="close" data-close="alert" class="close">×</button>
                   											 		<span id="loginError">${message}</span>
                													</div>
                                                            <div class="form-group col-md-10">
                                                                <label class="control-label positioncx " style="float:left;">旧密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                <span class="input-group-addon" style="width:50px;float:left;height:34px;" > <i class="fa fa-lock"></i></span>
                                                                <input id="oldPassword" name="oldPassword" type="password" class="form-control " style="float:left;width:60%" onblur="checkLong(this)" onkeyup="changeLong(this)"/>
                                                               	<input type="hidden" value="旧密码:"/>
                                                                 </div>
                                                            <div class="form-group col-md-10">
                                                                <label class="control-label positioncx" style="float:left;">新密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                <span class="input-group-addon" style="width:50px;float:left;height:34px;" > <i class="fa fa-unlock-alt"></i></span>
                                                                <input id="newPassword" name="newPassword" type="password" class="form-control " style="float:left;width:60%" onblur="checkLong(this)" onkeyup="changeLong(this)"/>
                                                                 <input type="hidden" value="新密码:"/>
                                                                 </div>
                                                            <div class="form-group col-md-10">
                                                                <label class="control-label positioncx" style="float:left;">确认新密码:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                <span class="input-group-addon" style="width:50px;float:left;height:34px;" > <i class="fa fa-expeditedssl"></i></span>
                                                                <input id="confirmNewPassword" name="confirmNewPassword" type="password" class="form-control" style="float:left;width:60%"   onblur="samePassword(this)" onkeyup="changeSamePassword(this)"/>
                                                                <input type="hidden" value="确认新密码:"/>
                                                                  </div>
                                                            <div class="margin-top-10 col-md-10">
                                                               <!--  <a href="javascript:;" class="btn green"> 保存 </a> -->
                                                                <input type="submit" value="保存"   class="btn green">
                                                            </div>
                                                        </form>
                                                    </div>
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
        <%@ include  file="../include/footer.jsp" %>
        <!-- js必须引用在body前面 -->
	 <!-- 陈新 -->
	 <!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	 	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				rules: {
				},
				messages: {
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script> -->
	<script type="text/javascript">
	var message="";var flag=true;var m=$("#loginError");
	var messageArray=new Array();

		function checkLong(obj){
			var nbsp="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//debugger;
			var value=obj.value.trim();
			if(value.length<3){
				var lable=$(obj).prev().prev();
				//m.html("输入长度小于3个字符");
				lable.html("<font color='red'>"+$(obj).next().val()+"*"+nbsp+"</font>");
				//$("#messageBox").css("display","block");
				addArray($(obj).next().val()+"输入长度小于3个字符");
				$(obj).css("color","red");
				flag=false;
			}else{
				var lable=$(obj).prev().prev();
				//m.html("");
				lable.html($(obj).next().val()+nbsp+"&nbsp;&nbsp;");
				removeArray($(obj).next().val()+"输入长度小于3个字符");
				//$("#messageBox").css("display","none");
				$(obj).css("color","black");
			}
			var confirmNewPassword=document.getElementById("confirmNewPassword");
			if(confirmNewPassword.value.trim()>0){
				samePassword(confirmNewPassword);
			}
		}
		function samePassword(obj){
			var nbsp="&nbsp;&nbsp;";
			var newPassword=$("#newPassword").val();
			var confirmNewPassword=$("#confirmNewPassword").val();
			if(newPassword!=confirmNewPassword){
				var lable=$(obj).prev().prev();
				lable.html("<font color='red'>"+$(obj).next().val()+"*"+nbsp+"</font>");
				//m.html("两次密码不一致");
				//$("#messageBox").css("display","block");
				addArray("两次密码不一致");
				$(obj).css("color","red");
				flag=false;
			}else{
				var lable=$(obj).prev().prev();
				lable.html($(obj).next().val()+nbsp+"&nbsp;&nbsp;");
				removeArray("两次密码不一致");
				
				//m.html("");
				//$("#messageBox").css("display","none");
				$(obj).css("color","black");
			}
		}
		
		function check(obj){
		
			flag=true;
			var oldPassword=document.getElementById("oldPassword");
			var newPassword=document.getElementById("newPassword");
			 var v=oldPassword.innerHTML;
			checkLong(oldPassword);
			checkLong(newPassword);
			return flag;
			
		}
		
		/*遍历数组 并判断是否还显示错误  */
			function addArray(content){
				var f=true;
				var mm="";
				//debugger;
				for(var i=0;i<messageArray.length;i++){
					var mess=messageArray[i];
					if(mess==""){
						continue;
					}
					mm+=mess+"&nbsp;&nbsp;&nbsp;&nbsp;";
					if(content==mess){
						f=false;
					}
				}
				if(f){
					messageArray.push(content);
					mm+=content+"&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				if(mm.trim().length>0){
					m.html(mm);
					$("#messageBox").css("display","block");
				}else{
					$("#messageBox").css("display","none");
				}
				
			
			}
			function removeArray(content){
			//debugger;
				var mm=""
				for(var i=0;i<messageArray.length;i++){
					if(content==messageArray[i]){
						messageArray[i]="";
						
					}else{
						if(messageArray[i]!="")
						mm+=messageArray[i]+"&nbsp;&nbsp;&nbsp;&nbsp;";
						
					}
				}
				if(mm.trim().length>0){
					m.html(mm);
					$("#messageBox").css("display","block");
				}else{
					$("#messageBox").css("display","none");
				}
			}
		
	/*change  */
			function changeLong(obj){
		debugger;
			var nbsp="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//debugger;
			var value=obj.value.trim();
			if(value.length<3){
				var lable=$(obj).prev().prev();
				lable.html("<font color='red'>"+$(obj).next().val()+"*"+nbsp+"</font>");
				$(obj).css("color","red");
			}else{
				var lable=$(obj).prev().prev();
				lable.html($(obj).next().val()+nbsp+"&nbsp;&nbsp;");
				$(obj).css("color","black");
			}
			var confirmNewPassword=document.getElementById("confirmNewPassword");
			if(confirmNewPassword.value.trim()>0){
				samePassword(confirmNewPassword);
			}
		}
	
			function changeSamePassword(obj){
				var nbsp="&nbsp;&nbsp;";
				var newPassword=$("#newPassword").val();
				var confirmNewPassword=$("#confirmNewPassword").val();
				if(newPassword!=confirmNewPassword){
					var lable=$(obj).prev().prev();
					lable.html("<font color='red'>"+$(obj).next().val()+"*"+nbsp+"</font>");
					$(obj).css("color","red");
				}else{
					var lable=$(obj).prev().prev();
					lable.html($(obj).next().val()+nbsp+"&nbsp;&nbsp;");
					$(obj).css("color","black");
				}
			}
	</script>
	
	
    </body>
</html>
