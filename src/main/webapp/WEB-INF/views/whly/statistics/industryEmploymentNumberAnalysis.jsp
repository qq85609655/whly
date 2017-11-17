<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<style type="text/css">
	.control-label {
	    margin-top: 1px;
	    font-weight: 400;
	    text-align: right;
	    padding: 6px 0px;
	}
</style>
<script type="text/javascript">
			$(function() {
				//重置按钮
				$("#reset").click(resetFrom);
				$('#query').click(loadLine);
				// 加载统计图
				loadLine();
				
			});
			
			function loadLine() {
				var companyName = $('#nameQuery').val();

				var areaName = $('#areaQuery').val();
				var typeId = $('#industryQuery').val();
				var year = $('#timeQuery').val();
				//console.info(areaName);
				//return false;
				var data = {
						companyName : companyName,
						areaName : areaName,
						year : year
					};
				$.ajax({
					type : 'POST',
					data : data,
					url : whlyPath + '/reportstatistics/reportStatistics/industryEnploymentNumberAnalysis'
				}).done(function(result, status, xhr) {
					//console.info(result.data);
					var data = result.data;
					var titleText=year+"全市行业从业人数分析";//主标题
					var titleSubtext=0;//副标题
					var xAxisData=[];//横坐标数据 
					var seriesData=[];
					var pieData=[];
					for(var i=0;i<data.length;i++){
						var obj=data[i];
						var typeName=obj.typeName;
						var empQuantity=obj.empQuantity;
						xAxisData.push(typeName);
						seriesData.push(empQuantity);
						titleSubtext+=parseInt(empQuantity);
						var d={value:empQuantity,name:typeName};
						if(empQuantity==0){
							continue;
						}
						pieData.push(d);
					}
					
					console.log(data);
					console.log(xAxisData);
					debugger;
					var option = {
						    title : {
						        text: titleText,
						        subtext: '从业人数:'+titleSubtext,
						        x:'center',
						       	 textStyle: {
				        		          color: '#446699',
				        		           fontSize: '20',
				        		            align: 'center'
				        		    }
						    },
						    tooltip : {
						        trigger: 'axis'
						    },
						    toolbox: {
		        		        show: true,
		        		        feature: {
		        		            dataZoom: {
		        		                yAxisIndex: 'none'
		        		            },
		        		            dataView: {readOnly: false},
		        		            magicType: {type: ['line', 'bar']},
		        		            restore: {},
		        		            saveAsImage: {}
		        		        }
		        		    },
						    calculable : true,
						    xAxis : [
						        {
						            type : 'category',
						            axisLabel:{
						            	interval:'0',
						            	rotate:-45
						            	},
						            data : xAxisData
						        }
						    ],
						    yAxis : [
						        {
						            type : 'value'
						        }
						    ],
						    
						    series : [
						       
						        {
						            name:'从业人数',
						            type:'bar',
						            data:seriesData,
						            itemStyle : { normal: {label : {show: true, position: 'top'}}}
						        }
						    ]
						};
						                    
 					
 					var psLineChar = echarts.init(document.getElementById('lineDiv'));
					psLineChar.setOption(option, true);
			/******************************饼图 *********************************************/
				var Pieoption = {
					    title : {
					        text: '从业人数占比',
					        x:'center',
					   	 textStyle: {
	        		          color: '#446699',
	        		           fontSize: '20',
	        		            align: 'center'
	        		    }
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        orient : 'vertical',
					        x : 'left',
					        data:xAxisData
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
					            restore : {show: true},
					            saveAsImage : {show: true}
					        }
					    },
					    calculable : true,
					    series : [
					        {
					            name:'就业人数',
					            type:'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:pieData
					        }
					    ]
					};
			var pieChar=echarts.init(document.getElementById('PieDiv'));
			pieChar.setOption(Pieoption,true);

			/***************************************************************************/
			$('#query').button('reset'); //检索取消loading状态
			$('#query').dequeue();
			$('#reset').button('reset');//重置取消loading状态
			$('#reset').dequeue();
				}).fail(function(xhr, status, error) {
					window.location.href=whlyPath + '/reportstatistics/reportStatistics/industryEnploymentNumberAnalysis';
				}); 
			}
			
			
			
        	//重置表单
			function resetFrom() {
        		var time = $('#year').attr('value');
				$("#timeQuery").val(time);
				$("#areaQuery").val("");
				$("#industryQuery").val("");
				$("#nameQuery").val("");
				loadLine();
			}
			
			
		</script>

