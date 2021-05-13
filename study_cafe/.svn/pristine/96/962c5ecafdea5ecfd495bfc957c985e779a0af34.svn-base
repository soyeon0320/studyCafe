<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
	input, textarea{
		border: 1px solid #d7d7d7;
	}
</style>
<section>
	<h3 align="center">고객의 소리</h3>
	<p align="center">DDIT 스터디카페에 전하고 싶은 불만, 칭찬을 보내주세요. 항상 고객님들의 목소리에 귀 기울이겠습니다.</p>
	<form:form commandName="vocFormVO" action="regist" method="post" id="vocForm">
	    <form:hidden path="searchVocVO.searchCondition"/>
	    <form:hidden path="searchVocVO.searchKeyword"/>
	    <form:hidden path="searchVocVO.pageIndex"/>
	    <form:hidden path="searchVocVO.pageUnit"/>
	    <form:hidden path="vocVO.saveToken"/>
	
		<table class="table">
			<colgroup>
				<col width="20%" align="right">
				<col width="80%">
			</colgroup>
		
			<tr>
				<th>매장명</th>
				<td>
					<div class="input-group">
						<input id="storeName" type="text" readonly="readonly"><input type="button" class="btn btn-info input-group-append" value="매장검색" onclick="search_store();">
						<form:input type="hidden"  path="vocVO.storeCode" />
					</div>
				</td>	
			</tr>
			
			<tr>
				<th>문의 유형</th>
				<td>
					<form:radiobuttons path="vocVO.vocKind" items="${kindList }" itemValue="codeId" itemLabel="codeIdNm" cssStyle="margin: 10px;"/>
				</td>
			</tr>
		
			<tr>
				<th>이용 서비스</th>
				<td>
					<form:radiobuttons path="vocVO.useService"  items="${serviceList }" itemValue="codeId" itemLabel="codeIdNm" cssStyle="margin: 10px;"/>
				</td>
			</tr>
			<tr>		
				<th>방문날짜</th>
				<td><input type="text" name="vocVO.visitDate" id="datetimepicker" readonly="readonly" style="width: 150px;"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><form:input type="text" path="vocVO.vocTitle" style="width: 100%"/></td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td><form:textarea  rows="10" cols="120" path="vocVO.vocContent" style="width: 100%"></form:textarea></td>
			</tr>
			
			
		</table>
		<hr>
		<div style="display: inline-block; float: right;">
			<button type="button" onclick="go_voc_regist()" class="btn btn-success">확인</button>
			<button type="button" class="btn btn-light" onclick="go_action('list','#vocForm');">취소</button>
		</div>
		<form:input type="hidden" path="vocVO.memId" value="${sessionScope.loginUser.memId }"/>
	</form:form>
</section>

<script>
	function search_store(){
		OpenWindow('<c:url  value="/common/saerchStore?searchStoreVO.storeContractStatus=CS03"/>', '매장 검색',650,700);
	}
	
	function setStoreCode(storeCode,storeName){
		$("input[id=storeName]").val(storeName);
		$("input[name='vocVO.storeCode']").val(storeCode);
	}
	
	function go_voc_regist(){
		var storeCode = $("#vocForm input[name='vocVO.storeCode']");
		if(storeCode.val().length == 0) {
			swal_alert("매장을 검색해 주세요.");
			storeCode.focus();
			return;
		}
		var vocTitle = $("#vocForm input[name='vocVO.vocTitle']");
		if(vocTitle.val().length == 0) {
			swal_alert("제목을 입력해 주세요.");
			vocTitle.focus();
			return;
		}
		var vocContent = $("#vocForm textarea[name='vocVO.vocContent']");
		if(vocContent.val().length == 0) {
			swal_alert("내용을 입력해 주세요.");
			vocContent.focus();
			return;
		}
		var vocKind = $("#vocForm input[name='vocVO.vocKind']:checked");
		if(vocKind.length == 0 || vocKind.val().length == 0) {
			swal_alert("문의 유형을 선택해 주세요.");
			vocKind.focus();
			return;
		}
		var useService = $("#vocForm input[name='vocVO.useService']:checked");
		if(useService.length == 0 || useService.val().length == 0) {
			swal_alert("이용 서비스를 선택해 주세요.");
			useService.focus();
			return;
		}
		$("#vocForm").submit();
	}
</script>