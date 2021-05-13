<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column">
			<h3>나의 구매내역</h3>
		</div>
		<a href="buyList" class="nav-link avatar avatar32 bg-success-light text-success rounded-circle  no-padding">
		<i class="fa fa-ellipsis-v"></i></a>
	</div>
			<div class="portlet-body" style="padding: 10px;">
				<table class="table table-hover mt-15" id="ticketBody">
					<thead align="center">
						<tr>
						  <th>구매일</th>
						  <th>이용권</th>
						  <th>남은시간</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:if test="${empty myTicketList}">
							<tr>
								<td colspan="3">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${myTicketList}" var="buy" varStatus="status">
						<tr>
						  <td><fmt:formatDate value="${buy.ticketBuyDate  }" pattern="MM/dd일" /></td>
						  <td>${buy.ticketName }</td>
						  <c:if test="${buy.ticketTimeRemain != 0}">
						  <td>
						  <input type="hidden" id="remainTime" value="${buy.ticketTimeRemain}">
						  <span id="hour"></span> <span id="mi"></span></td>
						  </c:if>
						  <c:if test="${buy.ticketTimeRemain == 0}">
						  <td>
						  <input type="hidden" id="remainTime" value="${buy.ticketTimeRemain}">
						  <span>0 분</span></td>
						  </c:if>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>  
			</div>
		</div>