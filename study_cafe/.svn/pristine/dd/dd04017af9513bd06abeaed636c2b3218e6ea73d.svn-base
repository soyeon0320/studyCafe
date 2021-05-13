<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<section>
	<main class="content mt-5">
	<div class="flex-column d-flex bg-white" style="height: auto;">

	<div style="text-align: center;" class="mt-20">
		<h1>가맹점 계약서</h1>
	</div>
	
	<form:form commandName="contractViewFormVO" id="listForm" name="listForm" method="post">
	
	<div class="row" style="margin-left: auto;">
		<div class="col-md-4">
			<a href="#" onclick="getSearchFn('CS02')"><span class="badge badge-text badge-info mr-2 mb-2" style="font-size: larger; color: white;">계약요청 ${contractStatic.cs02Count}건</span></a>
			<a href="#" onclick="getSearchFn('CS03')"><span class="badge badge-text badge-success mr-2 mb-2" style="font-size: larger; color: white;">계약승인 ${contractStatic.cs03Count}건</span></a>
			<a href="#" onclick="getSearchFn('CS05')"><span class="badge badge-text badge-warning mr-2 mb-2" style="font-size: larger; color: white;">계약임박 ${contractStatic.deadlineCount}건</span></a>
			<a href="#" onclick="getSearchFn('CS04')"><span class="badge badge-text badge-danger mr-2 mb-2" style="font-size: larger; color: white;">계약만료 ${contractStatic.cs04Count}건</span></a>
		</div>
		<div class="col-md-8">
			<div id="keyword" class="card-tools float-right mb-20" style="width:700px;">
				<div class="input-group row">
					<form:select path="searchContractVO.pageUnit" cssClass="form-control col-md-3" onchange="go_action('list');">
						<form:options items="${contractViewFormVO.searchContractVO.pageUnitSelector}" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
					</form:select>
					<form:select path="searchContractVO.searchCondition" cssClass="form-control col-md-3" >
						<form:options items="${codeList}" itemValue="codeId" itemLabel="codeIdNm"/>
					</form:select>
					<form:select path="searchContractVO.contractStatus" cssClass="form-control col-md-3"  id="statusSearch"  onchange="searchStatusFn()">
						<form:options items="${conStaCodeList}" itemValue="codeId" itemLabel="codeIdNm"/>
					</form:select>
					<form:input type="text" path="searchContractVO.searchKeyword" class="form-control" style="width:25%;" placeholder="검색어를 입력해주세요."/>
					<span class="input-group-append">
						<button class="btn btn-success" type="button" onclick="go_search('<c:url value='/contract/list'/>');">
							<i class="fa fa-fw fa-search"></i>검색
						</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="portlet-body">
		<table class="table table-hover mt-20">
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="*">
				<col width="10%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead align="center" style="background-color: #dee4e936;">
				<tr>
					<th>번호</th>
					<th>가맹점코드</th>
					<th>가맹점명</th>
					<th>처리상태</th>
					<th>계약자</th>
					<th>계약일자</th>
				</tr>
				<c:if test="${empty contractList}">
					<tr style="text-align: center;">
						<td colspan="7">
							<strong>계약서가 존재하지 않습니다.</strong>
					</tr>
				</c:if>
			</thead>
			<tbody>
				<c:forEach var="list" items="${contractList}">
					<c:choose>
						<c:when test="${list.contractStatus eq 'CS04'}">
							<tr onclick="OpenWindow('detail?storeCode=${list.storeCode}', '계약서 상세조회', 1100, 1100);" style="cursor: pointer; text-align: center; background: #f7b3b2;">
						</c:when>
						<c:otherwise>
							<tr onclick="OpenWindow('detail?storeCode=${list.storeCode}', '계약서 상세조회', 1100, 1100);" style="cursor: pointer; text-align: center;">
						</c:otherwise>
					</c:choose>
						<td>${list.rnum}</td>
						<td>${list.storeCode}</td>
						<td style="text-align: left;"> 
							<c:if test="${list.contractStatus eq 'CS03' and list.calcDate >= 0 and list.calcDate <= 180}"> 
								<span class="badge badge-text badge-danger mr-2 mb-2"><c:out value="마감 ${list.calcDate}일전"/></span>
							</c:if>
							${list.storeName}
						</td>
						<c:if test="${list.contractStatus eq 'CS02'}">
							<td><span class="badge badge-text badge-info mr-2 mb-2" style="color: white;">계약요청</span></td>
						</c:if>
						<c:if test="${list.contractStatus eq 'CS03'}">
							<td><span class="badge badge-text badge-success mr-2 mb-2" style="color: white;">계약승인</span></td>
						</c:if>
						<c:if test="${list.contractStatus eq 'CS04'}">
							<td><span class="badge badge-text badge-danger mr-2 mb-2">계약만료</span></td>
						</c:if>
						<td>${list.ownerId}</td>
						<td>
							<fmt:formatDate value="${list.affiliateRegStartDate}" pattern="yyyy-MM-dd"/>
							 ~ 
							<fmt:formatDate value="${list.affiliateRegEndDate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</c:forEach>
		</tbody>
		</table>
	</div>		
	
	<div class="container clearfix" style="width: fit-content;">
		<ul class="pagination pagination-circle pagination-3d pagination-light">
			<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
		</ul>    
	</div>
	
	<form:hidden path="searchContractVO.pageIndex" id="pageIndex"/>
	
	</form:form>
	
	</div>
	</main>
	
</section>
	
<script>
	function searchStatusFn() {
		$("#pageIndex").val(1);
		$("form[name='listForm']").submit();
	}
	
	function getSearchFn(param) {
		$("#pageIndex").val(1);
		$("#statusSearch").val(param);
		$("form[name='listForm']").submit();
	}
	
</script>