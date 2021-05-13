<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	th, td{
		padding: 5px 20px;
	}
	th{
		text-align: center;
		background-color: aliceblue;
	}
</style>

<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/equip/tablet" class="btn btn-block btn-icon btn-rounded btn-xl btn-light mb-2">
                    <i class="icon-line-chevron-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">태블릿 다시 선택하기</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="javascript:confirmLogout();" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-dark mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
          	 </li>
        </ul>
    </header>
    
    <div id="overPay" style="text-align: center;">
		<h3 style="margin: 20px;">추가 결제정보확인</h3>
		
		<div class="offset-2 col-8">
			<table border="1" width="100%" style="font-size: large;">
				<tr>
					<th width="30%;">이름</th>
					<td width="70%;">${myEquip.memName}
					<input type="hidden" name="memId" value="${myEquip.memName}">
					</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>${myEquip.memTel}</td>
				</tr>
				<tr>
					<th>기기이름</th>
					<td><span id="equipName">${myEquip.equipName}</span></td>                                                                                                                                                                                                                     
				</tr>
				<tr>
					<th>초과 시간</th>
					<td>
						<span id="ticketName">${overPayTime} 분</span>
					</td>
				</tr>
				<tr>
					<th>금액</th>
					<td><span id="ticketPrice">
					<input type="hidden" name="overPayPrice" value="${overPayPrice}">
					<fmt:formatNumber value="${overPayPrice}" pattern="#,###"/>
					</span>원</td>
				</tr>
				<tr>
					<th>결제유형</th>
					<td>카카오페이<img src="<%=request.getContextPath()%>/resources/images/kiosk/kakaoLogo.png"></td>
				</tr>
			</table>
			<div align="center" style="margin-top: 30px; ">
				<p>기기반납 시간 초과하여 추가 결제를 해주셔야 합니다.</p>
				<p><img alt="" src="<%=request.getContextPath()%>/resources/images/warn.png" style="width: 20px;">
				초과시간 10분당 2,000원 부과</p>
				<p style="font-size: 1.5em; color: #DB4455;">위 정보로 결제를 진행합니다. <br>동의하시면 "결제" 버튼을 눌러주세요.</p>
				<button type="button" style="color: black; background-color: #fee500;" class="btn  btn-icon btn-icon-right btn-rounded btn-xl btn-warning" onclick="pay();">
				<span>QR코드 결제하기</span><i class="icon-qrcode1"></i></button>
			</div>
		</div>
		
	</div>
	
	<iframe id="tabletPay" style="display: none; width: 100%; height: 500px;">
		
	</iframe>
</div>

<script>
function out(){
	
// 	sendTo(qrInfo, serverIp);
	
	location.href='<%=request.getContextPath()%>/kiosk/main';
<%-- 	location.href='<%=request.getContextPath()%>/equip/sendTo'; --%>
}

function pay(){
	var equipTotalPrice = $('input[name=overPayPrice]').val();
	var memId = $('input[name=memId]').val();
	var equipName = $('#equipName').text();
	
	$('#tabletPay').css('display', '');
	$('#overPay').css('display', 'none');
	$.ajax({
		url:"<c:url value='/equip/rent/pay/ready' />",
		data:{equipTotalPrice : equipTotalPrice,
			 memId : memId, equipName : equipName},
		type:"post",
		success:function(data){
			
			console.log(data.redirectUrl);
			$('#tabletPay').attr('src', data.redirectUrl);
			
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
	
}
</script>    