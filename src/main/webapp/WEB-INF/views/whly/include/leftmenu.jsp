<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 左侧菜单 -->
 <div class="page-sidebar-wrapper" style="padding-top:21px;">
     <!-- BEGIN SIDEBAR -->
     <div class="page-sidebar navbar-collapse collapse">
         <!-- BEGIN SIDEBAR MENU -->
         <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
             <li class="sidebar-toggler-wrapper hide">
                 <div class="sidebar-toggler"> </div>
             </li>
             
             <!-- 搜索 -->
             <li class="sidebar-search-wrapper">
                 <form class="sidebar-search  " action="" method="POST">
                     <a href="javascript:;" class="remove">
                         <i class="icon-close"></i>
                     </a>
                     <div class="input-group">
                         <input type="text" class="form-control" placeholder="查询">
                         <span class="input-group-btn">
                             <a href="javascript:;" class="btn submit">
                                 <i class="icon-magnifier"></i>
                             </a>
                         </span>
                     </div>
                 </form>
             </li>
             
             <!-- 左侧菜单项 -->
			<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
			<!--  一级菜单-->
				<!-- 如果没有选择过菜单  默认选中第一个 start active open-->
				 <c:if test="${menu.isShow eq '1'}">
					<%--  <li class="nav-item <c:if test="${empty menusIds}"><c:if test="${idxStatus.index==0 }">start active open</c:if></c:if> 
					 <c:if test="${fn:indexOf(menusIds,menu.idJoin) !=-1}">active open</c:if>" > --%>
					  <li class="nav-item 
					 <c:if test="${fn:indexOf(menusIds,menu.idJoin) !=-1}">active open</c:if>" >
					 	 <a href="javascript:;" class="nav-link nav-toggle">
					 	 	<span onclick="intentPage('${menu.href }','${menu.target }','${menu.id }')">
			                     <i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i>
			                     <span class="title">${menu.name }</span>
					 	 	</span>
		                     <c:if test="${fn:length(menu.childList) >0}">
								 <span class="arrow "></span>
							</c:if>
		                 </a>
		                <c:if test="${fn:length(menu.childList) >0}">
		                		 <!-- 二级菜单 -->
								 <ul class="sub-menu">
								 	  <c:forEach items="${menu.childList}" var="menu2" varStatus="idxStatus">
								 	      <c:if test="${menu2.isShow eq '1'}">
										 	  <li class="nav-item <c:if test="${fn:indexOf(menusIds,menu2.idJoin) !=-1}">active open</c:if>" >
						                         <a href="javascript:;"  class="nav-link nav-toggle">
						                             <span onclick="intentPage('${menu2.href }','${menu2.target }','${menu2.id }')">
							                             <i class="icon-${not empty menu2.icon?menu2.icon:' hide'}"></i>
							                             ${menu2.name }
						                             </span>
						                             <c:if test="${fn:length(menu2.childList) >0}">
														 <span class="arrow "></span>
													</c:if>
						                         </a>
						                         <!-- 三级菜单 -->
						                          <c:if test="${fn:length(menu2.childList) >0}">
														 <ul class="sub-menu">
														 	<c:forEach items="${menu2.childList}" var="menu3" varStatus="idxStatus">
														 		<c:if test="${menu3.isShow eq '1'}">
																 	 <li class="nav-item <c:if test="${fn:indexOf(menusIds,menu3.idJoin) !=-1}">active open</c:if>" >
										                                 <a href="javascript:;"  class="nav-link">
										                                    <span onclick="intentPage('${menu3.href }','${menu3.target }','${menu3.id }')" >
											                                     <i class="icon-${not empty menu3.icon?menu3.icon:' hide'}"></i>
											                                     ${menu3.name }
										                                    </span>
										                                     <c:if test="${fn:length(menu3.childList) >0}">
										                                     	<!-- 比较特殊 增加类 nav-toggle 前三级没有-->
																				 <span class="arrow nav-toggle"></span>
																			 </c:if>
										                                 </a>
										                                 <c:if test="${fn:length(menu3.childList) >0}">
										                                 <!-- 四级菜单 -->
																				  <ul class="sub-menu">
																				  	 <c:forEach items="${menu3.childList}" var="menu4" varStatus="idxStatus">
																				  	 	<c:if test="${menu4.isShow eq '1'}">
														                                     <li class="nav-item <c:if test="${fn:indexOf(menusIds,menu4.idJoin) !=-1}">active open</c:if>" >
														                                         <a href="javascript:;" onclick="intentPage('${menu4.href }','${menu4.target }','${menu4.id }')" class="nav-link">
														                                             <i class="icon-${not empty menu4.icon?menu4.icon:' hide'}"></i> ${menu4.name}</a>
														                                     </li>
																				  	 	</c:if>
												                                     </c:forEach>
												                                 </ul>
																		  </c:if>
										                                
										                             </li>
														 		</c:if>
														 	</c:forEach>
														 </ul>
												  </c:if>
						                       </li>
								 	      </c:if>
								 	  </c:forEach>
								 </ul>
						</c:if>
		                 
					 </li>
				 </c:if>
			</c:forEach>
         </ul>
     </div>
     <!-- END SIDEBAR -->
 </div>
<script>
function intentPage(url,target,parentIds){
	if(url!=""&&url!=null&&url!=undefined){
		if(target=="_blank"){
			window.open(whlyPath+url+"?menuId="+parentIds);        
		}else{
			if(url.indexOf("?")==-1){
				window.location.href=whlyPath+url+"?menuId="+parentIds;
			}else{
				window.location.href=whlyPath+url+"&menuId="+parentIds;
			}
		}
	}
}
</script>