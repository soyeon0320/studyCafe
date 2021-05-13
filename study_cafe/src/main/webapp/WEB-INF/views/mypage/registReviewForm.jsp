<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
h2{
	text-align: center;
	padding-top: 10px;
	padding-bottom: 10px;
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
<h2>스터디룸 후기등록</h2>
<form action="studyRoomRegistReview" id="registStudyRoom" name="registReviewForm" method="post">
<div class="card">
	<div class="card-header">
	<input type="number" class="rating" name="studyRoomGrade" data-size="lg" data-readonly="false" style="margin: 0 auto;">
	<input type="hidden" name="studyroomReservNo" value="${rvStore.studyroomReservNo}">
	<input type="hidden" name="memId" value="${rvStore.memId}">
	<div class="row">
	<div class="col-sm-12">
		<div class="form-group">
			<label for="review">내 용 :</label>
			<textarea name="reviewsContent" id="myReview" class="form-control required valid" cols="30" rows="5" style="margin-top: 0px; margin-bottom: 0px; height: 160px;"></textarea>
		</div>
	</div>
	</div>
	</div>
</div>
</form><br><br>
<button type="button" id="reg" onclick="regist()" class="btn btn-shadow  btn-teal mb-3 mr-3" style="margin:0 auto; float: right;"><span>등록완료</span></button>	
<script>
	function regist(){
		
		var studyRoomGrade = $('input[name=studyRoomGrade]').val();
		
		if (studyRoomGrade >= 1){
			
			var data = $('#registStudyRoom').serialize();
		}else if(studyRoomGrade < 1){
			alert('별점은 1점 이상부터 등록 가능합니다.');
		}else{
			alert('별점을 1점 이상 등록해주세요.!');
		}
		$.ajax({
			type:'post',
			url:'<c:url value='/myPage/studyRoomRegistReview' />',
			data:data,
			success:function(data){
				alert('스터디룸 후기가 등록되었습니다.');
				window.open("about:blank", "_self").close();
			},error:function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
	}
</script>
</section>