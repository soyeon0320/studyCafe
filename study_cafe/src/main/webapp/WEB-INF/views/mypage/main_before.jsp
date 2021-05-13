<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
h3{
	text-align: center;
}
div.button{
	margin: auto;
	width: 50%;
}
/* div{ */
/* 	text-align: center; */
/* } */
</style>

<section class="content flex">
	<div class="content">
		<div class="container">
			<div class="tabs mx-auto mb-0">
				<div class="tab-container mb-30">
				<div class="tab-content">
					<div class="card mb-0">
						<div class="card-body">
							<form method="post" action="myInfo" id="signUp" name="changeInfo">
								<div class="spacer-b30">
								<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>	
									<h3>내정보 조회</h3>
								</div>
								<div class="container form-group">
								<div class="input-group mb-7">
									<div class="input-group-prepend">
                                    	<div class="input-group-text" style="width: 100px;">아이디 </div>
									</div>
									 <input type="text"
										name="userId" id="memId" class="form-control"
										value="${myInfo.memId}" readonly="readonly"> 
								</div>
								</div>
								<div class="container form-group">
								<div class="input-group mb-7">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon3" style="width: 100px;">이름</span>
									</div>	
									<input type="text"
										name="memName" id="memName" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" 
										placeholder="${myInfo.memName}">
								</div>
									 <span class="error_next_box"></span>
								</div>
								<div class="container form-group">
								<div class="input-group mb-7">
									<div class="input-group-prepend">
                                    	<div class="input-group-text" style="width: 100px;">전화번호</div> 
									</div>	
									<input type="text"
										name="memTel" id="memTel" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
										placeholder="${myInfo.memTel }"> 
								</div>
									<span class="error_next_box"></span>
								</div>
								<div class="container form-group">
								<div class="input-group mb-7">
									<div class="input-group-prepend">
                                    	<div class="input-group-text" style="width: 100px;">이메일 </div>
									</div>	
									<input type="email"
										name="memEmail" id="memEmail" class="form-control"
										placeholder="${myInfo.memEmail }">
								</div>
									<span class="error_next_box"></span>
								</div>
								<div class="container form-group">
								<div class="input-group mb-7">
									<div class="input-group-prepend">
                                    	<div class="input-group-text" style="width: 100px;">생년월일 </div>
									</div>	
									<input type="text"
										name="userBir" id="memBir" class="form-control"
										value="${myInfo.memBir }" readonly="readonly"> 
								</div>
								</div>
							</form>
							<div class="button" style="text-align: center;">
							<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3"
								onclick="myInfoChange();">수정</button>
							<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3"
								onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/checkPass'">비밀번호
								변경</button>
							</div>
						</div>
						<!--end .colm section  -->
					</div>
					<!-- end .frm-row section  -->
				</div>
				<!--end .form-body section  -->

			</div>
			<!--end .smart-forms section  -->
		</div>
		<!-- end .smart-wrap section -->
	</div>
	</div>
</section>

<script>

	function myInfoChange(){
		 $("form[name='changeInfo']").submit();
	}
	
	var userName = document.querySelector('#memName');
	
	var email = document.querySelector('#memEmail');
	
	var mobile = document.querySelector('#memTel');
	
	var error = document.querySelectorAll('.error_next_box');
	
	userName.addEventListener("focusout", checkName);
	email.addEventListener("focusout", isEmailCorrect);
	mobile.addEventListener("focusout", checkPhoneNum);
	
	function checkName() {
	    var namePattern = /[a-zA-Z가-힣]/;
	    if(userName.value === "") {
	        error[0].innerHTML = "필수 정보입니다.";
	        error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
	        error[0].innerHTML = "한글과 영문 대 소문자를 사용하세요.";
	        error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    } else {
	        error[0].style.display = "none";
	    }
	}
	
	function checkPhoneNum() {
	    var isPhoneNum = /([01]{2})([01679]{1})-[0-9]{3,4}-([0-9]{4})/;
	    var data = {memTel : mobile.value};
	    if(mobile.value === "") {
	        error[1].innerHTML = "필수 정보입니다.";
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	    } else if(!isPhoneNum.test(mobile.value)) {
	        error[1].innerHTML = "형식에 맞지 않는 번호입니다.";
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	    } else {
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/user/tel_check"
	    		,data: data
	    		,type:'post'
	    		,success:function(result){
	    			console.log(result);
	    			if (result == "duplicated") {
	    		    	error[1].innerHTML = "중복된 전화번호 입니다.";
	    		    	error[1].style.display = "block";
	    		        error[1].style.color = "#B40431";
					}else {
				        error[1].style.display = "none";
					}
	    		}
	    		,error:function(error){
	    			alert('시스템 장애로 가입이 불가합니다.');
	    		}
	    	});
	    }
	}
	
	function isEmailCorrect() {
	    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

	    if(email.value === ""){ 
	        error[2].innerHTML = "필수 정보입니다.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	    } else if(!emailPattern.test(email.value)) {
	        error[2].innerHTML = "형식에 맞게 입력해주세요.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	    } else {
	        error[2].style.display = "none"; 
	    }

	}
	
	
</script>
