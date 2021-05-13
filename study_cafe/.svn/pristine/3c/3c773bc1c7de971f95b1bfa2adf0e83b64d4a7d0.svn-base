<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<style>
	table thead {
		text-align: center;
	}
</style>

<section> 
	<form:form commandName="memberScrapFormVO" id="listForm">
	
	<form:button type="button" id="storeScrapBt" onclick="myScrap('#storeScrapList', this)" class="btn btn-success mr-1 mb-2"><span>가맹점</span></form:button>
	<form:button type="button" id="freeScrapBt" onclick="myScrap('#freeScrapList', this)" class="btn btn-primary mr-1 mb-2"><span>자유게시판</span></form:button>
	<form:button type="button" id="infoScrapBt" onclick="myScrap('#infoScrapList', this)" class="btn btn-primary mr-1 mb-2"><span>정보게시판</span></form:button>
	<form:button type="button" id="studygroupScrapBt" onclick="myScrap('#studygroupScrapList', this)" class="btn btn-primary mr-1 mb-2"><span>소모임게시판</span></form:button>
	
	<button type="button" onclick="storeScrapRemoveFn()" id="storeScrapRemoveBt" class="btn btn-danger mr-1 mb-2" style=""><span>가맹점 즐겨찾기 해제</span></button>
	<button type="button" onclick="freeScrapRemoveFn()" id="freeScrapRemoveBt" class="btn btn-danger mr-1 mb-2" style="display: none;"><span>자유게시판 즐겨찾기 해제</span></button>
	<button type="button" onclick="infoScrapRemoveFn()" id="infoScrapRemoveBt" class="btn btn-danger mr-1 mb-2" style="display: none;"><span>정보게시판 즐겨찾기 해제</span></button>
	<button type="button" onclick="studygroupScrapRemoveFn()" id="studygroupScrapRemoveBt" class="btn btn-danger mr-1 mb-2" style="display: none;"><span>소모임게시판 즐겨찾기 해제</span></button>
	
	<!-- 가맹점 즐겨찾기 목록 -->
	<div id="storeScrapList" class="store" style="">
		<table class="table table-hover mt-20">
			<thead>
				<tr style="text-align: center;">
				  <th style="width: 5%;">
			  	  	<input type="checkbox" id="storeCodeAll">
			  	  </th>
				  	<th style="width: 8%;">No</th>
					<th style="width: 20%;">가맹점명</th>
					<th style="width: *">주소</th>
					<th style="width: 10%;">평점</th>
				</tr>
			</thead>
			<tbody id="storeScrapList">
				<c:forEach items="${storeScrapList}" var="list">
					<tr style="cursor: pointer; text-align:center;">
						<td><input type="checkbox" id="storeCode" name="storeCode" value="${list.storeCode}"></td>
						<td>${list.rnum}</td>
						<td>${list.storeName}</td>
						<td style="text-align:left;">${list.storeAddr}</td>
						<td><input type="number" class="rating" value="${list.storeGrade}" data-size="xs" data-readonly="true" readonly="readonly"></td>
					</tr>
				</c:forEach>
				<c:if test="${empty storeScrapList}">
					<tr>
						<td colspan="5" style="text-align: center;">
							<strong>조건에 맞는 데이터가 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<tr>
				</tr>
			</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${storePaginationInfo}" type="text" jsFunction="go_store" />
				<form:hidden path="searchStoreScrapVO.pageIndex" id="storeIndex"/>
			</ul>    
		</div> 
	</div>
	
	<!-- 자유게시판 즐겨찾기 목록 -->
	<div id="freeScrapList" class="freeBoard" style="display: none;">
		<table class="table table-hover mt-20">
			<thead>
				<tr style="text-align: center;">
				  <th style="width: 5%;">
			  	  	<input type="checkbox" id="freeNoAll">
			  	  </th>
				  	<th style="width: 8%;">No</th>
					<th style="width: *;">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%;">작성일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
			</thead>
			<tbody id="freeScrapList">
				<c:forEach items="${boardScrapList}" var="list">
					<tr style="cursor: pointer; text-align:center;">
						<td><input type="checkbox" id="freeNo" name="freeNo" value="${list.freeNo}"></td>
						<td>${list.rnum}</td>
						<td style="text-align:left;">${list.freeTitle}</td>
						<td>${list.memId}</td>
						<td><fmt:formatDate value="${list.freeRegDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.freeCnt}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty boardScrapList}">
					<tr>
						<td colspan="6" style="text-align: center;">
							<strong>조건에 맞는 데이터가 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<tr>
				</tr>
			</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${boardPaginationInfo}" type="text" jsFunction="go_board" />
				<form:hidden path="searchBoardVO.pageIndex" id="boardIndex"/>
			</ul>    
		</div>
	</div>
	
	<!-- 정보게시판 즐겨찾기 목록 -->
	<div id="infoScrapList" class="infoBoard" style="display: none;">
		<table class="table table-hover mt-20">
			<thead>
				<tr style="text-align: center;">
				  <th style="width: 5%;">
			  	  	<input type="checkbox" id="infoNoAll">
			  	  </th>
				  	<th style="width: 8%;">No</th>
					<th style="width: *;">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%;">작성일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
			</thead>
			<tbody id="infoBoardScrapList">
				<c:forEach items="${infoScrapList}" var="list">
					<tr style="cursor: pointer; text-align:center;">
						<td><input type="checkbox" id="infoNo" name="infoNo" value="${list.infoNo}"></td>
						<td>${list.rnum}</td>
						<td style="text-align:left;">${list.infoTitle}</td>
						<td>${list.memId}</td>
						<td><fmt:formatDate value="${list.infoRegDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.infoCnt}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty infoScrapList}">
					<tr>
						<td colspan="6" style="text-align: center;">
							<strong>조건에 맞는 데이터가 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<tr>
				</tr>
			</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${infoPaginationInfo}" type="text" jsFunction="go_info" />
				<form:hidden path="searchInfoVO.pageIndex" id="infoIndex"/>
			</ul>    
		</div>
	</div>
	
	<!-- 소모임게시판 즐겨찾기 목록 -->
	<div id="studygroupScrapList" class="studygroupBoard" style="display: none;">
		<table class="table table-hover mt-20">
			<thead>
				<tr style="text-align: center;">
				  <th style="width: 5%;">
			  	  	<input type="checkbox" id="studygroupNoAll">
			  	  </th>
				  	<th style="width: 8%;">No</th>
					<th style="width: *;">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%;">작성일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
			</thead>
			<tbody id="studygroupBoardScrapList">
				<c:forEach items="${studygroupScrapList}" var="list">
					<tr style="cursor: pointer; text-align:center;">
						<td><input type="checkbox" id="studygroupNo" name="studygroupNo" value="${list.studygroupNo}"></td>
						<td>${list.rnum}</td>
						<td style="text-align:left;">${list.studygroupTitle}</td>
						<td>${list.memId}</td>
						<td><fmt:formatDate value="${list.studygroupRegDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.studygroupCnt}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty studygroupScrapList}">
					<tr>
						<td colspan="6" style="text-align: center;">
							<strong>조건에 맞는 데이터가 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<tr>
				</tr>
			</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${studygroupPaginationInfo}" type="text" jsFunction="go_studygroup" />
				<form:hidden path="searchStudygroupVO.pageIndex" id="studygroupIndex"/>
			</ul>    
		</div>
	</div>
	
	<form:hidden path="tabType" id="taType"/>
	
	</form:form>
