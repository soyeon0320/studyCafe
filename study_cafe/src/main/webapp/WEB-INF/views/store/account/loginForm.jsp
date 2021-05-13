<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/ownerAdmin/images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/font.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/css/util.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/css/main.css">

<section>
	
<form action="<%=request.getContextPath()%>/store/login" method="post" name="loginFm">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<span class="login100-form-title p-b-32" style="text-align:center;" onclick="store_logIn();">
					Login
				</span>

				<span class="p-b-11" onclick="stanby_store();">
					Id
				</span>
				<div class="wrap-input100 validate-input m-b-36">
					<input class="input100" type="text" id="ownerId" name="ownerId" value="">
					<span class="focus-input100"></span>
				</div>
				
				<span class="p-b-11" onclick="init_store();">
					Password
				</span>
				<div class="wrap-input100 validate-input m-b-30" data-validate = "비밀번호를 입력해주세요.">
					<span class="btn-show-pass">
						<i class="fa fa-eye"></i>
					</span>
					<input class="input100" type="password" id="ownerPass" name="ownerPass" value="">
					<span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn container" type="button" onclick="loginFn()">
						Login
					</button>
				</div>
		
<!-- 				<div style="text-align: center;"> -->
<!-- 					<a href="#" class="btn btn-outline-light mr-1 mb-2" onclick="loginTempFn()"> </a> -->
<!-- 				</div> -->
				
				<div class="text-center p-t-20">
					<a href="#" onclick="OpenWindow('findId', '아이디 찾기', 550, 400)">아이디 찾기</a>&emsp;
					<a href="#" onclick="OpenWindow('findPass', '비밀번호 찾기', 500, 450)">비밀번호 찾기</a>&emsp;
					<a href="<%=request.getContextPath()%>/contract/regist">가맹점 가입신청</a>&emsp;
				</div>
				<div class="text-center p-t-10">
					<a href="<%=request.getContextPath()%>/home"><i class="fas fa-home"></i> 회원 메인으로</a>
				</div>
			</div>
		</div>
	</div>
</form>

<div id="dropDownSelect1"></div>
	
<%@ include file="/WEB-INF/views/common/common.jsp" %>

<script>
	function loginFn() {
		if($("#ownerId").val()=="") {
			alert("아이디를 입력해주세요.");
			$("#ownerId").focus();
			return;
		}
		
		if($("#ownerPass").val()=="") {
			alert("비밀번호를 입력해주세요.");
			$("#ownerPass").focus();
			return;
		}
		
		$("form[name='loginFm']").submit();
	}
	
// 	function loginTempFn() {
// 		$("#ownerId").val("ddit");
// 		$("#ownerPass").val("ddit");
// 		$("form[name='loginFm']").submit();
// 	}
	
	function stanby_store(){
		$("#ownerId").val("hyys1234");
		$("#ownerPass").val("testpass");
	}
	
	function init_store(){
		$("#ownerId").val("cfiqyj753");
		$("#ownerPass").val("testpass");
	}
	
	function store_logIn(){
		$("#ownerId").val("ddit");
		$("#ownerPass").val("ddit");
	}
	
	
</script>	

</section>

<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/js/popper.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/select2/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/tilt/tilt.jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/js/main.js"></script>