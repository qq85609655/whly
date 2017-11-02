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
                                                                    	<a href="#"> 第122届广交会第三期开幕 众多轻工制造业企业参展</a>
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
                                                                <div class="desc"> 关于英大泰和财产保险股份有限公司筹建吉林分公司的通知<span class="badge badge-danger"> new </span>
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
                                                                    <div class="desc"> 关于未上报企业的通知
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
                                                                <div class="desc"> 飞宇电力:关于设立西藏自治区分公司的公告
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
                                                                <div class="desc"> 623家公司年内业绩三连增 扎堆四行业
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
                                                                <div class="desc"> 乐视成立管委会名单未见梁军 公司内部或现分歧
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
                                                                <div class="desc"> 关于印发宿迁市重点行业挥发性有机物污染源清单编制工作方案的通知
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
                                                                <div class="desc"> 年内356家企业完成上市 A股企业数量升至3452家
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 12小时前</div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col2">
                                                                <div class="desc"> 关于富平县承诚醋业有限公司小米醋的核查处置情况公告
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> 13次                                                                                     小时前</div>
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
                    
				     
				       <!-- 折线图 -->
				     
				     <div class="row">
                        <div class="col-md-12">
                            <div class="portlet light portlet-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=" icon-layers font-green"></i>
                                        <span class="caption-subject font-green bold uppercase">企业上报分析</span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="echarts_line" style="height: 400px; -webkit-tap-highlight-color: transparent; user-select: none; background-color: rgba(0, 0, 0, 0); cursor: default;" _echarts_instance_="1508464360993"><div style="position: relative; overflow: hidden; width: 1032px; height: 500px;"><div data-zr-dom-id="bg" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none;"></div><canvas width="1032" height="500" data-zr-dom-id="0" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><canvas width="1032" height="500" data-zr-dom-id="1" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><canvas width="1032" height="500" data-zr-dom-id="_zrender_hover_" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><div class="echarts-dataview" style="position: absolute; display: block; overflow: hidden; transition: height 0.8s, background-color 1s; z-index: 1; left: 0px; top: 0px; width: 1032px; height: 0px; background-color: rgb(240, 255, 255);"></div><div class="echarts-tooltip zr-element" style="position: absolute; display: none; border-style: solid; white-space: nowrap; transition: left 0.4s, top 0.4s; background-color: rgba(0, 0, 0, 0.701961); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); padding: 5px; left: 963px; top: 104px;">Sun<br>High : 10<br>Low : 0</div></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 饼状图 -->
                     <div class="row">
                        <div class="col-md-12">
                            <div class="portlet light portlet-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=" icon-layers font-green"></i>
                                        <span class="caption-subject font-green bold uppercase">行业分类分析</span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="echarts_pie" style="height: 400px; -webkit-tap-highlight-color: transparent; user-select: none; background-color: rgba(0, 0, 0, 0); cursor: default;" _echarts_instance_="1508464360993"><div style="position: relative; overflow: hidden; width: 1032px; height: 500px;"><div data-zr-dom-id="bg" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none;"></div><canvas width="1032" height="500" data-zr-dom-id="0" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><canvas width="1032" height="500" data-zr-dom-id="1" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><canvas width="1032" height="500" data-zr-dom-id="_zrender_hover_" class="zr-element" style="position: absolute; left: 0px; top: 0px; width: 1032px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><div class="echarts-dataview" style="position: absolute; display: block; overflow: hidden; transition: height 0.8s, background-color 1s; z-index: 1; left: 0px; top: 0px; width: 1032px; height: 0px; background-color: rgb(240, 255, 255);"></div><div class="echarts-tooltip zr-element" style="position: absolute; display: none; border-style: solid; white-space: nowrap; transition: left 0.4s, top 0.4s; background-color: rgba(0, 0, 0, 0.701961); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); padding: 5px; left: 963px; top: 104px;">Sun<br>High : 10<br>Low : 0</div></div></div>
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
	  <!-- js必须引用在body前面 -->
	   <script>
	   var myChart2 = echarts.init(document.getElementById("echarts_line"));
       var myChartPie = echarts.init(document.getElementById("echarts_pie"));
       var option = {
   		    title : {
   		        text: '行业分类分析',
   		        x:'center'
   		    },
   		    tooltip : {
   		        trigger: 'item',
   		        formatter: "{a} <br/>{b} : {c} ({d}%)"
   		    },
   		    legend: {
   		        orient : 'vertical',
   		        x : 'left',
				data:["交通运输、仓储和邮政业","信息传输、软件和信息技术服务业","房地产业",
   		              "租赁和商务服务业",
   		              "科学研究和技术服务业","水利、环境和公共设施管理业","居民服务、修理和其他服务业","教育、卫生和社会工作","文化体育和娱乐业",
					  "批发零售","住宿和餐饮业"]
   		    },
   		    toolbox: {
   		        show : true,
   		        feature : {
   		            mark : {show: true},
   		            dataView : {show: true, readOnly: false},
   		            magicType : {
   		                show: true, 
   		                type: ['pie', 'funnel'],
   		                option: {
   		                    funnel: {
   		                        x: '25%',
   		                        width: '50%',
   		                        funnelAlign: 'left',
   		                        max: 1548
   		                    }
   		                }
   		            },
   		            saveAsImage : {show: true}
   		        }
   		    },
   		    calculable : true,
   		    series : [
   		        {
   		            name:'行业分类分析',
   		            type:'pie',
   		            radius : '55%',
   		            center: ['50%', '60%'],
   		            data:[{value:125, name:"交通运输、仓储和邮政业"},
   		                  {value:215, name:"信息传输、软件和信息技术服务业"},
   		               	  {value:88, name:"房地产业"},
   		                  {value:313, name:"租赁和商务服务业"},
		               	  {value:55, name:"科学研究和技术服务业"},
		               	  {value:78, name:"水利、环境和公共设施管理业"},
  		               	  {value:432, name:"居民服务、修理和其他服务业"},
		               	  {value:255, name:"教育、卫生和社会工作"},
						  {value:230, name:"文化体育和娱乐业"},
		               	  {value:69, name:"批发零售"},
  		                  {value:356, name:"住宿和餐饮业"}
		               	
   		            ]
   		        }
   		    ]
   		};
   		                    
      myChartPie.setOption(option);
	   $(function(){
		    getStatisticsCountByStatus(null,null);
		    getBottomData(null);
		});
	   //下方折现 pie图数据
	   function getBottomData(status){
		   getStatisticsReportByDate(status);
		  // getStatisticsCountByType(status);
	   }
	   //按照状态、时间统计数量
	   function getStatisticsCountByStatus(startDate,endDate){
			$.ajax({
				type : "post",
				url : whlyPath+"/ajax/statisticsCountByStatus",
				data:{"startDate":startDate,"endDate":endDate},
				dataType:'json',
				success : function(data) {
					if(data.statusCode==200){
						var dataArr=[],nameArr=[];
						//以下三行为获取真实数据，应客户要求先注释
						// $.each(data.resData,function(index,item){
						// 	var html='<span data-counter="counterup"  data-value="'+item.count+'">'+item.count+'</span>家';
						// 	$("#num_"+(item.name.toLowerCase())).html(html);
						// });
					}
					
				}			
			});
		};
		//按照行业类型统计数量
		function getStatisticsCountByType(status){
				$.ajax({
					type : "post",
					url : whlyPath+"/ajax/statisticsCountByType",
					data:{"status":status},
					dataType:'json',
					success : function(data) {
						if(data.statusCode==200){
							var nameArr=[];
							var series=[];
							$.each(data.resData,function(index,item){
								nameArr.push(item.name);
								series.push({value:item.count, name:item.name});
							});
							var option = {
					    		    title : {
					    		        text: '行业分类分析',
					    		        x:'center'
					    		    },
					    		    tooltip : {
					    		        trigger: 'item',
					    		        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    		    },
					    		    legend: {
					    		        orient : 'vertical',
					    		        x : 'left',
					    		        data:nameArr
					    		    },
					    		    toolbox: {
					    		        show : true,
					    		        feature : {
					    		            mark : {show: true},
					    		            dataView : {show: true, readOnly: false},
					    		            magicType : {
					    		                show: true, 
					    		                type: ['pie', 'funnel'],
					    		                option: {
					    		                    funnel: {
					    		                        x: '25%',
					    		                        width: '50%',
					    		                        funnelAlign: 'left',
					    		                        max: 1548
					    		                    }
					    		                }
					    		            },
					    		            saveAsImage : {show: true}
					    		        }
					    		    },
					    		    calculable : true,
					    		    series : [
					    		        {
					    		            name:'行业分类分析',
					    		            type:'pie',
					    		            radius : '55%',
					    		            center: ['50%', '60%'],
					    		            data:series
					    		        }
					    		    ]
					    		};
					    		                    
					       myChartPie.setOption(option);
						}
						
					}			
				});
			};
	   //按照月份统计上报数量
	   function getStatisticsReportByDate(status){
			$.ajax({
				type : "post",
				url : whlyPath+"/ajax/statisticsReportByDateAjax",
				data:{status:status},
				dataType:'json',
				success : function(data) {
					if(data.statusCode==200){
						var dataArr=[],nameArr=[];
						$.each(data.resData,function(index,item){
							dataArr.push(item.count);
							nameArr.push(item.name);
						});
						  myChart2.setOption({
					           title: {
					               text: '数量/条'
					           },
					           tooltip: {
					               trigger: 'axis'
					           },
					           legend: {
					               data: ['企业上报']
					           },
					           toolbox: {
					               show: true,
					               feature: {
					                   mark: {
					                       show: true
					                   },
					                   dataView: {
					                       show: true,
					                       readOnly: false
					                   },
					                   saveAsImage: {
					                       show: true
					                   }
					               }
					           },
					           calculable: true,
					           xAxis: [{
					               type: 'category',
					               boundaryGap: false,
					               data:nameArr
					           }],
					           yAxis: [{
					               type: 'value',
					               axisLabel: {
					                   formatter: '{value} 条'
					               }
					           }],
					           series: [{
					               name: '企业上报',
					               type: 'line',
					               data: dataArr,
					               markPoint: {
					                   data: [{
					                       type: 'max',
					                       name: 'Max'
					                   }, {
					                       type: 'min',
					                       name: 'Min'
					                   }]
					               }
					           }]
					       });
					}
					
				}			
			});
		};
	   </script>
    </body>
</html>
