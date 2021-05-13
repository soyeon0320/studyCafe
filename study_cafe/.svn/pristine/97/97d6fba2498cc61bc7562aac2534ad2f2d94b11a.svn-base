<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
h3{
	text-align: center;
}
div.button{
	margin: auto;
	width: 50%;
}
/*  폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');


html {
    font-family: "Noto Sans KR", sans-serif;
}

body, ul, li, html {
    margin: 0;
    padding: 0;
    list-style: none;
}

a {
    text-decoration: none;
}
.block {
    display: block;
}
td.td-title{
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
	max-width: 200px;
	text-align: left;
}
/* 메인페이지 2 작업 시작 */

</style>

<section>
	<div class="row">
		<div class="col-6">
			<%@ include file="./box/profile.jsp" %>
		</div>
		
		<div class="col-6">
			<%@ include file="./box/reservation.jsp" %>
		</div>
		
		<div class="col-6">
			<%@ include file="./box/useHistory.jsp" %>
		</div>
		
		<div class="col-6">
			<%@ include file="./box/review.jsp" %>
		</div>
		
		<div class="col-6">
			<%@ include file="./box/scrap.jsp" %>
		</div>
		
		<div class="col-6">
			<%@ include file="./box/boardHistory.jsp" %>
		</div>
		
		<div class="col-6">
			<%@ include file="./box/purchase.jsp" %>
		</div>
		
	</div>
</section>

<script>
	window.onload = function(){
		var time = $('#remainTime').val();
		var hour = parseInt(time / 60);
		var mi = time % 60;
		if(hour > 0){
			$('#hour').text(hour + "시간");
		}
		if(mi > 0){
			$('#mi').text(mi + "분");
		}
	}

	function myBoard(tabId,obj){
		if(tabId == '#freeBoardList'){
			$("#freeBoardList").show();
			$("#freeBoard").attr('class', 'btn btn-danger btn-sm');
			$("#infoBoard").attr('class', 'btn btn-primary btn-sm');
			$("#stgBoard").attr('class', 'btn btn-primary btn-sm');
			$("#infoBoardList").hide();
			$("#studygroupList").hide();
		}else if(tabId == "#infoBoardList"){
			$("#infoBoardList").show();
			$("#infoBoard").attr('class', 'btn btn-danger btn-sm');
			$("#freeBoard").attr('class', 'btn btn-primary btn-sm');
			$("#stgBoard").attr('class', 'btn btn-primary btn-sm');
			$("#freeBoardList").hide();
			$("#studygroupList").hide();
		}else if(tabId == "#studygroupList"){
			$("#studygroupList").show();
			$("#stgBoard").attr('class',  'btn btn-danger btn-sm');
			$("#infoBoard").attr('class', 'btn btn-primary btn-sm');
			$("#freeBoard").attr('class', 'btn btn-primary btn-sm');
			$("#freeBoardList").hide();
			$("#infoBoardList").hide();
		}
	}
	function myHistory(tabId,obj){
		if($(obj).hasClass("btn-danger")){
			return;
		}
		$(".history-show").hide().attr("class","history-hide");
		$(tabId).show().attr("class","history-show");
		$("div.btn-list .btn-danger").removeClass("btn-danger").addClass("btn-primary");
		$(obj).removeClass("btn-primary").addClass("btn-danger");
		
	}
	
	function myReview(tabId,obj){
		console.log(obj);
		if($(obj).hasClass("btn-danger")){
			return;
		}
		$(".review-show").hide().attr("class","review-hide");
		$(tabId).show().attr("class","review-show");
		$("div.reviewBtn-list .btn-danger").removeClass("btn-danger").addClass("btn-primary");
		$(obj).removeClass("btn-primary").addClass("btn-danger");
	}
	
	function my_toggle(targetId,myId,obj){
		
		if($(obj).attr("class").indexOf("plus1") > 0){
			$("i.icon-minus1").attr("class","icon-plus1")
			$(obj).attr("class","icon-minus1");
		}else{
			$("i.icon-plus1").attr("class","icon-minus1")
			$(obj).attr("class","icon-plus1");
		}
		$("#"+targetId).slideToggle();
		$("#"+myId).slideToggle();
		
	}
	
	
	function myInfoChange(){
		 $("form[name='changeInfo']").submit();
	}
	
	var userName = document.querySelector('#memName');
	
	var email = document.querySelector('#memEmail');
	
	var mobile = document.querySelector('#memTel');
	
	var error = document.querySelectorAll('.error_next_box');
	
