<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comSymCcmCcc.cmmnClCodeVO.title"/></c:set>

<section>
	<div class="container" style="margin-top: 50px;">
		<form name="CcmClCodeForm" action="<c:url value='/sym/ccm/ccc/UpdateCcmCmmnClCodeView.do'/>" method="post">
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
				<!-- 분류코드 -->
				<tr>
					<th><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCode" /></th>
					<td class="left"><c:out value="${result.clCode}"/></td>
				</tr>
				<!-- 분류코드명 -->
				<tr>
					<th><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCodeNm" /></th>
					<td class="left"><c:out value="${result.clCodeNm}"/></td>
				</tr>
				<!-- 분류코드설명 -->
				<tr>
					<th class="vtop"><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCodeDc" /></th>
					<td class="cnt">
						<c:out value="${fn:replace(result.clCodeDc , crlf , '<br/>')}" escapeXml="false" />
					</td>
				</tr>
				<!-- 사용여부 -->
				<tr>
					<th><spring:message code="comSymCcmCcc.cmmnClCodeVO.useAt" /></th>
					<td class="left"><c:out value="${result.useAt}"/></td>
				</tr>
				
				
			</tbody>
			</table>
			<!-- 하단 버튼 -->
			<div class="btn">
				<input type="submit" class="btn btn-primary" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
				<span ><a class="btn btn-light" href="<c:url value='/sym/ccm/ccc/RemoveCcmCmmnClCode.do?clCode=${result.clCode}' />" onClick="fn_egov_delete_code('<c:out value="${result.clCode}"/>'); return false;" title="<spring:message code="title.delete" /> <spring:message code="input.button" />"><spring:message code="button.delete" /></a></span>
				<span ><a class="btn btn-light" href="<c:url value='/sym/ccm/ccc/SelectCcmCmmnClCodeList.do' />"  title="<spring:message code="title.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
			</div><div style="clear:both;"></div>
			
		</div>
		
		<input name="clCode" type="hidden" value="<c:out value="${result.clCode}" />">
		</form>
	</div>
</section>
<script type="text/javascript">
 function fn_egov_delete_code(clCode){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		document.CcmClCodeForm.clCode.value = clCode;	
		document.CcmClCodeForm.action = "<c:url value='/sym/ccm/ccc/RemoveCcmCmmnClCode.do'/>";
		document.CcmClCodeForm.submit();
	}	
}	
</script>
