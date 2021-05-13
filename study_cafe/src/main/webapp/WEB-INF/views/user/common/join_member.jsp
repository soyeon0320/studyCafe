<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

    <!-- 회원가입 -->
    
    <!DOCTYPE html>
	<html dir="ltr" lang="en-US">
	<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap-->
    <link href="<%=request.getContextPath() %>/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--Common Plugins CSS (all plugins css file compile into one file by gulp) -->
    <link href="<%=request.getContextPath() %>/resources/css/plugins/plugins.css" rel="stylesheet">
    <!--fonts-->
<%--     <link href="<%=request.getContextPath() %>/resources/lib/line-icons/line-icons.css" rel="stylesheet"> --%>
    <link href="<%=request.getContextPath() %>/resources/css/font-icons.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/resources/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/chartist-custom.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/resources/lib/chartist/chartist.min.css" rel="stylesheet" />
    
        <!-- datepicker -->
    <link href="<%=request.getContextPath() %>/resources/lib/dt-picker/jquery.datetimepicker.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/picker-custom.css" rel="stylesheet">
    
    <!-- jvectormap -->
    <link href="<%=request.getContextPath() %>/resources/lib/vector-map/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Assan cuatom CSS fle -->
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font.css" type="text/css" />
		
    <style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	
		body,* {
			font-family: 'Jeju Gothic', serif;
		}
		
		input[type="password"] {
			font-family: sans-serif !important;
		}

	</style>
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<title>회원가입</title>
	</head>
	
	<body>
		<section class="content flex">
		
			<div class="content">
			<header class="navbar page-header border0 navbar-expand-lg p-5" style="background-color: white;">
			  <div class="container">
			       <a class="navbar-brand d-inline-flex align-items-center" href="<%=request.getContextPath()%>/home">
			          <i class="icon-book-reader d-inline-flex mr-2 avatar50 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"
			          		style="background-color: #86d4f5;"></i>
			          <span class="fs-2x font500">Spring Study</span>
			      </a>
			    </div>
			</header>
			<nav class="navbar navbar-expand-lg navbar-light navbar-horizontal" style="background-color: #69c1e6; color: rgb(255,234,0);">
		    <div class="container">
		         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
		            <span class="navbar-toggler-icon"></span>
		        </button>
		        <div class="collapse navbar-collapse" id="navbarsExample05">
		            <ul class="navbar-nav mr-auto">
		                <li class="nav-item">
		                    <a class="nav-link" href="<%=request.getContextPath()%>/home">
		                        <i class="icon-home"></i>
		                        Home 
		                    </a>
		                </li>
		            </ul>
		        </div>
		    </div>
		</nav>
				<div class="container" style="margin-top: 30px;">
				

					<div class="tabs mx-auto mb-0" id="tab-login-register" style="max-width: 650px;">

						<ul class="tab-nav tab-nav2 center clearfix">
						</ul>

						<div class="tab-container mb-30">


							<div class="tab-content" id="tab-register">
								<div class="card mb-0">
									<div class="card-body">
										<h3>회원가입</h3>

										<form id="joinForm" name="joinForm" class="row mb-0" action="join" method="post">

											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
	                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">아이디 </label></span>
													</div>
													<input type="text" id="memId" name="memId" value="" class="form-control col-9" placeholder="5~13자의 영문 소문자,숫자만 사용 가능합니다.">
	                                           </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
	                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">비밀번호 </label></span>
													</div>
													<input type="password" id="memPass" name="memPass" value="" class="form-control col-9" placeholder="6~13자 영문 대 소문자,숫자,특수문자를 사용하세요.">
	                                           </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
	                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">비밀번호 확인</label></span>
													</div>
													<input type="password" id="memPass2" name="memPass2" value="" class="form-control col-9" placeholder="비밀번호를 한번 더 입력해주세요.">
	                                           </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
	                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">이 름</label></span>
													</div>
													<input type="text" id="memName" name="memName" value="" class="form-control col-9" placeholder="한글과 영문 대 소문자를 사용하세요.">
	                                           </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
	                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">생년월일</label></span>
													</div>
													<input type="text" id="date_timepicker_start" name="memBir" value="" class="form-control col-9" />
	                                           </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
		                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">전화번호</label></span>
													</div>
													<input type="text" id="memTel" name="memTel" value="" class="form-control col-9" placeholder="010-1234-5678"/>
		                                        </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
		                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">이메일</label></span>
													</div>
													<input type="text" id="memEmail" name="memEmail" value="" class="form-control col-9" placeholder="abcd@ddit.com"/>
		                                        </div>
												<span class="error_next_box"></span>
											</div>

											
											<div class="col-6 form-group">
												<div class="customUi-radio radioUi-info  pb-2">
	                                              <input id="memGenM" type="radio" name="memGen" value="M">
	                                              <label for="memGenM">
	                                                  <span class="label-radio"></span>
	                                                  <span class="label-helper">남자</span>
	                                              </label>
	                                            </div>
												<div class="customUi-radio radioUi-success pb-2">
	                                              <input id="memGenF" type="radio" name="memGen" value="F">
	                                              <label for="memGenF">
	                                                  <span class="label-radio"></span>
	                                                  <span class="label-helper">여자</span>
	                                              </label>
	                                            </div>
												<span class="error_next_box"></span>
                                            </div>
											
											
											<div class="col-6 form-group">
												<select class="form-control mb-20" name="memRoute" id="memRoute">
													<option value="">--------- 유입경로 선택 ---------</option>
													<option value="SNS">SNS</option>
													<option value="광고">광고</option>
													<option value="지인">지인</option>
													<option value="기타">기타</option>
												</select>
												<span class="error_next_box"></span>
											</div>
											<div class="col-12 form-group">
												<a href="<%=request.getContextPath() %>/home" class="btn btn-secondary">
                                                	메인으로
                                            	</a>										
												<a href="javascript:join_go();" class="btn btn-info float-right">
                                                	회원가입완료
                                            	</a>										
											</div>

										</form>
									</div>
								</div>
							</div>

						</div>

					</div>

			</div>
			</div>
		</section><!-- #content end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up" style="display: none;"></div>

	<!-- JavaScripts
	============================================= -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins/plugins.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/peity/jquery.peity.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/fullcalendar/moment.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/dt-picker/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins-custom/pickers-custom.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="<%=request.getContextPath() %>/resources/old_js/functions.js"></script>
	<script src="<%=request.getContextPath() %>/resources/join.js"></script>




	<script type="text/javascript"> //회원 정규식

	
 			//회원가입 완료
		function join_go() {
			var form = $("#joinForm");
			
			if (!$("#memId").val()) {
				alert("아이디는 필수값입니다.");
				return;
			}
			if (!$("#memPass").val()) {
				alert("비밀번호는 필수값입니다.");
				return;
			}
			if (!$("#memPass2").val()) {
				alert("비밀번호 확인은 필수입니다.");
				return;
			}
			if (!$("#memName").val()) {
				alert("이름은 필수값입니다.");
				return;
			}
			if (!$("input[name='memBir']").val()) {
				alert("생년월일은 필수값입니다.");
				return;
			}
			if (!$("input[name='memTel']").val()) {
				alert("전화번호는 필수값입니다.");
				return;
			}
			if (!$("input[name='memEmail']").val()) {
				alert("이메일은 필수값입니다.");
				return;
			}
			checkGen();
			
// 			var memBir = yy.value + mm.value + dd.value;
// 			console.log(memBir);
// 			$('#memBir').val(memBir);
			
			form.submit();
	 	}

</script>


</body>
</html>