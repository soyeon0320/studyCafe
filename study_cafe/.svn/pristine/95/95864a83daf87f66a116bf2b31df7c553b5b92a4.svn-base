<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<section> 
	
	<form:form commandName="memberReviewFormVO" id="listForm">
		<div class="container clearfix">
			<h1>나의 리뷰조회</h1>
			
			<div class="btn-list">
				<form:button id="studyRoom"  class="btn btn-danger mr-1 mb-2" type="button" onclick="myReview('#myStudyRoomReview',this)"><span>스터디룸</span></form:button>
				<form:button id="seat"       class="btn btn-primary mr-1 mb-2" type="button" onclick="myReview('#mySeatReview',this)"><span>좌석</span></form:button>
			</div>
			
			<div id="myStudyRoomReview" class="history-show">
				<table class="table table-hover">
					<thead>
						<tr>
						  <th>No</th>
						  <th>이용가맹점</th>
						  <th>별점</th>
						  <th>내용</th>
						  <th>작성일</th>
						</tr>
					</thead>
					<tbody id="indexListAjax">
						<c:forEach items="${myStudyRoomReview }" var="mrr" varStatus="status">
						<tr onclick="OpenWindow('reviewDetail?reviewsNo=${mrr.reviewsNo}', '스터디룸리뷰 상세',800,600)">
						  <td>${status.count }</td>
						  <td>${mrr.storeName }</td>
						  <td>
			  			 	 <input type="number" class="rating" value="${mrr.studyRoomGrade}" data-size="xs" data-readonly="true" readonly="readonly">
						  </td>
						  <td>${mrr.reviewsContent }</td>
						  <td>
						  	<fmt:formatDate value="${mrr.studyRoomReviewsRegDate}" pattern="yyyy-MM-dd"/>
						  </td>
						</tr>
						</c:forEach>
						</tbody>
						</table>
						<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>
						<div class="container clearfix" style="width: fit-content;">
							<ul class="pagination pagination-circle pagination-3d pagination-light">
								<ui:pagination paginationInfo = "${studyRoomPaginationInfo}" type="text" jsFunction="go_room" />
								<form:hidden path="searchStudyRoomReviewsVO.pageIndex" id="roomIndex"/>
							</ul>    
						</div>
					</div>
					 
					<div id="mySeatReview" class="history-hide" style="display: none;">
						<table class="table table-hover">
						<thead>
							<tr>
							  <th>No</th>
							  <th>이용가맹점</th>
							  <th>별점</th>
							  <th>내용</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="indexListAjax">
							<c:forEach items="${mySeatReview }" var="msr" varStatus="status">
								<tr onclick="OpenWindow('reviewDetail?seatReviewsNo=${msr.seatReviewsNo}&storeCode=${msr.storeCode}', '좌석리뷰 상세', 800, 600)">
								  <td>${status.count }</td>
								  <td>${msr.storeName }</td>
								  <td>
					  			 	 <input type="number" class="rating" value="${msr.seatGrade}" data-size="xs" data-readonly="true" readonly="readonly">
								  </td>
								  <td>${msr.seatReviewsContent }</td>
								  <td>
								  	<fmt:formatDate value="${msr.seatReviewsRegDate}" pattern="yyyy-MM-dd"/>
								  </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>
				<div class="container clearfix" style="width: fit-content;">
					<ul class="pagination pagination-circle pagination-3d pagination-light">
						<ui:pagination paginationInfo = "${seatPaginationInfo}" type="text" jsFunction="go_seat" />
						<form:hidden path="searchSeatReviewsVO.pageIndex" id="seatIndex"/>
					</ul>    
				</div>
				
			</div>
		</div>
		<form:hidden path="tabType" id="tabType"/>
	
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
		go_action("reviewList");
	}
	function go_room(pageIndex){
		$("#roomIndex").val(pageIndex);
		$("#tabType").val("room");
		go_action("reviewList");
		
	}
	function myReview(tabId,obj){
		if($(obj).hasClass("btn-danger")){
			return;
		}
		$(".history-show").hide().attr("class","history-hide");
		$(tabId).show().attr("class","history-show");
		$("div.btn-list .btn-danger").removeClass("btn-danger").addClass("btn-primary");
		$(obj).removeClass("btn-primary").addClass("btn-danger");
	}
</script>	