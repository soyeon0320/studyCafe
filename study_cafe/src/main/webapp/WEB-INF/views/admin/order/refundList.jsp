<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	h1,td{
		text-align: center;
	}
</style>
<body>
	<select>
		<option>글갯수</option>
		<option>10개</option>
		<option>20개</option>
		<option>30개</option>
	</select>
	<select>
		<option>검색조건</option>
		<option>처리상태</option>
		<option>가맹점명</option>
	</select>
	<input placeholder="검색어를 입력하세요."/>
	
	<h1>물품 반품내역 목록</h1>
	
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>
			  	<input type="checkbox">
			  </th>
			  <th>번호</th>
			  <th>주문번호</th>
			  <th>가맹점명</th>
			  <th>품목명</th>
			  <th>신청일</th>
			  <th>처리상태</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty refundList }">
				<tr>
					<td colspan="6">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
<%-- 			<c:forEach items="" var=""> --%>
<!-- 			<tr> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			</tr> -->
			
<%-- 			</c:forEach> --%>
			
		</tbody>
	</table>
	
	<div id="pagination" style="margin: auto;">
		<%@ include file="/WEB-INF/include/pagination.jsp" %>
	</div>
</body>
</html>