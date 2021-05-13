<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>    
<section>
<div class="content-wrap" style="padding-top: 40px; padding-bottom: 40px;">
	<div class="container clearfix">
		<h1>이용권 상세조회</h1>
			<div class="form-result"></div>
			<div class="row">
				<div class="col-lg-12">
					<form class="row" id="ticketRegistForm" action="regist" method="post">
						<div class="form-process">
							<div class="css3-spinner">
								<div class="css3-spinner-scaler"></div>
							</div>
						</div>
						<div class="col-6 form-group">
							<label>이용권 종류</label>
							<input type="text" class="form-control required" name="ticketKind" value="정액권" readonly="readonly">
						</div>
						<div class="col-6 form-group">
							<label>이용권  명 :</label>
							<input type="text" id="ticketName" name="ticketName" class="form-control required" value="">
						</div>
						<div class="col-12 form-group">
							<label>금액:</label>
							<input type="number" id="ticketPrice" name="ticketPrice" class="form-control required" value="">
						</div>
						<div class="col-12 form-group rent">
							<label>마감날짜:</label>
							<input type="text" id="date_timepicker_start" name="ticketTerm" value="" class="form-control required" />
						</div>
						<div class="col-6 form-group rent">
							<label>시간:</label>
							<input type="hidden" id="resultTime" name="ticketTime" class="form-control required" value="">
							<input type="number" id="ticketTime2" class="form-control required" value="">
						</div>
						<div class="col-6 form-group">
							<label>판매여부:</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input required" type="radio" name="ticketStatus"id="ticketStatusYES" value="Y">
								<label class="form-check-label nott" for="ticketStatusYES">판매중</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="ticketStatus"id="ticketStatusNO" value="N">
								<label class="form-check-label nott" for="ticketStatusNO">판매중지</label>
							</div>
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-secondary" onclick="submit_go();">완료</button>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">


function submit_go() {
	
	var time2 = parseInt($("#ticketTime2").val());
	var resultTime = time2 * 60 ;
	$("#resultTime").val(resultTime);
	console.log("resultTime : "+ resultTime);
	
	if (!$("#ticketName").val()) {
		alert('이용권 이름은 필수값 입니다.');
		return;
	}
	
	var price = $("#ticketPrice").val();
	if (!price ||price < 0 ||price == 0) {
		alert('이용권 금액을 확인해주세요.');
		return;
	}
	
	if (!$("#date_timepicker_start").val()) {
		alert('마감날짜를 입력해주세요');
		return;
	}
	
	var ticketTime = $("#ticketTime2").val();
	if (!ticketTime ||ticketTime < 0 ||ticketTime == 0) {
		alert('시간을 확인해주세요.');
		return;
	}
	
	if ($('input:radio[name="ticketStatus"]').is(':checked') == false) {
		alert('판매여부 선택은 필수입니다.');
		return;
	}
	
	
	var form = $("#ticketRegistForm");
	$.ajax({
		url:"<%=request.getContextPath()%>/ticket/regist"
		,data: form.serialize()
		,type:'post'
		,success:function(){
				alert("이용권 등록이 완료되었습니다.");
				window.opener.location.reload();
				window.close();
		}
		,error:function(error){
			alert('시스템 장애가 발생하였습니다. 관리자에게 문의하십시오.');
		}
	});
}





</script>


</section>