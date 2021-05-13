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
             <form id="findPw" name="findPw" action="sendMail" method="post">
	             <div class="container form-group">
	                 <div class="input-group row m-0">
	                     <div class="input-group-prepend  col-2 p-0">
	                         <span class="input-group-text col-12" id="basic-addon3"><label class="mb-0" for="register-form-name">아이디 </label></span>
	                     </div>
	                     <input type="text" class="form-control col-10" id="memId" name="memId" aria-describedby="basic-addon3">
	                 </div>
	        	 </div>       
        	    
        	    <div class="container form-group">
	                 <div class="input-group row m-0">
	                     <div class="input-group-prepend  col-2 p-0">
	                         <span class="input-group-text col-12" id="basic-addon3"><label class="mb-0" for="register-form-name">이름</label></span>
	                     </div>
	                     <input type="text" class="form-control col-10" id="memName" name="memName" aria-describedby="basic-addon3">
	                 </div>
				</div>	

                 <div class="container form-group">
	                 <div class="pt-15 pb-15 b-t mt-15">
	                 	<a href="javascript:sendMail_go();" class="btn btn-warning mr-1 mb-2">임시비밀번호 발송</a>
	                 	<a href="javascript:window.close();" class="btn btn-info mr-1 mb-2">로그인창으로</a>
	                 </div>
	             </div>
	             </form>
             </div>
         </div>
	</div>
	</section>

	<script type="text/javascript">
	function sendMail_go() {
		if ($("#memId").val() == "") {
			alert("아이디는 필수 입력값입니다.");
			$("#memId").focus();
			return;
		}
		if ($("#memName").val() == "") {
			alert("휴대폰번호는 필수 입력값입니다.");
			$("#memName").focus();
			return;
		}

		var form = $("#findPw");
		form.submit();
		
// 		$.ajax({
<%-- 			url:"<%=request.getContextPath()%>/user/check_member" --%>
// 			,data:form.serialize()
// 			,type : 'post'
// 			,success : function(result) {
// 				if (result != null) {
					
// 				}else {
// 					alert("일치하는 회원 정보가 없습니다.");
// 				}
// 			}
// 			,error:function(error){
// 				alert('시스템 장애로 이용이 불가합니다.');
// 			}
// 		});
	}
	
	
	
	</script>



</body>
</html>