</section>

<script>
window.addEventListener("onload",function() {
	<c:if test="${tabType eq 'storeScrapBt'}">
		$("#storeScrapBt").trigger("click");
	</c:if>
	
	$("#storeCodeAll").click(function() {
		if($(this).prop("checked") == true) {
			$("input[name='storeCode']").prop("checked", true);
		}else {
			$("input[name='storeCode']").prop("checked", false);
		}
	});
	$("input:checkbox[name=storeCode]").change(function(){
		var Len = $("input:checkbox[name=storeCode]").length;
		var ckLen = $("input:checkbox[name=storeCode]:checked").length;
		if($(this).is(":checked") == false){
			$("#storeCodeAll").prop("checked", false);
		}
		if(Len == ckLen){
			$("#storeCodeAll").prop("checked", true);
		}
	});
	
	$("#freeNoAll").click(function() {
		if($(this).prop("checked") == true) {
			$("input[name='freeNo']").prop("checked", true);
		}else {
			$("input[name='freeNo']").prop("checked", false);
		}
	});
	$("input:checkbox[name=freeNo]").change(function(){
		var Len = $("input:checkbox[name=freeNo]").length;
		var ckLen = $("input:checkbox[name=freeNo]:checked").length;
		if($(this).is(":checked") == false){
			$("#freeNoAll").prop("checked", false);
		}
		if(Len == ckLen){
			$("#freeNoAll").prop("checked", true);
		}
	});
	
	$("#infoNoAll").click(function() {
		if($(this).prop("checked") == true) {
			$("input[name='infoNo']").prop("checked", true);
		}else {
			$("input[name='infoNo']").prop("checked", false);
		}
	});
	$("input:checkbox[name=infoNo]").change(function(){
		var Len = $("input:checkbox[name=infoNo]").length;
		var ckLen = $("input:checkbox[name=infoNo]:checked").length;
		if($(this).is(":checked") == false){
			$("#infoNoAll").prop("checked", false);
		}
		if(Len == ckLen){
			$("#infoNoAll").prop("checked", true);
		}
	});
	
	$("#studygroupNoAll").click(function() {
		if($(this).prop("checked") == true) {
			$("input[name='studygroupNo']").prop("checked", true);
		}else {
			$("input[name='studygroupNo']").prop("checked", false);
		}
	});
	$("input:checkbox[name=studygroupNo]").change(function(){
		var Len = $("input:checkbox[name=studygroupNo]").length;
		var ckLen = $("input:checkbox[name=studygroupNo]:checked").length;
		if($(this).is(":checked") == false){
			$("#studygroupNoAll").prop("checked", false);
		}
		if(Len == ckLen){
			$("#studygroupNoAll").prop("checked", true);
		}
	});
});

