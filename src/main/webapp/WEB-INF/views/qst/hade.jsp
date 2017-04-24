<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <link type="text/css" rel="stylesheet" href="/qst/css/index.css"/>
<style>
   /* .header-center{
        border:1px solid red;
        width: 59%;
        line-height: 60px;
        position: relative;
        left: 79px;
        top: 10px;
        display: inline-block;
        overflow: hidden;
    }*/
</style>
 <script type="text/javascript" src="/qst/js/jquery-1.12.0.min.js"></script>
<header>
    <div class="header-box clearfix">
        <h1 class="header-logo">
            <a href="javascript:void(0);">
                <img src="/qst/images/logo1.jpg" alt="">
            </a>
        </h1>
       <%-- <div class="header-center"></div>--%>
        <div class="header-weixin">
            <span>关注微信</span>
            <div class="weixin-code">
                <div class="code-box">
                    <img src="/qst/images/code.png" alt="">
                </div>
                <p>关注微信</p>
            </div>
        </div>
    </div>
</header>
<nav>
    <div class="section-wrapper">
        <ul class="clearfix">
            <li>
                <a href="/">青软首页</a>
            </li>
            <li>
                <a href="/qst/r/school">青软业务</a>
                <div class="nav-down">
                    <a href="/qst/r/school">高校合作</a>
                    <a href="/qst/r/platform">平台支撑</a>
                    <a href="/qst/r/enterprise">企业合作</a>
                </div>
            </li>
            <li>
                <a href="/qst/r/books">产品创新</a>
                <div class="nav-down">
                    <a href="/qst/r/books">出版教材</a>
                    <a href="/qst/r/curriculum">课程组件</a>
                </div>
            </li>
            <li>
                <a href="/qst/r/media">青软资讯</a>
                <div class="nav-down">
                    <a href="/qst/r/media">媒体聚焦</a>
                    <a href="/qst/r/newsInformation">新闻资讯</a>
                    <a href="/qst/r/qstViewpoint">青软观点</a>
                    <div class="nav-down-item">
                        <span >各界关怀</span>
                        <div class="item-down">
                            <a href="/qst/news/concernpage?titletype=0">高校来访</a>
                            <a href="/qst/news/concernpage?titletype=1">政府来访</a>
                            <a href="/qst/news/concernpage?titletype=2">企业来访</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <a href="/qst/r/enterprisejs">关于青软</a>
                <div class="nav-down">
                    <a href="/qst/r/enterprisejs">企业介绍</a>
                    <a href="/qst/r/enterprisewh">企业文化</a>
                    <a href="/qst/r/founder">创始人</a>
                    <a href="/qst/r/relationwe">联系我们</a>
                </div>
            </li>
            <li class="nav-search">
                <input type="text" id="seachNews" class="search-text"/>
                <a href="javascript:void(0);" class="search-icon" onclick="seachNews()"></a>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
    function seachNews(){
    	var title=$("#seachNews").val();
    	window.location.href="/qst/r/newsInformation?title="+encodeURIComponent(encodeURIComponent(title));
    }
    </script>
</nav>