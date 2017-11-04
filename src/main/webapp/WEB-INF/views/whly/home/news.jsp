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
				    width: 481px;
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
					console.info(nowTime);
					$.ajax({
						type : 'POST',
						url : 'http://localhost:8080/a/frontnotification/frontNotification/getfrontNotification',
						dataType : 'json'
					}).done(function(result, status, xhr) {
						console.info(result);
						var data = result.data;
						var newsLi = $('#newsLi');
						var noticeLi = $('#noticeLi');
		                for (var i = 0; i < data.length; i++) {
		                	var dataTitle = "";
		                	if(data[i].title.length > 28) {
		                		var s1 = new Date(nowTime.replace(/-/g, '/'));
		    			        var s2 = new Date(data[i].updateDate.replace(/-/g, '/'));
		    			        var ms = Math.abs(s1.getTime() - s2.getTime());
		    			        var time = Math.floor(ms/1000/60/60);
		    			        if(time > 24) {
		    			        	dataTitle = data[i].title.substring(0,28) + '...';
		    			        } else if(data[i].title.length > 32) {
		    			        	dataTitle = data[i].title.substring(0,32) + '...';
		    			        } else {
		    			        	dataTitle = data[i].title;
		    			        }
		                	} else {
		                		dataTitle = data[i].title;
		                	}
							var li1 = li.replace('[id]', "'" + data[i].id + "'").replace('[title]', dataTitle).replace('[title1]', data[i].title).replace('[time]', getHour(nowTime,data[i].updateDate));
							if(data[i].categoryType == "1") {
								newsLi.append(li1);
							} else if(data[i].categoryType == "2"){
								noticeLi.append(li1);
							}
						}
					}).fail(function(xhr, status, error) {
						
					});
					
				}
				
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
				
				function alert(id) {
					var data = {
							id : id
					}
					$.ajax({
						type : 'POST',
						url : 'http://localhost:8080/a/frontnotification/frontNotification/getfrontNotification',
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
							  message: '<h3 style="text-align:center;font-weight:bold;color:'+ result.data[0].color +';">' + result.data[0].title + '</h3><br>' + result.data[0].content,
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
                <div class="col-md-6 col-sm-6">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title tabbable-line">
                            <div class="caption">
                                <i class="fa fa-bullhorn font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp bold uppercase">企业新闻</span>
                            </div>
                            <div class="text-right">
                            	<a action="#">
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
                                               <!--  <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#" onclick="alert()"> 第122届广交会第三期开幕 众多轻工制造业企业参展</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 2小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                 <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 大兴区进修学校数学教研室走进北京第二实验</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 3小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 高通向苹果代工厂索要专利费被法院驳回  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 6小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 饿了么百度外卖进入艰难整合期 百度外卖CTO出走  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 6小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 谷歌不服欧盟29亿美元最高金额罚单 已提起上诉  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 7小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 武汉开发区千亿通航产业链雏形初现  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 9小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 华道数据费控之路成功转型 钱包行云成绝密武器  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 10小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 四部门工作组“考核”微信淘宝等隐私条款 9月下旬公布评审结果  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 10小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 日照港第一个海外码头运维项目正式投运  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 12小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 中铁十四局穗莞深项目部不惧风雨 抗击台风“天鸽”  </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 13小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                 <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc" style="margin-left:16px;">
                                                                    	<a href="#"> 重庆抢滩临空经济 </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 13小时前</div>
                                                        </div>
                                                    </a>
                                                </li> -->
                                              
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
                            	<a action="#">
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
                                               <!--  <li>
                                                    <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc"> 关于公司开展内部竞聘的通知<span class="badge badge-danger"> new </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date"> 1小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                	<a href="javascript:;">
	                                                    <div class="col1">
	                                                        <div class="cont">
	                                                            <div class="cont-col2">
	                                                                <div class="desc"> 保监会调研人身险公司经营近况<span class="badge badge-danger"> new </span>
	                                                                </div>
	
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col2">
	                                                        <div class="date"> 2小时前</div>
	
	                                                    </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"> <a>关于英大泰和财产保险股份有限公司筹建吉林分公司的通知</a><span class="badge badge-danger"> new </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 2小时前</div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <div class="col1">
                                                            <div class="cont">
                                                                <div class="cont-col2">
                                                                    <div class="desc"><a> 关于未上报企业的通知</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col2">
                                                            <div class="date">3小时前</div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"> <a>飞宇电力:关于设立西藏自治区分公司的公告</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 5小时前</div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"> <a>623家公司年内业绩三连增 扎堆四行业</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 6小时前</div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"><a> 乐视成立管委会名单未见梁军 公司内部或现分歧</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 6小时前</div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"><a> 关于印发宿迁市重点行业挥发性有机物污染源清单编制工作方案的通知</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 9小时前</div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"> <a>年内356家企业完成上市 A股企业数量升至3452家</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 12小时前</div>
                                                    </div>
                                                </li> -->
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
