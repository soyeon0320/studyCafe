<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	table th {
		text-align: center;
	}
</style>

<section class="container clearfix col-md-7 offset-md-2 mt-20">
	<div style="text-align: center;" class="mt-20">
		<h1>${member.memId}님의 상세화면</h1>
	</div>
	
	<form:form commandName="memberFormVO" id="memberForm">
	
	<table class="table table-hover mt-20">
		<tr>
			<th>아이디</th>
			<td>${member.memId}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${member.memName}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${member.memTel}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${member.memEmail}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${member.memBir}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${member.memGen}</td>
		</tr>
		<tr>
			<th>유입경로</th>
			<td>${member.memRoute}</td>
		</tr>
		<tr>
			<th>구매내역</th>
			<td>${member.memId}</td>
		</tr>
		<tr>
			<th>이용내역</th>
			<td>${member.memId}</td>
		</tr>
	</table>
	
		<c:if test="${!empty member.memMemo}">
	       <div class="alert alert-warning alert-dismissible">
           <i class="icon-paperclip"></i>
           		${member.memMemo}
           </div>
		</c:if>
		
	</form:form>
		
	<div style="text-align:center;">
		<button class="btn btn-secondary" onclick="javascript:window.close()"> 닫기</button>
	</div>
</section>