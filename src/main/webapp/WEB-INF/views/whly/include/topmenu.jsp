<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 顶部菜单 -->
<div class="page-header navbar navbar-fixed-top">
      <!-- BEGIN HEADER INNER -->
      <div class="page-header-inner ">
      
          <!-- 系统图标 -->
          <div class="page-logo">
              	   <c:if test="${not empty fnc:getSite(1).logo}">
		              <a href="${whlyPath}/home">
			                  <img src="${fnc:getSite(1).logo}" alt="logo"  class="logo-default" />
		              </a>
				   </c:if>  
              <div class="menu-toggler sidebar-toggler my-menu"> </div>
          </div>
          <!-- 手机端 菜单控制按钮 -->
          <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
          <!-- 顶部导航 -->
          <div class="top-menu">
              <ul class="nav navbar-nav pull-right">
              	  <!-- 邮件 -->
                  <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
                      <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                          <i class="icon-envelope-open"></i>
                          <span class="badge badge-default" id="messageNumber"> 0 </span>
                      </a>
                      <ul class="dropdown-menu">
                          <li class="external">
                              <h3>您有
                                  <span class="bold" id="mailNumber"> 0封 </span> 邮件 </h3>
                              <a href="${whlyPath}/report/frontNotificationList/listMailPage?menuId=b95b18b541c54548b8efd8b9d7ee3e77">查看所有</a>
                          </li>
                          <li>
                              <ul class="dropdown-menu-list scroller" style="height: 100%;" data-handle-color="#637283" id="messageUl">
                                  
                                
                              </ul>
                          </li>
                      </ul>
                  </li>
                  <!-- 用户中心 -->
                  <li class="dropdown dropdown-user">
                      <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                          <img alt="" class="img-circle" src="
	                         <c:choose>  
							   <c:when test="${empty fns:getUser().photo}">
							   	/static/${whlyPage}/assets/layouts/layout/img/avatar3_small.jpg
							   </c:when>  
							   <c:otherwise>  
							  	 ${fns:getUser().photo}
							   </c:otherwise>  
							</c:choose>  
                         " />
                          <span class="username username-hide-on-mobile"> ${fns:getUser().loginName} </span>
                          <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu dropdown-menu-default">
                      	   <c:choose>  
							   <c:when test="${empty fns:getUser().id}">
							   		<!-- 用户没有登录 -->
							   		 <li>
			                              <a href="${whlyPath }/login">
			                                  <i class="icon-user"></i> 登录</a>
			                          </li>
			                           <li class="divider"> </li>
							   </c:when>  
							   <c:otherwise>  
							   	<!-- 用户已经登录 -->
							  	  <li>
		                              <a href="/front/user/userInfo">
		                                  <i class="icon-user"></i> 个人信息 </a>
		                          </li>
		                          <li>
		                              <a href="/front/user/userPwdPage">
		                                  <i class="fa fa-lock"></i> 更改密码
		                              </a>
		                          </li>
		                          <%-- <li>
		                              <a href="${whlyPath}/report/frontCompanyReport/list?status=SUBMIT&month=1&menuId=${menuId }">
		                                  <i class="icon-rocket"></i> 待办
		                                  <span class="badge badge-success" id="bancklogNumber">  </span>
		                              </a>
		                          </li> --%>
		                        
		                          <li class="divider"> </li>
		                          <li  id="btnLogout">
		                              <a href="javascript:void(0);">
		                                  <i class="icon-key"></i> 退出 </a>
		                          </li>
							   </c:otherwise>  
							</c:choose>  
                         
                      </ul>
                  </li>
              </ul>
          </div>
          <!-- 顶部菜单结束 -->
      </div>
      <!-- END HEADER INNER -->
  </div>
      <script type="text/javascript">
   		$('#btnLogout').click(function(){
   			window.location.href="${whlyPath}/logout";
   		});
   		$(".my-menu").click(function(){
   			if(!$(this).hasClass("menu_css")){
   				//收
   				$(".page-logo").css("width","45px");
   				$(this).addClass("menu_css")
   			}else{
   				$(".page-logo").css("width","235px");
   				$(this).removeClass("menu_css")
   			}
   		});
   		
   		$(function() {
   			
   			//加载邮件
   			loadMail();
   			/* //更改代办显示数量
   			updateBancklogNumber(); */
   		});
   		
   		//获取新闻发布时间相对于当前时间的时间差
		function getHourTop(s1,s2) {
			var s3 = s2;
	        s1 = new Date(s1.replace(/-/g, '/'));
	        s2 = new Date(s2.replace(/-/g, '/'));
	        var ms = Math.abs(s1.getTime() - s2.getTime());
	        var time = Math.floor(ms/1000/60/60);
	        if(time==0) {
	        	time = Math.floor(ms/1000/60);
	        	if(time==0) {
	        		time = Math.floor(ms/1000);
	        		return time + "秒前";
	        	}
	        	return time + "分钟前";
	        }
	        if(time > 24) {
	        	return s3; 
	        }
	        return time + "小时前";
	    }
   		
   		function loadMail() {
   			$.ajax({
   				type: 'GET',
   				url: whlyPath + '/report/frontNotificationList/listData?categoryType=3',
   				dataType: 'json'
   			}).done(function(result, status, xhr) {
				var page = result.data.page;
				$('#mailNumber').text(page.count+"封");
				$('#messageNumber').text(page.count);
				var messageUl = $('#messageUl');
				if(page.count > 2) {
					messageUl.attr('style','height:175px;');
				}
				if(!page.list) {
					return;
				}
				for (var i = 0; i < page.list.length; i++) {
					var messageLi1 = messageLi.replace('[name]', page.list[i].createName).replace('[time]',getHourTop(result.data.time, page.list[i].updateDate)).replace('[title]', page.list[i].title);
					if(page.list[i].keywords == 1) {
						messageLi1 = messageLi1.replace('[href]', whlyPath + '/taskmange/examine/form?menuId=7e90ace61d63482a95ebf719877cd0be&id=' + page.list[i].reportId + '&from=sh');
					} else if(page.list[i].keywords == 2){
						messageLi1 = messageLi1.replace('[href]', whlyPath + '/report/frontCompanyReport/history?menuId=e6c6c5566bf7460e94d7c28ecaaac248&id=' + page.list[i].reportId + '&from=view');
					} else {
						messageLi1 = messageLi1.replace('[href]', '#');
					}
					messageUl.append(messageLi1);
				}
				
				
				
			}).fail(function(xhr, status, error) {
				
   			});
   		}
   		
   		
   		messageLi =  '	<li> '+
					 '      <a href="[href]"> '+
					 '	        <span class="subject" style="margin-left: 0px;"> '+
					 '	            <span class="from"> [name] </span> '+
					 '	            <span class="time"> [time] </span> '+
					 '	        </span> '+
					 '	        <span class="message" style="margin-left: 0px;"> [title] </span> '+
					 '	    </a> '+
					 '  </li> ' ;
   		
   		
   		
   		
   		
   		
   		
   		/* function updateBancklogNumber() {
   			$.ajax({
				type : 'GET',
				url : whlyPath + '/report/frontCompanyReport/getBancklogNumber?status=SUBMIT',
				dataType : 'json'
			}).done(function(result, status, xhr) {
				$("#bancklogNumber").text(result.data);
				
			}).fail(function(xhr, status, error) {
				
			});
   		} */
   		
    </script>