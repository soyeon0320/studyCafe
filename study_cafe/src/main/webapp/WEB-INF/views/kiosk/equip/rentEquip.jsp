<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div>
<header class="navbar page-header navbar-expand-lg">
	<ul class="nav flex-row mr-auto">
			<li class="nav-item">
			</li>       		
	    <li class="nav-item">
    		<a href="<%=request.getContextPath() %>/equip/main" class="btn btn-block btn-icon btn-rounded btn-xl btn-warning mb-2">
            <i class="icon-line-chevron-left"></i>
             <p class="mb-0" style="font-size: x-large;">뒤로가기</p>
	        </a>
	    </li>
	  </ul>
	  <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
	    <li class="nav-item">
	 		 <a href="javascript:confirmLogout();" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-warning mb-2">
	         <i class="icon-line2-home"></i>
	         <p class="mb-0" style="font-size: x-large;">메인으로</p>
	      </a>
	 	 </li>
	</ul>
</header>      
</div>