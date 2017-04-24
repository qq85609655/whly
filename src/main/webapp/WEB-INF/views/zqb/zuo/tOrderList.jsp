<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <meta name="decorator" content="default"/>
    <link rel="shortcut icon" href=""/>
    <title>资讯列表</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <style type="text/css">
     	.picId{width:135px;height:40px;}
     	.dis_none{display: none;}
     	.layout_add{position: fixed;top: 10%; left: 10%;border-radius: 10px;text-align: center;line-height: 40px;font-weight: bold;z-index: 19;}
     	.layout_fenxiang{display:none;z-index:20;position:absolute;top:30%;-webkit-transform:translate(-125px,-125px);transform:translate(-125px,-125px);}
        .layout_fenxiang img{width:100%;height:100%;}
        .mask{position: absolute;height:100%;background-color: rgba(0,0,0,.4);top: 0px;}
        
         .layout_iknow{display:none;position:fixed;top:30%;left:40%;border-radius: 10px;text-align: center;width:25%;z-index: 10;background-color: #EAEAEA;display: none;height:150px;}
         .layout_iknow p{padding:20px 5px;border-bottom: 1px solid #F1F1F1;font-size: 16px;height:40%;margin:0}
         .layout_iknow button{display: inline;height:20%;text-align: center;color:#48AEFF;font-weight: bold;width:65px;margin-left:15px;}
          .layout_iknow2{position:fixed;top:40%;left:50%;border-radius: 10px;text-align: center;width:25%;z-index: 10;background-color: #EAEAEA;display: none;height:150px;}
         .layout_iknow2 p{padding:20px 5px;border-bottom: 1px solid #F1F1F1;font-size: 16px;height:40%;}
         .layout_iknow2 button{display: inline;height:20%;text-align: center;color:#48AEFF;font-weight: bold;width:65px;margin-left:15px;}
         .tab-content{width:100%;}
         .tab-content table{border-collapse: collapse;width: 100%;}
         .tab-content td,.tab-content th{border:1px solid #ccc;text-align:center;}
         .tab-content table td img{width:200px;height:150px;}
         .thispage_btn{padding:5px 10px;margin-left:5px;border:none;cursor: pointer;border: 1px solid #ccc;color:#fff;background:#2fa4e7;}
         .add_data{overflow:hidden;margin-bottom:10px;}
         .add_data .thispage_btn {float:right;text-decoration: none;}
         ul li ,a{cursor: pointer;}
         #bodyContent td:nth-child(1){max-width:150px;padding:0 10px;}
         #bodyContent td:nth-child(2){max-width:150px;padding:0 10px;}
         #bodyContent td:nth-child(4){max-width:200px;padding:0 10px;}
         #bodyContent td{word-break: break-all;}
     </style>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/zuo/tOrder/">zqb列表</a></li>
		<li><a href="${ctx}/zuo/tOrder/form">zqb添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tOrder" action="${ctx}/zuo/tOrder/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="22" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
			</li>
			<li><label>手机：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>回复类型：</label>
				<form:radiobutton path="answerType" class="required" value="2"/>普通新闻
				<form:radiobutton path="answerType" value="1"/>公告新闻
				<form:radiobutton path="answerType" value="0"/>重大新闻
			</li>
			<li><label>婚礼时间：</label>
				<input name="weddingDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tOrder.weddingDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>删除标记：</label>
				<form:radiobutton path="delFlag" class="required" value="2"/>普通新闻
				<form:radiobutton path="delFlag" value="1"/>公告新闻
				<form:radiobutton path="delFlag" value="0"/>重大新闻
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>手机</th>
				<th>回复类型</th>
				<th>婚礼时间</th>
				<th>删除标记</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tOrder">
			<tr>
				<td><a href="${ctx}/zuo/tOrder/form?id=${tOrder.id}">
					${tOrder.id}
				</a></td>
				<td>
					${tOrder.userName}
				</td>
				<td>
					${tOrder.mobile}
				</td>
				<td>
					
				</td>
				<td>
					${tOrder.weddingDate}
				</td>
				<td>
				</td>
				<td>
    				<a href="${ctx}/zuo/tOrder/form?id=${tOrder.id}">修改</a>
					<a href="${ctx}/zuo/tOrder/delete?id=${tOrder.id}" onclick="return confirmx('确认要删除该zqb吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>