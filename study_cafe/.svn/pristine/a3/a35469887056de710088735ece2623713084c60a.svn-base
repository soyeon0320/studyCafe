<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section>
<h1>교육기기 상세정보</h1>
	
	<table class="table table-hover">
		<tr>
			<th>기기명</th>
			<td>SAMSUNG</td>
			<th>이용자</th>
			<td>김미미</td>
		</tr>
		<tr>
		  <th>이용상태</th>
		  <td>이용중</td>
		  <th>입실시간</th>
		  <td>2021....</td>
		</tr>
		<tr>
		  <th>상태수정</th>
		  <td>
		  	<input type="radio" value="이용가능">이용가능
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
			  <th>이용자</th>
			  <th>대여시간</th>
			  <th>반납시간</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty equipList }">
				<tr>
					<td colspan="3">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${equipList}" var="equip">
			<tr onclick="javascript:location.href='<%=request.getContextPath()%>/'">
			  <td>${equip.memId}</td>
			  <td><fmt:formatDate value="${equip.equipRentIn}" pattern="yyyy-MM-dd" /></td>
			  <td><fmt:formatDate value="${equip.equipRentOut}" pattern="yyyy-MM-dd"/></td>
			</tr>
			
			</c:forEach>
			
		</tbody>
	</table>
</section>