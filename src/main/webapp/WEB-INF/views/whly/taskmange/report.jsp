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
                        <div class="col-md-6 col-md-offset-3">
                            <!-- BEGIN SAMPLE FORM PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption font-red-sunglo">
                                        <i class="icon-settings font-red-sunglo"></i>
                                        <span class="caption-subject bold uppercase"> 营业收入、利润总额、税收总额请填写企业单月数据，不要填写累计数据</span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group">
                                           
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Delete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-ban"></i> Ban </a>
                                                </li>
                                                <li class="divider"> </li>
                                                <li>
                                                    <a href="javascript:;"> Make admin </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <form role="form">
                                        <div class="form-body">
										<div class="form-group">
                                                <label>营业收入（万元）</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="sizing-addon1">￥</span>
                                                    <input type="text" class="form-control" placeholder="单位：（万元）" aria-describedby="sizing-addon1"> </div>
                                            </div>
											<div class="form-group">
                                                <label>利润总额（万元）</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="sizing-addon1">￥</span>
                                                    <input type="text" class="form-control" placeholder="单位：（万元）" aria-describedby="sizing-addon1"> </div>
                                            </div>
											<div class="form-group">
                                                <label>税收总额（万元）</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="sizing-addon1">￥</span>
                                                    <input type="text" class="form-control" placeholder="单位：（万元）" aria-describedby="sizing-addon1"> </div>
                                            </div>
                                            <div class="form-group">
                                                <label>从业人员</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </span>
                                                    <input type="text" class="form-control" placeholder="单位：（人）">
													</div>
                                            </div>
                                          
                                        </div>
                                        <!-- <div class="form-actions"> -->
                                            <button type="submit" class="btn default pull-right">取消</button>
                                            <button type="button" class="btn blue pull-right">提交</button>
										<!-- </div> -->
											<br><br><br>
										<div class="form-actions">
											<button type="button" class="btn btn-success">新增</button>
											<button type="button" class="btn btn-danger">删除</button>
											<br><br>
											<div class="form-group">
                                                <label>标题</label>
                                                <input class="form-control spinner" type="text" placeholder=""> </div>
											<div class="form-group">
                                                <label>内容</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END SAMPLE FORM PORTLET-->
                           
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
    </body>
</html>
