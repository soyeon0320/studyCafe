<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<section> 
	
	<form:form commandName="memberBoardFormVO" id="listForm">
		<div>
			<form:button type="button" id="freeBoard" class="btn btn-primary mr-1 mb-2" onclick="myBoard('#freeBoardList', this)"><span>자유게시판</span></form:button>
			<form:button type="button" id="infoBoard" class="btn btn-primary mr-1 mb-2" onclick="myBoard('#infoBoardList', this)"><span>정보게시판</span></form:button>
			<form:button type="button" id="stgBoard"  class="btn btn-primary mr-1 mb-2" onclick="myBoard('#studygroupList', this)"><span>소모임게시판</span></form:button>
		</div>
		
		<div id="freeBoardList" class="free">
		<form action="freeChkSuccess" name="freeChkForm" method="post">
		<table class="table table-hover mt-20">
			<thead>
				<tr>
<!-- 				  <th> -->
<!-- 				  	<input type="checkbox" name="freeCheckAll" id="freeCheckAll" onclick="frCheckAll()"> -->
<!-- 				  	<input type="hidden" name="freeData" id="freeData" value=""> -->
<!-- 				  </th> -->
				  <th>No</th>
				  <th>제목</th>
				  <th>작성자</th>
				  <th>작성일</th>
				  <th>조회수</th>
				</tr>
			</thead>
			<tbody id="indexListAjax">
				<c:if test="${empty freeBoardList}">
					<tr>
						<td colspan="5">
							<strong>작성 게시글이 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				
				<c:forEach items="${freeBoardList}" var="free"  varStatus="status">
				<tr id="free">
<%-- 				  <td><input type="checkbox" name="freeCheck" id="freeCheck" value="${free.freeNo}"></td> --%>
				  <td>${status.count }</td>
				  <td onclick="location_go('board/detail?boardVO.freeNo=${free.freeNo}')">${free.freeTitle }</td>
				  <td>${free.memId }</td>
				  <td>
				  	<fmt:formatDate value="${free.freeRegDate }" pattern="yyyy-MM-dd"/>
				  </td>
				  <td>${free.freeCnt }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
			<div>
<!-- 			<button style="float: right;" class="btn btn-shadow btn-success" type="button" onclick="freeCheckData();">글 삭제</button> -->
			<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>	    
			</div>
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${freeBoardPaginationInfo}" type="text" jsFunction="go_free" />
					<form:hidden path="searchBoardVO.pageIndex" id="freeIndex"/>
				</ul>
			</div>    
		
		</div>
		
		<div id="infoBoardList" class="info" style="display: none;">
		<table class="table table-hover mt-20">
			<thead>
				<tr>
<!-- 				  <th> -->
<!-- 				  	<input type="checkbox" name="infoCheckAll" id="infoCheckAll" onclick="inFoCheckAll()"> -->
<!-- 				  </th> -->
				  <th>No</th>
				  <th>제목</th>
				  <th>작성자</th>
				  <th>작성일</th>
				  <th>조회수</th>
				</tr>
			</thead>
			<tbody id="indexListAjax">
				<c:if test="${empty infoBoardList }">
					<tr>
						<td colspan="6">
							<strong>작성 게시글이 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${infoBoardList }" var="info" varStatus="status">
				<tr id="info">	
<!-- 					<td><input type="checkbox" name="infoCheck" id="infoCheck"></td> -->
					<td>${status.count }</td>
					<td onclick="location_go('info/detail?infoVO.infoNo=${info.infoNo}')">${info.infoTitle}</td>
					<td>${info.memId }</td>
					<td>
						<fmt:formatDate value="${info.infoRegDate }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${info.infoCnt }</td>
				</tr>
				</c:forEach>
	
			</tbody>
		</table>
			<div>
			<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>
			</div>
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${infoPaginationInfo}" type="text" jsFunction="go_info" />
					<form:hidden path="searchInfoVO.pageIndex" id="infoIndex"/>
				</ul>    
			</div>   
		</div>
		
		<div id="studygroupList" class="studygroup" style="display: none;">
		<table class="table table-hover mt-20">
			<thead>
				<tr>
