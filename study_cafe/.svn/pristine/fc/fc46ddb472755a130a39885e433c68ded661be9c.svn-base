<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<section>
	<header class="navbar page-header border0 navbar-expand-lg" style="background-color: #e5effd">
	  <div class="container">
	       <a class="navbar-brand d-inline-flex align-items-center" href="#">
	          <i class="icon-book-reader d-inline-flex mr-2 avatar32 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"
	          		style="background-color: #69c1e6;"></i>
	          <span class="fs-1x font500">Spring Study</span>
	      </a>
	    </div>
	</header>
	
	<body>
	<div class="container">
		<div class="portlet-box portlet-gutter ui-buttons-col mb-30 mt-30">
             <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                 <div class="flex d-flex flex-column">
                     <h3>아이디 찾기</h3> 
                 </div>
             </div>
             <div class="portlet-body">
             <form id="findId" name="findId" action="findId" method="post">
	             <div class="container form-group">
	                 <div class="input-group row m-0">
	                     <div class="input-group-prepend  col-2 p-0">
	                         <span class="input-group-text col-12" id="basic-addon3"><label class="mb-0" for="register-form-name">이 름 </label></span>
	                     </div>
	                     <input type="text" class="form-control col-10" id="memName" name="memName" aria-describedby="basic-addon3">
	                 </div>
	        	 </div>       
        	    
        	    <div class="container form-group">
	                 <div class="input-group row m-0">
	                     <div class="input-group-prepend  col-2 p-0">
	                         <span class="input-group-text col-12" id="basic-addon3"><label class="mb-0" for="register-form-name">휴대폰 번호</label></span>
	                     </div>
	                     <input type="text" class="form-control col-10" id="memTel" name="memTel" aria-describedby="basic-addon3">
	                 </div>
				</div>	
				<div class="container form-group">
	                <div class="input-group">
						<div class="customUi-radio radioUi-info">
                          <input id="memGenM" type="radio" name="memGen" value="M">
                          <label for="memGenM">
                              <span class="label-radio"></span>
                              <span class="label-helper">남자</span>
                          </label>
                        </div>
                        &nbsp;&nbsp;&nbsp;
						<div class="customUi-radio radioUi-success">
                           <input id="memGenF" type="radio" name="memGen" value="F">
                           <label for="memGenF">
                               <span class="label-radio"></span>
                               <span class="label-helper">여자</span>
                           </label>
	                    </div>
	                 </div>
                 </div>
                 <div class="container form-group">
	                 <div class="pt-30 pb-30 b-t mt-15">
	                 	<a href="javascript:findId_go();" class="btn btn-warning mr-1 mb-2">아이디 찾기</a>
	                 	<a href="javascript:window.close();" class="btn btn-info mr-1 mb-2">로그인창으로</a>
	                 </div>
	             </div>
	             </form>
             </div>
         </div>
	</div>
	</section>

	<script type="text/javascript">
	function findId_go() {
		if ($("#memName").val() == "") {
			alert("이름은 필수 입력값입니다.");
			$("#memName").focus();
			$("#memName").focus();
			return;
		}
		if ($("#memTel").val() == "") {
			alert("휴대폰번호는 필수 입력값입니다.");
			$("#memTel").focus();
			return;
		}
		if ($('#memGenF').is(':checked') == false&&$('#memGenM').is(':checked') == false) {
			alert('성별을 선택해주세요');
			return;
		}
		var form = $("#findId");
		form.submit();
	}
	
	</script>



</body>
</html>