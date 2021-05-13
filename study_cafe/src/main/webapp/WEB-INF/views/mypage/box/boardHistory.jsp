<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			
<div class="portlet-box portlet-shadow  mb-30" style="height: 98%; overflow: auto; padding: 10px;">
	<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
		<div class="flex d-flex flex-column">
			<h3>나의 게시글</h3>
		</div>
		<a href="myBoard" class="nav-link avatar avatar32 bg-success-light text-success rounded-circle  no-padding">
		<i class="fa fa-ellipsis-v"></i></a>
	</div>
	
	<div class="portlet-body" style="padding: 10px;">
		<div>
			<button type="button" id="freeBoard" class="btn btn-danger btn-sm" onclick="myBoard('#freeBoardList', this)"><span>자유게시판</span></button>
			<button type="button" id="infoBoard" class="btn btn-primary btn-sm" onclick="myBoard('#infoBoardList', this)"><span>정보게시판</span></button>
			<button type="button" id="stgBoard"  class="btn btn-primary btn-sm" onclick="myBoard('#studygroupList', this)"><span>소모임게시판</span></button>
		</div>
		<div id="freeBoardList" class="free">
	<form action="freeChkSuccess" name="freeChkForm" method="post">	
	<table class="table table-hover mt-15" id="freeBody">
		<thead align="center">
			<tr>
			  <th>
			  	<input type="checkbox" name="freeCheckAll" id="freeCheckAll" onclick="frCheckAll()">
			  	<input type="hidden" name="freeData" id="freeData" value="">
			  </th>
			  <th>제목</th>
			  <th>작성자</th>
			  <th>작성일</th>
			  <th>조회수</th>
			</tr>
		</thead>
		<tbody id="indexListAjax" align="center">
			<c:if test="${empty freeBoardList }">
				<tr>
					<td colspan="5">
						<strong>작성 게시글이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
			<c:forEach items="${freeBoardList}" var="free"  varStatus="status">
			<tr id="free">
			  <td><input type="checkbox" name="freeCheck" id="freeCheck" value="${free.freeNo}"></td>
			  <td class="td-title" onclick="location_go('board/detail?boardVO.freeNo=${free.freeNo}')">${free.freeTitle }</td>
			  <td>${free.memId }</td>
			  <td>
			  	<fmt:formatDate value="${free.freeRegDate }" pattern="MM/dd"/>
			  </td>
			  <td>${free.freeCnt }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
		<button class="btn btn-shadow btn-success" type="button" onclick="freeCheckData();">글 삭제</button>
	</div>
	<div id="infoBoardList" class="info" style="display: none;">
	<form action="infoChkSuccess" name="infoChkForm" method="post">
	<table class="table table-hover mt-15" id="infoBody">
		<thead align="center">
			<tr>
			  <th>
			  	<input type="checkbox" name="infoCheckAll" id="infoCheckAll" onclick="inFoCheckAll()">
			  	<input type="hidden" name="infoData" id="infoData" value="">
			  </th>
			  <th>제목</th>
			  <th>작성자</th>
			  <th>작성일</th>
			  <th>조회수</th>
			</tr>
		</thead>
		<tbody id="indexListAjax" align="center">
			<c:if test="${empty infoBoardList}">
				<tr>
					<td colspan="5">
						<strong>작성 게시글이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
			<c:forEach items="${infoBoardList }" var="info" varStatus="status">
			<tr id="info">	
				<td><input type="checkbox" name="infoCheck" id="infoCheck" value="${info.infoNo }"></td>
				<td class="td-title" onclick="location_go('info/detail?infoVO.infoNo=${info.infoNo}')">${info.infoTitle}</td>
				<td>${info.memId }</td>
				<td>
					<fmt:formatDate value="${info.infoRegDate }" pattern="MM/dd"/>
				</td>
				<td>${info.infoCnt }</td>
			</tr>
			</c:forEach>

		</tbody>
		</table>
		</form>
		<button class="btn btn-shadow btn-success" type="button" onclick="infoCheckData();">글 삭제</button>
	</div>
	<div id="studygroupList" class="studygroup" style="display: none;">
	<form action="stgChkSuccess" name="stgChkForm" method="post">
	<table class="table table-hover mt-15" id="studyBody">
		<thead align="center">
			<tr>
			  <th>
			  	<input type="checkbox" name="stgCheckAll" id="stgCheckAll" onclick="studyCheckAll()">
			  	<input type="hidden" name="stgData" id="stgData" value=""> 
			  </th>
			  <th>제목</th>
			  <th>작성자</th>
			  <th>작성일</th>
			  <th>조회수</th>
			</tr>
		</thead>
		<tbody id="indexListAjax" align="center">
			
			<c:if test="${empty studygroupList }">
				<tr>
					<td colspan="5">
						<strong>작성게시글이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
			<c:forEach items="${studygroupList }" var="stg" varStatus="status">
			<tr id="stg">
				<td><input type="checkbox" name="stgCheck" id="stgCheck" value="${stg.studygroupNo }"></td>
				<td class="td-title" onclick="location_go('stb/detail?studygroupVO.studygroupNo=${stg.studygroupNo}')">${stg.studygroupTitle }</td>
				<td>${stg.memId }</td>
				<td>
					<fmt:formatDate value="${stg.studygroupRegDate }" pattern="MM/dd"/>
				</td>
				<td>${stg.studygroupCnt }</td>
			</tr>
			</c:forEach>

		</tbody>
	</table>
	</form>
	<button class="btn btn-shadow btn-success" type="button" onclick="stgCheckData();">글 삭제</button>
	</div>
	
	</div>
</div>
<script>
	function frCheckAll(){
		if($("#freeCheckAll").is(':checked')){
			$('input[name=freeCheck]').prop("checked", true);
		}else{
			$('input[name=freeCheck]').prop("checked", false);
		}
	}
	function freeCheckData(){
		var chk = $("input[name=freeCheck]");
		var chkArray = new Array();
		$('input:checkbox[name=freeCheck]:checked').each(function(){
			chkArray.push(this.value);
			
			if($(this).is(":checked") == true){
				
				$("#freeData").val(chkArray);
				
				$("form[name='freeChkForm']").submit();
			}
		});
		
		alert("체크박스를 미체크하셨습니다. 다시 선택해주세요.");
	}
	function inFoCheckAll(){
		if($("#infoCheckAll").is(':checked')){
			$('input[name=infoCheck]').prop("checked", true);
		}else{
			$("input[name=infoCheck]").prop("checked", false);
		}
	}
	
	function infoCheckData(){
		var chk = $("input[name=infoCheck]");
		var chkArray = new Array();
		$('input:checkbox[name=infoCheck]:checked').each(function(){
			
			chkArray.push(this.value);
			
			$("#infoData").val(chkArray);
			
			$("form[name='infoChkForm']").submit();
			alert($("#infoData").val());
		});
	}
	
	function studyCheckAll(){
		if($("#stgCheckAll").is(':checked')){
			$('input[name=stgCheck]').prop("checked", true);
		}else{
			$('input[name=stgCheck]').prop("checked", false);
		}
	}
	
	function stgCheckData(){
		var chk= $('input[name=stgCheck]');
		var chkArray = new Array();
		
		$('input:checkbox[name=stgCheck]:checked').each(function(){
			chkArray.push(this.value);
			
			if($(this).is(":checked") == true){
				
				$("#stgData").val(chkArray);
				
				$("form[name='stgChkForm']").submit();
			}
			
		});
		alert("체크박스를 미체크하셨습니다. 다시 선택해주세요.");
	}
</script>