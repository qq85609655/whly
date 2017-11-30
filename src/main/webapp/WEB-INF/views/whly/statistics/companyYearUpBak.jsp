<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<script type="text/javascript">
			$(function() {
				//重置按钮
				$("#reset").click(resetFrom);
				$('#query').click(loadLine);
				// 加载统计图
				loadLine();
				
			});
			
			function loadLine() {
				var companyName = $('#nameQuery').attr('value');
				var areaName = $('#areaQuery').val();
				var typeId = $('#industryQuery').val();
				var year = $('#timeQuery').val();
				var data = {
						companyName : companyName,
						areaName : areaName,
						typeId : typeId,
						year : year
					};
				$.ajax({
					type : 'POST',
					data : data,
					url : whlyPath + '/reportstatistics/reportStatistics/getStatic'
				}).done(function(result, status, xhr) {
					if(!result.data[0].values) { //如果没数据 进行提示
						alert(title+areaName+typeName+companyName+ '没有数据，请重新选择！');
						psLineChar.clear();
						$('#query').button('reset'); //检索取消loading状态
						$('#query').dequeue();
						$('#reset').button('reset');//重置取消loading状态
						$('#reset').dequeue();
						return;
					}
					var data = result.data;
 					var title = "";
 					
 					var listingNumber= [];
 					var numbers = [];
 					var totalIncome = [];	// 营业总额（万）
 					var totalProfit = [];	// 利润总额（万）
 					var totalTax = [];		// 税收总额（万）
 					var empQuantity = [];	// 从业人员（人）
 					var employeeCompensation = [];	// 应付职工薪酬 （万）
 					var loanAmount = [];	// 贷款金额 （万）
 					var orderQuantity = [];	// 订单数量 （个）
 					var operatingCosts = [];	// 营业成本（万元）
 					for (var i = 0; i < data.length; i++) {
 						listingNumber.push(data[i].month+"月");
 						totalIncome.push(data[i].totalIncome);
 						totalProfit.push(data[i].totalProfit);
 						totalTax.push(data[i].totalTax);
 						empQuantity.push(data[i].empQuantity);
 						employeeCompensation.push(data[i].employeeCompensation);
 						loanAmount.push(data[i].loanAmount);
 						orderQuantity.push(data[i].orderQuantity);
 						operatingCosts.push(data[i].operatingCosts);
					}
 					var listingName = ['营业总额', '利润总额', '税收总额', '从业人员', '应付职工薪酬', '贷款金额', '订单数量', '营业成本'];
 					var number = [ {
					            name:'营业总额',
					            type:'line',
					            stack: '总量',
					            data: totalIncome
				       		}, {
					            name:'利润总额',
					            type:'line',
					            stack: '总量',
					            data: totalProfit
					       	}, {
					            name:'税收总额',
					            type:'line',
					            stack: '总量',
					            data: totalTax
					       	}, {
					            name:'从业人员',
					            type:'line',
					            stack: '总量',
					            data: empQuantity
					       	}, {
					            name:'应付职工薪酬',
					            type:'line',
					            stack: '总量',
					            data: employeeCompensation
					       	}, {
					            name:'贷款金额',
					            type:'line',
					            stack: '总量',
					            data: loanAmount
					       	}, {
					            name:'订单数量',
					            type:'line',
					            stack: '总量',
					            data: orderQuantity
					       	}, {
					            name:'营业成本',
					            type:'line',
					            stack: '总量',
					            data: operatingCosts
					       	}
						];
 					var psLineChar = echarts.init(document.getElementById('lineDiv'));
					
				       var  option = {
				        		    title: {
				        		        text: '企业数据同比增速'
				        		    },
				        		    tooltip: {
				        		        trigger: 'axis'
				        		    },
				        		    legend: {
				        		        data:listingName
				        		    },
				        		    grid: {
				        		        left: '3%',
				        		        right: '4%',
				        		        bottom: '3%',
				        		        containLabel: true
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
				        		    xAxis: {
				        		        type: 'category',
				        		        boundaryGap: false,
				        		        data: listingNumber
				        		    },
				        		    yAxis: [{
				        		    	 type: "value",//坐标轴类型  'value' 数值轴，适用于连续数据 
				        	                boundaryGap: [0, 0],//坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样
				        	                max: this.max,
				        	                axisLabel:{
				        	                        formatter:'{value} %',
				        	                        interval:0,//为auto时会隐藏显示不了的X轴小标题
				        	                        textStyle:{
				        	                            color:'#333333'
				        	                        }
				        	                    },
				        	                    axisLine:{
				        	                        show:true,
				        	                        lineStyle:{type : 'dotted',color:"#445683"}
				        	                    },
				        	                    splitLine: {show: true,lineStyle:{type : 'dotted',color:"#445683"}},//网格线
				        		    }],
				        		    series: number
				        		};
				    
					psLineChar.setOption(option, true);
					//psLineChar.hideLoading();
					
					
					
				}).fail(function(xhr, status, error) {
					window.location.href=whlyPath + '/reportstatistics/reportStatistics/companyYearUpPage';
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
<body
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
						<div class="row form-body">
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">时间：</label>
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
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">地区：</label>
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

						</div>
						<div class="row">
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">行业：</label>
								<div class="col-md-8">
									<form:select path="typeId" class="form-control" name="typeId"
										id="industryQuery">
										<form:option value="" label="全部" />
										<c:set var="industyTypeLable" value="${industyTypeLable}"/>
										<form:options items="${fns:getDictList(industyTypeLable)}"
											itemLabel="label" itemValue="id" htmlEscape="false" />
									</form:select>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label col-md-4" style="padding: 6px 12px;">企业名称：</label>
								<div class="col-md-8">
									<input class="form-control" type="text" placeholder=""
										name="companyName" value="${reportStatistics.companyName }" id="nameQuery">
								</div>
							</div>
							<div class="form-group col-md-4">
								<button class="btn demo-loading-btn green col-md-3" id="query" type="button" 
									style="margin-left: 15px;">检索</button>
								<div class="col-md-1"></div>
								<button class="btn green demo-loading-btn col-md-3" id="reset" type="button" >重置</button>
							</div>
						</div>
					</form:form> 
				</div>
				<!-- 主体部分START-->
				<div class="row">
					<div class="col-md-12 chart" id="lineDiv">
						
					
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
	<%@ include file="../include/footer.jsp"%>
	<!-- js必须引用在body前面 -->
</body>
</html>

