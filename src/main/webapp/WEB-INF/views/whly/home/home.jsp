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
				                     <div class="number" id="num_unsubmit" > 
				                         <span data-counter="counterup" data-value="0">0</span>家
				                      </div>
				                     <div class="desc"> 未上报 </div>
				                 </div>
				                 <a class="more" href="javascript:;" onclick="getBottomData('UNSUBMIT')"> 查看详情
				                     <i class="m-icon-swapright m-icon-white"></i>
				                 </a>
				             </div>
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
	   <script>
	   var myChart2 = echarts.init(document.getElementById("echarts_line"));
       var myChartPie = echarts.init(document.getElementById("echarts_pie"));
	   $(function(){
		    getStatisticsCountByStatus(null,null);
		    getBottomData(null);
		});
	   //下方折现 pie图数据
	   function getBottomData(status){
		   getStatisticsReportByDate(status);
		   getStatisticsCountByType(status);
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
						$.each(data.resData,function(index,item){
							var html='<span data-counter="counterup"  data-value="'+item.count+'">'+item.count+'</span>家';
							$("#num_"+(item.name.toLowerCase())).html(html);
						});
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
					               text: '数量/家'
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
					                   formatter: '{value} 家'
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
