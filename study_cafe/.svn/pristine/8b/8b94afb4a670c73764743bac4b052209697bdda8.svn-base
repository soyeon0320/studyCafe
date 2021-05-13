<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comSymCcmCca.cmmnCodeVO.title"/></c:set>

<section>
	<div class="container" style="margin-top: 50px;">
		<form name="CcmCodeForm" action="<c:url value='/sym/ccm/cca/UpdateCcmCmmnCodeView.do'/>" method="post">
		<div class="wTableFrm">
			<!-- 타이틀 -->
			<h2>${pageTitle} <spring:message code="title.detail" /></h2>
		
			<!-- 상세조회 -->
			<table class="table table-bordered" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
			<colgroup>
				<col style="width: 20%;">
				<col style="width: ;">
			</colgroup>
			<tbody>
				<!-- 코드 순번 -->
				<tr>
					<th>코드 순번</th>
					<td class="left"><c:out value="${result.codeDepth}"/></td>
				</tr>			
				<!-- 분류코드명 -->
				<tr>
					<th><spring:message code="comSymCcmCca.cmmnCodeVO.clCodeNm" /></th>
					<td class="left"><c:out value="${result.clCodeNm}"/></td>
				</tr>
				<!-- 코드ID -->
				<tr>
					<th><spring:message code="comSymCcmCca.cmmnCodeVO.codeId" /></th>
					<td class="left"><c:out value="${result.codeId}"/></td>
				</tr>
				<!-- 코드ID명 -->
				<tr>
					<th><spring:message code="comSymCcmCca.cmmnCodeVO.codeIdNm" /></th>
					<td class="left"><c:out value="${result.codeIdNm}"/></td>
				</tr>
				<!-- 코드ID설명 -->
				<tr>
					<th class="vtop"><spring:message code="comSymCcmCca.cmmnCodeVO.codeIdDc" /></th>
					<td class="cnt">
						<c:out value="${fn:replace(result.codeIdDc , crlf , '<br/>')}" escapeXml="false" />
					</td>
				</tr>
				<!-- 사용여부 -->
				<tr>
					<th><spring:message code="comSymCcmCca.cmmnCodeVO.useAt" /></th>
					<td class="left"><c:out value="${result.useAt}"/></td>
				</tr>

				
				
			</tbody>
			</table>
			<!-- 하단 버튼 -->
			<div class="btn">
				<input type="submit" class="btn btn-primary" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
				<span ><a class="btn btn-light" href="<c:url value='/sym/ccm/cca/RemoveCcmCmmnCode.do?codeId=${result.codeId}' />" onClick="fn_egov_delete_code('<c:out value="${result.codeId}"/>'); return false;" title="<spring:message code="title.delete" /> <spring:message code="input.button" />"><spring:message code="button.delete" /></a></span>
				<span ><a class="btn btn-light" href="<c:url value='/sym/ccm/cca/SelectCcmCmmnCodeList.do' />"  title="<spring:message code="title.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
			</div><div style="clear:both;"></div>
			
		</div>
		
		<input name="codeId" type="hidden" value="<c:out value="${result.codeId}" />">
		</form>
	</div>
</section>
<script type="text/javascript">
 function fn_egov_delete_code(codeId){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		document.CcmCodeForm.codeId.value = codeId;	
		document.CcmCodeForm.action = "<c:url value='/sym/ccm/cca/RemoveCcmCmmnCode.do'/>";
		document.CcmCodeForm.submit();
	}	
}	
</script>
