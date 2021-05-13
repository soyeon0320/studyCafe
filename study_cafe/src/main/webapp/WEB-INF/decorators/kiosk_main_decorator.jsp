<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${!empty loginUser }">
	<c:set value="${loginUser.useInfoVO }" var="useInfo" scope="session" />
</c:if>
<c:if test="${!empty loginOwner }">
	<c:set value="${loginOwner }" var="owner" scope="session" />
</c:if>


<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap-->
    <link href="<%=request.getContextPath() %>/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--Common Plugins CSS (all plugins css file compile into one file by gulp) -->
    <link href="<%=request.getContextPath() %>/resources/css/plugins/plugins.css" rel="stylesheet">
    <!--fonts-->
    <link href="<%=request.getContextPath() %>/resources/css/font-icons.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/resources/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/lib/chartist/chartist.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/resources/css/chartist-custom.css" rel="stylesheet" />
    
    <!-- jvectormap -->
    <link href="<%=request.getContextPath() %>/resources/lib/vector-map/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Assan cuatom CSS fle -->
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<!-- font 커스텀 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font.css" type="text/css" />
	
	<!-- 가상키보드 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/keyboard/style.css"/>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath() %>/resources/keyboard/js/hangul.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath() %>/resources/keyboard/js/jquery.secureKeyboard.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath() %>/resources/keyboard/js/crypto.js"></script>
	
	<!-- QR 생성 -->
	<!-- 화면에 출력 -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/qr/jquery.qrcode.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/qr/jquery.qrcode.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/qr/qrcode.js"></script>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script> -->
	<!-- QR 리더 -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/qr/jsQR.js"></script>
	
	<link href="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/sweet-alert-custom.css" rel="stylesheet">

<meta charset="UTF-8">
<title>[키오스크]</title>
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	
		body,* {
/* 			font-family: 'Jeju Gothic', serif; */
			font-family: 'TmoneyRoundWindExtraBold', serif;
		}
		body{
			width: 768px;
			height: 1024px;
			overflow: hidden;
			background-color: #ffffff;" 

		}
		h1 {
		    text-align: center;
		    font-size: 6em;
		}
		h3 {
/*  			color: rgb(255,234,0);  */
		    text-align: center;
		}
		h5 {
		    text-align: center;
		}
		@media screen and (min-width: 1900px) {
			html{
				background-color: black;
			}
		
		    body {
	            width: 42%;
			    margin-right: auto;
			    margin-left: auto;
		        max-width: 1140px;
	    	}
	    	
	    	div.keyboard{
	    		width: 42%;
	    	}
		}
	</style>
</head>
<body>
	<h1 style="margin-bottom: 0px;background-color: #69c1e6;color: white;">SPRING STUDY</h1>
	
	<div class="container-clearfix">
		<p style="text-align: center; font-size: x-large;background-color: #e7f7fe">${owner.storeName }입니다.</p>
		<div>
				<tiles:insertAttribute name="div"/>
			
		</div><!-- #content end -->
		
	
	</div><!-- .tiles end -->
	
	<%@ include file="/WEB-INF/include/message_kiosk.jsp" %>
	
	<!-- 가상키보드 -->
	<div class="keyboard" style="top: 926px; padding-top: 0px;"></div>
  	<script>$.svk.init({_isRandom: false})</script>
	
	<!-- Common plugins -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins/plugins.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/appUi-custom.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/peity/jquery.peity.min.js"></script>
    
    <!-- Sweetalerts2 js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.js"></script> 
    <script src="<%=request.getContextPath() %>/resources/js/plugins-custom/sweetalert2-custom.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/swal.js"></script> 
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	
	<script type="text/javascript">
	function confirmLogout(){
		swal({
	        title: '<p>로그아웃하고 메인으로 이동하시겠습니까?</p>',
	        type: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '<p class="mb-0">네</p>',
	        cancelButtonText: '<p class="mb-0">아니요</p>',
	        confirmButtonClass: 'btn btn-success mt-2',
	        cancelButtonClass: 'btn btn-danger ml-2 mt-2',
	        buttonsStyling: false
	    }).then(function () {
	    	location.href ="<c:url value='/kiosk/logout'/>";
	    }, function (dismiss) {
	        if (dismiss === 'cancel') {
	        	
	        }
	    })
	}
	
	</script>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a3534454a891289cd08358f9b98b5256');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
	
</body>
</html>