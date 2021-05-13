<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<style type="text/css">
	body{
		width: 375px;
		height: 667px;
	}
	
	table{
		margin-left: auto;
		margin-right: auto;
		margin-bottom : 20px;
		border: 1px solid gray; width: 50%; position: relative; top: 10px;
	}

	tr, th, td{
		border: 1px solid gray;
		text-align: center;
	}
	th {
		background-color: darkkhaki;
	}
</style>
</head>
<body>
	<div id="preparePay" style="text-align: center;">
		<h3>결제정보확인</h3>
		
		<div class="bg-white">
			<table>
				<tr>
					<th>이름</th>
					<td>${loginUser.memName }</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>${loginUser.memTel }</td>
				</tr>
				<tr>
					<th>기기명</th>
					<td><span id="equipName"></span></td>                                                                                                                                                                                                                     
				</tr>
				<tr>
					<th>대여시간</th>
					<td>
						<input type="hidden" id="equipRentOut" name="rentOut" value="">
						<span id="ticketName"></span>
					</td>
				</tr>
				<tr>
					<th>금액</th>
					<td><span id="ticketPrice"></span>원</td>
				</tr>
				<tr>
					<th>결제유형</th>
					<td>카카오페이</td>
				</tr>
			</table>
			
<!-- 			<span class="badge badge-text badge-danger"> -->
<!-- 				<i class="fa fa-exclamation mr-2"></i> -->
<!-- 			</span> -->
			<p><img alt="" src="<%=request.getContextPath()%>/resources/images/warn.png" style="width: 20px;">
			초과시간 10분당 2,000원 부과</p>
			<p style="font-size: 1.5em; color: #DB4455;">입력하신 휴대폰번호로 대여정보 발송되었습니다. <br>퇴실전 반납 바랍니다.</p>
			
		</div>
		
		<button type="button" class="btn btn-shadow btn-warning mb-3 mr-3" onclick="qr();" style="margin: 0 auto;">QR코드</button>
	</div>
	<div id="qr" style="display: none;">
		<img alt="" src="">
	</div>
</body>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins/plugins.js"></script> 
	<script>
		var equipTotalPrice = sessionStorage.getItem("equipTotalPrice");
		var equipTicket = sessionStorage.getItem("equipTicket");
		var equipName = sessionStorage.getItem("equipName");
		
		$('#ticketPrice').text(equipTotalPrice);
		$('#ticketName').text(equipTicket);
		$('#equipName').text(equipName);
		
	</script>
</html>