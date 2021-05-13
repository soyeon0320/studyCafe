<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<section>
	<div>
		<h1>자유게시판</h1>
	</div>
	
	<form:form commandName="boardFormVO" id="listForm" name="listForm" method="post">
		<form:hidden path="boardVO.freeNo" id="detailNo"/>
		<input type="hidden" id="memId" name="memId" value="${loginUser.memId }"/>
		
		<a class="btn btn-success mb-2" href="javascript:go_action('registView');"><i class="icon-pencil2"></i>글등록</a>
		
		<div id="keyword" class="card-tools float-right" style="width:550px;">
			<div class="input-group row">	
				<form:select path="searchBoardVO.pageUnit" cssClass="form-control col-md-3" onchange="go_action('<c:url value='/board/list' />');">
					<form:options items="${boardFormVO.searchBoardVO.pageUnitSelector}" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
				</form:select>
				<form:select cssClass="form-control col-md-3" path="searchBoardVO.searchCondition" id="searchBoardVO.searchCondition">
					<form:options items="${codeList}" itemValue="codeId" itemLabel="codeIdNm"/>
				</form:select>
				<form:input type="text" path="searchBoardVO.searchKeyword" name="searchBoardVO.searchKeyword" cssClass="form-control col-md-5" placeholder="검색어를 입력해주세요."/>
				<span class="input-group-append">
					<button class="btn btn-info" type="button" name="searchBoardVO.searchKeyword" onclick="go_search('<c:url value='/board/list' />');">
						<i class="fa fa-fw fa-search"></i><span>검색</span>
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
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty boardList}">
					<tr>
						<td colspan="5" align="center">
							<strong>게시글이 존재하지 않습니다.</strong>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${boardList}" var="list" varStatus="stat">
					<tr align="center">
						<td>${list.rnum }</td>
						<td align="left" onclick="go_detail(${list.freeNo})" style="cursor: pointer;">${list.freeTitle}
							<c:if test="${list.replyCnt != 0 }">
								<span class="badge badge-warning " style="color:black;font-weight: bolder;">${list.replyCnt}</span>
							</c:if>
						</td>
						<td>${list.memId}</td>
						<td><fmt:formatDate value="${list.freeRegDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.freeCnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div>
			
		<form:hidden path="searchBoardVO.pageIndex" id="pageIndex"/>
		
	</form:form>

</section>
