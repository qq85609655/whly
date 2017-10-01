<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta name="decorator" content="whly"/>
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
                    <div class="row">
				         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				             <div class="dashboard-stat blue">
				                 <div class="visual">
				                     <i class="fa fa-comments"></i>
				                 </div>
				                 <div class="details">
				                     <div class="number">
				                         <span data-counter="counterup" data-value="1349">0</span>
				                     </div>
				                     <div class="desc"> New Feedbacks </div>
				                 </div>
				                 <a class="more" href="javascript:;"> View more
				                     <i class="m-icon-swapright m-icon-white"></i>
				                 </a>
				             </div>
				         </div>
				         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				             <div class="dashboard-stat red">
				                 <div class="visual">
				                     <i class="fa fa-bar-chart-o"></i>
				                 </div>
				                 <div class="details">
				                     <div class="number">
				                         <span data-counter="counterup" data-value="12,5">0</span>M$ </div>
				                     <div class="desc"> Total Profit </div>
				                 </div>
				                 <a class="more" href="javascript:;"> View more
				                     <i class="m-icon-swapright m-icon-white"></i>
				                 </a>
				             </div>
				         </div>
				         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				             <div class="dashboard-stat green">
				                 <div class="visual">
				                     <i class="fa fa-shopping-cart"></i>
				                 </div>
				                 <div class="details">
				                     <div class="number">
				                         <span data-counter="counterup" data-value="549">0</span>
				                     </div>
				                     <div class="desc"> New Orders </div>
				                 </div>
				                 <a class="more" href="javascript:;"> View more
				                     <i class="m-icon-swapright m-icon-white"></i>
				                 </a>
				             </div>
				         </div>
				         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				             <div class="dashboard-stat purple">
				                 <div class="visual">
				                     <i class="fa fa-globe"></i>
				                 </div>
				                 <div class="details">
				                     <div class="number"> +
				                         <span data-counter="counterup" data-value="89"></span>% </div>
				                     <div class="desc"> Brand Popularity </div>
				                 </div>
				                 <a class="more" href="javascript:;"> View more
				                     <i class="m-icon-swapright m-icon-white"></i>
				                 </a>
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
	   <script src="/static/${whlyPage}/js/home/home.js" type="text/javascript"></script>
    </body>
</html>
