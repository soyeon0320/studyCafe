<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/main" class="btn btn-block btn-icon btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="javascript:join_go();" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line2-login"></i>
                    	<p class="mb-0" style="font-size: x-large;">회원가입</p>
                </a>
          	 </li>
       </ul>
   </header>
   
<%--    <%@ include file="/WEB-INF/views/user/common/join_member.jsp" %> --%>
	<div class="container clearfix">

					<div class="tabs mx-auto mb-0 clearfix" id="tab-login-register" style="max-width: 650px;">

						<ul class="tab-nav tab-nav2 center clearfix">
						</ul>

						<div class="tab-container">


							<div class="tab-content" id="tab-register">
								<div class="card mb-0">
									<div class="card-body" style="padding: 40px;">

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
													<input type="text" id="memPass" name="memPass" value="" class="form-control col-9" placeholder="6~13자 영문 대 소문자,숫자,특수문자를 사용하세요.">
	                                           </div>
												<span class="error_next_box"></span>
											</div>
											
											<div class="container form-group">
												<div class="input-group row m-0">
													<div class="input-group-prepend col-3 p-0">
	                                             	  <span class="input-group-text col-12"><label class="mb-0" for="register-form-name">비밀번호 확인</label></span>
													</div>
													<input type="text" id="memPass2" name="memPass2" value="" class="form-control col-9" placeholder="비밀번호를 한번 더 입력해주세요.">
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
													<div class="input-group-append col-1 p-0">
		                                             	  <span class="input-group-text col-12"><a href="javascript:email_check();"><i class="fa fa-check"></i></a></span>
													</div>
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

										</form>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>
</div>



<script type="text/javascript"> //회원 정규식
	
 			//회원가입 완료
		function join_go() {
			var form = $("#joinForm");
			
			checkId();
			checkPw();
			comparePw();
			checkName();
			checkGen();
			isBirthCompleted();
			isEmailCorrect();
			checkPhoneNum();
			
			var memBir = yy.value + mm.value + dd.value;
			console.log(memBir);
			$('#memBir').val(memBir);
			
			form.submit();
	 	}

</script>

<script src="/scm/resources/join.js"></script>
