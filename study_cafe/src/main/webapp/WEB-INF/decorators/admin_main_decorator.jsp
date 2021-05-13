<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/include/admin_header.jsp" %>
</head>
<body class="stretched side-header device-xl has-plugin-easing has-plugin-bootstrap has-plugin-lightbox has-plugin-hoveranimation has-plugin-isotope has-plugin-flexslider">
	<div class="page-wrapper" id="page-wrapper">
		<%@ include file="/WEB-INF/include/admin_sidebar.jsp" %>
		<!-- Content
		============================================= -->
	<main class="content">		
	
		<header class="navbar page-header whiteHeader navbar-expand-lg" style="padding: 35px;">
              <ul class="nav flex-row mr-auto">
                  <li class="nav-item">
                      <a href="javascript:void(0)" class="nav-link sidenav-btn h-lg-down">
                          <span class="navbar-toggler-icon"></span>
                      </a>
                      <a class="nav-link sidenav-btn h-lg-up" href="#page-aside" data-toggle="dropdown" data-target="#page-aside">
                          <span class="navbar-toggler-icon"></span>
                      </a>
                  </li>

              </ul>
              <ul class="nav flex-row order-lg-2 ml-auto nav-icons">

		        <li class="nav-item dropdown user-dropdown align-items-center">
		              <a href="<%=request.getContextPath()%>/admin/logout">로그아웃</a> <i class="icon-line2-logout"></i>
		        </li>
		        <li class="h-lg-up nav-item">
		            <a href="#" class=" nav-link collapsed" data-toggle="collapse" data-target="#navbarToggler" aria-expanded="false">
		                <i class="icon-Magnifi-Glass2"></i>
		            </a>
		        </li>
		    </ul>
		    <div class="collapse navbar-collapse search-collapse" id="navbarToggler">
		        <form class="form-inline ml-1">     
		            <button class="no-padding bg-trans border0" type="button"><i class="icon-Magnifi-Glass2"></i></button>
		        </form>
		    </div>
		</header>
		<section class="container-fluid">
			<tiles:insertAttribute name="section"/>
		</section>
				
				
		</main>			
	</div>			
	<%@ include file="/WEB-INF/include/admin_script.jsp" %>
	<%@ include file="/WEB-INF/include/message.jsp" %>
</body>
</html>