function go_store(pageIndex) {
	$("#storeIndex").val(pageIndex);
	$("#tabType").val("storeScrapBt");
	go_action("myScrap");
}

function go_board(pageIndex) {
	$("#boardIndex").val(pageIndex);
	$("#tabType").val("freeScrapBt");
	go_action("myScrap");
}

function go_info(pageIndex) {
	$("#infoIndex").val(pageIndex);
	$("#tabType").val("infoScrapBt");
	go_action("myScrap");
}

function go_studygroup(pageIndex) {
	$("#studygroupIndex").val(pageIndex);
	$("#tabType").val("studygroupScrapBt");
	go_action("myScrap");
}

function myScrap(tabId, obj) {
	if(tabId == "#storeScrapList") {
		$("#storeScrapList").css("display", "");
		$("#storeScrapRemoveBt").css("display", "");
		$("#freeScrapList").css("display", "none");
		$("#freeScrapRemoveBt").css("display", "none");
		$("#infoScrapList").css("display", "none");
		$("#infoScrapRemoveBt").css("display", "none");
		$("#studygroupScrapList").css("display", "none");
		$("#studygroupScrapRemoveBt").css("display", "none");
	}else if(tabId == "#freeScrapList") {
		$("#storeScrapList").css("display", "none");
		$("#storeScrapRemoveBt").css("display", "none");
		$("#freeScrapList").css("display", "");
		$("#freeScrapRemoveBt").css("display", "");
		$("#infoScrapList").css("display", "none");
		$("#infoScrapRemoveBt").css("display", "none");
		$("#studygroupScrapList").css("display", "none");
		$("#studygroupScrapRemoveBt").css("display", "none");
	}else if(tabId == "#infoScrapList") {
		$("#storeScrapList").css("display", "none");
		$("#storeScrapRemoveBt").css("display", "none");
		$("#freeScrapList").css("display", "none");
		$("#freeScrapRemoveBt").css("display", "none");
		$("#infoScrapList").css("display", "");
		$("#infoScrapRemoveBt").css("display", "");
		$("#studygroupScrapList").css("display", "none");
		$("#studygroupScrapRemoveBt").css("display", "none");
	}else if(tabId == "#studygroupScrapList"){		
		$("#storeScrapList").css("display", "none");
		$("#storeScrapRemoveBt").css("display", "none");
		$("#freeScrapList").css("display", "none");
		$("#freeScrapRemoveBt").css("display", "none");
		$("#infoScrapList").css("display", "none");
		$("#infoScrapRemoveBt").css("display", "none");
		$("#studygroupScrapList").css("display", "");
		$("#studygroupScrapRemoveBt").css("display", "");
	}
}
function storeScrapRemoveFn() {
	$.ajax({
		url:"<c:url value='/scrap/myPage/store/remove'/>",
		type:"post",
		data:$("input:checkbox[name='storeCode']:checked").serialize(),
		success:function(data) {
			alert("즐겨찾기를 해제하셨습니다.");
// 			location.reload();
			$("#storeScrapList tr td input:checkbox[name='storeCode']:checked").closest("tr").remove();
		},
		error:function(xhr) {
			console.log(xhr);
		}
	});
}

function freeScrapRemoveFn() {
	$.ajax({
		url:"<c:url value='/scrap/myPage/free/remove'/>",
		type:"post",
		data:$("input:checkbox[name='freeNo']:checked").serialize(),
		success:function(data) {
			alert("즐겨찾기를 해제하셨습니다.");
			$("#freeScrapList tr td input:checkbox[name='freeNo']:checked").closest("tr").remove();
		},
		error:function(xhr) {
			console.log(xhr);
		}
	});
}

function infoScrapRemoveFn() {
	$.ajax({
		url:"<c:url value='/scrap/myPage/info/remove'/>",
		type:"post",
		data:$("input:checkbox[name='infoNo']:checked").serialize(),
		success:function(data) {
			alert("즐겨찾기를 해제하셨습니다.");
			$("#infoBoardScrapList tr td input:checkbox[name='infoNo']:checked").closest("tr").remove();
		},
		error:function(xhr) {
			console.log(xhr);
		}
	});
}

function studygroupScrapRemoveFn() {
	$.ajax({
		url:"<c:url value='/scrap/myPage/studygroup/remove'/>",
		type:"post",
		data:$("input:checkbox[name='studygroupNo']:checked").serialize(),
		success:function(data) {
			alert("즐겨찾기를 해제하셨습니다.");
			$("#studygroupBoardScrapList tr td input:checkbox[name='studygroupNo']:checked").closest("tr").remove();
		},
		error:function(xhr) {
			console.log(xhr);
		}
	});
}
</script>