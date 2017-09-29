<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 左侧菜单 -->
 <div class="page-sidebar-wrapper">
     <!-- BEGIN SIDEBAR -->
     <div class="page-sidebar navbar-collapse collapse">
         <!-- BEGIN SIDEBAR MENU -->
         <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
             <li class="sidebar-toggler-wrapper hide">
                 <div class="sidebar-toggler"> </div>
             </li>
             
             <!-- 搜索 -->
             <li class="sidebar-search-wrapper">
                 <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                     <a href="javascript:;" class="remove">
                         <i class="icon-close"></i>
                     </a>
                     <div class="input-group">
                         <input type="text" class="form-control" placeholder="Search...">
                         <span class="input-group-btn">
                             <a href="javascript:;" class="btn submit">
                                 <i class="icon-magnifier"></i>
                             </a>
                         </span>
                     </div>
                 </form>
             </li>
             
             <!-- 左侧菜单项 -->
             <li class="nav-item start active open">
                 <a href="javascript:;" class="nav-link nav-toggle">
                     <i class="icon-home"></i>
                     <span class="title">Dashboard-${id }</span>
                     <span class="selected"></span>
                     <span class="arrow open"></span>
                 </a>
                 <ul class="sub-menu">
                     <li class="nav-item start active open">
                         <a href="index.html" class="nav-link ">
                             <i class="icon-bar-chart"></i>
                             <span class="title">Dashboard 1</span>
                             <span class="selected"></span>
                         </a>
                     </li>
                 </ul>
             </li>
             <li class="heading">
                 <h3 class="uppercase">监管全景</h3>
             </li>
             <li class="nav-item  ">
                 <a href="javascript:;" class="nav-link nav-toggle">
                     <i class="icon-diamond"></i>
                     <span class="title">菜单1</span>
                     <span class="arrow"></span>
                 </a>
                 <ul class="sub-menu">
                     <li class="nav-item  ">
                         <a href="ui_colors.html" class="nav-link ">
                             <span class="title">菜单1-1</span>
                         </a>
                     </li>
                     <li class="nav-item  ">
                         <a href="ui_general.html" class="nav-link ">
                             <span class="title">菜单1-2</span>
                         </a>
                     </li>
                 </ul>
             </li>
             <li class="heading">
                 <h3 class="uppercase">机构透视</h3>
             </li>
             <li class="nav-item  ">
                 <a href="javascript:;" class="nav-link nav-toggle">
                     <i class="icon-settings"></i>
                     <span class="title">风险画像</span>
                     <span class="arrow"></span>
                 </a>
                 <ul class="sub-menu">
                     <li class="nav-item  ">
                         <a href="page_system_coming_soon.html" class="nav-link " target="_blank">
                             <span class="title">菜单1</span>
                         </a>
                     </li>
                     <li class="nav-item  ">
                         <a href="page_system_404_1.html" class="nav-link ">
                             <span class="title">菜单2</span>
                         </a>
                     </li>
                    
                 </ul>
             </li>
             <li class="nav-item">
                 <a href="javascript:;" class="nav-link nav-toggle">
                     <i class="icon-folder"></i>
                     <span class="title">指标对比</span>
                     <span class="arrow "></span>
                 </a>
                 <ul class="sub-menu">
                     <li class="nav-item">
                         <a href="javascript:;" class="nav-link nav-toggle">
                             <i class="icon-settings"></i> 菜单1
                             <span class="arrow"></span>
                         </a>
                         <ul class="sub-menu">
                             <li class="nav-item">
                                 <a href="javascript:;" target="_blank" class="nav-link">
                                     <i class="icon-user"></i>菜单1-1
                                     <span class="arrow nav-toggle"></span>
                                 </a>
                                 <ul class="sub-menu">
                                     <li class="nav-item">
                                         <a href="#" class="nav-link">
                                             <i class="icon-power"></i> 菜单1-1-1</a>
                                     </li>
                                     <li class="nav-item">
                                         <a href="#" class="nav-link">
                                             <i class="icon-paper-plane"></i>菜单1-1-2</a>
                                     </li>
                                 </ul>
                             </li>
                             
                         </ul>
                     </li>
                     <li class="nav-item">
                         <a href="javascript:;" target="_blank" class="nav-link">
                             <i class="icon-globe"></i> 菜单2
                             <span class="arrow nav-toggle"></span>
                         </a>
                         <ul class="sub-menu">
                             <li class="nav-item">
                                 <a href="#" class="nav-link">
                                     <i class="icon-tag"></i> 菜单2-1</a>
                             </li>
                             <li class="nav-item">
                                 <a href="#" class="nav-link">
                                     <i class="icon-pencil"></i> 菜单2-2</a>
                             </li>
                         </ul>
                     </li>
                     <li class="nav-item">
                         <a href="#" class="nav-link">
                             <i class="icon-bar-chart"></i> 菜单3 </a>
                     </li>
                 </ul>
             </li>
         </ul>
         <!-- END SIDEBAR MENU -->
         <!-- END SIDEBAR MENU -->
     </div>
     <!-- END SIDEBAR -->
 </div>
