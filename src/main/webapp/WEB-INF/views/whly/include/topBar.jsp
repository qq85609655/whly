<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <div class="page-bar">
     <ul class="page-breadcrumb">
         <li>
             <a href="${whlyPath}/home">主页</a>
             <i class="fa fa-circle"></i>
         </li>
         <c:forEach items="${topMenu}" var="menu" varStatus="idxStatus">
          <li>
              <a href="${whlyPath}${menu.href }?menuId=${menu.id}">${ menu.name }</a>
           <c:if test="${!idxStatus.last }">
           	<i class="fa fa-circle"></i>
           </c:if>
          </li>
         </c:forEach>
     </ul>
 </div>