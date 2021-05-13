<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	h2{
		text-align: center;
	}
</style>

<section>
	<h2>ddit 스터디 카페</h2>
	<table class="table table-hover">
		<c:if test="${empty orderDetailOwnerList}">
				<tr>
					<td colspan="4">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
		</c:if>
		<c:forEach items="${orderDetailOwnerList}" var="odol">
		<tr>
			<th>사업자번호</th>
			<td>${odol.businessNumber }</td>
			<th>주소</th>
			<td>${odol.storeAddr }</td>
		</tr>
		<tr>
		  <th>연락처</th>
		  <td>${odol.ownerTel }</td>
		  <th>대표자</th>
		  <td>${odol.ownerName }</td>
		</tr>
		</c:forEach>
	</table>
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>상품코드</th>
			  <th>상품명</th>
			  <th>주문일자</th>
			  <th>금액</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty orderDetailProductList }">
				<tr>
					<td colspan="4">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${orderDetailProductList }" var="odpl">
				<tr>
				  <td>${odpl.productCode }</td>
				  <td>${odpl.productName}</td>
				  <td>
				  	<fmt:formatDate value="${odpl.orderProductRegDate }" pattern="yyyy-MM-dd"/>
				  </td>
				  <td>${odpl.productPrice }</td>
				</tr>
				<c:set var="sum" value="${sum + odpl.productPrice }"/>
			</c:forEach>
		</tbody>
	</table>
	<table class="table table-hover">
		<tr>
			<th>총금액</th>
			<td><c:out value="${sum }"/>원</td>
		</tr>
	</table>
	<table class="table table-hover">
		<tr>
			<th>배송상태</th>
			<td>배송중(옥천 HUB)</td>
			<th>현재위치</th>
			<td>대전광역시 서구 갈마동..</td>
		</tr>
	</table>
</section>    