<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>좌석 후기 등록</h2>
<form action="seatRegistReview" name="registReviewForm" method="post">
<div class="card">
	<div class="card-header">
	<input type="number" class="rating" name="seatGrade" data-size="lg" data-readonly="false" style="margin: 0 auto;">
	<input type="hidden" name="rentSeatNo" value="${rentSeat.rentSeatNo}">
	<input type="hidden" name="memId" value="${rentSeat.memId}">
	<div class="row">
	<div class="col-sm-12">
		<div class="form-group">
			<label for="review">내 용 :</label>
			<textarea name="seatReviewsContent" id="myReview" class="form-control required valid" cols="30" rows="5" style="margin-top: 0px; padding-bottom:10px; margin-bottom: 10px; height: 160px;"></textarea>
		</div>
	</div>
	</div>
	</div>
</div>
</form><br><br>
<button type="button" id="reg" onclick="regist()" class="btn btn-shadow  btn-teal mb-3 mr-3" style="margin:0 auto; float: right;"><span>등록완료</span></button>	
<script>
	function regist(){
		var seatGrade = $('input[name=seatGrade]').val();
		
		if(seatGrade >= 1){
			$("form[name='registReviewForm']").submit();
		}else if(seatGrade < 1){
			alert('별점은 1점이상부터 등록 가능합니다.');
		}else{
			alert('별점을 1점 이상 등록해주세요.!');
		}
		
	}
</script>
</section>