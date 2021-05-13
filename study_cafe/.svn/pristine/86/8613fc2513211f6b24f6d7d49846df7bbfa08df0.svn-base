<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comSymCcmCcc.cmmnClCodeVO.title"/></c:set>
<section>
	<div class="container" style="margin-top: 50px;">
		<form name="CcmClCodeForm" action="<c:url value='/sym/ccm/ccc/SelectCcmCmmnClCodeList.do'/>" method="post" onSubmit="fn_egov_search_code(); return false;"> 
		<div class="board">
			<h1>${pageTitle} <spring:message code="title.list" /></h1>
			
			<!-- 검색영역 -->
					<!-- 검색조건선택 -->
			<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
				<div>
					<div class="form-inline" style="float: right;margin-bottom: 40px;">
						<select class="form-control" name="searchCondition" title="<spring:message code="title.searchCondition" />">
							<%-- <option <c:if test="${searchVO.searchCondition == ''}">selected="selected"</c:if>><spring:message code="input.select" /></option><!-- 선택하세요 --> --%>
							<option selected value=''><spring:message code="input.select" /></option><!-- 선택하세요 -->
							<option value="1"  <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if> ><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCode" /></option><!-- 코드ID -->
							<option value="2"  <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if> ><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCodeNm" /></option><!-- 코드ID명 -->
						</select>
						<div>
							<input class="form-control" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" >
							<input type="submit" class="btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
							<span ><a class="btn btn-primary" href="<c:url value='/sym/ccm/ccc/RegistCcmCmmnClCodeView.do' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span>
						</div>
					</div>
				</div>				
				
			</div>
			
			<!-- 목록영역 -->
			<table class="table table-bordered table-hover" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
				<thead>
				<tr>
					<th><spring:message code="table.num" /></th><!-- 번호 -->
					<th><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCode" /></th><!-- 분류코드 -->
					<th class="board_th_link"><spring:message code="comSymCcmCcc.cmmnClCodeVO.clCodeNm" /></th><!-- 분류코드명 -->
					<th><spring:message code="comSymCcmCcc.cmmnClCodeVO.useAt" /></th><!-- 사용여부 -->
				</tr>
				</thead>
				<tbody class="ov">
				<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="4"><spring:message code="common.nodata.msg" /></td>
				</tr>
				</c:if>
				<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
					<td><c:out value='${resultInfo.clCode}'/></td>
					<td><a href="<c:url value='/sym/ccm/ccc/SelectCcmCmmnClCodeDetail.do'/>?clCode=${resultInfo.clCode}" onClick="fn_egov_inquire_codedetail('<c:out value="${resultInfo.clCode}"/>');return false;"><c:out value='${fn:substring(resultInfo.clCodeNm, 0, 40)}'/></a></td>
					<td><c:out value='${resultInfo.useAt}'/></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<!-- paging navigation -->
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_egov_select_linkPage"/>
				</ul>
			</div>
			 
		</div>
		
		<input name="clCode" type="hidden" value="">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		</form>
	</div>
</section>
<script>

function fn_egov_select_linkPage(pageNo){
	document.CcmClCodeForm.pageIndex.value = pageNo;
	document.CcmClCodeForm.action = "<c:url value='/sym/ccm/ccc/SelectCcmCmmnClCodeList.do'/>";
   	document.CcmClCodeForm.submit();
}

function fn_egov_search_code(){
	document.CcmClCodeForm.pageIndex.value = 1;
	document.CcmClCodeForm.submit();
}

function fn_egov_inquire_codedetail(clCode) {
	// 사이트 키값(siteId) 셋팅.
	document.CcmClCodeForm.clCode.value = clCode;
  	document.CcmClCodeForm.action = "<c:url value='/sym/ccm/ccc/SelectCcmCmmnClCodeDetail.do'/>";
  	document.CcmClCodeForm.submit();
}
</script>