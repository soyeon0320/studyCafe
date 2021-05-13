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

<section>

<div class="wrap-login100 p-l-100 p-r-100 p-t-70 p-b-30">

<form class="login100-form validate-form" action="findId" name="findFm" method="post">

	<h3 style="text-align: center;" class="mb-20">아이디 찾기</h3>
	
	<div class="input-icon-group input-icon-lg">
	    <div class='input-icon-append'>
	        <i class="far fa-address-card"></i>
	        <input placeholder="이름을 입력해주세요." type="text" id="ownerName" name="ownerName" class="form-control">
	    </div>
  	</div>
	
	<div class="input-icon-group input-icon-lg">
	    <div class='input-icon-append'>
	        <i class="fas fa-phone"></i>
	        <input placeholder="연락처를 입력해주세요." type="text" id="ownerTel" name="ownerTel" class="form-control">
	    </div>
	</div>
	
	<div class="input-icon-group p-l-100">
		<button class="login100-form-btn mt-20" type="button" onclick="findIdFn()"> 
			아이디 찾기
		</button>
	</div>
</form>

</div>
	
<script>
	function findIdFn() {
		if($("#ownerName").val()=="") {
			alert("이름을 입력해주세요.");
			$("#ownerName").focus();
			return;
		}
		
		if($("#ownerTel").val()=="") {
			alert("연락처를 입력해주세요.");
			$("#ownerTel").focus();
			return;
		}
		
		var regTel = /^\d{3}-\d{3,4}-\d{4}$/;
		if(!(regTel.test($("#ownerTel").val()))) {
			alert("휴대폰 번호 형식에 맞게 입력해주세요.");
			$("#ownerTel").focus();
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
	
</section>