<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="container clearfix">
	<div>
		<h1>자유게시판</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/board/list' />', '#registForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="registBt" name="registBt" onclick="registFn()"><i class="icon-pencil2"></i> 등록</button>
		</div>
	</div>
	
	<form:form commandName="boardFormVO" id="registForm" action="regist" name="" method="post">
		<form:hidden path="searchBoardVO.searchCondition"/>
		<form:hidden path="searchBoardVO.searchKeyword"/>
		<form:hidden path="searchBoardVO.pageIndex"/>
		<form:hidden path="searchBoardVO.pageUnit"/>
		<form:hidden path="boardVO.saveToken"/>
		<form:hidden path="boardVO.isModified" value="true"/>
		<form:hidden path="boardVO.memId" cssClass="form-control" value="${loginUser.memId }"/>
		<input type="text" class="form-control mb-20" name="boardVO.freeTitle" placeholder="제목을 입력해주세요."/>
		
		<form:textarea cssClass="summernote-init form-control" maxlength="900"  path="boardVO.freeContent"  placeholder="내용을 입력해주세요." cols="30" rows="5" style="margin-top: 0px; margin-bottom: 0px; height: 160px;" />
	
	</form:form>
	
	<script>
		function registFn() {
			
			if(!$("input[name='boardVO.freeTitle']").val()){
				$("input[name='boardVO.freeTitle']").focus();
				alert("제목을 입력해 주세요.");
				return;
			}else if($("input[name='boardVO.freeTitle']").val().lenth > 90){
				$("input[name='boardVO.freeTitle']").focus();
				alert("제목은 90자 미만입니다.");
				return;
			}else if(!$("textarea[name='boardVO.freeContent']").val()){
				alert("내용을 입력해 주세요.");
				return;
			}
				
			$("form[id='registForm']").submit();
		}
	</script>
</section>