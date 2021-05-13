<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<section> 
	<h1>구매내역 조회</h1>
	
	<form:form commandName="memberBuyListFormVO" id="listForm">
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>구매번호</th>
			  <th>구매날짜</th>
			  <th>이용권 이름</th>
			  <th>가격</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty buyList }">
				<tr>
					<td colspan="4">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${buyList}" var="buy" varStatus="status">
			<tr>
			  <td>${status.count }</td>
			  <td>
			  	<fmt:formatDate value="${buy.ticketBuyDate }" pattern="yyyy-MM-dd"/>
			  </td>
			  <td>${buy.ticketName }</td>
			  <td>
			  <fmt:formatNumber value="${buy.ticketPrice}" maxFractionDigits="3" />원	
			  </td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로가기</button>
	<div class="container clearfix" style="width: fit-content;">
		<ul class="pagination pagination-circle pagination-3d pagination-light">
			<ui:pagination paginationInfo = "${buyListPaginationInfo}" type="text" jsFunction="go_buy" />
			<form:hidden path="searchBuyListVO.pageIndex" id="buyIndex"/>
		</ul>    
	</div>    
	</form:form>
		
</section>
<script>
	function go_buy(pageIndex){
		$("#buyIndex").val(pageIndex);
		go_action("buyList");
	}
</script>