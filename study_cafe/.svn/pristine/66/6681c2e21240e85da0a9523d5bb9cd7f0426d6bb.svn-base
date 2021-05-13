<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/ownerAdmin/images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/css/util.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/ownerAdmin/css/main.css">

<form class="login100-form validate-form mt-60" action="findPass" name="findFm" method="post">

<div class="wrap-login90 p-l-80 p-r-80 p-t-30 p-b-30">
	<h3 style="text-align: center;" class="mb-20">비밀번호 찾기</h3>
	
	<div class="input-icon-group input-icon-lg">
	    <div class='input-icon-append'>
	        <i class="far fa-address-card"></i>
	        <input placeholder="이름을 입력해주세요." type="text" id="ownerName" name="ownerName" class="form-control">
	    </div>
  	</div>
	
	<div class="input-icon-group input-icon-lg">
	    <div class='input-icon-append'>
	        <i class="fas fa-user"></i>
	        <input placeholder="아이디를 입력해주세요." type="text" id="ownerId" name="ownerId" class="form-control">
	    </div>
	</div>
	
	<div class="input-icon-group input-icon-lg">
	    <div class='input-icon-append'>
	        <i class="far fa-envelope"></i>
	        <input placeholder="이메일을 입력해주세요." type="email" id="ownerEmail" name="ownerEmail" class="form-control">
	    </div>
	</div>
	
	<div class="input-icon-group p-l-120">
		<button class="login100-form-btn" type="button" onclick="findPassFn()"> 
			비밀번호 찾기
		</button>
	</div>
</div>

</form>

<script>
	function findPassFn() {
		if($("#ownerName").val()=="") {
			alert("이름을 입력해주세요.");
			$("#ownerName").focus();
			return;
		}
		
		if($("#ownerId").val()=="") {
			alert("아이디를 입력해주세요.");
			$("#ownerId").focus();
			return;
		}
		
		if($("#ownerEmail").val()=="") {
			alert("이메일을 입력해주세요.");
			$("#ownerEmail").focus();
			return;
		}
		
		var regEmail = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
		if(!(regEmail.test($("#ownerEmail").val()))) {
			alert("이메일 형식에 맞게 입력해주세요.");
			$("#ownerEmail").focus();
			return;
		}
		
		$("form[name='findFm']").submit();
	}
</script>

<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/js/popper.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/select2/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ownerAdmin/vendor/tilt/tilt.jquery.min.js"></script>

