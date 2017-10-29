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
				    
                                            <div class="col-md-12">
                                                <div class="portlet box yellow">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-gift"></i>Actions Buttons </div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"> </a>
                                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                                            <a href="javascript:;" class="reload"> </a>
                                                            <a href="javascript:;" class="remove"> </a>
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body form">
                                                        <!-- BEGIN FORM-->
                                                        <form action="#">
                                                            <div class="form-actions top">
                                                                <div class="btn-set pull-left">
                                                                    <button type="submit" class="btn green">Submit</button>
                                                                    <button type="button" class="btn blue">Other Action</button>
                                                                </div>
                                                                <div class="btn-set pull-right">
                                                                    <button type="button" class="btn default">Action 1</button>
                                                                    <button type="button" class="btn red">Action 2</button>
                                                                    <button type="button" class="btn yellow">Action 3</button>
                                                                </div>
                                                            </div>
                                                            <div class="form-body">
                                                                <div class="form-group">
                                                                    <label class="control-label">Text</label>
                                                                    <input type="text" class="form-control" placeholder="Enter text">
                                                                    <span class="help-block"> A block of help text. </span>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Email Address</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon">
                                                                            <i class="fa fa-envelope"></i>
                                                                        </span>
                                                                        <input type="email" class="form-control" placeholder="Email Address"> </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Password</label>
                                                                    <div class="input-group">
                                                                        <input type="password" class="form-control" placeholder="Password">
                                                                        <span class="input-group-addon">
                                                                            <i class="fa fa-user"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Left Icon</label>
                                                                    <div class="input-icon">
                                                                        <i class="fa fa-bell-o"></i>
                                                                        <input type="text" class="form-control" placeholder="Left icon"> </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Right Icon</label>
                                                                    <div class="input-icon right">
                                                                        <i class="fa fa-microphone"></i>
                                                                        <input type="text" class="form-control" placeholder="Right icon"> </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Input With Spinner</label>
                                                                    <input type="password" class="form-control spinner" placeholder="Password"> </div>
                                                                <div class="form-group last">
                                                                    <label class="control-label">Static Control</label>
                                                                    <p class="form-control-static"> email@example.com </p>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <div class="btn-set pull-left">
                                                                    <button type="submit" class="btn green">Submit</button>
                                                                    <button type="button" class="btn blue">Other Action</button>
                                                                </div>
                                                                <div class="btn-set pull-right">
                                                                    <button type="button" class="btn default">Action 1</button>
                                                                    <button type="button" class="btn red">Action 2</button>
                                                                    <button type="button" class="btn yellow">Action 3</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <!-- END FORM-->
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
	   <script src="/static/${whlyPage}/js/home/home.js" type="text/javascript"></script>
    </body>
</html>
