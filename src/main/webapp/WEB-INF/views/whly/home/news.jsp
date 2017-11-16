<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
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
					background:#e1898f;
				}
				.dashboard-stat.red .more {
					background:#da7a80;
				}
				.dashboard-stat.green {
					background:#9ae2e9;
				}
				.dashboard-stat.green .more {
					background:#92d1d6;
				}
				.dashboard-stat.purple {
					background:#cd9fe1;	
				}
				.dashboard-stat.purple .more {
					background:#ae89be;
				}
				
				.modal-content {
			        width: 193%;
				    margin-left: -37%;
				    height: 100%;
				}
				.portlet.light>.portlet-title>.caption {
					float:left;
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
				});
				
				function loadSohoads() {
					var nowTime =$('#nowTime').attr('value');
					var vagueWords = $('#vagueWords').attr('value');
					$.ajax({
						type : 'GET',
						url : whlyPath+'/report/frontNotificationList/listData?categoryType=1&pageSize=13&vagueWords=' + vagueWords,
						dataType : 'json'
					}).done(function(result, status, xhr) {
						var data = result.data.list;
						var newsLi = $('#newsLi');
						var noticeLi = $('#noticeLi');
						var newsWeight = null;
						var noticeWeight = null;
						if(!data) {
							bootbox.alert({ 
								  size: "small",
								  title: "提示信息",
								  message: "没有查询到企业新闻", 
								  callback: function(){ /* your callback code */ }
								})
							return;
						}
		                for (var i = 0; i < data.length; i++) {
		                	var dataTitle = "";
		                	if(data[i].title.length > 28) {
		                		var s1 = new Date(nowTime.replace(/-/g, '/'));
		    			        var s2 = new Date(data[i].updateDate.replace(/-/g, '/'));
		    			        var ms = Math.abs(s1.getTime() - s2.getTime());
		    			        var time = Math.floor(ms / 1000 / 60 / 60);
		    			        if(time > 24) {
		    			        	dataTitle = data[i].title.substring(0,27) + '...';
		    			        } else if(data[i].title.length > 32) {
		    			        	dataTitle = data[i].title.substring(0,29) + '...';
		    			        } else {
		    			        	dataTitle = data[i].title;
		    			        }
		                	} else {
		                		dataTitle = data[i].title;
		                	}
							var li1 = li.replace('[id]', "'" + data[i].id + "'").replace('[title]', dataTitle).replace('[title1]', data[i].title).replace('[time]', getHour(nowTime,data[i].updateDate));
							
							if(newsLi.find('li').length < 13) {
								if(data[i].weight == 0) {
									if(newsWeight == null) {
										newsLi.prepend(li1.replace('[weight]', '<span class="badge badge-danger"> 置顶 </span>'));
										newsWeight = 0;
									} else {
										newsLi.find('li').eq(newsWeight).after(li1.replace('[weight]', '<span class="badge badge-danger"> 置顶 </span>'));
										newsWeight ++;
									}
								} else {
									newsLi.append(li1.replace('[weight]', ''));
								}
							} 
						}
					}).fail(function(xhr, status, error) {
						
					});
					
					
					$.ajax({
						type : 'GET',
						url : whlyPath+'/report/frontNotificationList/listData?categoryType=2&pageSize=13&vagueWords=' + vagueWords,
						dataType : 'json'
					}).done(function(result, status, xhr) {
						var data = result.data.list;
						var newsLi = $('#newsLi');
						var noticeLi = $('#noticeLi');
						var newsWeight = null;
						var noticeWeight = null;
						if(!data) {
							bootbox.alert({ 
								  size: "small",
								  title: "提示信息",
								  message: "没有查询到系统公告", 
								  callback: function(){ /* your callback code */ }
								})
							return;
						}
		                for (var i = 0; i < data.length; i++) {
		                	var dataTitle = "";
		                	if(data[i].title.length > 28) {
		                		var s1 = new Date(nowTime.replace(/-/g, '/'));
		    			        var s2 = new Date(data[i].updateDate.replace(/-/g, '/'));
		    			        var ms = Math.abs(s1.getTime() - s2.getTime());
		    			        var time = Math.floor(ms / 1000 / 60 / 60);
		    			        if(time > 24) {
		    			        	dataTitle = data[i].title.substring(0,27) + '...';
		    			        } else if(data[i].title.length > 32) {
		    			        	dataTitle = data[i].title.substring(0,29) + '...';
		    			        } else {
		    			        	dataTitle = data[i].title;
		    			        }
		                	} else {
		                		dataTitle = data[i].title;
		                	}
							var li1 = li.replace('[id]', "'" + data[i].id + "'").replace('[title]', dataTitle).replace('[title1]', data[i].title).replace('[time]', getHour(nowTime,data[i].updateDate));
							
							if(noticeLi.find('li').length < 13){
								if(data[i].weight == 0) {
									if(noticeWeight == null) {
										noticeLi.prepend(li1.replace('[weight]', '<span class="badge badge-danger"> 置顶 </span>'));
										noticeWeight = 0;
									} else {
										noticeLi.find('li').eq(noticeWeight).after(li1.replace('[weight]', '<span class="badge badge-danger"> 置顶 </span>'));
										noticeWeight ++;
									}
								} else {
									noticeLi.append(li1.replace('[weight]', ''));
								}
							}
						}
					}).fail(function(xhr, status, error) {
						
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
				function alert(id) {
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
							  callback: function(){ /* your callback code */ }
							});
					}).fail(function(xhr, status, error) {
					    
					});
					
					
					
				}
				
				var li = '  <li> ' +
			             '     <a href="javascript:;">' +
			             '          <div class="col1">' +
			             '              <div class="cont">' +
			             '                  <div class="cont-col2">' +
			             '                      <div class="desc" style="margin-left:16px;">' +
			             '                      	<a href="#" onclick="alert([id])" title="[title1]">  [title]</a>' +
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
                <div class="col-sm-6">
                	<input type="hidden" value="${vagueWords }" id="vagueWords">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title tabbable-line">
                            <div class="caption">
                                <i class="fa fa-bullhorn font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp bold uppercase">企业新闻</span>
                            </div>
                            <div class="text-right">
                            	<a href="${whlyPath}/report/frontNotificationList/listPage?categoryType=1">
	                                <span class="caption-subject grey-cascade  uppercase">查看更多</span>
	                                <i class="fa fa-angle-double-right grey-cascade" ></i>
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane active" >
                                	<input type="hidden" value="${time}" id="nowTime">
                                    <div class="slimScrollDiv"
                                         style="position: relative; overflow: hidden; width: auto; height: 100%;">
                                        <div class="scroller" style="height: 458px; overflow: hidden; width: auto;"
                                             data-always-visible="1" data-rail-visible="0" data-initialized="1">
                                            <ul class="feeds" id="newsLi">
                                              
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--END TABS-->
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
                <div class="col-md-6 col-sm-6">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title tabbable-line">
                             <div class="caption">
                                <i class="fa fa-bullhorn font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp bold uppercase">系统公告</span>
                            </div>
                            <div class="text-right">
                            	<a href="${whlyPath}/report/frontNotificationList/listPage?categoryType=2">
	                                <span class="caption-subject grey-cascade  uppercase">查看更多</span>
	                                <i class="fa fa-angle-double-right grey-cascade" ></i>
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane active" >
                                    <div class="slimScrollDiv"
                                         style="position: relative; overflow: hidden; width: auto; height: 100%;">
                                        <div class="scroller" style="height: 458px; overflow: hidden; width: auto;"
                                             data-always-visible="1" data-rail-visible="0" data-initialized="1">
                                            <ul class="feeds" id="noticeLi">
                                              
                                            </ul>
                                        </div>
                                    </div>
                                </div>
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
        <%@ include  file="../include/footer.jsp" %>
        <!-- js必须引用在body前面 -->
	  <!-- js必须引用在body前面 -->
	
    </body>
</html>
