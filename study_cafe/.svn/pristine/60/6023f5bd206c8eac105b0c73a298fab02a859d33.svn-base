<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column col-11">
			<h3>내 프로필</h3>
		</div>
			<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3"
				onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/myInfo';">수정</button>
		<div>
			<!-- 톱니바퀴 -->
		</div>
	</div>

	<div class="portlet-body" style="padding: 10px;">
	
	<div class="iCard border1 p-2 rounded bg-white">
              <div class="col-3" style="float: left;">
              <a href="#">
                  <img src="<%=request.getContextPath() %>/resources/login/img/avatar.svg" alt="" class="img-fluid rounded" style="padding-top: 20px;">
              </a>
              </div>
               <div role="tabpanel" class="tab-pane " id="tb2">
                   <div class="bg-white  p-3 border1 rounded">
                       <div class="row mb-2">
                           <div class="col-6">
                               <small class="text-muted">회원 ID</small>
                               <div class="font500">${myInfo.memId}
                               </div>
                           </div>
                           <div class="col-6">
                               <small class="text-muted">회원 이름</small>
                               <div class="font500">${myInfo.memName}</div>
                           </div>
                       </div>
                       <div class="row mb-2">
                           <div class="col-6">
                               <small class="text-muted">이메일</small>
                               <div class="font500">${myInfo.memEmail}</div>
                           </div>
                           <div class="col-6">
                               <small class="text-muted">전화번호</small>
                               <div class="font500">${myInfo.memTel}</div>
                            </div>
                        </div>
                    </div>
                </div>
		</div>
	</div>
</div>