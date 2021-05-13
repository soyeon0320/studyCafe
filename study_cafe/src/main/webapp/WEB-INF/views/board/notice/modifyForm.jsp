<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<section class="container clearfix">

	<div>
		<h1>공지사항</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/notice/list' />', '#modifyForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="modifyBt" name="modifyBt" onclick="modify_go()" value="수정"><i class="icon-book3"></i> 수정</button>
		</div>
	</div>
	
	<form:form commandName="noticeFormVO" action="modify" id="modifyForm" name="modifyForm" method="post">
		<form:hidden path="searchNoticeVO.searchCondition"/>
		<form:hidden path="searchNoticeVO.searchKeyword"/>
		<form:hidden path="searchNoticeVO.pageIndex"/>
		<form:hidden path="searchNoticeVO.pageUnit"/>
		<form:hidden path="noticeVO.saveToken"/>
		<form:hidden path="noticeVO.isModified" value="true"/>
	
		<form:input type="hidden" path="noticeVO.adminId" id="adminId" name="adminId" value="test"/>
		<form:input type="hidden" path="noticeVO.noticeNo" id="noticeNo" name="noticeNo" value="${notice.noticeNo}"/>

		<form:input type="text" id="noticeTitle" path="noticeVO.noticeTitle" maxlength="90" class="form-control mb-20" value="${notice.noticeTitle}"/>
		<div class="input-daterange component-datepicker input-group mb-20">
			<form:input type="text" autocomplete="off" value='' path="noticeVO.noticeStart" id="date_timepicker_start" class="form-control text-left" placeholder="공지게시시작" />
			<div class="input-group-prepend"><div class="input-group-text">to</div></div>
			<form:input type="text" autocomplete="off"  path="noticeVO.noticeEnd" id="date_timepicker_end" class="form-control text-left" placeholder="공지게시마감" />
			<div class="input-group-prepend"><div class="input-group-text">까지 상단에 공지로 게시합니다.</div></div>
		</div>

		<form:textarea rows="15" id="noticeContent" path="noticeVO.noticeContent" maxlength="900" cssClass="summernote-init"/>
	</form:form>

</section>
<script>
function modify_go(){
	
	if($('#noticeTitle').val()==""){
		$('#noticeTitle').focus();
		alert("제목은 필수입니다.");
		return;
	}
	if($('#noticeContent').val()==""){
		$('#noticeContent').focus();
		alert("내용은 필수입니다.");
		return;
	}

	$("form[name='modifyForm']").submit();
	
}


</script>