</head>
<body>
	<!-- BEGIN 顶部菜单  -->
	<%@ include file="../include/topmenu.jsp"%>
	<!-- END 顶部菜单  -->
	<!-- 不能删除下面一行 否则手机端样式错乱 -->
	<div class="clearfix"></div>
	<!-- 内容 -->
	<div class="page-container " id="main">
		<!-- modal-backdrop fade in -->
		<!-- BEGIN 左侧部分 -->
		<%@ include file="../include/leftmenu.jsp"%>
		<!-- END 左侧部分 -->

		<!-- BEGIN 右侧内容 -->
		<div class="page-content-wrapper ">
			<div class="page-content">
				<!-- page 菜单-->
				<%@ include file="../include/topBar.jsp"%>
				<div class="portlet-body">
					<form:form id="searchForm" modelAttribute="reportStatistics"
						action="${whlyPath}/reportstatistics/reportStatistics/getStatic?menuId=${menuId }"
						method="post" class="breadcrumb form-search">
						<input type="hidden" value="${companyParentType}" id="companyParentType">
						<input type="hidden" value="${reportStatistics.year }" id="year">
						<input type="hidden" value="1" name="month">
						<input type="hidden" value="${queryType }" id="queryType">
						<div class="row form-body">
							<div class="form-group col-md-3">
								<label class="control-label col-md-4" >时间：</label>
								<div class="col-md-8">
									<div class="input-group date date-picker"
										data-date-format="yyyy年mm月">
										<input type="text" class="form-control" readonly name="year"
											value="${reportStatistics.year }" id="timeQuery"> <span
											class="input-group-btn" >
											<button class="btn default date-set" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group col-md-3">
								<label class="control-label col-md-4" >地区：</label>
								<div class="col-md-8">
									<form:select path="area.id" name="area.id" class="form-control"
										id="areaQuery">
										<form:option value="" label="全部" />
										<form:options
											items="${fnc:getArea('d233fe3d43da4d10ba0a7039746a47dd')}"
											itemLabel="name" itemValue="name" htmlEscape="false" />
									</form:select>
								</div>
							</div>
						<!-- 	<div class="form-group col-md-3">
								<label class="control-label col-md-4" >行业：</label>
								<div class="col-md-8">
									<form:select path="typeName" class="form-control" name="typeName"
										id="industryQuery">
										<form:option value="" label="全部" />
										<c:set var="industyTypeLable" value="${industyTypeLable}"/>
										<form:options items="${fns:getDictList(industyTypeLable)}"
											itemLabel="label" itemValue="label" htmlEscape="false" />
									</form:select>
								</div>
							</div> -->
							<div class="form-group col-md-3">
								<label class="control-label col-md-4" >企业名称：</label>
								<div class="col-md-8">
									<input class="form-control" type="text" placeholder=""
										name="companyName" value="${reportStatistics.companyName }" id="nameQuery">
								</div>
							</div>

							<div class="form-group col-md-3">
								<button class="btn demo-loading-btn green col-md-4" id="query" type="button" 
									style="margin-left: 15px;">检索</button>
								<div class="col-md-1"></div>
								<button class="btn green demo-loading-btn col-md-4" id="reset" type="button" >重置</button>
							</div>
						</div>
						
							
						
					</form:form> 
				</div>
				<!-- 主体部分START-->
				<div class="row">
					<div class="col-md-12 chart" id="lineDiv" style="height:470px;width:100%;">
					
						
					
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
				<br/><br/><br/>
				<div class="row">
					<div class="col-md-12 chart" id="PieDiv" style="height:470px;width:100%;">
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
</body>
</html>

