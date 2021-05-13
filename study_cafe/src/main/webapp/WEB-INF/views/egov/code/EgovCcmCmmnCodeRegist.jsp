<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comSymCcmCca.cmmnCodeVO.title"/></c:set>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnCodeVO" staticJavascript="false" xhtml="true" cdata="false"/>

<section>
	<div class="container"  style="margin-top: 50px;">
		<form:form commandName="cmmnCodeVO" cssClass="form" action="${pageContext.request.contextPath}/sym/ccm/cca/RegistCcmCmmnCode.do" method="post" onSubmit="fn_egov_regist_code(document.forms[0]); return false;"> 
		<div class="wTableFrm">
			<!-- 타이틀 -->
			<h2>${pageTitle} <spring:message code="title.create" /></h2>
			
			<!-- 등록폼 -->
			<table class="table" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
			<colgroup>
				<col style="width: 20%;"><col style="width: ;">
			</colgroup>
			<tbody>
				<!-- 입력/선택 -->
				<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
				<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
				<c:set var="inputYes"><spring:message code="input.yes" /></c:set>
				<c:set var="inputNo"><spring:message code="input.no" /></c:set>
				<!-- 분류코드명 -->
				<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.clCodeNm"/> </c:set>
				<tr>
					<th><label for="clCode">${title} <span class="pilsu">*</span></label></th>
					<td class="left">
					    <form:select cssClass="form-control" path="clCode" title="${title} ${inputSelect }" >
					    			<form:option value="" label="${inputSelect}"/>
		 							<form:options items="${clCodeList}"  itemValue="clCode" itemLabel="clCodeNm"/>
						</form:select>
		   				<div><form:errors path="clCode" cssClass="error" /></div>     
					</td>
				</tr>
						
				<!-- 코드ID -->
				<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.codeId"/> </c:set>
				<tr>
					<th><label for="codeId">${title} <span class="pilsu">*</span></label></th>
					<td class="left">
					    <form:input cssClass="form-control" path="codeId" title="${title} ${inputTxt}" size="70" maxlength="70" />
		   				<div><form:errors path="codeId" cssClass="error" /></div>     
					</td>
				</tr>
		
				<!-- 코드ID명 -->
				<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.codeIdNm"/> </c:set>
				<tr>
					<th><label for="codeIdNm">${title} <span class="pilsu">*</span></label></th>
					<td class="left">
					    <form:input cssClass="form-control" path="codeIdNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
		   				<div><form:errors path="codeIdNm" cssClass="error" /></div>     
					</td>
				</tr>
				
				<!-- 코드ID설명 -->
				<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.codeIdDc"/> </c:set>
				<tr>
					<th><label for="codeIdDc">${title } <span class="pilsu">*</span></label></th>
					<td class="nopd">
						<form:textarea path="codeIdDc" title="${title} ${inputTxt}" cols="" rows="" cssClass="form-control"  />   
						<div><form:errors path="codeIdDc" cssClass="error" /></div>  
					</td>
				</tr>

				<!-- 코드 순번 -->
				<c:set var="depth">코드 순번 </c:set>
				<tr>
					<th><label for="codeDepth">${depth } <span class="pilsu">*</span></label></th>
					<td class="nopd">
					    <form:input cssClass="form-control" type="number"  min="1"  path="codeDepth"  title="${title} ${inputTxt}" size="70" maxlength="70" />
					</td>
				</tr>
				
				<!-- 사용여부 -->
				<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.useAt"/> </c:set>
				<tr>
					<th>${title } <span class="pilsu">*</span></th>
					<td class="left">
						<form:select path="useAt" title="${title} ${inputTxt }" cssStyle="width: 20%;" cssClass="form-control">
							<form:option value="Y"  label=" ${inputYes}"/>
							<form:option value="N" label=" ${inputNo}"/>
						</form:select>
						<div><form:errors path="useAt" cssClass="error" /></div>       
					</td>
				</tr>
				
			</tbody>
			</table>
		
			<!-- 하단 버튼 -->
			<div class="btn">
				<input type="submit" class="btn btn-primary" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
				<span ><a class="btn btn-light" href="<c:url value='/sym/ccm/cca/SelectCcmCmmnCodeList.do' />" title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
			</div><div style="clear:both;"></div>
			
		</div>
		
		<input name="cmd" type="hidden" value="<c:out value='save'/>">
		</form:form>
	</div>
</section>
<script type="text/javascript">

window.onload=function(){
	fncShowMessg();
}

function fn_egov_list_code(){
	location.href = "<c:url value='/sym/ccm/cca/SelectCcmCmmnCodeList.do' />";
}
function fn_egov_regist_code(form){
	//input item Client-Side validate
	if (!validateCmmnCodeVO(form)) {	
		return false;
	} else {
		if(confirm("<spring:message code="common.regist.msg" />")){	
			form.submit();	
		}
	} 
}
function fncShowMessg(){
	if("<c:out value='${message}'/>" != ''){
	alert("<c:out value='${message}'/>");
	}
}
</script>