<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="decorator" content="whly" />
<style>

	.btn-success {
		background:#77dae3;
		border:0;
	}
	.btn-danger {
		background:#e9969d;
		border:0;
	}
	.col-md-10 {
   		width: 84.33333%;
	}
</style>
<script type="text/javascript">
	var step = 1;
	$(function() {
		
		//返回上一页点击事件
		$("#return").click(returnBack);
		loadingContent();
		
		//如果有信息，则弹出
		if($('#message').val()){
			alert($('#message').val());
		}
	});

	function returnBack() {
		window.history.back();
	}

	//批准和不批准按钮
	function submit1(operation) {
		if(operation == 1) {
			operation = "通过";
		} else {
			operation = "驳回";
		}
		var reason = $('#opinion').val();
		var id = $("#reportId").val();
		var data = {
			status : operation,
			reason : reason,
			id : id 
		};
		$.ajax({
			type : 'POST',
			data : data,
			url : whlyPath + '/report/frontCompanyReport/update'
		}).done(function(result, status, xhr) {
			window.location.href=whlyPath+"/report/frontCompanyReport/list?menuId=${menuId}";    
		}).fail(function(xhr, status, error) {
			window.location.href=whlyPath+"/report/frontCompanyReport/list?menuId=${menuId}";
		}); 
	}
		
	//改变当前显示的步数
	function updateStepNumber(step, max) {
		var progress = step / max * 100 + "%";
		if (progress != null) {
			$("#progress").attr("style", "width:" + progress + ";"); //修改当前进度条百分比
		}
		if (stepNumber != null) {
			$("#stepNumber").html("第" + step + "步"); //修改当前步数的文本
		}
		if(step == max) {
			$("#return").attr('style', 'width: 100px;');
		} else {
			$("#return").attr('style', 'width: 100px;display: none');
		}
	}
	
	function loadingContent() {
		var redirectAttributes = $('#redirectAttributes').attr('value');
		var type = $('#companyParentType').val();
		if(redirectAttributes) {
			alert(redirectAttributes);
		}
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var time = year + '年' + month + '月'; //设置显示时间
		var id = $("#reportId").val();
		var data = {
				reportId: id
		};
		$.ajax({
			type : 'POST',
			data : data,
			url : whlyPath + '/taskmange/examine/list',
			dataType : 'json'
		}).done(function(result, status, xhr) {
			var data = result.data;
			var thisMonth = null; //本年本月的上报信息
			var lastMonth = null; //本年上月的上报信息
			var lastYear = null;  //上年本月的上报信息
			var now = 0;
			var max = 0;
			var operation1 = true;
			if(data!=null && data!="") {
				for (var k=0; k < data.length; k++) {
					if(data[k].id == '本年本月') {
						thisMonth = data[k].frontCompanyReport;
						now = k;
					}
					if(data[k].operation == "通过") {
						max = k + 1;
					} 
					if(data[k].id == '上年本月') { 	//同比
						lastMonth = data[k].frontCompanyReport;
					}
					if(data[k].id == '本年上月') {	//环比
						lastYear = data[k].frontCompanyReport;
					}
				}
				if(max==0) {
					max = now + 1;
				}
				var i = 0;
				for (; i < data.length; i++) {
					if(data[i].id!='本年本月' && data[i].id!='上年本月' && data[i].id!='本年上月' ) {
						var li = menuLi.replace('[start]',i+1).replace('[max]',max).replace('[href]','#tab'+(i+1)).replace('[number]',i+1).replace('[name]',data[i].operation);
						$('#menu').append(li);
					}
					if(data[i].operation == "提交" || data[i].operation == "更新") {
						if(data[i].frontCompanyReport) {
							var question = data[i].frontCompanyReport.question;
							var remarksDiv = "";
							if(question!=null && question!="") {
								for (var j = 0; j < question.length; j++) {
									remarksDiv = remarksDiv + remarks.replace('[number]', j+1).replace('[value]', question[j].title).replace('[textarea]',question[j].content);
									
								}
							}
							var report = data[i].frontCompanyReport;
							var mainDiv = fromDiv.replace('[id]', 'tab'+(i+1)).replace('[time]', time).replace('[question]', remarksDiv).replace('[公司名称]',report.companyName);
							if(type == '1') {
								mainDiv = mainDiv.replace('[营业收入]', report.totalIncome? report.totalIncome: 0).replace('[营业成本]', report.operatingCosts? report.operatingCosts: 0).replace('[营业利润]',report.totalProfit? report.totalProfit: 0).replace('[企业税费]',report.totalTax? report.totalTax: 0).replace('[应付职工薪酬]',report.employeeCompensation? report.employeeCompensation: 0).replace('[贷款金额]',report.loanAmount? report.loanAmount: 0).replace('[从业人数]',report.empQuantity? report.empQuantity: 0).replace('[订单数量]',report.orderQuantity? report.orderQuantity: 0);
							} else if(type == '2') {
								mainDiv = mainDiv.replace('[营业收入]', report.totalIncome? report.totalIncome: 0).replace('[营业利润]',report.totalProfit? report.totalProfit: 0).replace('[营业成本]',report.operatingCosts? report.operatingCosts: 0).replace('[从业人数]',report.empQuantity? report.empQuantity: 0);
							} else if(type == '3') {
								mainDiv = mainDiv.replace('[项目名称]', report.projectName? report.projectName: 0).replace('[起止年限]',report.yearLimit? report.yearLimit: 0).replace('[投资总额]',report.totalInvestment? report.totalInvestment: 0).replace('[银行贷款金额]',report.bankLoanAmount? report.bankLoanAmount: 0).replace('[项目主要内容]',report.projectContent? report.projectContent: 0).replace('[项目预期效果]',report.projectDesiredEffect? report.projectDesiredEffect: 0);
							}
							
							$('#tab').append(mainDiv);
						}
					}
					if((data[i].operation == "通过" &&  operation1) || data[i].operation == "驳回") {
						thisMonth = data[i].frontCompanyReport;
						var totalIncome = statementBody.replace('[name]','营业收入').replace('[value]', thisMonth.totalIncome? thisMonth.totalIncome: 0).replace('[year]',(lastMonth && lastMonth.totalIncome) ? yearOnYear(thisMonth.totalIncome, lastMonth.totalIncome) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalIncome) ? yearOnYear(thisMonth.totalIncome, lastYear.totalIncome) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalIncome)? exceededDetection(thisMonth.totalIncome, lastYear.totalIncome, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalIncome)? exceededDetection(thisMonth.totalIncome, lastYear.totalIncome, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var operatingCosts = statementBody.replace('[name]','营业成本').replace('[value]', thisMonth.operatingCosts? thisMonth.operatingCosts: 0).replace('[year]',(lastMonth && lastMonth.operatingCosts) ? yearOnYear(thisMonth.operatingCosts, lastMonth.operatingCosts) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.operatingCosts) ? yearOnYear(thisMonth.operatingCosts, lastYear.operatingCosts) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.operatingCosts)? exceededDetection(thisMonth.operatingCosts, lastYear.operatingCosts, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.operatingCosts)? exceededDetection(thisMonth.operatingCosts, lastYear.operatingCosts, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var totalProfit = statementBody.replace('[name]','营业利润').replace('[value]', thisMonth.totalProfit? thisMonth.totalProfit: 0).replace('[year]',(lastMonth && lastMonth.totalProfit) ? yearOnYear(thisMonth.totalProfit, lastMonth.totalProfit) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalProfit) ? yearOnYear(thisMonth.totalProfit, lastYear.totalProfit) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalProfit)? exceededDetection(thisMonth.totalProfit, lastYear.totalProfit, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalProfit)? exceededDetection(thisMonth.totalProfit, lastYear.totalProfit, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var totalTax = statementBody.replace('[name]','企业税费').replace('[value]', thisMonth.totalTax? thisMonth.totalTax: 0).replace('[year]',(lastMonth && lastMonth.totalTax) ? yearOnYear(thisMonth.totalTax, lastMonth.totalTax) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalTax) ? yearOnYear(thisMonth.totalTax, lastYear.totalTax) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalTax)? exceededDetection(thisMonth.totalTax, lastYear.totalTax, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalTax)? exceededDetection(thisMonth.totalTax, lastYear.totalTax, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var employeeCompensation = statementBody.replace('[name]','应付职工薪酬').replace('[value]', thisMonth.employeeCompensation? thisMonth.employeeCompensation: 0).replace('[year]',(lastMonth && lastMonth.employeeCompensation) ? yearOnYear(thisMonth.employeeCompensation, lastMonth.employeeCompensation) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.employeeCompensation) ? yearOnYear(thisMonth.employeeCompensation, lastYear.employeeCompensation) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.employeeCompensation)? exceededDetection(thisMonth.employeeCompensation, lastYear.employeeCompensation, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.employeeCompensation)? exceededDetection(thisMonth.employeeCompensation, lastYear.employeeCompensation, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var loanAmount = statementBody.replace('[name]','贷款金额').replace('[value]', thisMonth.loanAmount? thisMonth.loanAmount: 0).replace('[year]',(lastMonth && lastMonth.loanAmount) ? yearOnYear(thisMonth.loanAmount, lastMonth.loanAmount) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.loanAmount) ? yearOnYear(thisMonth.loanAmount, lastYear.loanAmount) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.loanAmount)? exceededDetection(thisMonth.loanAmount, lastYear.loanAmount, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.loanAmount)? exceededDetection(thisMonth.loanAmount, lastYear.loanAmount, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var empQuantity = statementBody.replace('[name]','从业人数').replace('[value]', thisMonth.empQuantity? thisMonth.empQuantity: 0).replace('[year]',(lastMonth && lastMonth.empQuantity) ? yearOnYear(thisMonth.empQuantity, lastMonth.empQuantity) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.empQuantity) ? yearOnYear(thisMonth.empQuantity, lastYear.empQuantity) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.empQuantity)? exceededDetection(thisMonth.empQuantity, lastYear.empQuantity, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.empQuantity)? exceededDetection(thisMonth.empQuantity, lastYear.empQuantity, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var orderQuantity = statementBody.replace('[name]','订单数量').replace('[value]', thisMonth.orderQuantity? thisMonth.orderQuantity: 0).replace('[year]',(lastMonth && lastMonth.orderQuantity) ? yearOnYear(thisMonth.orderQuantity, lastMonth.orderQuantity) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.orderQuantity) ? yearOnYear(thisMonth.orderQuantity, lastYear.orderQuantity) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.orderQuantity)? exceededDetection(thisMonth.orderQuantity, lastYear.orderQuantity, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.orderQuantity)? exceededDetection(thisMonth.orderQuantity, lastYear.orderQuantity, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var totalInvestment = statementBody.replace('[name]','总投资金额').replace('[value]', thisMonth.totalInvestment? thisMonth.totalInvestment: 0).replace('[year]',(lastMonth && lastMonth.totalInvestment) ? yearOnYear(thisMonth.totalInvestment, lastMonth.totalInvestment) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalInvestment) ? yearOnYear(thisMonth.totalInvestment, lastYear.totalInvestment) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalInvestment)? exceededDetection(thisMonth.totalInvestment, lastYear.totalInvestment, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalInvestment)? exceededDetection(thisMonth.totalInvestment, lastYear.totalInvestment, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						var bankLoanAmount = statementBody.replace('[name]','银行贷款金额').replace('[value]', thisMonth.bankLoanAmount? thisMonth.bankLoanAmount: 0).replace('[year]',(lastMonth && lastMonth.bankLoanAmount) ? yearOnYear(thisMonth.bankLoanAmount, lastMonth.bankLoanAmount) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.bankLoanAmount) ? yearOnYear(thisMonth.bankLoanAmount, lastYear.bankLoanAmount) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.bankLoanAmount)? exceededDetection(thisMonth.bankLoanAmount, lastYear.bankLoanAmount, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.bankLoanAmount)? exceededDetection(thisMonth.bankLoanAmount, lastYear.bankLoanAmount, false): '没有可比较的上报信息" style="color:#36c6d3;"');
						if(type == '1') {
							var tboby = totalIncome + operatingCosts + totalProfit + totalTax + employeeCompensation + loanAmount + empQuantity + orderQuantity ;
						} else if(type == '2') {
							var tboby = totalIncome + operatingCosts + totalProfit + empQuantity;
						} else if(type == '3') {
							var tboby = totalInvestment + bankLoanAmount;
						}
						var statement1 = statement.replace('[time]', time).replace('[tbody]', tboby).replace('[id]', 'tab'+(i+1)).replace('[readonly]', "readonly").replace('[buttonStyle1]', "display:none;").replace('[buttonStyle2]', "display:none;").replace('[textarea]', data[i].frontCompanyReport.reason?data[i].frontCompanyReport.reason:'');
						
						$('#tab').append(statement1);
						updateStepNumber(1, i+1);
						operation1 = false;
					}
					if(data[i].id == '本年本月') {
						thisMonth = data[i].frontCompanyReport;
					}
					
				}
				if(thisMonth.status != "PASSED") {
					var li1 = menuLi.replace('[start]',now+1).replace('[max]',max).replace('[href]','#tab'+(now+1)).replace('[number]',now+1).replace('[name]', "审核");
					
					var totalIncome = statementBody.replace('[name]','营业收入').replace('[value]', thisMonth.totalIncome? thisMonth.totalIncome: 0).replace('[year]',(lastMonth && lastMonth.totalIncome) ? yearOnYear(thisMonth.totalIncome, lastMonth.totalIncome) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalIncome) ? yearOnYear(thisMonth.totalIncome, lastYear.totalIncome) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalIncome)? exceededDetection(thisMonth.totalIncome, lastMonth.totalIncome, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalIncome)? exceededDetection(thisMonth.totalIncome, lastYear.totalIncome, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var operatingCosts = statementBody.replace('[name]','营业成本').replace('[value]', thisMonth.operatingCosts? thisMonth.operatingCosts: 0).replace('[year]',(lastMonth && lastMonth.operatingCosts) ? yearOnYear(thisMonth.operatingCosts, lastMonth.operatingCosts) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.operatingCosts) ? yearOnYear(thisMonth.operatingCosts, lastYear.operatingCosts) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.operatingCosts)? exceededDetection(thisMonth.operatingCosts, lastMonth.operatingCosts, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.operatingCosts)? exceededDetection(thisMonth.operatingCosts, lastYear.operatingCosts, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var totalProfit = statementBody.replace('[name]','营业利润').replace('[value]', thisMonth.totalProfit? thisMonth.totalProfit: 0).replace('[year]',(lastMonth && lastMonth.totalProfit) ? yearOnYear(thisMonth.totalProfit, lastMonth.totalProfit) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalProfit) ? yearOnYear(thisMonth.totalProfit, lastYear.totalProfit) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalProfit)? exceededDetection(thisMonth.totalProfit, lastMonth.totalProfit, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalProfit)? exceededDetection(thisMonth.totalProfit, lastYear.totalProfit, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var totalTax = statementBody.replace('[name]','企业税费').replace('[value]', thisMonth.totalTax? thisMonth.totalTax: 0).replace('[year]',(lastMonth && lastMonth.totalTax) ? yearOnYear(thisMonth.totalTax, lastMonth.totalTax) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalTax) ? yearOnYear(thisMonth.totalTax, lastYear.totalTax) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalTax)? exceededDetection(thisMonth.totalTax, lastMonth.totalTax, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalTax)? exceededDetection(thisMonth.totalTax, lastYear.totalTax, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var employeeCompensation = statementBody.replace('[name]','应付职工薪酬').replace('[value]', thisMonth.employeeCompensation? thisMonth.employeeCompensation: 0).replace('[year]',(lastMonth && lastMonth.employeeCompensation) ? yearOnYear(thisMonth.employeeCompensation, lastMonth.employeeCompensation) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.employeeCompensation) ? yearOnYear(thisMonth.employeeCompensation, lastYear.employeeCompensation) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.employeeCompensation)? exceededDetection(thisMonth.employeeCompensation, lastMonth.employeeCompensation, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.employeeCompensation)? exceededDetection(thisMonth.employeeCompensation, lastYear.employeeCompensation, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var loanAmount = statementBody.replace('[name]','贷款金额').replace('[value]', thisMonth.loanAmount? thisMonth.loanAmount: 0).replace('[year]',(lastMonth && lastMonth.loanAmount) ? yearOnYear(thisMonth.loanAmount, lastMonth.loanAmount) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.loanAmount) ? yearOnYear(thisMonth.loanAmount, lastYear.loanAmount) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.loanAmount)? exceededDetection(thisMonth.loanAmount, lastMonth.loanAmount, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.loanAmount)? exceededDetection(thisMonth.loanAmount, lastYear.loanAmount, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var empQuantity = statementBody.replace('[name]','从业人数').replace('[value]', thisMonth.empQuantity? thisMonth.empQuantity: 0).replace('[year]',(lastMonth && lastMonth.empQuantity) ? yearOnYear(thisMonth.empQuantity, lastMonth.empQuantity) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.empQuantity) ? yearOnYear(thisMonth.empQuantity, lastYear.empQuantity) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.empQuantity)? exceededDetection(thisMonth.empQuantity, lastMonth.empQuantity, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.empQuantity)? exceededDetection(thisMonth.empQuantity, lastYear.empQuantity, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var orderQuantity = statementBody.replace('[name]','订单数量').replace('[value]', thisMonth.orderQuantity? thisMonth.orderQuantity: 0).replace('[year]',(lastMonth && lastMonth.orderQuantity) ? yearOnYear(thisMonth.orderQuantity, lastMonth.orderQuantity) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.orderQuantity) ? yearOnYear(thisMonth.orderQuantity, lastYear.orderQuantity) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.orderQuantity)? exceededDetection(thisMonth.orderQuantity, lastMonth.orderQuantity, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.orderQuantity)? exceededDetection(thisMonth.orderQuantity, lastYear.orderQuantity, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var totalInvestment = statementBody.replace('[name]','总投资金额').replace('[value]', thisMonth.totalInvestment? thisMonth.totalInvestment: 0).replace('[year]',(lastMonth && lastMonth.totalInvestment) ? yearOnYear(thisMonth.totalInvestment, lastMonth.totalInvestment) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.totalInvestment) ? yearOnYear(thisMonth.totalInvestment, lastYear.totalInvestment) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.totalInvestment)? exceededDetection(thisMonth.totalInvestment, lastYear.totalInvestment, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.totalInvestment)? exceededDetection(thisMonth.totalInvestment, lastYear.totalInvestment, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					var bankLoanAmount = statementBody.replace('[name]','银行贷款金额').replace('[value]', thisMonth.bankLoanAmount? thisMonth.bankLoanAmount: 0).replace('[year]',(lastMonth && lastMonth.bankLoanAmount) ? yearOnYear(thisMonth.bankLoanAmount, lastMonth.bankLoanAmount) +'%': '100%').replace('[lastYear]',(lastYear && lastYear.bankLoanAmount) ? yearOnYear(thisMonth.bankLoanAmount, lastYear.bankLoanAmount) +'%': '100%').replace('[title1]', (lastMonth && lastMonth.bankLoanAmount)? exceededDetection(thisMonth.bankLoanAmount, lastYear.bankLoanAmount, true): '没有可比较的上报信息" style="color:#36c6d3;"').replace('[title2]', (lastYear && lastYear.bankLoanAmount)? exceededDetection(thisMonth.bankLoanAmount, lastYear.bankLoanAmount, false): '没有可比较的上报信息" style="color:#36c6d3;"');
					if(type == '1') {
						var tboby = totalIncome + operatingCosts + totalProfit + totalTax + employeeCompensation + loanAmount + empQuantity + orderQuantity ;
					} else if(type == '2') {
						var tboby = totalIncome + operatingCosts + totalProfit + empQuantity;
					} else if(type == '3') {
						var tboby = totalInvestment + bankLoanAmount;
					}
					var statement1 = statement.replace('[time]', time).replace('[tbody]', tboby).replace('[id]', 'tab'+(now+1)).replace('[readonly]', "").replace('[buttonStyle1]', "").replace('[buttonStyle2]', "").replace('[textarea]', "").replace('[opinion]', "opinion");
					
					$('#menu').append(li1);
					$('#tab').append(statement1);
				}
				contentShow();
				$("#menu").find("li:last").find("a").trigger("click");
				
			}
               
		}).fail(function(xhr, status, error) {
			
		});
		
		// 根据当前登录用户企业所属类型 来页面展示的内容
		function contentShow() {
			var type = $('#companyParentType').val();
			if(type == "1") {
				$('.type_emphasis').show();
			} else if(type == "2") {
				$('.type_quota').show();
			} else if(type == "3") {
				$('.type_support').show();
			}
		}
		
		/* （本期数－同期数）÷同期数×100% */
		function yearOnYear(now, last) {
			now = parseFloat(now).toFixed(4);
			last = parseFloat(last).toFixed(4);
			return ((now-last) / last*100).toFixed(2);
		}
		
		function exceededDetection(now, last, verdict) { //verdict 区分环比或者同比
			var existing = yearOnYear(now, last); //现有的比率
			var sinceThan = parseFloat("${fns:getWhlySinceThan()}"); //获取规定同比
			var loopThan = parseFloat("${fns:getWhlyLoopThan()}"); //获取规定环比
			if(verdict) { //同比
				if(existing > sinceThan) {
					return "同比增速高于"+ sinceThan + '%" style="color:red;"';
				} else if(existing < -sinceThan) {
					return "同比增速低于"+ sinceThan + '%" style="color:green;"';
				} else {
					return "";
				}
			} else {
				if(existing > loopThan) {
					return "环比增速高于"+ loopThan + '%" style="color:red;"';
				} else if(existing < -loopThan) {
					return "环比增速低于"+ loopThan + '%" style="color:green;"';
				} else {
					return "";
				}
			}
		}
		
		var statementBody = '<tr> ' +
							'	<td>[name]</td>' +
							'	<td>[value]</td>' +
							'	<td title="[title1]" >[year]</td>' +
							'	<td title="[title2]" >[lastYear]</td>' +
							'</tr>' ;
		
		var statement = '<div class="tab-pane [class] " id="[id]"> ' +
							'<div class="portlet light bordered">' +
							'	<div class="portlet-title">' +
							'		<div class="caption">' +
							'			<i class="icon-social-dribbble font-green"></i> <span' +
							'				class="caption-subject font-green bold uppercase">[time]</span>' +
							'		</div>' +
							'	</div>' +
							'	<div class="portlet-body">' +
							'		<div class="table-scrollable">' +
							'			<table class="table table-hover">' +
							'				<thead>' +
							'					<tr>' +
							'						<th>指标</th>' +
							'						<th>本月（万元|人）</th>' +
							'						<th>同比增速（%）</th>' +
							'						<th>环比增速（%）</th>' +
							'					</tr>' +
							'				</thead>' +
							'				<tbody >[tbody]' +
							'				</tbody>' +
							'			</table>' +
							'		</div>' +
							'	</div>' +
							'	<div class="form-actions text-center">' +
							'		<button type="button" class="btn demo-loading-btn btn-success " style="[buttonStyle1]" onclick="submit1(1)">批准</button>' +
							'		<button type="button" class="btn demo-loading-btn btn-danger" style="[buttonStyle2]" onclick="submit1(2)">不批准</button>' +
							'		<br> <br>' +
							'	    <div class="col-md-8 col-md-offset-2">' +
							'			<div class="form-group">' +
							'				<label>审核意见</label>' +
							'				<textarea class="form-control" [readonly] id="[opinion]">[textarea]</textarea>' +
							'			</div>' +
							'		</div>' +
							'	</div>' +
							'</div>' +
						'</div>' ;
		
		var remarks = '<div class="form-group ">'+
						'<label>[number]、标题</label> ' +
						'<input class="form-control spinner" type="text" readonly  placeholder="" value="[value]">'+
						'<label>内容</label>'+
						'<textarea class="form-control" rows="3" readonly >[textarea]</textarea>'+
					'</div>';
		
		var fromDiv = '<div class="row tab-pane [class]" id="[id]"> ' +
						'<div class="col-md-10 col-md-offset-1">' +
						'<!-- BEGIN SAMPLE FORM PORTLET-->' +
						'<div class="portlet light bordered">' +
						'	<div class="portlet-title">' +
						'		<div class="caption font-red-sunglo col-md-12">' +
						'			<i class="icon-settings font-red-sunglo"></i> <span class="caption-subject bold uppercase col-md-10 type_quota" style="display:none;">' +
						'				营业收入、营业成本 、营业利润、从业人数为企业单月数据。</span>' +
						'				<span class="caption-subject bold uppercase col-md-10 type_emphasis" style="display:none;">' +
						'				营业收入、营业成本、营业利润、企业税费、应付职工薪酬、贷款金额为企业单月数据。</span>' +
						'				<span class="caption-subject bold uppercase col-md-10 type_support" style="display:none;">' +
						'				项目申报信息</span>' +
						'				<span style="float: right;font-size: 15px;" class="actions" >[time]</span>' +
						'		</div>' +
						'	</div>' +
						'	<div class="portlet-body form">' +
						'			<div class="form-body row">' +
						'				<div class="form-group col-md-6">' +
						'					<label>公司名称</label>' +
						'					<div class="input-group">' +
						'						<span class="input-group-addon"> <i ' +
						'							class="fa fa-home"></i> ' +
						'						</span> <input type="text" class="form-control" ' +
						'							placeholder="公司名称"  readonly value="[公司名称]"> ' +
						'					</div>' +
						'				</div>' +
				'						<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">' +
				'							<label>营业收入（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control"' +
				'									placeholder="营业收入" readonly value="[营业收入]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">' +
				'							<label>营业成本 （万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" ' +
				'									placeholder="营业成本" readonly value="[营业成本]">' +
				'							</div>' +
				'						</div>' + 
				'						<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">' +
				'							<label>营业利润（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" ' +
				'									placeholder="营业利润" readonly value="[营业利润]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_emphasis" style="display:none;">' +
				'							<label>企业税费（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" ' +
				'									placeholder="企业税费" readonly value="[企业税费]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_emphasis" style="display:none;">' +
				'							<label>应付职工薪酬（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control" placeholder="应付职工薪酬"' +
				'									readonly value="[应付职工薪酬]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_emphasis" style="display:none;">' +
				'							<label>贷款金额（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon" >￥</span>' +
				'								<input type="text" class="form-control"  ' +
				'									readonly placeholder="贷款金额" readonly  value="[贷款金额]">' +
				'							</div>' +
				'						</div>' + 
				'						<div class="form-group col-md-6 type_emphasis type_quota" style="display:none;">' +
				'							<label>从业人数 （人）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-user"></i>' +
				'								</span> <input type="text" class="form-control"' + 
				'									readonly  placeholder="从业人数"  readonly value="[从业人数]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_emphasis" style="display:none;">' +
				'							<label>订单数量（个）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-reorder"></i>' +
				'								</span> <input type="text" class="form-control spinner"' +
				'									  readonly  placeholder="订单数量"  readonly value="[订单数量]">' +
				'							</div>' +
				'						</div>' + 
				'						<!-- 年度扶持项目监测 -->' +
				'						<div class="form-group col-md-6 type_support" style="display:none;">' +
				'							<label>项目名称</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-reorder"></i>' +
				'								</span> <input  type="text" class="form-control spinner input_support"' +
				'									 id="projectName" name="projectName" readonly placeholder="请输入项目名称" value="[项目名称]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_support" style="display:none;">' +
				'							<label>起止年限</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-reorder"></i>' +
				'								</span> <input type="text" class="form-control " readonly name="projectEndTime" ' +
				'										id="projectEndTime" placeholder="起止年限" value="[起止年限]" > ' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_support" style="display:none;">' +
				'							<label>投资总额（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-reorder"></i>' +
				'								</span> <input  type="number" class="form-control spinner input_support"' +
				'									  id="totalInvestment" name="totalInvestment"  readonly placeholder="请输入投资总额"  value="[投资总额]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-6 type_support" style="display:none;">' +
				'							<label>银行贷款金额（万元）</label>' +
				'							<div class="input-group">' +
				'								<span class="input-group-addon"> <i' +
				'									class="fa fa-reorder"></i>' +
				'								</span> <input  type="number" class="form-control spinner input_support"' +
				'									id="bankLoanAmount" name="bankLoanAmount"  readonly placeholder="请输入银行贷款金额"  value="[银行贷款金额]">' +
				'							</div>' +
				'						</div>' +
				'						<div class="form-group col-md-12 type_support" style="display:none;">' +
				'							<label>项目主要内容</label>' +
				'							<div class="input-group" id="projectContentDiv">' +
				'		                        <textarea  id="projectContent" class="input_support"  readonly name="projectContent" rows="6"  cols="130">[项目主要内容]</textarea>' +
				'		                    </div>' +
				'						</div>' +
				'						<div class="form-group col-md-12 type_support" style="display:none;">' +
				'							<label>项目预期效果</label>' +
				'							<div class="input-group">' +
				'								<textarea id="projectDesiredEffect"  readonly class="input_support" name="projectDesiredEffect" rows="6"  cols="130">[项目预期效果]</textarea>' +
				'							</div>' +
				'						</div>' +
				'					</div>' +
				'					<div class="form-actions type_emphasis type_quota" style="display:none;"  >' +
				'						[question]' +
				'					</div>' +
				'			</div>' +
				'		</div>' +
				'	</div>' +
				'</div>';
		
		
		var menuLi = '<li onclick="updateStepNumber([start],[max])" class="[class]"><a'+
					'	href="[href]" data-toggle="tab" class="step"> <span '+
					'	class="number"> [number]</span> <span class="desc"> <i '+
					'		class="fa fa-check"></i> [name] '+
					'</span></a></li>';
		
		
		
		
		
	}
	
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
					<div class="col-md-12">
						<input type="hidden" value="${companyParentType}" id="companyParentType">
						<div class="portlet light bordered" id="form_wizard_1">
							<div class="portlet-title">
								<div class="caption">
									<i class=" icon-layers font-red"></i> <span
										class="caption-subject font-red bold uppercase"> 数据审核 -
										<span class="step-title" id="stepNumber"> </span>
									</span>
								</div>
							</div>
							<div class="portlet-body form">
								<form class="form-horizontal" action="#" id="submit_form"
									method="POST" novalidate="novalidate">
									<div class="form-wizard">
										<div class="form-body">
											<ul class="nav nav-pills nav-justified steps " id="menu">
											
											</ul>
										</div>
										<div id="bar" class="progress progress-striped"
											role="progressbar">
											<div class="progress-bar progress-bar-success" id="progress"
												style="width: 0%"></div>
										</div>
										<div class="tab-content" id="tab">
											
										</div>
										<input type="hidden" value="${frontCompanyReport.id}"
											name="id">
										<input type="hidden" value="${frontCompanyReport.id}"
											id="reportId">
										<input type="hidden" value="${frontCompanyReport.companyName}"
											id="companyName">
										<input type="hidden" value="${redirectAttributes}"
											id="redirectAttributes">
										<input type="hidden" value="${message}" id="message">
										<div class="form-group col-md-11">
											<br>
											<!-- <button type="button" class="btn green pull-right"
												style="width: 100px;display: none" id="return">返回</button> -->
										</div>
									</div>
								</form>

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
	<%@ include file="../include/footer.jsp"%>

	<!-- js必须引用在body前面 -->
</body>
</html>
