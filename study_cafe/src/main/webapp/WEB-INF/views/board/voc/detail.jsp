<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<style>
	#vocDetail th{
		text-align: right;
		padding-right: 10px;
		height: 50px;
	}
	#vocDetail td{
		padding-left: 10px;
	
	}
</style>
<section>
<form:form commandName="vocFormVO" action="detail" method="post" id="vocForm">
    <form:hidden path="searchVocVO.searchCondition"/>
    <form:hidden path="searchVocVO.searchKeyword"/>
    <form:hidden path="searchVocVO.pageIndex"/>
    <form:hidden path="searchVocVO.pageUnit"/>

	<div>
		<h3 align="center">고객의 소리</h3>
		<div style="margin-bottom: 30px;">
			<button class="btn btn-warning" onclick="go_action('list','#vocForm');"><i class="icon-list"></i> 목록</button>
		</div>
	</div>
	
	<div id="vocDetail" style="clear: both;">
		<table style="width: 100%" class="table-bordered">
			<tr>
				<th>제목</th>
				<td colspan="3">${vocVO.vocTitle }</td>
			</tr>
			
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="40%">
			</colgroup>		
			<tr>
				<th>작성자</th>
				<td>${vocVO.memId}</td>
				<th>작성일</th>
				<td><fmt:formatDate value="${vocVO.vocRegDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>문의 유형</th>
				<td>${vocVO.vocKind }</td>
				<th>방문매장</th>
				<td>${vocVO.storeName }</td>
			</tr>
			<tr>
				<th>방문날짜</th>
				<td><fmt:formatDate value="${vocVO.visitDate }" pattern="yyyy-MM-dd HH:mm"/><c:if test="${vocVO.visitDate == null }">-</c:if></td>
				<th>이용 서비스</th>
				<td>${vocVO.useService }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="300px;">${vocVO.vocContent }</td>
			</tr>
		</table>
	</div>
	

	
<c:import url="/vocManage/vocReply" >
   <c:param name="vocNo" value="${vocVO.vocNo }" />
</c:import>  
</form:form>
</section>
