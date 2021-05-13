<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 	<p style=" text-align: center;">로그인 후 시설 이용이 가능합니다.</p> -->
	<div class="row mt-20"  style="text-align: center; padding: 0px 70px;">
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-primary " style="font-size: xx-large;letter-spacing: 10px;"
				onclick="loginWithKakao();">
				<p class="mb-0">시설이용</p></button>
		</div>
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-outline-teal " style="font-size: xx-large;letter-spacing: 10px;"
				onclick="go_inputQR('rentOut');">
				<p class="mb-0">기기반납</p></button>
		</div>
		
	</div>
	<div class="row mt-15 mb-20"  style="text-align: center; padding: 0px 70px;">
		<div class="col-4">
			<button type="button" class="btn btn-block btn-xl btn-outline-primary" style="font-size: xx-large;letter-spacing: 10px;padding: 10px;"
				onclick="go_inputQR('checkIn');">
				<p class="mb-0">입실</p>
			</button>
		</div>
		<div class="col-4">
			<button type="button" class="btn btn-block btn-xl btn-outline-primary" style="font-size: xx-large;letter-spacing: 10px;padding: 10px;"
				onclick="go_inputQR('checkOut');">
				<p class="mb-0">퇴실</p>
			</button>
		</div>
		<div class="col-4">
			<button type="button" class="btn btn-block btn-xl btn-outline-primary" style="font-size: xx-large;letter-spacing: 10px;padding: 10px;"
				onclick="go_inputQR('goingOut');">
				<p class="mb-0">외출</p>
			</button>
		</div>
		
	</div>
	
	<form id="goQR" action="<%=request.getContextPath()%>/kiosk/input_QR">
		<input type="hidden" name="useType" id="useType">
	</form>
	
<!-- 	<button class="api-btn" onclick="kakaoLogout()">카카오로그아웃</button> -->
	
	<%@ include file="/WEB-INF/include/kiosk_seatList.jsp" %>

<script>

	function go_inputQR(type){
		sessionStorage.setItem('qrType', type);
		location.href='<%=request.getContextPath()%>/kiosk/input_QR';
	}
	
	function loginWithKakao() {
	    Kakao.Auth.authorize({
	    	redirectUri: 'http://localhost/<%=request.getContextPath()%>/kiosk/loginForm'
	    });
	    Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(response) {
	            console.log('성공 : ' + response);
	        },
	        fail: function(error) {
	            console.log('실패 : ' + error);
	        }
	    });
	    
// 	    Kakao.Auth.authorize({
// 	      redirectUri: 'http://localhost/scm/kiosk/loginForm',
// 	      prompts: 'login'
// 	    })
	  }
	



</script>

