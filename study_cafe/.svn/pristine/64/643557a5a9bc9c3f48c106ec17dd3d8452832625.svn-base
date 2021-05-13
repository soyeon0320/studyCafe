<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
  <head>
    <title>회원 로그인</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/login/css/style.css" />
    <!-- common.js (OpenWindow있음) -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js"></script> 

    	<!-- font 커스텀 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font.css" type="text/css" />
    <style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	
		body,* {
			font-family: 'SLEIGothicTTF', serif;
			letter-spacing: 1px;
		}
		
		input[type="password"] {
		font-family: sans-serif !important;
		}

	</style>
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>
  <body>
  <div>
   	 <img class="wave" src="<%=request.getContextPath() %>/resources/login/img/wave_real.png" />
  </div>
    <div class="container">
      <div class="img"></div>
      <div class="login-content" style="z-index: 0;">
        <form id="loginForm" name="loginForm" action="loginUser" method="post">
          <img src="<%=request.getContextPath() %>/resources/login/img/avatar.png" onclick="go_login();"/>
          <h2 class="title" style="letter-spacing: 2px;" onclick="member_test_logIn();">회원 로그인</h2>
          <div class="input-div one">
            <div class="i">
              <i class="fas fa-user"></i>
            </div>
	            <div class="div">
	              <h5>아이디</h5>
	              <input type="text" class="input" name="memId" id="memId"/>
	            </div>
	          </div>
	          <div class="input-div pass" style="margin-bottom: 10px;">
	            <div class="i">
	              <i class="fas fa-lock"></i>
	            </div>
	            <div class="div">
	              <h5>비밀번호</h5>
	              <input type="password" class="input" name="memPass" id="memPass"/>
	            </div>
	          </div>
	          <div style="float: left;padding-left: 200px;">
	         	 <a href="javascript:OpenWindow('<%=request.getContextPath()%>/user/findForm_id', '아이디 찾기', 800, 500);">아이디 찾기</a>
	          </div>
	          <div>
	          	<a href="javascript:OpenWindow('<%=request.getContextPath()%>/user/findForm_pw', '비밀번호 찾기', 800, 500);">비밀번호 찾기</a>
	          </div>
	          
<!-- 	          <input type="button" class="btn" onclick="login_go();" value="Login"/> -->
	          <button type="submit" class="btn"><span>login</span></button>
          <div style="margin-top: 5px;">
          	<a href="<%=request.getContextPath()%>/home" style="float: left;"><i class="fas fa-home"></i>메인으로</a>
          	<a href="<%=request.getContextPath()%>/user/joinForm"><i class="fas fa-user"></i>회원가입</a>
          </div>
        </form>
	          
      </div>
    </div>
    	 <%@ include file="/WEB-INF/include/message.jsp" %>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/login/js/main.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins/plugins.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/peity/jquery.peity.min.js"></script>
	
	<script type="text/javascript">
	
		function login_go() {
			if ($("#selectUsers").val() != "") {
				var key = $("#selectUsers").val().split('|')[0];
				var Id = $("#selectUsers").val().split('|')[1];
				var pass = $("#selectUsers").val().split('|')[2];
				
				if (key == "mem") {
					$("input:text[name=memId]").val(Id);
					$("input:password[name=memPass]").val(pass);
					$("#loginForm").submit();
				} else if (key == "ow") {
					$("input:hidden[name=ownerId]").val(Id);
					$("input:hidden[name=ownerPass]").val(pass);
					$("#ownerLogin").submit();
				} else {
					$("input:hidden[name=adminId]").val(Id);
					$("input:hidden[name=adminPass]").val(pass);
					$("#adminLogin").submit();
				}
			}
		}
		
		
		
		function go_login(){
			$("#memId").focus();
			$("#memId").val('test');
			$("#memPass").focus();
			$("#memPass").val('test1234');
			$("body").focus();
		}
		
	</script>



  </body>
</html>
