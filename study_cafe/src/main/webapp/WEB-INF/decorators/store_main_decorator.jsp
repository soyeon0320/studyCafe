<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="owner" 		   value="${loginOwner }"    scope="session"/>
<c:set var="loginStore"    value="${loginStore }"    scope="session"/>
<c:set var="monthlySales"  value="${monthlySales }"  scope="session"/>
	
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/include/store_header.jsp" %>
</head>
<body>

   <div class="page-wrapper" id="page-wrapper">
       <aside id="page-aside" class=" page-aside aside-fixed">
			<%@ include file="/WEB-INF/include/store_sidebar.jsp" %>
           
       </aside><!-- page-aside end-->
       <main class="content">
           <header class="navbar page-header whiteHeader navbar-expand-lg" style="padding: 35px;">
               <ul class="nav flex-row mr-auto">
                   <li class="nav-item">
                       <a href="javascript:void(0)" class="nav-link sidenav-btn h-lg-down">
                           <span class="navbar-toggler-icon"></span>
                       </a>
                       <a class="nav-link sidenav-btn h-lg-up" href="#page-aside"  data-toggle="dropdown" data-target="#page-aside">
                           <span class="navbar-toggler-icon"></span>
                       </a>
                   </li>
                   <li class="nav-item" style="font-size: 1.3em;">
                   		<span style="margin: 0px 20px;">[${owner.storeName }]</span>
						<span style="margin: 0px 20px;">좌석 ${storeUseInfo.storeCurrentSeat}/${storeUseInfo.storeLocatedSeat }</span>
						<span style="margin: 0px 20px;">스터디룸 ${storeUseInfo.storeCurrentRoom}/${storeUseInfo.storeTotalRoom }</span> 
                   </li>
               </ul>
               <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
                   <li class="nav-item">
						<a style="text-align: center; margin: 0px; cursor: pointer;" href="<%=request.getContextPath()%>/store/logout">로그아웃</a> <i class="icon-line2-logout"></i>
                   </li>
               </ul>
           </header>
           
           <div class="page-content d-flex flex">
               <div class="container-fluid">
               
                   <div class="row">
                   		<div class="col-12">
	                       <tiles:insertAttribute name="section"/>
                   		</div>
                   </div>
               </div>
           </div>
           
           
           <footer class="content-footer bg-light b-t">
               <div class="d-flex flex align-items-center pl-15 pr-15">
                   <div class="d-flex flex p-3 ml-auto">
                       <div>
                           <a href="#" class="d-inline-flex pl-0 pr-2 b-r">Contact</a>
                           <a href="#" class="d-inline-flex pl-2 pr-2 b-r">Storage</a>
                           <a href="#" class="d-inline-flex pl-2 pr-2 ">Privacy</a>
                       </div>
                   </div>
                   <div class="d-flex flex p-3 mr-auto justify-content-end">
                       <div class="text-muted">© Copyright 2014-2018. Assan</div>
                   </div>
               </div>
           </footer><!-- footer end-->
       </main><!-- page content end-->
   </div><!-- app's main wrapper end -->
   

    <%@ include file="/WEB-INF/include/store_script.jsp" %>
    <%@ include file="/WEB-INF/include/message.jsp" %>
</body>
</html>