<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
	tr,td,th{
		text-align: center;
	}

</style>

<style>
.badge.badge-text{
	width: 60px!important;
	color: white !important;
}
</style>

<section> 
	<div>
		<h1>소모임게시판</h1>
	</div>
	
	<form:form commandName="studygroupFormVO" id="listForm" name="listForm" method="post">
		<form:hidden path="studygroupVO.studygroupNo" id="detailNo"/>
		
		<a class="btn btn-success mb-2" href="javascript:go_action('registForm');"><i class="icon-pencil2"></i>글등록</a>
		
		<div id="keyword" class="card-tools float-right" style="width:550px;">
			<div class="input-group row">	
				<form:select path="searchStudygroupVO.pageUnit" cssClass="form-control col-md-3" onchange="go_action('<c:url value='/stb/list' />');">
					<form:options items="${studygroupFormVO.searchStudygroupVO.pageUnitSelector}" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
				</form:select>
				<form:select cssClass="form-control col-md-3" path="searchStudygroupVO.searchCondition" id="searchStudygroupVO.searchCondition">
					<form:options items="${codeList}" itemValue="codeId" itemLabel="codeIdNm"/>
				</form:select>
				<form:input type="text" path="searchStudygroupVO.searchKeyword" name="searchStudygroupVO.searchKeyword" cssClass="form-control col-md-5" placeholder="검색어를 입력해주세요."/>
				<span class="input-group-append">
					<button class="btn btn-info" type="button" name="searchStudygroupVO.searchKeyword" onclick="go_search('<c:url value='/stb/list' />');">
						<i class="fa fa-fw fa-search"></i><span>검색</span>
					</button>
				</span>
			</div>
		</div>
		
		<table class="table table-hover mt-20">
			<colgroup>
				<col width="8%">
				<col width="8%">
				<col width="*">
				<col width="14%">
				<col width="8%">
				<col width="14%">
				<col width="6%">
			</colgroup>
			
			<thead>
				<tr align="center">
					<th>번호</th>
					<th>상태</th>
					<th>제목</th>
					<th>마감날짜</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty stgList}">
					<tr>
						<td colspan="5" align="center">
							<strong>게시글이 존재하지 않습니다.</strong>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${stgList}" var="sgl">
					<tr onclick="go_detail(${sgl.studygroupNo})" style="cursor: pointer;" align="center">
						<td >${sgl.rnum }</td>
						<c:if test="${sgl.recruitStatus eq 'N'}">
							<td>
								<span class="badge text-danger-light badge-danger ml-1 badge-text"><c:out value="모집마감" /></span>
							</td>
						</c:if>
						<c:if test="${sgl.recruitStatus eq 'Y'}">
							<td >
								<span class="badge text-danger-light badge-success ml-1 badge-text "><c:out value="모집중" /></span>
							</td>
						</c:if>

						<td style="text-overflow: ellipsis;text-align: left;">${sgl.studygroupTitle}
							<c:if test="${sgl.replyCnt != 0 }">
								<span class="badge badge-warning" style="color:black;font-weight: bolder;">${sgl.replyCnt}</span>
							</c:if>
						</td>
						<td>
							~<fmt:formatDate value="${sgl.studygroupEnd}" pattern="yyyy-MM-dd"/>
						</td>
						<td>${sgl.memId}</td>
						<td><fmt:formatDate value="${sgl.studygroupRegDate}" pattern="yyyy-MM-dd"/></td>
						<td>${sgl.studygroupCnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div>
			
		<form:hidden path="searchStudygroupVO.pageIndex" id="pageIndex"/>
		
	</form:form>

</section>









