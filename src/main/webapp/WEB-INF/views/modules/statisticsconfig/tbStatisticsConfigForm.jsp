<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻数量配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/statisticsconfig/tbStatisticsConfig/">新闻数量配置列表</a></li>
		<li class="active"><a href="${ctx}/statisticsconfig/tbStatisticsConfig/form?id=${tbStatisticsConfig.id}">新闻数量配置<shiro:hasPermission name="statisticsconfig:tbStatisticsConfig:edit">${not empty tbStatisticsConfig.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="statisticsconfig:tbStatisticsConfig:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbStatisticsConfig" action="${ctx}/statisticsconfig/tbStatisticsConfig/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">二级分类：</label>
			<div class="controls">
				<form:select path="category" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('news_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">类型名称：</label>
			<div class="controls">
				<form:input path="category" htmlEscape="false"  maxlength="11" class="required" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">倍数（实际数量*倍数）：</label>
			<div class="controls">
				<form:input path="multiple" htmlEscape="false"  maxlength="11" class="required number" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">随机累计范围：</label>
			<div class="controls">
				<form:input path="accumulate" htmlEscape="false" maxlength="11" class="required digits"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="statisticsconfig:tbStatisticsConfig:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>