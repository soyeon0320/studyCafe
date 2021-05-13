<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column">
			<h3>즐겨찾기 관리</h3>
		</div>
		<div>
			<a href="myScrap" class="nav-link avatar avatar32 bg-success-light text-success rounded-circle  no-padding">
			<i class="fa fa-ellipsis-v"></i></a>
		</div>
	</div>
	
	<div class="portlet-body">
		<div>
			<button id="storeScrapBt" onclick="myScrap('#storeScrapList', this)" class="btn btn-success btn-sm"><span>가맹점</span></button>
			<button id="freeBoardScrapBt" onclick="myScrap('#freeScrapList', this)" class="btn btn-primary btn-sm"><span>자유게시판</span></button>
			<button type="button" onclick="myScrap('#infoScrapList', this)" class="btn btn-primary btn-sm"><span>정보게시판</span></button>
			<button type="button" onclick="myScrap('#scrapStudygroupList', this)" class="btn btn-primary btn-sm"><span>소모임게시판</span></button>
		</div>
		<!-- 가맹점 즐겨찾기 목록 -->
		<div id="scrapStoreList" class="store" style="">
			<table class="table table-hover mt-15">
				<thead align="center">
					<tr>
						<th style="width: 25%;">가맹점명</th>
						<th style="width: *">주소</th>
						<th style="width: 10%;">평점</th>
					</tr>
				</thead>
				<tbody id="storeScrapList" align="center">
					<c:forEach items="${storeScrapList}" var="list">
						<tr style="cursor: pointer;">
							<td>${list.storeName}</td>
							<td style="text-align:left;">${list.storeAddr}</td>
							<td><input type="number" class="rating" value="${list.storeGrade}" data-size="xs" data-readonly="true" readonly="readonly"></td>
						</tr>
					</c:forEach>
					<c:if test="${empty storeScrapList}">
						<tr>
							<td colspan="4" style="text-align: center;">
								<strong>즐겨찾기한 게시글이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 자유게시판 즐겨찾기 목록 -->
		<div id="freeScrapList" class="freeBoard" style="display: none;">
			<table class="table table-hover mt-15">
				<thead align="center">
					<tr>
						<th style="width: *;">제목</th>
						<th style="width: 20%">작성자</th>
						<th style="width: 25%;">작성일</th>
					</tr>
				</thead>
				<tbody id="freeScrapList" align="center">
					<c:forEach items="${boardScrapList}" var="list">
						<tr style="cursor: pointer;">
							<td class="td-title">${list.freeTitle}</td>
							<td>${list.memId}</td>
							<td><fmt:formatDate value="${list.freeRegDate}" pattern="MM/dd"/></td>
						</tr>
					</c:forEach>
					<c:if test="${empty boardScrapList}">
						<tr>
							<td colspan="4">
								<strong>즐겨찾기한 게시글이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 정보게시판 즐겨찾기 목록 -->
		<div id="infoScrapList" class="infoBoard" style="display: none;">
			<table class="table table-hover mt-15">
				<thead align="center">
					<tr>
						<th style="width: *;">제목</th>
						<th style="width: 20%">작성자</th>
						<th style="width: 25%;">작성일</th>
					</tr>
				</thead>
				<tbody id="infoBoardScrapList" align="center">
					<c:forEach items="${infoScrapList}" var="list">
						<tr style="cursor: pointer;">
							<td class="td-title">${list.infoTitle}</td>
							<td>${list.memId}</td>
							<td><fmt:formatDate value="${list.infoRegDate}" pattern="MM/dd"/></td>
						</tr>
					</c:forEach>
					<c:if test="${empty infoScrapList}">
						<tr>
							<td colspan="4" style="text-align: center;">
								<strong>즐겨찾기한 게시글이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 소모임게시판 즐겨찾기 목록 -->
		<div id="scrapStudygroupList" class="studygroupBoard" style="display: none;">
			<table class="table table-hover mt-15">
				<thead>
					<tr style="text-align: center;">
						<th style="width: *;">제목</th>
						<th style="width: 20%">작성자</th>
						<th style="width: 25%;">작성일</th>
					</tr>
				</thead>
				<tbody id="studygroupBoardScrapList">
					<c:forEach items="${studygroupScrapList}" var="list">
						<tr style="cursor: pointer; text-align:center;">
							<td class="td-title">${list.studygroupTitle}</td>
							<td>${list.memId}</td>
							<td><fmt:formatDate value="${list.studygroupRegDate}" pattern="MM/dd"/></td>
						</tr>
					</c:forEach>
					<c:if test="${empty studygroupScrapList}">
						<tr>
							<td colspan="4" style="text-align: center;">
								<strong>즐겨찾기한 게시글이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>