<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻公告管理</title>
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
		<li><a href="${ctx}/frontnotification/frontNotification/">新闻公告列表</a></li>
		<li class="active"><a href="${ctx}/frontnotification/frontNotification/form?id=${frontNotification.id}">新闻公告${not empty frontNotification.id?'修改':'发布'}<%-- <shiro:hasPermission name="frontnotification:frontNotification:edit"></shiro:hasPermission><shiro:lacksPermission name="frontnotification:frontNotification:edit">查看</shiro:lacksPermission> --%></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="frontNotification" action="${ctx}/frontnotification/frontNotification/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">发布类型 ：</label>
			<div class="controls">
				<form:select path="categoryType" class="input-xlarge required" value="${frontNotification.categoryType }">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('front_pr') }" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-xxlarge measure-input required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				&nbsp;<label>颜色:</label>
				<form:select path="color" class="input-mini">
					<form:option value="" label="默认"/>
					<form:options items="${fns:getDictList('color')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键字：</label>
			<div class="controls">
				<form:input path="keywords" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline">多个关键字，用空格分隔。</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">摘要：</label>
			<div class="controls">
				<form:textarea path="description" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">正文:</label>
			<div class="controls" style="width:1120px;">
				<form:textarea htmlEscape="true" path="content" rows="4" maxlength="2048" class="input-xxlarge"/>
				<sys:ckeditor replace="content" uploadPath="/cms/article" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">置顶：</label>
			<div class="controls">
				<form:radiobutton path="weight" value="1" class="required"/>否
				<form:radiobutton path="weight" value="0" class="required"/>是
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发布状态:</label>
			<div class="controls">
				<%-- <form:radiobuttons path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/> --%>
				<input type="radio" name="delFlag1" value="0"  checked>发布
				<input type="radio" name="delFlag1" value="0" >审核
				<input type="radio" name="delFlag1" value="0" >删除
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<%-- <shiro:hasPermission name="frontnotification:frontNotification:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission> --%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>