<!-- 				  <th> -->
<!-- 				  	<input type="checkbox" name="stgCheckAll" id="stgCheckAll" onclick="studyCheckAll()"> -->
<!-- 				  </th> -->
				  <th>No</th>
				  <th>제목</th>
				  <th>작성자</th>
				  <th>작성일</th>
				  <th>조회수</th>
				</tr>
			</thead>
			<tbody id="indexListAjax">
				<c:if test="${empty studygroupList}">
					<tr>
						<td colspan="5">
							<strong>작성게시글이 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				
				<c:forEach items="${studygroupList }" var="stg" varStatus="status">
				<tr id="stg">
<!-- 					<td><input type="checkbox" name="stgCheck" id="stgCheck"></td> -->
					<td>${status.count }</td>
					<td onclick="location_go('stb/detail?studygroupVO.studygroupNo=${stg.studygroupNo}')">${stg.studygroupTitle }</td>
					<td>${stg.memId }</td>
					<td>
						<fmt:formatDate value="${stg.studygroupRegDate }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${stg.studygroupCnt }</td>
				</tr>
				</c:forEach>
	
			</tbody>
		</table>
			<button class="btn btn-shadow btn-info" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/myPage/main'">뒤로 가기</button>
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${studygroupPaginationInfo}" type="text" jsFunction="go_study" />
					<form:hidden path="searchStudygroupVO.pageIndex" id="studygroupIndex"/>
				</ul>    
			</div>  
			<form:hidden path="tabType" id="taType"/>
		</div>
	</form:form>
</section>
<script>

window.addEventListener("onload",function(){
	<c:if test="${tabType eq 'freeBoard' }">
		$("#freeBoard").trigger("click");
	</c:if>
});

function go_free(pageIndex){
	$("#freeIndex").val(pageIndex);
	$("#tabType").val("freeBoard");
	go_action("myBoard");
}
function go_info(pageIndex){
	$("#infoIndex").val(pageIndex);
	$("#tabType").val("infoBoard");
	go_action("myBoard");
	
}
function go_study(pageIndex){
	$("#studygroupIndex").val(pageIndex);
	$("#tabType").val("stgBoard");
	go_action("myBoard");
	
}

function myBoard(tabId,obj){
	if(tabId == '#freeBoardList'){
		$("#freeBoardList").show();
		$("#freeBoard").attr('class', 'btn btn-danger mr-1 mb-2');
		$("#infoBoard").attr('class', 'btn btn-primary mr-1 mb-2');
		$("#stgBoard").attr('class', 'btn btn-primary mr-1 mb-2');
		$("#infoBoardList").hide();
		$("#studygroupList").hide();
	}else if(tabId == "#infoBoardList"){
		$("#infoBoardList").show();
		$("#infoBoard").attr('class', 'btn btn-danger mr-1 mb-2');
		$("#freeBoard").attr('class', 'btn btn-primary mr-1 mb-2');
		$("#stgBoard").attr('class', 'btn btn-primary mr-1 mb-2');
		$("#freeBoardList").hide();
		$("#studygroupList").hide();
	}else if(tabId == "#studygroupList"){
		$("#studygroupList").show();
		$("#stgBoard").attr('class', 'btn btn-danger mr-1 mb-2');
		$("#infoBoard").attr('class', 'btn btn-primary mr-1 mb-2');
		$("#freeBoard").attr('class', 'btn btn-primary mr-1 mb-2');
		$("#freeBoardList").hide();
		$("#infoBoardList").hide();
	}
	
}

function studyCheckAll(){
	if($("#stgCheckAll").is(':checked')){
		$("input[name=stgCheck]").prop("checked", true);
	}else{
		$("input[name=stgCheck]").prop("checked", false);
	}
}
function frCheckAll(){
	if($("#freeCheckAll").is(':checked')){
		$('input[name=freeCheck]').prop("checked", true);
	}else{
		$("input[name=freeCheck]").prop("checked", false);
	}
}
function inFoCheckAll(){
	if($("#infoCheckAll").is(':checked')){
		$('input[name=infoCheck]').prop("checked", true);
	}else{
		$("input[name=infoCheck]").prop("checked", false);
	}
}

function freeCheckData(){
	var chk = $("input[name=freeCheck]");
	var chkArray = new Array();
	$('input:checkbox[name=freeCheck]:checked').each(function(){
		chkArray.push(this.value);
		
		$("#freeData").val(chkArray);
		
		$("form[name='freeChkForm']").submit();
		alert($("#freeData").val());
	});
	
	
}
</script>