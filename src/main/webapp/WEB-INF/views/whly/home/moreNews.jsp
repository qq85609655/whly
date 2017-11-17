<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="decorator" content="whly" />
	<style>
		/*************************pagination***********************/
		.pagination {
			/*background:#d00;*/
			width: 100%;
			margin-top: 50px;
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
		.btn.green:not(.btn-outline) {
			background:#84d3da;
			border:0;
		}
		.dashboard-stat.blue {
			background: #81c7f7;
		}
		
		.dashboard-stat.blue .more {
			background: #6ebcf1;
		}
		
		.dashboard-stat.red {
			background: #e1898f;
		}
		
		.dashboard-stat.red .more {
			background: #da7a80;
		}
		
		.dashboard-stat.green {
			background: #9ae2e9;
		}
		
		.dashboard-stat.green .more {
			background: #92d1d6;
		}
		
		.dashboard-stat.purple {
			background: #cd9fe1;
		}
		
		.dashboard-stat.purple .more {
			background: #ae89be;
		}
		
		.modal-content {
			width: 193%;
			margin-left: -37%;
			height: 100%;
		}
		
		.portlet.light>.portlet-title>.caption {
			float: left;
		}
		
		.text-right {
			height: 40px;
			float: left;
			width: 84%;
			text-align: right;
			line-height: 40px;
		}
		
		.feeds li .col2 {
			float: left;
			width: 161px;
			margin-left: -161px;
		}
	</style>
<script type="text/javascript">
				$(function() {
					
					//加载企业新闻和系统公告
					loadSohoads();
					var categoryType = $('#categoryType').attr('value');
					if(categoryType == 1) {
						$('#title').text('企业新闻');
					} else {
						$('#title').text('系统公告');
					}
				});
				
				
				function loadSohoads() {
					var nowTime = $('#nowTime').attr('value');
					var pageNo = $('#pageNo').attr('value');
					var pageSize = $('#pageSize').attr('value'); 
					var categoryType = $('#categoryType').attr('value');
					var data = {
						categoryType : categoryType,
						pageNo : pageNo,
						pageSize : pageSize
					};
					$.ajax({
						type : 'POST',
						url : whlyPath+'/report/frontNotificationList/listData',
						data : data,
						dataType : 'json'
					}).done(function(result, status, xhr) {
						var data = result.data.list;
						var dataLi = $('#dataLi');
						$('.pagination').html(result.data.html);
						dataLi.empty();
						//var newsWeight = null;
		                for (var i = 0; i < data.length; i++) {
		                	var dataTitle = "";
		                	if(data[i].title.length > 50) {
		                		var s1 = new Date(nowTime.replace(/-/g, '/'));
		    			        var s2 = new Date(data[i].updateDate.replace(/-/g, '/'));
		    			        var ms = Math.abs(s1.getTime() - s2.getTime());
		    			        var time = Math.floor(ms / 1000 / 60 / 60);
		    			        if(time > 24) {
		    			        	dataTitle = data[i].title.substring(0,50) + '...';
		    			        } else if(data[i].title.length > 60) {
		    			        	dataTitle = data[i].title.substring(0,60) + '...';
		    			        } else {
		    			        	dataTitle = data[i].title;
		    			        }
		                	} else {
		                		dataTitle = data[i].title;
		                	}
							var li1 = li.replace('[id]', "'" + data[i].id + "'").replace('[title]', dataTitle).replace('[title1]', data[i].title).replace('[time]', getHour(nowTime,data[i].updateDate));
							if(data[i].weight == 0) {
								dataLi.append(li1.replace('[weight]', '<span class="badge badge-danger"> 置顶 </span>'));
							} else {
								dataLi.append(li1.replace('[weight]', ''));
							}
						}
					}).fail(function(xhr, status, error) {
						bootbox.mAlert({ 
							  size: "small",
							  title: "错误提示",
							  message: "无法获取到数据", 
							  callback: function(){ /* your callback code */ }
						});
						window.location.href=whlyPath+"/home";
					});
					
				}
				
				//获取新闻发布时间相对于当前时间的时间差
				function getHour(s1,s2) {
					var s3 = s2;
			        s1 = new Date(s1.replace(/-/g, '/'));
			        s2 = new Date(s2.replace(/-/g, '/'));
			        var ms = Math.abs(s1.getTime() - s2.getTime());
			        var time = Math.floor(ms/1000/60/60);
			        if(time==0) {
			        	time = Math.floor(ms/1000/60);
			        	if(time==0) {
			        		time = Math.floor(ms/1000);
			        		return time + "秒前";
			        	}
			        	return time + "分钟前";
			        }
			        if(time > 24) {
			        	return s3; 
			        }
			        return time + "小时前";
			    }
				
				//查看首页动态详细内容
				function mAlert(id) {
					var data = {
							id : id
					}
					$.ajax({
						type : 'POST',
						url : whlyPath+'/report/frontNotificationList/getfrontNotification',
						data : data,
						dataType : 'json'
					}).done(function(result, status, xhr) {
						var title = "";
						if(result.data[0].categoryType == "1") {
							title = "企业新闻";
						} else if(result.data[0].categoryType == "2"){
							title = "系统公告";
						}
						bootbox.dialog({ 
							  size: "dialog",
							  title: title,
							  onEscape: true,
							  message: '<h3 style="text-align:center;font-weight:bold;color:'+ result.data[0].color +';">' + result.data[0].title + '</h3><div class="date" style="text-align: center;padding: 0 0 20px 0;font-size: 12px;color: #888;font-family: "宋体";">'+ result.data[0].updateDate +'</div><br>' + result.data[0].content,
							  callback: function(){
								  
							  }
							});
					}).fail(function(xhr, status, error) {
						bootbox.mAlert({ 
							  size: "small",
							  title: "错误提示",
							  message: "无法获取到数据", 
							  callback: function(){ /* your callback code */ }
						});
					});
				}
				
				//分页
				function page(n,s){
					$("#pageNo").val(n);
					$("#pageSize").val(s);
					loadSohoads();
		        	return false;
		        }
				
				var li = '  <li> ' +
			             '     <a href="javascript:;">' +
			             '          <div class="col1">' +
			             '              <div class="cont">' +
			             '                  <div class="cont-col2">' +
			             '                      <div class="desc" style="margin-left:16px;">' +
			             '                      	<a href="#" onclick="mAlert([id])" title="[title1]" data-toggle="tooltip" data-placement="right">  [title]</a>' +
			             ' 							[weight]' +
			             '                      </div>' +
			             '                  </div>' +
			             '              </div>' +
			             '          </div>' +
			             '          <div class="col2">' +
			             '              <div class="date"> [time]</div>' +
			             '          </div>' +
			             '      </a>' +
			             '  </li>' ;
				
				
				
				
		</script>
</head>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- BEGIN 顶部菜单  -->
	<%@ include file="../include/topmenu.jsp"%>
	<!-- END 顶部菜单  -->
	<!-- 不能删除下面一行 否则手机端样式错乱 -->
	<div class="clearfix"></div>
	<!-- 内容 -->
	<div class="page-container">
		<!-- BEGIN 左侧部分 -->
		<%@ include file="../include/leftmenu.jsp"%>
		<!-- END 左侧部分 -->

		<!-- BEGIN 右侧内容 -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- page 菜单-->
				<%@ include file="../include/topBar.jsp"%>

				<!-- 主体部分START-->

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<!-- BEGIN PORTLET-->
						<div class="portlet light bordered">
							<div class="portlet-title tabbable-line">
								<div class="caption">
									<i class="fa fa-bullhorn font-green-sharp"></i> <span
										class="caption-subject font-green-sharp bold uppercase" id="title"></span>
								</div>
							</div>
								<div class="portlet-body">
									<!--BEGIN TABS-->
									<div class="tab-content">
										<div class="tab-pane active">
											<input type="hidden" value="${time}" id="nowTime">
											<input type="hidden" value="${categoryType}" id="categoryType">
											<input id="pageNo" name="pageNo" type="hidden"
												value="" />
											<input id="pageSize" name="pageSize" type="hidden"
												value="" />
											<div class="slimScrollDiv"
												style="position: relative; overflow: hidden; width: auto; height: 100%;">
												<div class="scroller"
													style="height: 100%; overflow: hidden; width: auto;"
													data-always-visible="1" data-rail-visible="0"
													data-initialized="1">
													<ul class="feeds" id="dataLi">
	
													</ul>
												</div>
										</div>
										<div class="pagination"></div>
									</div>
									<!--END TABS-->
								</div>
						</div>
						<!-- END PORTLET-->
					</div>
					
				</div>




				<!-- 主体部分END-->

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<%@ include file="../include/footer.jsp"%>
	<!-- js必须引用在body前面 -->
	<!-- js必须引用在body前面 -->

</body>
</html>
