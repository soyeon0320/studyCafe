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
					<form class="row" >
						<div class="form-process">
							<div class="css3-spinner">
								<div class="css3-spinner-scaler"></div>
							</div>
						</div>
						<div class="col-6 form-group">
							<label>이용권 코드</label>
							<input type="text" class="form-control required" value="${ticket.ticketCode}" readonly="readonly">
						</div>
						<div class="col-6 form-group">
							<label>이용권  명 :</label>
							<input type="text" class="form-control required" value="${ticket.ticketName}" readonly="readonly">
						</div>
						<div class="col-12 form-group">
							<label>금액:</label>
							<input type="number" class="form-control required" value="${ticket.ticketPrice}" readonly="readonly">
						</div>
						<div class="col-6 form-group rent" >
							<label>종류:</label>
							<input type="text" class="form-control required" value="${ticket.ticketKind}" readonly="readonly">
						</div>
						<div class="col-6 form-group rent">
							<label>시간:</label>
							<input type="hidden" id="time" class="form-control required" value="${ticket.ticketTime}" readonly="readonly">
							<input type="number" id="ticketTime" class="form-control required" value="" readonly="readonly">
						</div>
						<div class="col-6 form-group">
							<label>판매여부:</label><br>
							<c:choose>
								<c:when test="${ticket.ticketStatus eq 'Y'}">
									<input type="text" class="form-control required" value="판매중" readonly="readonly">
								</c:when>
								<c:when test="${ticket.ticketStatus eq 'N'}">
									<input type="text" class="form-control required" value="판매중지" readonly="readonly">
								</c:when>
							</c:choose>
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-secondary" onclick="modify_go();">수정</button>
						</div>
				</form>
			</div>

		</div>

	</div>

</div>

<script type="text/javascript">
window.onload=function(){
	var time = parseInt($("#time").val());
	var resultTime = time/60;
	console.log("time : " +time );
	console.log("resultTime : " +resultTime );
	$("#ticketTime").val(resultTime);
}


function modify_go() {
	location.href="<%=request.getContextPath()%>/ticket/modifyForm?ticketNo=${ticket.ticketNo}";
}




</script>


</section>