<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section> 
	
	<button type="button" id="freeBoard" class="button button-border button-border-thin button-rounded button-fill fill-from-right button-blue" onclick="javascript:location.href='<%=request.getContextPath()%>/member/myBoardList'"><span>자유게시판</span></button>
	<button type="button" id="infoBoard" class="button button-border button-border-thin button-rounded button-fill fill-from-right button-blue" onclick="javascript:location.href='<%=request.getContextPath()%>/member/infoBoard'"><span>정보게시판</span></button>
	<button type="button" class="button button-border button-border-thin button-rounded button-fill fill-from-right button-red"><span>소모임게시판</span></button>
	
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>No</th>
			  <th>제목</th>
			  <th>작성자</th>
			  <th>작성일</th>
			  <th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty stgBoardList}">
				<tr>
					<td colspan="5">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
			<c:forEach items="${stgBoardList }" var="stg" varStatus="status">
			<tr id="stg" onclick="javascript:location.href='<%=request.getContextPath()%>/'">
				<td>${status.count}</td>
				<td>${stg.studygroupTitle }</td>
				<td>${stg.studygroupContent }</td>
				<td>
					<fmt:formatDate value="${stg.studygroupRegDate }" pattern="yyyy-MM-dd"/>
				</td>
				<td>${stg.studygroupCnt }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
<!-- 	<div id="pagination" style="margin: auto;"> -->
<%-- 		<%@ include file="/WEB-INF/include/pagination.jsp" %> --%>
<!-- 	</div> -->

</section>