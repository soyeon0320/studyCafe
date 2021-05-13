<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="navbar page-header border0 navbar-expand-lg p-5" style="background-color: white;">
	  <div class="container">
	       <a class="navbar-brand d-inline-flex align-items-center" href="<%=request.getContextPath()%>/home">
	          <i class="icon-book-reader d-inline-flex mr-2 avatar50 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"
	          		style="background-color: #86d4f5;"></i>
	          <span class="fs-2x font500">SPRING STUDY</span>
	      </a>
	      <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
	          <c:if test="${!empty loginUser && !empty useInfo }">
	          <li class="nav-item nav-link">
				<div style="float: right;">
					<span id="useTime"></span>
				</div>
			 </li>
			 </c:if>
	          <c:if test="${!empty loginUser}">
	          <li class="nav-item nav-link">
	              <span id="loginUserName"> [${loginUser.memName}님]</span>
	          </li>
	          </c:if>
	          <li class="nav-item">
		          <c:if test="${!empty loginUser}">
		              <a class="nav-link" href="<%=request.getContextPath()%>/myPage/main">
		                  <i class="icon-user1"></i>&nbsp;마이페이지로
		              </a>
		          </c:if>    
	            </li>
	            <c:if test="${empty loginUser }">
	          <li class="nav-item">
		              <a class="nav-link" href="<%=request.getContextPath()%>/contract/regist" >
		                  <i class="icon-file-contract"></i>
		                  	&nbsp;가맹점 가입
		              </a>
	            </li>
	          <li class="nav-item">
		              <a class="nav-link" href="<%=request.getContextPath() %>/store/main" >
		                  <i class="icon-store"></i>
		                  	&nbsp;가맹점페이지로
		              </a>
	            </li>
	            </c:if>
	          <li class="nav-item">
		          <c:if test="${empty loginUser}">
	              <a class="nav-link" href="<%=request.getContextPath() %>/user/loginForm" >
	                  	로그인 &nbsp;
	                  <i class="icon-line2-login"></i>
<!-- 	                  <i class="fa fa-sign-in-alt"></i> -->
	              </a>
	              </c:if>
	            </li>
	          <li class="nav-item">
		          <c:if test="${!empty loginUser}">
	              <a class="nav-link" href="<%=request.getContextPath()%>/user/logoutUser" >
	                  	로그아웃 &nbsp;
	                  <i class="icon-line2-logout"></i>
<!-- 	                  <i class="fa fa-sign-out-alt"></i> -->
	              </a>
	              </c:if>
	            </li>
	        </ul> 
	    </div>
	</header>
	
	
<nav class="navbar navbar-expand-lg navbar-light navbar-horizontal" style="background-color: #69c1e6; color: rgb(255,234,0);">
	
    <div class="container">
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample05">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/home">
                        <i class="icon-home"></i>
                        Home 
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/store/list">
                        <i class="icon-search-location"></i>
                        	매장검색 
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/rent/studyRoom/main' />">
                        <i class="icon-study"></i>
                        	스터디룸 예약 
                    </a>
                </li>
                
             
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/notice/list">
                        <i class="icon-bullhorn1"></i>
                        	공지사항 
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                        <i class="icon-line-list"></i>게시판
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdown05">
                        <a class="dropdown-item" href="<c:url value='/board/list'/>"><i class="icon-pencil-alt"></i>자유게시판</a>
                        <a class="dropdown-item" href="<c:url value='/info/list'/>"><i class="icon-line-database"></i>정보게시판</a>
                        <a class="dropdown-item" href="<c:url value='/stb/list'/>"><i class="icon-users"></i>소모임게시판</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/voc/list">
                        <i class="icon-chat-3"></i>
                        	고객의 소리 
                    </a>
                </li>
            </ul>
			 <div class="rolling_box">
			  <ul id ="rolling_box">
			    <li class="card_sliding" id ="first_rolling"><p></p></li>
			    <li class="" id ="second_rolling"><p></p></li>
			    <li class="" id ="third_rolling"><p></p></li>
			  </ul>
			</div>
        </div>
    </div>
</nav>