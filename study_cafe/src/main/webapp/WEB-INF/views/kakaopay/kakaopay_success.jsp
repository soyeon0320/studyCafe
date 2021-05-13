<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>

<div class="container">

	<h4 align="center" style="margin-top: 100px;">Spring Study</h4>
	
	<h5>결제 완료</h5>
	<h3><fmt:formatNumber value="${approvalVO.amount.total }" maxFractionDigits="3" /> 원</h3>
	<hr>
	<table style="width: 100%">
		<colgroup>
			<col width="40%">
			<col align="right">
		</colgroup>
		
		<tr>
			<th>주문금액</th>
			<td align="right"><fmt:formatNumber value="${approvalVO.amount.total }" maxFractionDigits="3" /> 원</td>
		</tr>
		<tr>
			<th>결제수단</th>
			<td align="right">${approvalVO.payment_method_type }</td>
		</tr>
		<tr>
			<th>결제일시</th>
			<td align="right"><fmt:formatDate value="${approvalVO.approved_at }" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
	</table>
	
	<div align="center">
		<input type="button" class="btn btn-primary" onclick="javascript:window.close();" value="결제완료">
		<input type="hidden" id="tid" value="${approvalVO.tid }">
	</div>
</div>

</section>

<script>

window.onload=function(){
	opener.setTid($("#tid").val());	
}
</script>