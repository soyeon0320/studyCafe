<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
<%--            		<a href="<%=request.getContextPath() %>/kiosk/main" class="btn btn-icon btn-rounded btn-xl btn-warning mb-2"> --%>
<!--                     <i class="icon-line2-home"></i> -->
<!--                     	<p class="mb-0" style="font-size: x-large;">메인으로</p> -->
<!--                 </a> -->
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
             
          	 </li>
       </ul>
   </header>
   <h4 align="center" onclick="get_hidden_data();">로그인 후 시설이용이 가능합니다. <br> 회원이 아닌경우 웹페이지를 통해 회원가입해주세요.</h4>
	<div class="row">
	
		<div class="offset-2 col-8 pt-40 pb-20 no-border-lg-down mt-50" style="background-color: #e5f2ff82;border-radius: 20px;">
           <form id="loginForm" name="loginForm" method="post" action="login">
               <div class="input-icon-group input-icon-lg">
                   <div class="input-icon-append">
                       <i class="icon-user21"></i>
                       <label for="loginId" class="form-control" >
	                       	<input type="text" class="hangulField" id="loginId" name="memId" placeholder="아이디를 입력하세요" style="border-style: hidden; background: none;" >
	                   </label>
                   </div>
               </div>
               <div class="input-icon-group input-icon-lg">
                   <div class="input-icon-append">
                       <i class="icon-line-lock"></i>
                       <label for="loginPwd" class="form-control" >
	                       	<input type="password" class="hangulField" id="loginPwd" name="memPass" placeholder="비밀번호를 입력하세요" style="border-style: hidden; background: none;" >
	                   </label>
                   </div>
               </div>
      		<button type="submit" class="btn btn-block btn-rounded btn-xl btn-info mb-2">
               	<p class="mb-0" style="font-size: x-large;">로그인</p>
           </button>
           </form>
      		<a href="<%=request.getContextPath() %>/kiosk/main" class="btn btn-block btn-rounded btn-xl btn-dark mb-2">
               	<p class="mb-0" style="font-size: x-large;">메인으로</p>
           </a>
       </div>
	
		
		<!-- 테스트기간중 간편로그인 -->
<!-- 		<div class="container center" align="center"> -->
<!--          	<select id="selectUsers" onchange="login_go();" style="height: 40px;width: 100%;font-size: xx-large;"> -->
<!--          		<option value="">테스트 사용자 선택</option> -->
<!--          		<option value="test|1234">test(김미미)</option> -->
<!--          		<option value="kim|1234">kim(김감자)</option> -->
<!--          		<option value="son1010|1234">son1010(손가휘)</option> -->
<!--          		<option value="potato1234|1234">potato1234(박감자)</option> -->
<!--          	</select> -->
<!--          </div> -->
         <script type="text/javascript">
	
			function login_go() {
				if ($("#selectUsers").val() != "") {
					var Id = $("#selectUsers").val().split('|')[0];
					var pass = $("#selectUsers").val().split('|')[1];
					
						$("input:text[name=memId]").val(Id);
						$("input:password[name=memPass]").val(pass);
						$("#loginForm").submit();
				}
			}
			
			function get_hidden_data(){
				$("#loginId").val("son1010");
				$("#loginPwd").val("test1234");
			}
		</script>
         
         
	</div>
	
	

</div>

