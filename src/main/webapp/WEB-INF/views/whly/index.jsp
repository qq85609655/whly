<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>${fnc:getSite(1).title}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
         <link href="/static/${whlyPage}/assets/global/css/fonts.googleapis.com.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="/static/${whlyPage}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="/static/${whlyPage}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="/static/${whlyPage}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="/static/${whlyPage}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/${whlyPage}/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="/static/${whlyPage}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <!-- <link rel="shortcut icon" href="favicon.ico" /> </head> -->
    <!-- END HEAD -->
    
    <!-- 先引用 Jquery 让content页面可以使用 顺序不用改-->
	<script src="/static/${whlyPage}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <!-- BEGIN 顶部菜单  -->
        <%@ include  file="./include/topmenu.jsp" %>
        <!-- END 顶部菜单  -->
        
        <!-- 不能删除下面一行 否则手机端样式错乱 -->
        <div class="clearfix"> </div>
        
        <!-- 内容 -->
        <div class="page-container">
        
            <!-- BEGIN 左侧部分 -->
           <%@ include  file="./include/leftmenu.jsp" %>
            <!-- END 左侧部分 -->
            <!-- BEGIN 内容 -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!-- page 菜单-->
                    <%@ include  file="./include/topBar.jsp" %>
                    
                    <!-- 主体部分-->
                   <%--  <%@ include  file="./${url}.jsp" %> --%>
                    <jsp:include page="./${url}.jsp" />
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <%@ include  file="./include/footer.jsp" %>
        
        
           <!-- BEGIN CORE PLUGINS -->
        
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="/static/${whlyPage}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="/static/${whlyPage}/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="/static/${whlyPage}/assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="/static/${whlyPage}/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
        <script src="/static/${whlyPage}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>