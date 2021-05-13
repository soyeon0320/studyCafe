<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<section class="container clearfix">
	<div>
		<h1>소모임게시판</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/stb/list' />', '#modifyForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="modifyBt" name="modifyBt" onclick="modifyFn()" value="수정"><i class="icon-book3"></i> 수정</button>
		</div>
	</div>
	
	<form:form commandName="studygroupFormVO" action="modify" id="modifyForm" name="modifyForm" method="post">
		<form:hidden path="searchStudygroupVO.searchCondition"/>
		<form:hidden path="searchStudygroupVO.searchKeyword"/>
		<form:hidden path="searchStudygroupVO.pageIndex"/>
		<form:hidden path="searchStudygroupVO.pageUnit"/>
		<form:hidden path="studygroupVO.saveToken"/>
		<form:hidden path="studygroupVO.isModified" value="true"/>
	
		<form:input type="hidden" path="studygroupVO.memId" id="memId" name="memId" value="${sgv.memId}"/>
		<form:input type="hidden" path="studygroupVO.studygroupNo" id="studygroupNo" name="studygroupNo" value="${sgv.studygroupNo}"/>
		<form:input type="text" id="studygroupTitle" path="studygroupVO.studygroupTitle" maxlength="90" class="form-control mb-20" value="${sgv.studygroupTitle}"/>

		<textarea rows="15" id="studygroupContent" name="studygroupVO.studygroupContent" maxlength="900" class="summernote-init">${sgv.studygroupContent}</textarea>
	</form:form>
	<script>
		function modifyFn() {
			if($("#studygroupTitle").val()=="") {
				alert("제목을 입력해주세요.");
				$("#studygroupTitle").focus();
				return;
			}
			if($("#studygroupContent").val()=="") {
				alert("내용을 입력해주세요.");
				$("#studygroupContent").focus();
				return;
			}
			
			$("form[name='modifyForm']").submit();
		}
	</script>
</section>