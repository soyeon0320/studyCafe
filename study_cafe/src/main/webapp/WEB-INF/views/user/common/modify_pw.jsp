<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<section>
	<header class="navbar page-header border0 navbar-expand-lg" style="background-color: rgb(255,234,0);">
	  <div class="container">
	       <a class="navbar-brand d-inline-flex align-items-center" href="#">
	          <i class="icon-book-reader d-inline-flex mr-2 avatar32 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"
	          		style="background-color: rgb(14,44,106);"></i>
	          <span class="fs-1x font500">Spring Study</span>
	      </a>
	    </div>
	</header>
	
	<div class="container">
		<div class="portlet-box portlet-gutter ui-buttons-col mb-30 mt-30">
             <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                 <div class="flex d-flex flex-column">
                     <h3>비밀번호 찾기</h3> 
                 </div>
             </div>
             <div class="portlet-body">
        	    
		    	<div class="container form-group" id="checkPwDiv">
					<div class="input-group row m-0">
						<div class="input-group-prepend col-2 p-0">
		                  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">임시비밀번호</label></span>
						</div>
						<input type="text" id="memPass" name="memPass" value="" class="form-control col-9" placeholder="임시비밀번호를 입력해주세요."/>
			            <input type="hidden"id="memId" name="memId" value="${member.memId}">
						<div class="input-group-append col-1 p-0">
		                  <span class="input-group-text col-12"><a href="javascript:pass_check();">확인</a></span>
						</div>
		            </div>
				</div>
        	    
             <form id="modify_pw" name="modify_pw" action="modify_pw" method="post">
        	    <div class="container form-group">
	                 <div class="input-group row m-0">
	                     <div class="input-group-prepend  col-2 p-0">
	                         <span class="input-group-text col-12" id="basic-addon3"><label class="mb-0" for="register-form-name">새로운 비밀번호</label></span>
	                     </div>
	                     <input type="password" class="form-control col-10" id="modifyMemPass" name="memPass" aria-describedby="basic-addon3" placeholder="6~13자 영문 대 소문자,숫자,특수문자를 사용하세요."><br>
	                 </div>
	                     <span class="error_next_box"></span>
				</div>	
        	    <div class="container form-group">
	                 <div class="input-group row m-0">
	                     <div class="input-group-prepend  col-2 p-0">
	                         <span class="input-group-text col-12" id="basic-addon3"><label class="mb-0" for="register-form-name">비밀번호 확인</label></span>
	                     </div>
	                     <input type="password" class="form-control col-10" id="modifyMemPass2" name="memPass2" aria-describedby="basic-addon3" placeholder="한번 더 입력해주세요.">
     			         <input type="hidden"id="memId" name="memId" value="${member.memId}">
     			         <input type="hidden"id="memName" name="memName" value="${member.memName}"><br>
	                 </div>
	                     <span class="error_next_box"></span>
				</div>	
        	   
                 <div class="container form-group">
	                 <div class="pt-15 b-t mt-15">
	                 	<a href="javascript:modify_pw();" id="modifyBtn" class="btn btn-info mr-1 mb-2">변경완료</a>
	                 	<a href="javascript:window.close();" class="btn btn-info mr-1 mb-2">로그인창으로</a>
	                 </div>
	             </div>
	           </form> 
             </div>
         </div>
	</div>
	</section>
	<script>
		window.onload=function(){
			$("#modify_pw").hide();
			$("#modifyBtn").hide();
		}
		
		
		function modify_pw() {
			if ($("#modifyMemPass").val() == "") {
				alert("비밀번호는 필수 입력값입니다.");
				$("#memId").focus();
				return;
			}
			if ($("#modifyMemPass2").val() == "") {
				alert("비밀번호 확인은 필수 입력값입니다.");
				$("#memName").focus();
				return;
			}
			
			var form = $("#modify_pw");
	    	$.ajax({
	    		url:"/scm/user/modify_pw"
	    		,data: form.serialize()
	    		,type:'post'
	    		,success:function(){
	    				alert("비밀번호 변경 완료되었습니다.");
	    				window.close();
	    		}
	    		,error:function(error){
	    			alert('시스템 장애가 발생하였습니다. 관리자에게 문의하십시오.');
	    		}
	    	});
		}
		
		
		function pass_check() {
			var data = {
					memPass : document.querySelector('#memPass').value
				   ,memId : document.querySelector('#memId').value
			}
			
	    	$.ajax({
	    		url:"/scm/user/check_pw"
	    		,data: data
	    		,type:'post'
	    		,success:function(result){
	    			console.log(result);
	    			if (result == "duplicated") {
	    				alert("임시비밀번호가 일치합니다. 새로운 비밀번호로 변경해주십시오.");
	    				$("#checkPwDiv").hide();
	    				$("#modify_pw").show();
	    				$("#modifyBtn").show();
					}else {
	    				alert("임시비밀번호가 일치하지않습니다. 다시확인해주십시오.");
	    				$("#memPass").val("");
	    				$("#memPass").focus();
					}
	    		}
	    		,error:function(error){
	    			alert('시스템 장애가 발생하였습니다. 관리자에게 문의하십시오.');
	    		}
	    	});
		}
		
		var pw1 = document.querySelector('#modifyMemPass');
		var pw2 = document.querySelector('#modifyMemPass2');
		var error = document.querySelectorAll('.error_next_box');
		
		pw1.addEventListener("focusout", checkPw);
		pw2.addEventListener("focusout", comparePw);
		
		function checkPw() {
		    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{6,13}/;
		if(!pwPattern.test(pw1.value)) {
		        error[0].innerHTML = "6~13자 영문 대 소문자,숫자,특수문자를 사용하세요.";
		        error[0].style.display = "block";
		        error[0].style.color = "#B40431";
		        return;
		    } else {
		        error[0].innerHTML = "안전";
		        error[0].style.color = "#08A600";
		        error[0].style.display = "block";
		    }
		} 

		function comparePw() {
		    if(pw2.value === pw1.value && pw2.value != "") {
		        error[1].innerHTML = "일치"; 
		        error[1].style.display = "block";
		        error[1].style.color = "#08A600";
		    } else if(pw2.value !== pw1.value) {
		        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
		        error[1].style.display = "block";
		        error[1].style.color = "#B40431";
		        return;
		    } 
		}
	
	
	</script>


</html>