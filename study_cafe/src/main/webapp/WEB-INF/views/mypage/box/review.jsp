<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column">
			<h3>나의 리뷰조회</h3>
			
			
		</div>
		<a href="reviewList" class="nav-link avatar avatar32 bg-success-light text-success rounded-circle  no-padding">
		<i class="fa fa-ellipsis-v"></i></a>
		<div>
			
		</div>
	</div>
	
	<div class="portlet-body" style="padding: 10px;">
		<div class="reviewBtn-list">
			<button id="studyRoom"  class="btn btn-danger btn-sm" type="button" onclick="myReview('#myStudyRoomReview',this)"><span>스터디룸</span></button>
			<button id="seat"       class="btn btn-primary btn-sm" type="button" onclick="myReview('#mySeatReview',this)"><span>좌석</span></button>
		</div>
		<div id="myStudyRoomReview" class="review-show">
			<table class="table table-hover mt-15">
				<colgroup>
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
				<thead align="center">
					<tr>
					  <th>지점</th>
					  <th>별점</th>
					  <th>내용</th>
					</tr>
				</thead>
				<tbody id="indexListAjax" align="center">
					<c:forEach items="${myStudyRoomReview }" var="mrr" varStatus="status">
					<tr onclick="OpenWindow('reviewDetail?reviewsNo=${mrr.reviewsNo}', '스터디룸리뷰 상세',800,600)">
					  <td>${mrr.storeName }</td>
					  <td>
		  			 	 <input type="number" class="rating" value="${mrr.studyRoomGrade}" data-size="xs" data-readonly="true" readonly="readonly">
					  </td>
					  <td class="td-title">${mrr.reviewsContent }</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				</div>
				<div id="mySeatReview" class="review-hide" style="display: none;">
				<table class="table table-hover mt-15">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
				
					<thead align="center">
						<tr>
						  <th>지점</th>
						  <th>별점</th>
						  <th>내용</th>
						  <th>작성일</th>
						</tr>
					</thead>
					<tbody id="indexListAjax" align="center">
						<c:forEach items="${mySeatReview }" var="msr" varStatus="status">
							<tr onclick="OpenWindow('reviewDetail?seatReviewsNo=${msr.seatReviewsNo}&storeCode=${msr.storeCode}', '좌석리뷰 상세', 800, 600)">
							  <td>${msr.storeName }</td>
							  <td>
				  			 	 <input type="number" class="rating" value="${msr.seatGrade}" data-size="xs" data-readonly="true" readonly="readonly">
							  </td>
							  <td class="td-title">${msr.seatReviewsContent }</td>
							  <td>
							  	<fmt:formatDate value="${msr.seatReviewsRegDate}" pattern="MM/dd"/>
							  </td>
							</tr>
						</c:forEach>
						<c:if test="${mySeatReview == null}">
							<tr>
								<td colspan="4">작성 이력이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
		</div>
	</div>
</div>
