<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="container clearfix">
	<div>
		<h1>소모임게시판</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/stb/list' />', '#registForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="registBt" name="registBt" onclick="registFn()"><i class="icon-pencil2"></i> 등록</button>
		</div>
	</div>
	
	<form:form commandName="studygroupFormVO" name="registForm" action="regist" id="registForm" method="post">
		<form:hidden path="searchStudygroupVO.searchCondition"/>
		<form:hidden path="searchStudygroupVO.searchKeyword"/>
		<form:hidden path="searchStudygroupVO.pageIndex"/>
		<form:hidden path="searchStudygroupVO.pageUnit"/>
		<form:hidden path="studygroupVO.saveToken"/>
		<form:hidden path="studygroupVO.isModified" value="true"/>
		<form:hidden path="studygroupVO.memId" cssClass="form-control" value="${loginUser.memId }"/>
		
		<div >
			<label >모집마감일</label>
			<form:input path="studygroupVO.studygroupEnd" cssClass="form-control" cssStyle="display:inline;" type="date" />
		</div>
		
		<input type="text" class="form-control mb-20" name="studygroupVO.studygroupTitle" placeholder="제목을 입력해주세요."/>
		
		<form:textarea cssClass="summernote-init form-control" maxlength="900"  path="studygroupVO.studygroupContent"  placeholder="내용을 입력해주세요." cols="30" rows="5" style="margin-top: 0px; margin-bottom: 0px; height: 160px;" />
	</form:form>
	
	<script>
		function registFn() {
			
			if(!$("input[name='studygroupVO.studygroupTitle']").val()){
				$("input[name='studygroupVO.studygroupTitle']").focus();
				alert("제목을 입력해 주세요.");
				return;
			}else if($("input[name='studygroupVO.studygroupTitle']").val().lenth > 90){
				$("input[name='studygroupVO.studygroupTitle']").focus();
				alert("제목은 90자 미만입니다.");
				return;
			}else if(!$("textarea[name='studygroupVO.studygroupContent']").val()){
				alert("내용을 입력해 주세요.");
				return;
			}
				
			
			
			$("form[name='registForm']").submit();
		}
	</script>
</section>
