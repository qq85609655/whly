<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>网站地图</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link type="text/css" rel="stylesheet" href="/qst/css/index.css"/>
    <script type="text/javascript" src="/qst/js/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="/qst/js/common.js"></script>
</head>
<body>
<%@ include  file="./hade.jsp"%>
<div class="mainWrapper structureWrapper">
    <dl class="clearfix">
        <dt>
            <a href="javascript:void(0);">青软业务</a>
        </dt>
        <dd><a href="/qst/r/school">高校合作</a></dd>
        <dd><a href="/qst/r/platform">平台合作</a></dd>
        <dd><a href="j/qst/r/enterprise">企业支撑</a></dd>
        <dt>
            <a href="javascript:void(0);">产品创新</a>
        </dt>
        <dd><a href="/qst/r/books">出版教材</a></dd>
        <dd><a href="/qst/r/curriculum">课程组件</a></dd>
        <dt>
            <a href="javascript:void(0);">青软资讯</a>
        </dt>
        <dd><a href="/qst/r/media">媒体聚焦</a></dd>
        <dd><a href="/qst/r/newsInformation">新闻资讯</a></dd>
        <dd><a href="/qst/r/qstViewpoint">青软观点</a></dd>
        <dd><a href="/qst/r/concern">各界关怀</a></dd>
        <dt>
            <a href="/qst/r/enterprisejs">关于青软</a>
        </dt>
        <dd><a href="/qst/r/enterprisejs">企业介绍</a></dd>
        <dd><a href="/qst/r/enterprisewh">企业文化</a></dd>
        <dd><a href="/qst/r/founder">创始人</a></dd>
        <dd><a href="/qst/r/relationwe">联系我们</a></dd>
    </dl>
</div>
<%@ include  file="./footer.jsp"%>
<script>
    $(document).ready(function () {
        //tab切换
        $(".tabs li").on("click", function () {
            var index = $(this).index();
            var text = $(this).text();
            $(this).addClass("active").siblings().removeClass("active");
            $(".tab").hide().eq(index).show();
            $(".location-now").find("span:last").text(text);
        });
    });
</script>
</body>
</html>