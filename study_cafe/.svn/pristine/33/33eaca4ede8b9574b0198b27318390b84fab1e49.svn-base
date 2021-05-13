<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<section> 
	<h1>공지사항</h1>
	
	<a href="<%=request.getContextPath() %>/notice/registForm" class="button button-border button-border-thin button-rounded button-fill fill-from-right button-blue"><i class="icon-book3"></i><span>글 등록</span></a>
	
	<div id="keyword" class="card-tools float-right" style="width:550px;">
		<div class="input-group row">	
			<!-- sort num -->
		  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="searchList_go(${cri.page });">
		  		<option value="10" ${pageMaker.cri.perPageNum == 10 ? 'selected':'' }>정렬개수</option>
		  		<option value="20" ${pageMaker.cri.perPageNum == 20 ? 'selected':'' }>20개씩</option>
		  		<option value="30" ${pageMaker.cri.perPageNum == 30 ? 'selected':'' }>30개씩</option>
		  		<option value="50" ${pageMaker.cri.perPageNum == 50 ? 'selected':'' }>50개씩</option>
		  		
		  	</select>					
			<select class="form-control col-md-3" name="searchType" id="searchType">
				<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
				<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
				<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
			</select>					
			<input  class="form-control col-md-5" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
			<span class="input-group-append col-me-1">
				<button class="button button-border button-border-thin button-dirtygreen" type="button" onclick="searchList_go(1);" 
				data-card-widget="search">
					<i class="icon-line-search"></i>검색
				</button>
			</span>
		</div>
	</div>
	
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>#</th>
			  <th style="width: 50%;">제목</th>
			  <th>작성자</th>
			  <th>작성일</th>
			  <th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty upNotice }">
			</c:if>
			<c:forEach items="${upNoticeList}" var="upNotice">
			<tr onclick="javascript:location.href='<%=request.getContextPath()%>/notice/detail?noticeNo=${upNotice.noticeNo}'" style="font-weight: bold;background-color: aliceblue;">
			  <td>[공지]</td>
			  <td>${upNotice.noticeTitle}</td>
			  <td>${upNotice.adminId }</td>
			  <td><fmt:formatDate value="${upNotice.noticeRegDate}" pattern="yyyy-MM-dd" /></td>
			  <td>${upNotice.noticeCnt }</td>
			</tr>
			</c:forEach>
			
			<c:if test="${empty noticeList }">
				<tr>
					<td colspan="4">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${noticeList}" var="notice">
			<tr onclick="javascript:location.href='<%=request.getContextPath()%>/notice/detail?noticeNo=${notice.noticeNo}'">
			  <td>${notice.noticeNo }</td>
			  <td>${notice.noticeTitle }</td>
			  <td>${notice.adminId }</td>
			  <td><fmt:formatDate value="${notice.noticeRegDate }" pattern="yyyy-MM-dd" /></td>
			  <td>${notice.noticeCnt }</td>
			</tr>
			
			</c:forEach>
			
		</tbody>
	</table>
	
	<div id="pagination" style="margin: auto;">
		<%@ include file="/WEB-INF/include/pagination.jsp" %>
	</div>
		
</section>