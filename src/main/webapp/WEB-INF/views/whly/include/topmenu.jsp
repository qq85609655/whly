<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 顶部菜单 -->
<div class="page-header navbar navbar-fixed-top">
      <!-- BEGIN HEADER INNER -->
      <div class="page-header-inner ">
      
          <!-- 系统图标 -->
          <div class="page-logo">
              	   <c:if test="${not empty fnc:getSite(1).logo}">
		              <a href="${whlyPath}/home">
			                  <img src="${fnc:getSite(1).logo}" alt="logo"  class="logo-default" />
		              </a>
				   </c:if>  
              <div class="menu-toggler sidebar-toggler my-menu"> </div>
          </div>
          <!-- 手机端 菜单控制按钮 -->
          <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
          <!-- 顶部导航 -->
          <div class="top-menu">
              <ul class="nav navbar-nav pull-right">
              <!-- 邮件 -->
                  <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
                      <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                          <i class="icon-envelope-open"></i>
                          <span class="badge badge-default"> 4 </span>
                      </a>
                      <ul class="dropdown-menu">
                          <li class="external">
                              <h3>You have
                                  <span class="bold">7 New</span> Messages</h3>
                              <a href="app_inbox.html">view all</a>
                          </li>
                          <li>
                              <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                                  <li>
                                      <a href="#">
                                          <span class="photo">
                                              <img src="/static/${whlyPage}/assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                          <span class="subject">
                                              <span class="from"> Lisa Wong </span>
                                              <span class="time">Just Now </span>
                                          </span>
                                          <span class="message"> Vivamus sed auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                          <span class="photo">
                                              <img src="/static/${whlyPage}/assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                          <span class="subject">
                                              <span class="from"> Richard Doe </span>
                                              <span class="time">16 mins </span>
                                          </span>
                                          <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                          <span class="photo">
                                              <img src="/static/${whlyPage}/assets/layouts/layout3/img/avatar1.jpg" class="img-circle" alt=""> </span>
                                          <span class="subject">
                                              <span class="from"> Bob Nilson </span>
                                              <span class="time">2 hrs </span>
                                          </span>
                                          <span class="message"> Vivamus sed nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                          <span class="photo">
                                              <img src="/static/${whlyPage}/assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                          <span class="subject">
                                              <span class="from"> Lisa Wong </span>
                                              <span class="time">40 mins </span>
                                          </span>
                                          <span class="message"> Vivamus sed auctor 40% nibh congue nibh... </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                          <span class="photo">
                                              <img src="/static/${whlyPage}/assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                          <span class="subject">
                                              <span class="from"> Richard Doe </span>
                                              <span class="time">46 mins </span>
                                          </span>
                                          <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </li>
                  <!-- 用户中心 -->
                  <li class="dropdown dropdown-user">
                      <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                          <img alt="" class="img-circle" src="
	                         <c:choose>  
							   <c:when test="${empty fns:getUser().photo}">
							   	/static/${whlyPage}/assets/layouts/layout/img/avatar3_small.jpg
							   </c:when>  
							   <c:otherwise>  
							  	 ${fns:getUser().photo}
							   </c:otherwise>  
							</c:choose>  
                         " />
                          <span class="username username-hide-on-mobile"> ${fns:getUser().loginName} </span>
                          <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu dropdown-menu-default">
                      	   <c:choose>  
							   <c:when test="${empty fns:getUser().id}">
							   		<!-- 用户没有登录 -->
							   		 <li>
			                              <a href="${whlyPath }/login">
			                                  <i class="icon-user"></i> 登录</a>
			                          </li>
			                           <li class="divider"> </li>
							   </c:when>  
							   <c:otherwise>  
							   	<!-- 用户已经登录 -->
							  	  <li>
		                              <a href="/front/user/userInfo">
		                                  <i class="icon-user"></i> 个人信息 </a>
		                          </li>
		                          <li>
		                              <a href="/front/user/userPwdPage">
		                                  <i class="fa fa-lock"></i> 更改密码
		                              </a>
		                          </li>
		                          <li>
		                              <a href="javascript:void(0);">
		                                  <i class="icon-rocket"></i> 待办
		                                  <span class="badge badge-success"> 7 </span>
		                              </a>
		                          </li>
		                        
		                          <li class="divider"> </li>
		                          <li  id="btnLogout">
		                              <a href="javascript:void(0);">
		                                  <i class="icon-key"></i> 退出 </a>
		                          </li>
							   </c:otherwise>  
							</c:choose>  
                         
                      </ul>
                  </li>
              </ul>
          </div>
          <!-- 顶部菜单结束 -->
      </div>
      <!-- END HEADER INNER -->
  </div>
      <script type="text/javascript">
   		$('#btnLogout').click(function(){
   			window.location.href="${whlyPath}/logout";
   		});
   		$(".my-menu").click(function(){
   			if(!$(this).hasClass("menu_css")){
   				//收
   				$(".page-logo").css("width","45px");
   				$(this).addClass("menu_css")
   			}else{
   				$(".page-logo").css("width","235px");
   				$(this).removeClass("menu_css")
   			}
   		});
    </script>