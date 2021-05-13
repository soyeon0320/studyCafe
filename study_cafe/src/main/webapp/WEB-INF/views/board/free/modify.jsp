<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<section class="container clearfix">
	<div>
		<h1>자유게시판</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/board/list' />', '#modifyForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="modifyBt" name="modifyBt" onclick="modifyFn()" value="수정"><i class="icon-book3"></i> 수정</button>
		</div>
	</div>
	
	<form:form commandName="boardFormVO" action="modify" id="modifyForm" name="modifyForm" method="post">
		<form:hidden path="searchBoardVO.searchCondition"/>
		<form:hidden path="searchBoardVO.searchKeyword"/>
		<form:hidden path="searchBoardVO.pageIndex"/>
		<form:hidden path="searchBoardVO.pageUnit"/>
		<form:hidden path="boardVO.saveToken"/>
		<form:hidden path="boardVO.isModified" value="true"/>
	
		<form:input type="hidden" path="boardVO.memId" id="memId" name="memId" value="${board.memId}"/>
		<form:input type="hidden" path="boardVO.freeNo" id="freeNo" name="freeNo" value="${board.freeNo}"/>
		<form:input type="text" id="freeTitle" path="boardVO.freeTitle" maxlength="90" class="form-control mb-20" value="${board.freeTitle}"/>

		<form:textarea rows="15" id="freeContent" path="boardVO.freeContent" maxlength="900" cssClass="summernote-init"/>
	</form:form>
	
	<script>
		function modifyFn() {
			if($("#freeTitle").val()=="") {
				alert("제목을 입력해주세요.");
				$("#freeTitle").focus();
				return;
			}
			if($("#freeContent").val()=="") {
				alert("내용을 입력해주세요.");
				$("#freeContent").focus();
				return;
			}
			
			$("form[name='modifyForm']").submit();
		}
	</script>
</section>