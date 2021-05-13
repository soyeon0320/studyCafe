<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"	   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<section> 

	<div>
		<h1>공지사항</h1>
	</div>
	
	<form:form commandName="noticeFormVO" id="listForm" name="listForm" method="post">
		<form:hidden path="noticeVO.noticeNo" id="detailNo"/>
		
		<c:if test="${not empty loginAdmin.adminId }">
			<a class="btn btn-success " href="javascript:go_action('registForm');"><i class="icon-pencil2"></i><span>글등록</span></a>
		</c:if>
		<div id="keyword" class="card-tools float-right mb-20" style="width:550px;">
			<div class="input-group row">	
				<form:select path="searchNoticeVO.pageUnit" cssClass="form-control col-md-3" onchange="go_action('list');">
					<form:options items="${noticeFormVO.searchNoticeVO.pageUnitSelector}" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
				</form:select>
				<form:select cssClass="form-control col-md-3" path="searchNoticeVO.searchCondition" id="searchNoticeVO.searchCondition">
					<form:options items="${codeList}" itemValue="codeId" itemLabel="codeIdNm"/>
				</form:select>
				<form:input type="text" path="searchNoticeVO.searchKeyword" name="searchNoticeVO.searchKeyword" cssClass="form-control col-md-5" placeholder="검색어를 입력해주세요."/>
				<span class="input-group-append">
					<button class="btn btn-info" type="button" name="searchNoticeVO.searchKeyword" onclick="go_search('<c:url value='/notice/list' />');">
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
					<th style="text-align: left;">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty upNoticeList }">
				</c:if>
				
				<c:forEach items="${upNoticeList}" var="upNotice">
					<tr align="center" onclick="go_detail(${upNotice.noticeNo});" style="font-weight: bold;background-color: aliceblue;cursor: pointer;">
					  <td><a href="javascript:void(0)" class="btn btn-icon btn-icon-left btn-outline-primary" style="font-weight: bold;pointer-events: none; padding: .1rem;"><i class="icon-bullhorn1"></i><span>&nbsp;&nbsp; 공지</span></a></td>
					  <td align="left">${upNotice.noticeTitle }</td>
					  <td>관리자</td>
					  <td><fmt:formatDate value="${upNotice.noticeRegDate }" pattern="yyyy-MM-dd" /></td>
					  <td>${upNotice.noticeCnt }</td>
					</tr>
				</c:forEach>

				<c:if test="${empty resultList}">
					<tr>
						<td colspan="5" align="center">
							<strong>게시글이 존재하지 않습니다.</strong>
						</td>
					</tr>
				</c:if>
				
				<c:forEach items="${resultList}" var="notice" varStatus="stat">
					<tr onclick="go_detail(${notice.noticeNo})" style="cursor: pointer;" align="center">
						<td >${notice.rnum }</td>
						<td align="left">${notice.noticeTitle}
						</td>
						<td>관리자</td>
						<td><fmt:formatDate value="${notice.noticeRegDate}" pattern="yyyy-MM-dd"/></td>
						<td>${notice.noticeCnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div>
			
		<form:hidden path="searchNoticeVO.pageIndex" id="pageIndex"/>
		
	</form:form>
		
</section>