<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<style>
h1{
	text-align: center;
}
</style>

<section>
<header class="navbar page-header border0 navbar-expand-lg" style="background-color: rgb(255,234,0);">
	<div class="container">
		<a class="navbar-brand d-inline-flex align-items-center" href="#">
		    <i class="icon-book-reader d-inline-flex mr-2 avatar32 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"
		    		style="background-color: rgb(14,44,106);"></i>
		     <span class="fs-1x font500">Spring Study</span>
		 </a>
	</div>
</header>
	<h1>스터디룸 리뷰 상세</h1>
	<div class="col-md-8 offset-md-2">
	<div class="row">
		<div class="col-md-6">
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button type="button" id="reg" onclick="reviewModi()" class="btn btn-shadow  btn-teal mb-3 mr-3"><span>수정완료</span></button>
			<button type="button" id="removeReview" onclick="rvRemove()" class="btn btn-shadow  btn-danger mb-3 mr-3"><span>삭제</span></button>
		</div>
	</div>
	<div class="card">
	<form action="studyReviewModify" name="reviewModify" method="post" id="strReviewModify">
		<div class="card-header">
			<input type="hidden" name="reviewsNo" value="${studyRoomReviewDetail.reviewsNo}">
			<p>이용가맹점 : ${studyRoomReviewDetail.storeName }</p>
			<div class="row">
				<div class="col-sm-12">
					<p class="card-text">별점</p>
	  			 	<input type="number" class="rating" value="${studyRoomReviewDetail.studyRoomGrade}" data-size="xs" data-readonly="false" style="margin: 0 auto;">
				</div>
				<div class="col-sm-12 ">
					<span>내용</span>
					<textarea name="reviewsContent" id="myReview" placeholder="${studyRoomReviewDetail.reviewsContent }" class="form-control required valid" cols="30" rows="5" style="margin-top: 0px; margin-bottom: 0px; height: 160px;"></textarea>
<%-- 					<p class="card-text float-right"><fmt:formatDate value="" pattern="yyyy-MM-dd HH:mm:ss" /></p> --%>
				</div>
				<div class="col-sm-12 ">
					<p class="card-text float-right">작성일 : <fmt:formatDate value="${studyRoomReviewDetail.studyRoomReviewsRegDate }" pattern="yyyy-MM-dd" /></p>
				</div>
			</div>
		</div>
	</form>
	</div>
	</div>
<script>
function reviewModi(){
	
	var data = $('#strReviewModify').serialize();
	
	$.ajax({
		type:'post',
		url:'<c:url value='/myPage/studyReviewModify' />',
		data:data,
		success:function(data){
			alert('수정이 완료되었습니다.');
			window.open("about:blank", "_self").close();
		},error:function(error){
			alert('스터디룸 리뷰 글 수정 오류');
		}
	});
	
}
function rvRemove(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="<%=request.getContextPath()%>/myPage/studyReviewRemove?reviewsNo=${studyRoomReviewDetail.reviewsNo}";
		alert('스터디룸 리뷰가 삭제되었습니다.');
		self.close();
	}
}
</script>	
</section>