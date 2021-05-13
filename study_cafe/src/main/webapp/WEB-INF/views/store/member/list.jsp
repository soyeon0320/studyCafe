<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<style>
	#pageUnitSelector {
		width: 120px;
		
	}

</style>	
<section>
<form:form commandName="memberFormVO" action="list" id="listForm" name="listForm" method="post">
	<form:hidden path="memberVO.memId" id="detailNo" />
	<form:hidden path="memberVO.memMemo"/>
	<form:hidden path="memberVO.saveToken"/>
	
<main class="content">
	<div class="page-content d-flex flex pl-0 pr-0 mt-20">
	  <div class="d-flex flex">
	     <aside class="sidebar sidebar-sm" id="mail-sidebar" style="width: 40%;">
	        <div class="flex-column d-flex bg-white" style="height: auto;">
	            <div class="b-b navbar">
			        <h2>이용 회원 목록</h2>
	            </div>
				<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: auto;">
					<div class="flex slim-scroll" style="overflow: hidden; width: auto; height: 100%;">
						<div class="slimScrollDiv">
							<div class="pb-30"> 
								<table class="table table-hover table-mails mb-0">
									<thead>
										<tr align="center">
											<th>번호</th>
											<th>아아디</th>
											<th>회원명</th>
											<th>연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty memberList }">
											<tr>
												<td colspan="4" align="center">
													<strong>회원이 존재하지 않습니다.</strong>
												</td>
											</tr>
										</c:if>
										<c:forEach items="${memberList}" var="member">
											<tr style="cursor: pointer;" onclick="getUseMember('${member.memId}')" align="center">
												<td >${member.rnum}</td>
												<td >${member.memId}</td>
												<td>${member.memName}</td>
												<td>${member.memTel}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="container clearfix" style="width: fit-content;">
							<ul class="pagination pagination-circle pagination-3d pagination-light">
								<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
							</ul>    
						</div>    
							</div>
						</div>
					</div>
			</aside><!--inobx sidebar-->
				<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
				    <div class="d-flex flex flex-column" style="height: auto;">
				        <div class="navbar bg-white b-b">
				            <h2>이용 회원 조회</h2>
				        </div>
				        <div class="portlet-body pt-2 pb-2 pl-3 pr-3" id="detailMemberDiv" style="display: none;">
                            <table class="table table-bordered mb-0" >
	                             <tbody>
	                             <tr>
	                                 <th width="10%">아이디</th>
	                                 <td width="40%" id="memId"></td>
	                                 <th width="10%">이름</td>
	                                 <td width="40%%" id="memName"></td>
	                             </tr>
	                             <tr>
	                                 <th>전화번호</th>
	                                 <td id="memTel"></td>
	                                 <th>이메일</td>
	                                 <td id="memEmail"></td>
	                             </tr>
	                             <tr>
	                                 <th>누적시간</th>
	                                 <td id="seatTotaltime"></td>
	                                 <th>이용내역</td>
	                                 <td>
	                                 	<button type="button" class="btn btn-info mr-1" data-toggle="modal" data-target="#exampleModal">
                                            	자세히보기
                                        </button>
                                          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">이용내역 조회</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                     	<table class="table mb-0">
                                                     		<thead>
	                                                     		<tr>
	                                                     			<th>no</th>
	                                                     			<th>좌석번호</th>
	                                                     			<th>입실시간</th>
	                                                     			<th>퇴실시간</th>
	                                                     		<tr>	
                                                     		</thead>
                                                     		<tbody id="seatList">
                                                     			<!-- 목록들어감 -->
                                                     		</tbody>
                                                     	
                                                     	</table>
                                                     	<div class="container clearfix" style="width: fit-content;">
															<ul class="pagination pagination-circle pagination-3d pagination-light" id="seatPagination">
																<!-- 페이징 생기는곳 -->
															</ul>
														</div>
														<input type="hidden" name="pageIndex" value="1" id="seatPageIndex">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
	                                 </td>
	                             </tr>
	                             <tr>
	                                 <th>메모</th>
	                                 <td colspan="3" height="300px;" id="memMemo" style="font-size: 2em;"></td>
	                             </tr>
	                             </tbody>
                         	</table>
                         	<button type="button" class="btn btn-teal mb-2 mr-1 mt-3 float-right" onclick="modifyView();" data-toggle="modal" data-target="#exampleModalCenter">
                             	  메모등록
                            </button>
                                 <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                   <div class="modal-dialog modal-dialog-centered" role="document">
                                       <div class="modal-content">
                                           <div class="modal-header">
                                               <h5 class="modal-title" id="exampleModalLongTitle">회원 메모 등록</h5>
                                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                               </button>
                                           </div>
                                           <div class="modal-body">
                                            <textarea rows="3" id="modifyMemo" class="form-control" maxlength="900" required="required" placeholder="내용을 입력해주세요."></textarea> 
                                            <input type="hidden" id="moidfySaveToken">
											<input type="hidden" id="moidfyMemId">
                                           </div>
                                           <div class="modal-footer">
                                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                               <button type="button" class="btn btn-primary" onclick="modify();">등록</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                         </div>
					</div>
					
				</div><!--chat content-->
	        </div>
	    </div>
	</main>
	<form:hidden path="searchMemberVO.pageIndex" id="pageIndex"/>							
	</form:form>		
