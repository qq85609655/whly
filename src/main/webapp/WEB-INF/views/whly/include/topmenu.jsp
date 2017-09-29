<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 顶部菜单 -->
<div class="page-header navbar navbar-fixed-top">
      <!-- BEGIN HEADER INNER -->
      <div class="page-header-inner ">
      
          <!-- 系统图标 -->
          <div class="page-logo">
              <a href="${whlyPath}/r/home">
                  <img src="/whly/assets/layouts/layout/img/logo.png" alt="logo" class="logo-default" /> </a>
              <div class="menu-toggler sidebar-toggler"> </div>
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
                                              <img src="/whly/assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
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
                                              <img src="/whly/assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
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
                                              <img src="/whly/assets/layouts/layout3/img/avatar1.jpg" class="img-circle" alt=""> </span>
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
                                              <img src="/whly/assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
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
                                              <img src="/whly/assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
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
                          <img alt="" class="img-circle" src="/whly/assets/layouts/layout/img/avatar3_small.jpg" />
                          <span class="username username-hide-on-mobile"> Nick </span>
                          <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu dropdown-menu-default">
                          <li>
                              <a href="page_user_profile_1.html">
                                  <i class="icon-user"></i> 个人信息 </a>
                          </li>
                          <li>
                              <a href="app_todo.html">
                                  <i class="icon-rocket"></i> 待办
                                  <span class="badge badge-success"> 7 </span>
                              </a>
                          </li>
                          <li class="divider"> </li>
                          <li>
                              <a href="page_user_login_1.html">
                                  <i class="icon-key"></i> 退出 </a>
                          </li>
                      </ul>
                  </li>
              </ul>
          </div>
          <!-- 顶部菜单结束 -->
      </div>
      <!-- END HEADER INNER -->
  </div>