<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column">
			<h3>스터디 카페 이용내역</h3>
			
			
		</div>
		<a href="history" class="nav-link avatar avatar32 bg-success-light text-success rounded-circle  no-padding">
		<i class="fa fa-ellipsis-v"></i></a>
		<div>
			<!-- 톱니바퀴 -->
		</div>
	</div>
	
	<div class="portlet-body" style="padding: 10px;">
		<div class="btn-list">
			<button id="registStudyRoom"  class="btn btn-danger btn-sm" type="button" onclick="myHistory('#myStudyRoomList',this)"><span>스터디룸</span></button>
			<button id="registSeat"       class="btn btn-primary btn-sm" type="button" onclick="myHistory('#mySeatList',this)"><span>좌석</span></button>
		</div>
		<div id="myStudyRoomList" class="history-show">
		<table class="table table-hover mt-15">
			<colgroup>
				<col width="">
				<col width="16%">
				<col width="">
				<col>
			</colgroup>
			
			
			<thead align="center">
				<tr>
				  <th>지점</th>
				  <th>종류</th>
				  <th>이용시간</th>
				  <th>후기등록</th>
				</tr>
			</thead>
			<tbody id="indexListAjax" align="center">
			<c:forEach items="${myStudyRoomList }" var="msr" varStatus="status">
				<c:if test="${msr.studyroomIn != null }">
					<tr>
						<td>${msr.storeName}</td>
						
						<td>${msr.studyroomNo }번 방</td>
						<td>
							<fmt:formatDate value="${msr.studyroomIn}" pattern="MM/dd HH:mm~"/>
							<c:if test="${msr.studyroomOut != null}">
								<fmt:formatDate value="${msr.studyroomOut}" pattern="HH:mm"/>
							</c:if>
						</td>
						<td>
						<c:if test="${msr.studyroomOut != null}">
							<c:if test="${msr.flag == 0 }">
							<button class="btn btn-shadow btn-sm btn-danger" type="button" onclick="OpenWindow('registReviewForm?studyroomReservNo=${msr.studyroomReservNo}', '리뷰 등록', 800, 600)"><span>후기등록</span></button>
							</c:if>
							<c:if test="${msr.flag > 0 }">
							<button class="btn btn-sm btn-success" type="button"><span>작성완료</span></button>
							</c:if>
						</c:if>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			
			</tbody>
		</table>
		</div>
		
		<div id="mySeatList" class="history-hide" style="display: none;">
		<table class="table table-hover mt-15">
			<colgroup>
				<col width="">
				<col width="16%">
				<col width="">
				<col>
			</colgroup>
			<thead align="center">
				<tr>
				  <th>지점</th>
				  <th>좌석번호</th>
				  <th>이용시간</th>
				  <th>후기등록</th>
				</tr>
			</thead>
			<tbody id="indexListAjax" align="center">
				
				<c:forEach items="${mySeatList }" var="msl" varStatus="status">
				<tr>
					<td>${msl.storeName}</td>
					
					<td>${msl.seatNo}번</td>
					<td>
						<fmt:formatDate value="${msl.seatIn}" pattern="MM/dd HH:mm~"/>
						<c:if test="${msl.seatOut != null}">
							<fmt:formatDate value="${msl.seatOut}" pattern="HH:mm"/>
						</c:if>
						
					</td>
					<td>
					<c:if test="${not empty msl.seatOut}">
						<c:if test="${msl.flag == 0 }">
						<button class="btn btn-danger btn-sm" type="button" onclick="OpenWindow('registSeatReviewForm?rentSeatNo=${msl.rentSeatNo}', '리뷰 등록', 800, 600)"><span>후기등록</span></button>
						</c:if>
						<c:if test="${msl.flag > 0}">
						<button class="btn  btn-success btn-sm" type="button"><span>작성완료</span></button>
						</c:if>
					</c:if>	
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</div>