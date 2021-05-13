<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
	<h1>스터디룸 상세정보</h1>
	
	<table class="table table-hover">
		
		<tr>
			<th>이름</th>
			<td>스터디룸A(4인)</td>
			<th>이용자</th>
			<td>김미미</td>
		</tr>
		<tr>
		  <th>스터디룸 상태</th>
		  <td>이용중</td>
		  <th>입실시간</th>
		  <td>2021....</td>
		</tr>
		<tr>
		  <th>상태수정</th>
		  <td>
		  	<input type="radio" value="이용중">이용중
		  	<input type="radio" value="이용불가">이용불가
		  	<button>수정</button>
		  </td>
		  <th>이용시간</th>
		  <td>50분</td>
		</tr>
			
	</table>
	
	<button>이용내역</button>
	<button>예약내역</button>
	
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>예약자</th>
			  <th>입실예정</th>
			  <th>퇴실예정</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty studyRoomList }">
				<tr>
					<td colspan="4">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="" var="studyRoom">
			<tr onclick="javascript:location.href='<%=request.getContextPath()%>/'">
			  <td></td>
			  <td><fmt:formatDate value="" pattern="yyyy-MM-dd" /></td>
			  <td><fmt:formatDate value="" pattern="yyyy-MM-dd"/></td>
			</tr>
			
			</c:forEach>
			
		</tbody>
	</table>
	
<!-- 	<div id="pagination" style="margin: auto;"> -->
<%-- 		<%@ include file="/WEB-INF/include/pagination.jsp" %> --%>
<!-- 	</div> -->
</section>
