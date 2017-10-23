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
                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption font-dark">
                                        <i class="icon-settings font-dark"></i>
                                        <span class="caption-subject bold uppercase"> 数据列表</span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-toolbar">
                                        <div class="row">
                                           <!--  <div class="col-md-6" style="">
                                                <div class="btn-group">
                                                    <button id="sample_editable_1_new" class="btn sbold green"> Add New
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="btn-group pull-right">
                                                    <button class="btn green  btn-outline dropdown-toggle" data-toggle="dropdown">工具栏
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-print"></i> 打印 </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-pdf-o"></i> 保存为PDF </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-excel-o"></i> 保存为Excel </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div id="sample_1_wrapper" class="dataTables_wrapper no-footer"><div class="row"><div class="col-md-6 col-sm-6"><div class="dataTables_length" id="sample_1_length"><label>Show <select name="sample_1_length" aria-controls="sample_1" class="form-control input-sm input-xsmall input-inline"><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="-1">All</option></select></label></div></div><div class="col-md-6 col-sm-6"><div id="sample_1_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm input-small input-inline" placeholder="" aria-controls="sample_1"></label></div></div></div><div class="table-scrollable"><table class="table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer" id="sample_1" role="grid" aria-describedby="sample_1_info">
                                        <thead>
                                            <tr role="row">
                                                   <th class="sorting_asc" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-sort="ascending" aria-label=" Username : activate to sort column descending" style="width: 150px;"> 上报企业名称 </th>
                                                   <!-- <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Email : activate to sort column ascending" style="width:124px;"> 审批状态 </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Email : activate to sort column ascending" style="width: 227px;"> 所属行业 </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Points : activate to sort column ascending" style="width: 150px;"> 所属地域 </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Joined : activate to sort column ascending" style="width: 113px;"> 营业收入（万元） </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 124px;"> 利润总额（万元） </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 124px;"> 税收总额（万元） </th>
                                                    <th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Status : activate to sort column ascending" style="width: 124px;"> 从业人员 </th> -->
                                                    </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${page.list}" var="frontCompanyReport">
											<tr  class="gradeX odd" role="row">
												<td class="center"><a href="${ctx}/report/frontCompanyReport/form?id=${frontCompanyReport.id}">
													${frontCompanyReport.area.name}
												</a></td>
												
											</tr>
										</c:forEach>
                                         <!--  <tr class="gradeX odd" role="row">
                                                <td><div class="checker"><span><input type="checkbox" class="checkboxes" value="1"></span></div> </td>
                                                <td><span class="label label-sm label-success"> 已审核  </span></td>
                                                <td class="sorting_1"> 文登市顺丰货运服务有限公司 </td>
                                                <td class="center">现代物流</td>
                                                <td class="center"> 文登区</td>
                                                <td class="center">43 </td>
                                                <td  class="center">2.6</td>
                                                <td  class="center">2.2</td>
                                                <td  class="center">8</td>
                                            </tr>
                                            <tr class="gradeX even" role="row">
                                                <td><div class="checker"><span><input type="checkbox" class="checkboxes" value="1"></span></div> </td>
                                                <td><span class="label label-sm label-warning"> 未审核  </span></td>
                                                <td class="sorting_1"> 文登市昆嵛酒店有限公司 </td>
                                                <td class="center">旅游休闲</td>
                                                <td class="center"> 南海新区</td>
                                                <td class="center">22.8</td>
                                                <td  class="center">0.8</td>
                                                <td  class="center">0.68</td>
                                                <td  class="center">45</td>
                                            </tr> -->
                                         
                                            </tbody>
                                    </table></div><div class="row"><div class="col-md-5 col-sm-5"><div class="dataTables_info" id="sample_1_info" role="status" aria-live="polite">Showing 1 to 5 of 25 records</div></div><div class="col-md-7 col-sm-7"><div class="dataTables_paginate paging_bootstrap_full_number" id="sample_1_paginate"><ul class="pagination" style="visibility: visible;"><li class="prev disabled"><a href="#" title="First"><i class="fa fa-angle-double-left"></i></a></li><li class="prev disabled"><a href="#" title="Prev"><i class="fa fa-angle-left"></i></a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li class="next"><a href="#" title="Next"><i class="fa fa-angle-right"></i></a></li><li class="next"><a href="#" title="Last"><i class="fa fa-angle-double-right"></i></a></li></ul></div></div></div></div>
                                </div>
                            </div>
                            <!-- END EXAMPLE TABLE PORTLET-->
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
