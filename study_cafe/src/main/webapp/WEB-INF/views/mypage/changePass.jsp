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
input[type="password"] {
   font-family: sans-serif !important;
}
</style>
    
<section class="content flex">	
  <div class="content">
      <div class="container">
          <div class="tabs mx-auto mb-0">

              <div class="tab-container mb-30">
                  <div class="tab-content"> 
                      <div class="card mb-0">
                      	<div class="card-body">
                          <form method="post" action="" id="signUp" name="changeInfo">
                              <div class="spacer-b30">
                                  <h3>비밀번호 변경</h3>
                              </div>
                              	<div class="container form-group">
								<div class="input-group mb-7">
                              	  <input type="hidden" id="memId" value="${loginUser.memId}" style="color: inherit;">
                                  <input type="hidden" id="memName" value="${loginUser.memName}">
                                  	<div class="input-group-prepend">
                                    	<span class="input-group-text" style="width: 100px;">현재 비밀번호 </span>
									</div>
                                      <input type="password" name="memPass" id="memPass" class="form-control" required="required">
                           		  </div><!-- end section -->  
                                 	  <span class="error_next_box"></span>
                              	</div>
                              <div class="container form-group">
								<div class="input-group mb-7">
                                  <div class="input-group-prepend">
                                    	<span class="input-group-text" style="width: 100px;">새 비밀번호 </span>
									</div>
                                      <input type="password" name="memPass" id="memPass2" class="form-control" required="required">
                              </div>
                                  	<span class="error_next_box"></span>
                              </div>
                              <div class="container form-group">
								<div class="input-group mb-7">
                                 	<div class="input-group-prepend">
                                    	<span class="input-group-text" style="width:100px;">비밀번호 확인 </span>
									</div>
                                      <input type="password" name="memTel" id="memPass3" class="form-control" required="required">
                              </div>
                                  <span class="error_next_box"></span>
                              </div>
                              <div class="button" style="text-align: center;">
	                              <button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3" onclick="modifyPass();" style="">확인</button>
	                              <button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3" onclick="history.back();" style="">취소</button>
                          	  </div>
                          </form>
                          	  <br>
<!--                           	  <div class="g-recaptcha" data-sitekey="6LeMobEaAAAAAFnHbxLZ8ldJHoIvJOvFErPKTVsK"></div> -->
                      </div><!--end .colm section  -->
                  </div><!-- end .frm-row section  -->
              </div><!--end .form-body section  -->
			</div>  
          </div><!--end .smart-forms section  -->
      </div><!-- end .smart-wrap section -->
  </div>
</section>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script>

	var pw1 = document.querySelector('#memPass');
	var pw2 = document.querySelector('#memPass2');
	var pw3 = document.querySelector('#memPass3');
	var memId = document.querySelector('#memId');
	
	var error = document.querySelectorAll('.error_next_box');
	
	pw1.addEventListener("focusout", myPassCheck);
	pw2.addEventListener("focusout", checkPw);
	pw3.addEventListener("focusout", comparePw);
	
	function myPassCheck(){
		var data = {memPass : pw1.value,
					memId : memId.value		
					};
		$.ajax({
    		url:"/scm/user/check_pw"
    		,data: data
    		,type:'post'
    		,success:function(result){
    			console.log(result);
    			if (result == "duplicated") {
    		    	error[0].innerHTML = "비밀번호가 확인되었습니다.";
    		    	error[0].style.display = "block";
    		        error[0].style.color = "#08A600";
				}else {
					error[0].style.display = "none";
    		    	error[0].innerHTML = "비밀번호 불일치";
    		    	error[0].style.display = "block";
    		        error[0].style.color = "#B40431";
    		       
				}
    		}
    		,error:function(error){
    			alert('시스템 장애로 가입이 불가합니다.');
    		}
    	});
	}
	
	function checkPw() {
	    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{6,13}/;
	    if(pw2.value === "") {
	        error[1].innerHTML = "필수 정보입니다."; 
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	        return;
	    } else if(!pwPattern.test(pw2.value)) {
	        error[1].innerHTML = "6~13자 영문 대 소문자,숫자,특수문자를 사용하세요.";
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	        return;
	    } else {
	        error[1].innerHTML = "안전";
	        error[1].style.color = "#08A600";
	        error[1].style.display = "block";
	    }
	} 

	function comparePw() {
	    if(pw3.value === pw2.value && pw3.value != "") {
	        error[2].innerHTML = "일치"; 
	        error[2].style.display = "block";
	        error[2].style.color = "#08A600";
	    } else if(pw3.value !== pw2.value) {
	        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	        return;
	    } 

	    if(pw3.value === "") {
	        error[2].innerHTML = "필수 정보입니다.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	        return;
	    }
	}
	
	function modifyPass(){
		
		if ( pw2.value != pw3.value ) {
		      alert( '비밀번호를 다시 확인해주세요.!' );
		      return false;
		}else if (pw2.value === pw3.value){
			
			var data = {memPass : pw2.value,
						memId : memId.value,
						memName : memName.value
					   };
		
			$.ajax({
				url:"/scm/user/modify_pw"
				,data: data
				,type:'post'
				,success:function(result){
					alert('비밀번호가 변경되었습니다.');
					location.href='<%=request.getContextPath()%>/myPage/main';
				}
				,error:function(error){
					alert('시스템 장애로 가입이 불가합니다.');
				}
			});
		}
		
	}
	
	$(function() {
		$('#add_member_form').submit(function() {
				var captcha = 1;
				$.ajax({
		            url: '/pro/VerifyRecaptcha',
		            type: 'post',
		            data: {
		                recaptcha: $("#g-recaptcha-response").val()
		            },
		            success: function(data) {
		                switch (data) {
		                    case 0:
		                        console.log("자동 가입 방지 봇 통과");
		                        captcha = 0;
		                		break;
		                    case 1:
		                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
		                        break;
		                    default:
		                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
		                   		break;
		                }
		            }
		        });
				if(captcha != 0) {
					return false;
				} 
		});
		});
</script>