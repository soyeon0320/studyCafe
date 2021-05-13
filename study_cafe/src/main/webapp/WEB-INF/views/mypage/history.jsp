<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<section>
	
	<form:form commandName="memberHistoryFormVO" id="listForm">
		<div class="btn-list">
			<form:button id="studyRoom"  class="btn btn-danger mr-1 mb-2" type="button" onclick="myHistory('#myStudyRoomList',this)"><span>스터디룸</span></form:button>
			<form:button id="seat"       class="btn btn-primary mr-1 mb-2" type="button" onclick="myHistory('#mySeatList',this)"><span>좌석</span></form:button>
		</div>
	
		<div id="myStudyRoomList" class="history-show">
			<table class="table table-hover mt-20">
				<thead>
					<tr>
					  <th>지점</th>
					  <th>좌석종류</th>
					  <th>입실시간</th>
					  <th>퇴실시간</th>
					  <th>후기등록</th>
					  <th>예약취소</th>
					</tr>
				</thead>
				<tbody id="indexListAjax">
					<c:forEach items="${myStudyRoomList }" var="msr" varStatus="status">
					<tr>
						<td>${msr.storeName}</td>
						
						<c:if test="${msr.studyroomCapa eq 6}">
							<td><c:out value="스터디룸  A(4인)" /></td>
						</c:if>
						<c:if test="${msr.studyroomCapa eq '5'}">
							<td><c:out value="스터디룸  B(6인)" /></td>
						</c:if>
						<td>
							<fmt:formatDate value="${msr.studyroomIn}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<fmt:formatDate value="${msr.studyroomOut}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
						<c:if test="${not empty msr.studyroomOut }">
							<c:if test="${msr.flag eq 0 }">
							<button class="btn btn-shadow  btn-teal mb-3 mr-3" type="button" onclick="OpenWindow('registReviewForm?studyroomReservNo=${msr.studyroomReservNo}', '리뷰 등록', 800, 600)"><span>후기등록</span></button>
							</c:if>
							<c:if test="${msr.flag eq 1 }">
							<button class="btn btn-shadow  btn-danger mb-3 mr-3" type="button"><span>작성완료</span></button>
							</c:if>
						</c:if>
						</td>
						<td>
						<c:if test="${today < msr.studyroomReservStart }">
							<button class="btn btn-shadow  btn-purple mb-3 mr-3" onclick="go_cancel(${msr.studyroomReservNo})">예약취소</button>
						</c:if>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${roomPaginationInfo}" type="text" jsFunction="go_room" />
					<form:hidden path="searchRentStudyRoomVO.pageIndex" id="roomIndex"/>
				</ul>    
			</div>    
		</div>
		
		<hr>

		<div id="mySeatList" class="history-hide" style="display: none;">
			<table class="table table-hover mt-20">
				<thead>
					<tr>
					  <th>지점</th>
					  <th>좌석종류</th>
					  <th>입실시간</th>
					  <th>퇴실시간</th>
					  <th>후기등록</th>
					</tr>
				</thead>
				<tbody id="indexListAjax">
					
					<c:forEach items="${mySeatList }" var="msl" varStatus="status">
					<tr>
						<td>${msl.storeName}</td>
						
						<td>${msl.seatNo}번 좌석</td>
						<td>
							<fmt:formatDate value="${msl.seatIn}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<fmt:formatDate value="${msl.seatOut}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
						<c:if test="${not empty msl.seatOut}">
							<c:if test="${msl.flag eq 0 }">
							<button class="btn btn-shadow  btn-teal mb-3 mr-3" type="button" onclick="OpenWindow('registSeatReviewForm?rentSeatNo=${msl.rentSeatNo}', '리뷰 등록', 800, 600)"><span>후기등록</span></button>
							</c:if>
							<c:if test="${msl.flag eq 1}">
							<button class="btn btn-shadow  btn-danger mb-3 mr-3" type="button"><span>작성완료</span></button>
							</c:if>
						</c:if>	
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${seatPaginationInfo}" type="text" jsFunction="go_seat" />
					<form:hidden path="searchRentSeatVO.pageIndex" id="seatIndex" />
				</ul>    
			</div>    
		</div>
		<form:hidden path="tabType" id="tabType"/>
		<form:hidden path="rentStudyRoomVO.studyroomReservNo" id="reservCancel"/>
	</form:form>
</section>
<script>

widow.onload=function(){
	<c:if test="${tabType eq 'seat' }">
		$("#seat").trigger("click");
	</c:if>
}


function go_seat(pageIndex){
	$("#seatIndex").val(pageIndex);
	$("#tabType").val("seat");
	go_action("history");
}
function go_room(pageIndex){
	$("#roomIndex").val(pageIndex);
	$("#tabType").val("room");
	go_action("history");
	
}

function myHistory(tabId,obj){
	if($(obj).hasClass("btn-danger")){
		return;
	}
	$(".history-show").hide().attr("class","history-hide");
	$(tabId).show().attr("class","history-show");
	$("div.btn-list .btn-danger").removeClass("btn-danger").addClass("btn-primary");
	$(obj).removeClass("btn-primary").addClass("btn-danger");
	
}

function go_cancel(reservNo){
	
	if(!confirm("예약을 취소하시겠습니까?")) return;
	if(!confirm("진짜로?")) return;
	if(!confirm("정말로?")) return;
	
	$("#reservCancel").val(reservNo);
	go_action("./history/cancel");
	
}

</script>