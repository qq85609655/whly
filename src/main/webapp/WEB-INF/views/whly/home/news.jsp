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
		</style>
		<script type="text/javascript">
				$(function() {
					//alert();
				});
				
				function alert() {
					bootbox.alert({ 
						  size: "small",
						  title: "Your Title",
						  message: "Your message here…", 
						  callback: function(){ /* your callback code */ }
						});
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
				     
                     <div class="row">
                <div class="col-md-6 col-sm-6">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title tabbable-line">
                            <div class="caption">
                                <i class="fa fa-bullhorn font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp bold uppercase">企业新闻</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane active" >
                                    <div class="slimScrollDiv"
                                         style="position: relative; overflow: hidden; width: auto; height: 339px;">
                                        <div class="scroller" style="height: 339px; overflow: hidden; width: auto;"
                                             data-always-visible="1" data-rail-visible="0" data-initialized="1">
                                            <ul class="feeds">
                                                <li>
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
                                                </li>
                                              
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
                                <i class="fa fa-bell-o font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp bold uppercase">系统公告</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane active" >
                                    <div class="slimScrollDiv"
                                         style="position: relative; overflow: hidden; width: auto; height: 339px;">
                                        <div class="scroller" style="height: 339px; overflow: hidden; width: auto;"
                                             data-always-visible="1" data-rail-visible="0" data-initialized="1">
                                            <ul class="feeds">
                                                <li>
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
                                                </li>
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
