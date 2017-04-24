<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>企业文化</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
</head>
<body>
<%@ include  file="./hade.jsp"%>
<div class="mainWrapper aboutWrapper">
    <div class="main-title">
        <div class="title-box">
            <div class="title-name">
                <h4>关于青软</h4>
                <p class="f14 pt10 pb5">做中国最值得信赖的教育集成服务提供商</p>
                <p>TO BE THE BEST</p>
            </div>
            <div class="title-pic">
                <img src="/qst/images/about-top.png" alt="">
            </div>
        </div>
    </div>
    <ul class="tabs">
        <a href="/qst/r/enterprisejs"><li>企业介绍</li></a>
        <li class="active">企业文化</li>
        <a href="/qst/r/founder"><li>创始人</li></a>
        <a href="/qst/r/relationwe"><li>联系我们</li></a>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">关于青软</a>
            <span>&gt;</span>
            <span>企业文化</span>
        </div>
    </div>
    <div class="tab culture">
        <div class="section-content">
            <ul class="culture-list clearfix">
                <li class="culture-name">
                    <h4>CULTURE</h4>
                    <div></div>
                    <p>做中国最值得信赖的教育集成服务提供商</p>
                </li>
                <li>
                    <h5><span>使命</span></h5>
                    <p>推动教育与产业的无缝衔接</p>
                </li>
                <li>
                    <h5><span>愿景</span></h5>
                    <p>立志成为对高等教育和IT产业有影响力的企业</p>
                </li>
                <li>
                    <h5><span>定位</span></h5>
                    <p>面向IT领域，根植产业园区，线上线下结合，提供高校人才培养及企业定制人才服务解决方案</p>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include  file="./footer.jsp"%>
<script>
    $(document).ready(function () {
        $(".map-list li").each(function(){
            $(this).find(".map-index").css({background:getRgbColor()});
        });
    });
</script>
</body>
</html>