<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column">
			<h3>스터디룸 예약내역</h3>
		</div>
		<a href="history" class="nav-link avatar avatar32 bg-success-light text-success rounded-circle  no-padding">
		<i class="fa fa-ellipsis-v"></i></a>
		<div>
			<!-- 톱니바퀴 -->
		</div>
	</div>
	
	<div class="portlet-body" style="padding: 10px;">
		<div class="">
		<table class="table table-hover mt-15">
			<thead align="center">
				<tr>
				  <th>지점</th>
				  <th>방번호</th>
				  <th>예약시간</th>
				  <th>예약취소</th>
				</tr>
			</thead>
			
			<tbody align="center">
				<c:forEach items="${reservationList }" var="reservation" varStatus="status">
				<tr>
					<td>${reservation.storeName}</td>
					<td>${reservation.studyroomNo}번</td>
					<td>
						<fmt:formatDate value="${reservation.studyroomReservStart}" pattern="MM/dd HH"/><fmt:formatDate value="${reservation.studyroomReservEnd}" pattern="~HH 시"/>
					</td>
					<td>
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set> 
						<c:if test="${today < reservation.studyroomReservStart }">
							<button class="btn btn-sm btn-secondary" onclick="go_cancel(${reservation.studyroomReservNo})">예약취소</button>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</div>