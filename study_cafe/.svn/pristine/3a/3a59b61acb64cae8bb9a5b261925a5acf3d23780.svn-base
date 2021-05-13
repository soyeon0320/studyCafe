<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	function myBoard(tab){
		var data = {
				tab:tab
		}
		console.log(data);
		$.ajax({
			url : '<%=request.getContextPath()%>/myPage/myBoard',
			type : 'post',
			data : data
		}).done(function(result){
			var html = jQuery('<tr>').html(result);
			var contents = html.find("tbody#indexListAjax").html();
			if (tab == "#freeBoardList"){
				$("#freeBoardList").html(contents);
				$("#freeBoardList").show();
				$("#freeBoard").attr('class', 'btn btn-danger mr-1 mb-2');
				$("#infoBoard").attr('class', 'btn btn-primary mr-1 mb-2');
				$("#stgBoard").attr('class', 'btn btn-primary mr-1 mb-2');
				$("#infoBoardList").hide();
				$("#studygroupList").hide();
			}else if(tab == "#infoBoardList"){
				$("#infoBoardList").html(contents);
				$("#infoBoardList").show();
				$("#infoBoard").attr('class', 'btn btn-danger mr-1 mb-2');
				$("#freeBoard").attr('class', 'btn btn-primary mr-1 mb-2');
				$("#stgBoard").attr('class', 'btn btn-primary mr-1 mb-2');
				$("#freeBoardList").hide();
				$("#studygroupList").hide();
			}else if(tab == "#studygroupList"){
				$("#studygroupList").html(contents);
				$("#studygroupList").show();
				$("#stgBoard").attr('class', 'btn btn-danger mr-1 mb-2');
				$("#infoBoard").attr('class', 'btn btn-primary mr-1 mb-2');
				$("#freeBoard").attr('class', 'btn btn-primary mr-1 mb-2');
				$("#freeBoardList").hide();
				$("#infoBoardList").hide();
			}
		}).fail(function (jqXHR, textStatus, errorThrown){
			console.log("에러");
			console.log(jqXHR);
			console.log(textStatus);
			console.log(errorThrown);
		});
	}
</script>
    
<section>
	<button type="button" id="freeBoard" class="btn btn-primary mr-1 mb-2" onclick="myBoard('#freeBoardList')"><span>자유게시판</span></button>
	<button type="button" id="infoBoard" class="btn btn-primary mr-1 mb-2" onclick="myBoard('#infoBoardList')"><span>정보게시판</span></button>
	<button type="button" id="stgBoard"  class="btn btn-primary mr-1 mb-2" onclick="myBoard('#studygroupList')"><span>소모임게시판</span></button>
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>
			  	<input type="checkbox" name="checkAll" id="checkAll" onclick="checkAllorder()">
			  </th>
			  <th>No</th>
			  <th>제목</th>
			  <th>작성자</th>
			  <th>작성일</th>
			  <th>조회수</th>
			</tr>
		</thead>
		<tbody id="freeBoardList" style="display: none">
			<c:if test="${empty freeBoardList }">
				<tr>
					<td colspan="6">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
		</tbody>
		<tbody id="infoBoardList" style="display: none">
			<c:if test="${empty infoBoardList }">
				<tr>
					<td colspan="6">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
		</tbody>
		<tbody id="studygroupList" style="display: none">
			<c:if test="${empty studygroupList }">
				<tr>
					<td colspan="6">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			
		</tbody>
	</table>
</section>