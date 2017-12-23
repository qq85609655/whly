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
       </style>
       <style>
/****************************table*******************************/
.table .gradeX td {
	
}

.table .gradeX td:last-child a {
	color: #333;
	padding: 0;
	font-size: 12px;
}

/*************************pagination***********************/
.pagination {
	/*background:#d00;*/
	width: 100%;
}

.pagination  ul li {
	list-style: none;
	float: left;
	margin: 0 1%;
}

.pagination  ul li a {
	float: left;
	width: 100%;
	color: #333;
}

.pagination  ul li:first-child {
	margin-left: 15%;
}

.pagination  ul .active a {
	text-decoration: underline;
}

.pagination  ul .disabled a {
	color: #ccc;
}

.pagination  ul .controls {
	margin-left: 5%;
	margin-top: -.3%;
}

.pagination  ul .controls input {
	width: 2em;
	outline: none;
}

.pagination  ul .controls a {
	color: #333;
}

.pagination  ul .controls a:hover {
	text-decoration: none;
}

.btn.green:not (.btn-outline ) {
	background: #84d3da;
	border: 0;
}

.control-label {
	margin-top: 1px;
	font-weight: 400;
	text-align: right;
	padding: 6px 0px;
}

.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width:111px;
	/* display:block; */
}

</style>
<script type="text/javascript">
	$(function() {
		//删除多余元素
		$("#sample_1_length").remove();
		$("#sample_1_filter").remove();
		$("#sample_1_info").remove();
		$("#sample_1_paginate").remove();
		contentShow();
		//设置表格宽度
		style();
	});
	
	function style() {
		$(".table-striped").css("tableLayout","fixed");
		$(".table-striped .width_1").css("width","60px");
		$(".table-striped .width_2").css("width","120px");
		$(".table-striped .width_3").css("width","150px");
		$(".table-striped .width_9").css("width","80px");
	}

	// 根据当前登录用户企业所属类型 来页面展示的内容
	function contentShow() {
		var type = $('#companyParentType').val();
		if (type == "1") {
			$('.type_emphasis').show();
		} else if (type == "2") {
			$('.type_quota').show();
		} else if (type == "3") {
			$('.type_support').show();
		}
	}



	//分页
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
</script>
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
                    <form:form id="searchForm" modelAttribute="frontCompanyReport"
						action="${whlyPath}/home"
						method="post" class="breadcrumb form-search">
						<input id="pageNo" name="pageNo" type="hidden"
							value="${page.pageNo}" />
						<input id="pageSize" name="pageSize" type="hidden"
							value="${page.pageSize}" />
				        <input type="hidden" name="pcid" value="${pcid}" id="pcid">
				        <input type="hidden" id="vType" name="status" value="${status}" >
				        <input type="hidden"  name="exportType" value="${companyParentType}"
							id="companyParentType">
                    <div class="row">
				         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				             <div class="dashboard-stat blue">
				                 <div class="visual">
				                     <i class="fa fa-comments"></i>
				                 </div>
				                 <div class="details">
				                     <div class="number" id="num_passed">
				                          <span data-counter="counterup"  data-value="0">0</span>家
				                     </div>
				                     <div class="desc"> 已审核 </div>
				                 </div>
				                 <a class="more" href="javascript:;" onclick="getBottomData('PASSED')"> 查看详情
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
				                     <div class="number" id="num_unpassed">
				                         <span data-counter="counterup"  data-value="0">0</span>家
				                     </div>
				                     <div class="desc">未通过 </div>
				                 </div>
				                 <a class="more" href="javascript:;" onclick="getBottomData('UNPASSED')"> 查看详情
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
				                     <div class="number" id="num_submit">
				                         <span data-counter="counterup"  data-value="0">0</span>家
				                     </div>
				                     <div class="desc"> 已提交 </div>
				                 </div>
				                 <a class="more" href="javascript:;" onclick="getBottomData('SUBMIT')"> 查看详情
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
				                     <div class="number" id="num_notreport">
				                         <span data-counter="counterup"  data-value="0">0</span>家
				                     </div>
				                     <div class="desc"> 未上报 </div>
				                 </div>
				                 <a class="more" href="javascript:;" onclick="getBottomData('UNSUBMIT')"> 查看详情
				                     <i class="m-icon-swapright m-icon-white"></i>
				                 </a>
				             </div>
				         </div>
				       
				     </div>
				     </form:form>
				     <!-- 数据列表 -->
				     <div class="row">
					<div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-dark">
									<i class="icon-settings font-dark"></i> <span
										class="caption-subject bold uppercase">
										<c:if test="${frontCompanyReport.status=='PASSED' }">已审核</c:if>
										<c:if test="${frontCompanyReport.status=='UNPASSED' }">未通过</c:if>
										<c:if test="${frontCompanyReport.status=='SUBMIT' }">已提交</c:if>
										<c:if test="${frontCompanyReport.status=='UNSUBMIT' }">未提交</c:if>数据列表
										 </span>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-bordered table-hover"  style="table-layout: fixed;"
									id="sample_1">
									<thead>
										<tr role="row">
											<th class="width_2">上报企业名称</th>
											<th class="width_2 type_emphasis type_quota" style="display: none;">所属行业</th>
											<th class="width_1">所属地域</th>
											<th class="width_1" >所属街道</th>
											
											<th class="type_support width_2" style="display: none;">项目名称</th>
											<!-- 
											<th class="type_support width_2" style="display: none;">项目建设进展情况
												</th>
											<th class="type_support width_2" style="display: none;">建设地点</th>
											<th class="type_support width_3" style="display: none;">项目主要内容</th>
											<th class="type_support width_3" style="display: none;">项目预期结果</th>
											<th class="type_support width_3" style="display: none;">起止年限</th> -->
											<th class="width_2">上报时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="frontCompanyReport">
											<tr class="gradeX odd" role="row">
												<td>${frontCompanyReport.companyName}</td>
												<td class="type_emphasis type_quota" style="display: none;">${frontCompanyReport.description}</td>
												<td>${frontCompanyReport.area.name}</td>
												<td>${frontCompanyReport.pCompanyName}</td>
												<td class="type_support" style="display: none;">${frontCompanyReport.projectName}</td>
												<td><fmt:formatDate
														value="${frontCompanyReport.reportTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>


											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="pagination">${page}</div>
							</div>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
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
	   <script>
	   
       var companyParentId=$("#companyIdDiv").val();
	   $(function(){
		   getStatisticsCountByStatus();
		});
	   function getBottomData(type){
		   $("#vType").val(type);
		   $("#searchForm").submit();
		   return false;
	   }
	   //按照状态、时间统计数量
	   function getStatisticsCountByStatus(){
			$.ajax({
				type : "post",
				url : whlyPath+"/ajax/statisticsCountByStatus",
				dataType:'json',
				success : function(data) {
					if(data.statusCode==200){
						var dataArr=[],nameArr=[];
						//以下三行为获取真实数据，应客户要求先注释
						 $.each(data.resData,function(index,item){
						 	var html='<span data-counter="counterup"  data-value="'+item.count+'">'+item.count+'</span>家';
						 	$("#num_"+(item.name.toLowerCase())).html(html);
						 });
					}
					
				}			
			});
		};
		
	
	   </script>
    </body>
</html>
