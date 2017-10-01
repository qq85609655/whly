<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title>${fnc:getSite(1).title}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="${fnc:getSite(1).description}" name="description" />
	<%@include file="/WEB-INF/views/whly/include/head.jsp" %>		
	<sitemesh:head/>
</head>
<body>
	<sitemesh:body/>
</body>
</html>