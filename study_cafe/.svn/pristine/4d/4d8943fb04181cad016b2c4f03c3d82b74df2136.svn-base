<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<section>
	<header class="navbar page-header border0 navbar-expand-lg" style="background-color: rgb(255,234,0);">
	  <div class="container">
	       <a class="navbar-brand d-inline-flex align-items-center" href="#">
	          <i class="icon-book-reader d-inline-flex mr-2 avatar32 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"
	          		style="background-color: rgb(14,44,106);"></i>
	          <span class="fs-1x font500">Spring Study</span>
	      </a>
	    </div>
	</header>
	
	<body>
	<div class="container">
		<div class="portlet-box portlet-gutter ui-buttons-col mb-30 mt-30">
             <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                 <div class="flex d-flex flex-column">
                     <h3>아이디 찾기</h3> 
                 </div>
             </div>
             <div class="portlet-body">
	           <p>
	          	 <strong>${member.memName}/${member.memTel}/
	          	 <c:choose>
		          	 <c:when test="${member.memGen eq 'F'}">
		          	 	여자
		          	 </c:when>
		          	 <c:otherwise>
		          	 	남자
		          	 </c:otherwise>
	          	 </c:choose>
	          	 </strong> 으로 찾은 아이디입니다.<br>
	           </p>
	           
	          	 <h3>${member.memId}</h3>

                 <div class="container form-group">
	                 <div class="pt-30 pb-30 b-t mt-15">
	                 	<a href="javascript:window.close();" class="btn btn-warning mr-1 mb-2">로그인창으로</a>
	                 </div>
	             </div>
             </div>
         </div>
	</div>
	</section>
