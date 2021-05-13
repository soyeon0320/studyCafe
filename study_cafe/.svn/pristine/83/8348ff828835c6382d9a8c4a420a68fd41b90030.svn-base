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
	
<form action="login" method="post" name="loginFm">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<span class="login100-form-title p-b-32" style="text-align:center;" onclick="set_test_data();">
					Admin Login
				</span>

				<span class="p-b-11">
					Id
				</span>
				<div class="wrap-input100 validate-input m-b-36">
					<input class="input100" type="text" id="adminId" name="adminId" >
					<span class="focus-input100"></span>
				</div>
				
				<span class="p-b-11">
					Password
				</span>
				<div class="wrap-input100 validate-input m-b-30" data-validate = "비밀번호를 입력해주세요.">
					<span class="btn-show-pass">
						<i class="fa fa-eye"></i>
					</span>
					<input class="input100" type="password" id="adminPass" name="adminPass" >
					<span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn container" type="button" onclick="loginFn()">
						Login
					</button>
				</div>
				
<!-- 				<div style="text-align: center;"> -->
<!-- 					<a href="#" class="btn btn-outline-light mr-1 mb-2" onclick="loginTempFn()"></a> -->
<!-- 				</div> -->
				
				<div class="text-center p-t-20">
					<a href="<%=request.getContextPath()%>/home"><i class="fas fa-home"></i> 회원 메인으로</a>
				</div>
				
			</div>
		</div>
	</div>
</form>
	
<script>
	function loginFn() {
		if($("#adminId").val()=="") {
			alert("아이디를 입력해주세요.");
			$("#adminId").focus();
			return;
		}
		
		if($("#adminPass").val()=="") {
			alert("비밀번호를 입력해주세요.");
			$("#adminPass").focus();
			return;
		}
		
		$("form[name='loginFm']").submit();
	}
	
// 	function loginTempFn() {
// 		$("#adminId").val("admin");
// 		$("#adminPass").val("admin");
// 		$("form[name='loginFm']").submit();
// 	}

	function set_test_data(){
		$("#adminId").val("admin");
		$("#adminPass").val("admin");
	}
</script>	

</section>

<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/js/popper.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/select2/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/tilt/tilt.jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/js/main.js"></script>