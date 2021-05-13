<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<section>
	<div>
		<h1>정보게시판</h1>
	</div>
	
	<form:form commandName="infoFormVO" id="listForm" name="listForm" method="post">
		<form:hidden path="infoVO.infoNo" id="detailNo" />
		
		<a class="btn btn-success mb-2" href="javascript:go_action('registForm');"><i class="icon-pencil2"></i>글등록</a>

		<div id="keyword" class="card-tools float-right" style="width:550px;">
				<div class="input-group row">	
				  	<form:select cssClass="form-control col-md-3" path="searchInfoVO.pageUnit" onchange="go_action('list');">
				  		<form:options items="${infoFormVO.searchInfoVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
				  	</form:select>					
					<form:select cssClass="form-control col-md-3" path="searchInfoVO.searchCondition" id="searchInfoVO.searchCondition">
						<form:options items="${codeList }" itemValue="codeId" itemLabel="codeIdNm" />
					</form:select>					
					<form:input  class="form-control col-md-5" type="text" path="searchInfoVO.searchKeyword" placeholder="검색어를 입력하세요." />
					<span class="input-group-append col-me-1">
						<button class="btn btn-info" type="button" name="searchInfoVO.searchKeyword" onclick="go_search('<c:url value='/info/list' />');" 
						data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>검색
						</button>
					</span>
				</div>
				</div>						
		<table class="table table-hover mt-20">
			<colgroup>
				<col width="8%">
				<col width="*">
				<col width="8%">
				<col width="16%">
				<col width="8%">
			</colgroup>
			<thead>
				<tr align="center">
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty infoList}">
					<tr>
						<td colspan="5" align="center">
							<strong>게시글이 존재하지 않습니다.</strong>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${infoList}" var="info">
					<tr onclick="go_detail(${info.infoNo});" style="cursor: pointer;" align="center">
						<td>${info.rnum }</td>
						<td align="left">${info.infoTitle }
							<c:if test="${info.replyCnt != 0 }">
								<span class="badge badge-warning" style="color:black;font-weight: bolder;">${info.replyCnt}</span>
							</c:if>
						</td>
						<td>${info.infoCnt }</td>
						<td><fmt:formatDate value="${info.infoRegDate }" pattern="yyyy-MM-dd"/></td>
						<td>${info.memId }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div>   
		<form:hidden path="searchInfoVO.pageIndex" id="pageIndex"/>
	</form:form>
</section>