</section>

<script>
	var storeCode = '${owner.storeCode}';


	function getUseMember(memId) {
		var data = {
			"memId" : memId
			,"storeCode" : "${owner.storeCode}"
		}
		
		$.ajax({
			url:"<c:url value='/useMember/detail'/>"
			,type : "post"
			,data : data
			,success : function(data){
				$("#detailMemberDiv").css("display", "");
				setUseMember(data.member);
				getSeatList(data.member.memId);
			}
		});
	}


	function setUseMember(member) {
		$("#memId").html(member.memId);
		$("#memName").html(member.memName);
		$("#memTel").html(member.memTel);
		$("#memEmail").html(member.memEmail);
		
		var hour = Math.floor(parseInt(member.seatTotaltime)/60);
		var min = parseInt(member.seatTotaltime)%60;
		$("#seatTotaltime").html(hour+"시간 " + min+"분");
		$("#memMemo").html(member.memMemo);
	}

	function setSeatList(seatHisList) {
		$("#seatList").empty();
		if (seatHisList.length > 0) {
			$.each(seatHisList, function(idx, item) {
				var table = $("<tr align='center'></tr>");
				$(table).append("<td>" + item.rnum + "</td>");
				$(table).append("<td>" + item.seatNo + "</td>");
				$(table).append("<td>" + getTimeStamp(item.seatIn) + "</td>");
				$(table).append("<td>" + getTimeStamp(item.seatOut) + "</td>");
				$("#seatList").append(table);
			});
		}else {
			$("#seatList").html("<tr> <td colspan='4'> 이용내역이 없습니다. </td> </tr>");
		}		
		
// 		var res = "";
// 		for (var i = 0; i < data.seatHisList.length; i++) {
			
// 			var list = data.seatHisList[i];
			
// 			var dateIn = new Date(list.seatIn);
// 			var dateOut = new Date(list.seatOut);
			
// 			res += "<tr>"
// 				+"<td>"+list.seatNo+"</td>"
// 				+"<td>"+getTimeStamp(list.seatIn)+"</td>"
// 				+"<td>"+getTimeStamp(list.seatOut)+"</td>"
// 				+"</tr>";
// 		}
		
// 		if (res == "") {
// 			res = "<tr><td colspan='3' align='center'>이용내역이 없습니다.</td></tr>";
// 		}
		
// 		$("#seatList").html(res);
		
	}
	
	function getSeatList(memId) {
		var data = {
			"memId" : memId
			,"storeCode" : storeCode
			,"pageIndex" : $("#seatPageIndex").val()
		}
		
		$.ajax({
			url : "<c:url value='/useMember/seatHisList'/>"
			,type : "post"
			,data : data
			,success : function(data){
				setSeatList(data.seatHisList);
				set_paging(data.paginationInfo,"page_seat","#seatPagination");
			}
			,error : function(error) {
				console.log(error);
			}
		});
		
	}
	
	function page_seat(pageIndex){
		$("#seatPageIndex").val(pageIndex);
		getSeatList($("#memId").html());
		
	}
		
	
	
	function modifyView(){
		
		var data = {
			memId : $("#memId").html()	
				
		}
		
		$.ajax({
			url : "<c:url value='/useMember/modifyView'/>"
			,type : "post"
			,data : data
			,success : function(data){
				open_modify_modal(data.member)
			}
			,error:function(error){
				console.log(error);
				alert("수정불가");
			}
		});
		
	}
	
	function open_modify_modal(member){
		$("#exampleModalCenter").modal();
		
		console.log("member : "  + member.saveToken);
		
		$("#modifyMemo").val(member.memMemo);
		$("#moidfySaveToken").val(member.saveToken);
		$("#moidfyMemId").val(member.memId);
	}
	
	function modify(){
		$("input[name='memberVO.memMemo']").val($("#modifyMemo").val());
		$("input[name='memberVO.saveToken']").val($("#moidfySaveToken").val());
		$("input[name='memberVO.memId']").val($("#moidfyMemId").val());
		
		go_action("<c:url value='/useMember/modify'/>","#listForm");
	}
	
	
</script>