// 	userName.addEventListener("focusout", checkName);
// 	email.addEventListener("focusout", isEmailCorrect);
// 	mobile.addEventListener("focusout", checkPhoneNum);
	
	function checkName() {
	    var namePattern = /[a-zA-Z가-힣]/;
	    if(userName.value === "") {
	        error[0].innerHTML = "필수 정보입니다.";
	        error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
	        error[0].innerHTML = "한글과 영문 대 소문자를 사용하세요.";
	        error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    } else {
	        error[0].style.display = "none";
	    }
	}
	
	function checkPhoneNum() {
	    var isPhoneNum = /([01]{2})([01679]{1})-[0-9]{3,4}-([0-9]{4})/;
	    var data = {memTel : mobile.value};
	    if(mobile.value === "") {
	        error[1].innerHTML = "필수 정보입니다.";
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	    } else if(!isPhoneNum.test(mobile.value)) {
	        error[1].innerHTML = "형식에 맞지 않는 번호입니다.";
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	    } else {
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/user/tel_check"
	    		,data: data
	    		,type:'post'
	    		,success:function(result){
	    			console.log(result);
	    			if (result == "duplicated") {
	    		    	error[1].innerHTML = "중복된 전화번호 입니다.";
	    		    	error[1].style.display = "block";
	    		        error[1].style.color = "#B40431";
					}else {
				        error[1].style.display = "none";
					}
	    		}
	    		,error:function(error){
	    			alert('시스템 장애로 가입이 불가합니다.');
	    		}
	    	});
	    }
	}
	
	function isEmailCorrect() {
	    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

	    if(email.value === ""){ 
	        error[2].innerHTML = "필수 정보입니다.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	    } else if(!emailPattern.test(email.value)) {
	        error[2].innerHTML = "형식에 맞게 입력해주세요.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	    } else {
	        error[2].style.display = "none"; 
	    }

	}
	
	function myScrap(tabId, obj) {
		if(tabId == "#storeScrapList") {
			$("#scrapStoreList").css("display", "");
			$("#freeScrapList").css("display", "none");
			$("#infoScrapList").css("display", "none");
			$("#scrapStudygroupList").css("display", "none");
		}else if(tabId == "#freeScrapList") {
			$("#scrapStoreList").css("display", "none");
			$("#freeScrapList").css("display", "");
			$("#infoScrapList").css("display", "none");
			$("#scrapStudygroupList").css("display", "none");
		}else if(tabId == "#infoScrapList") {
			$("#scrapStoreList").css("display", "none");
			$("#freeScrapList").css("display", "none");
			$("#infoScrapList").css("display", "");
			$("#scrapStudygroupList").css("display", "none");
		}else if(tabId == "#scrapStudygroupList"){
			$("#scrapStoreList").css("display", "none");
			$("#freeScrapList").css("display", "none");
			$("#infoScrapList").css("display", "none");
			$("#scrapStudygroupList").css("display", "");
		}
	}

	function go_cancel(reservNo){
		swal({
            title: '정말로 예약을 취소하시겠습니까??',
            text: "신중히 생각해주시길 바랍니다.",
            type: 'warning',
            showCancelButton: true,
            confirmButtonClass: 'btn btn-confirm mt-2',
            cancelButtonClass: 'btn btn-secondary ml-2 mt-2',
            confirmButtonText: '예약취소',
            cancelButtonText:'취소',
            preConfirm:function(){
            	var data = {
        				'rentStudyRoomVO.studyroomReservNo':reservNo
        		}
            	$.post("<%=request.getContextPath()%>/myPage/history/cancel",data)
                   .done(function (data) {
                   	swal({
                           title: '예약 취소 완료',
                           text: '예약이 취소되었습니다.',
                           type: 'success',
                           confirmButtonClass: 'btn btn-confirm mt-2'
                         }).then(function () {
                               	  location.reload();
                                 	}
                         		  )
                   });
            },
            allowOutsideClick: false
      	 })
	}

</script>
