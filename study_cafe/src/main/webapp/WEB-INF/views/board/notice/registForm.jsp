<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form"  	uri="http://www.springframework.org/tags/form" %>    

<section class="container clearfix">

	<div>
		<h1>공지사항</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/notice/list' />', '#registForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="registBt" name="registBt" onclick="submit_go()"><i class="icon-pencil2"></i> 등록</button>
		</div>
	</div>
	
	<form:form commandName="noticeFormVO" id="registForm" name="registForm" action="regist" method="post">
		<form:hidden path="searchNoticeVO.searchCondition"/>
		<form:hidden path="searchNoticeVO.searchKeyword"/>
		<form:hidden path="searchNoticeVO.pageIndex"/>
		<form:hidden path="searchNoticeVO.pageUnit"/>
		<form:hidden path="noticeVO.saveToken"/>
		<form:hidden path="noticeVO.adminId" cssClass="form-control" value="admin"/>
		<form:hidden path="noticeVO.isModified" value="true"/>
		
		<input type="text" class="form-control mb-20 required" name="noticeVO.noticeTitle" placeholder="제목을 입력해주세요."/>
		
		<div class="input-group mb-20">
			<input type="text" value='' autocomplete="off" name="noticeVO.noticeStart" id="date_timepicker_start" class="form-control" placeholder="공지게시시작">
			<div class="input-group-prepend"><div class="input-group-text">부터</div></div>
			<input type="text" value='' autocomplete="off" name="noticeVO.noticeEnd" id="date_timepicker_end" class="form-control" placeholder="공지게시마감">
			<div class="input-group-prepend"><div class="input-group-text">까지 상단에 공지로 게시합니다.</div></div>
		</div>
		
		<form:textarea cssClass="summernote-init form-control required" maxlength="900"  path="noticeVO.noticeContent"  placeholder="내용을 입력해주세요." cols="30" rows="5" style="margin-top: 0px; margin-bottom: 0px; height: 160px;" />
		
	</form:form>
</section>

<script>

function submit_go(){
	
	if($('#noticeTitle').val() ==""){
		$('#noticeTitle').focus();
		alert("제목은 필수입니다.");
		return;
	}
	if($('#noticeContent').val()==""){
		$('#noticeContent').focus();
		alert("내용은 필수입니다.");
		return;
	}
	
	$("form[name='registForm']").submit();
	
}

</script>

