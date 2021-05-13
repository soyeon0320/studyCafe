<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	th, td{
		padding: 5px 20px;
		
	}
	th {
		text-align: right;
		background-color: aliceblue;
	}


</style>

<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/seat/view" class="btn btn-block btn-icon btn-rounded btn-xl btn-light mb-2">
                    <i class="icon-line-chevron-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">좌석 다시 선택하기</p>
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
	
	
	<div id="selectTicket">
		<h3 style="margin-top: 10px;">${loginUser.memName }님  ${seat.seatNo }번 좌석을 선택하셨습니다.</h3>
		<h3 style="">이용방법을 선택해주세요</h3>
		<hr>
		<div align="center">
			<input type="hidden" id="remainTime" value="${remainTime }">
			<c:if test="${remainTime != 0 }">
				<span style="font-size: xx-large;">보유 시간 : 
				<span id="hour"></span> <span id="mi"></span>
				</span>
				<a href="javascript:usedRemainTime();" class="btn  btn-icon btn-icon-right btn-rounded btn-xl btn-teal mb-2">
	                <i class="icon-time"></i>
	                	<p class="mb-0" style="">보유시간 사용하기</p>
	            </a>
			</c:if>
			<c:if test="${remainTime == 0 }">
			<span style="font-size: xx-large;">보유 시간이 없습니다. 이용권을 구매해주세요. </span>
			</c:if>
		</div>
		<hr>
		<h3 class="h">이용권선택</h3>
		<div class="row" style="margin: auto;">
			<c:if test="${empty ticketList }">
				<h1>이용권이 없습니다.</h1>
			</c:if>
		
			<c:forEach items="${ticketList }" var="ticket">
				<div class="col-4 mb-20" onclick="ticketSelect(${ticket.ticketNo},'${ticket.ticketName}','${ticket.ticketPrice }','<fmt:formatNumber value="${ticket.ticketPrice }"/>');">
					<div class="list bg-success shadow-sm rounded overflow-hidden">
					    <div class="list-item">
					        
					        <div class="list-body text-center">
					            <span class="list-title fs-2x  lineH-1" ><fmt:formatNumber value="${ticket.ticketPrice }"/>원</span>
					            <span class="list-title fs-3x  lineH-1" >${ticket.ticketName}</span>
					        </div>
					    </div>
					    
					</div>
				</div>
			</c:forEach>
		</div>	
	</div>
	
	<div id="preparePay" style="display: none;">
		<h3 style="margin: 20px;">결제정보확인</h3>
		
		<div class="offset-2 col-8">
			<table border="1" width="100%" style="font-size: large;">
				<tr>
					<th width="30%">이름</th>
					<td width="70%">${loginUser.memName }</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>${loginUser.memTel }</td>
				</tr>
				<tr>
					<th>좌석번호</th>
					<td>${seat.seatNo }번</td>                                                                                                                                                                                                                     
				</tr>
				<tr>
					<th>이용권</th>
					<td><span class="ticketName"></span> 이용권</td>
				</tr>
				<tr>
					<th>금액</th>
					<td><span class="ticketPrice"></span>원</td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>카카오페이 <img alt="" src="<%=request.getContextPath()%>/resources/images/kiosk/kakaoLogo.png"></td>
				</tr>
			</table>
			
			<div align="center" style="margin-top: 30px;">
				<p>잔여시간이 모두 소진된 이후에 퇴실할 경우</p>
				<p><img alt="" src="<%=request.getContextPath()%>/resources/images/warn.png" style="width: 20px;">
				초과시간 10분당 1,000원 부과</p>
				<p style="font-size: 1.5em; color: #DB4455;">위 정보로 결제를 진행합니다. <br>동의하시면 "결제" 버튼을 눌러주세요.</p>
				<button id="backBtn" style="display: none;" type="button" class="btn  btn-icon btn-icon-left btn-rounded btn-xl" onclick="back();">
				<i class="icon-ticket"></i><span>이용권 다시 선택하기</span></button>
				<button type="button" style="color: black; background-color: #fee500;" class="btn  btn-icon btn-icon-right btn-rounded btn-xl btn-warning" onclick="pay();">
				<span>QR코드 결제하기 </span><i class="icon-qrcode1"></i></button>
			</div>
		
		</div>
		
	</div>

	<div align="center" style="margin-top: 30px;">
		<iframe id="seatPay" style="display: none; width: 60%; height: 500px; border-style: hidden;">
		</iframe>
	</div>
		
</div>

<form id="buyInfo" action="buyInfo">
	<input type="hidden" id="memId" name="memId" value="${loginUser.memId }">
	<input type="hidden" id="seatNo" name="seatNo" value="${seat.seatNo }">
	<input type="hidden" id="ticketNo" name="ticketNo" value="0">
	<input type="hidden" id="ticketName" name="ticketName" value="0">
	<input type="hidden" id="ticketPrice" name="ticketPrice" value="0">
	<input type="hidden" id="storeCode" name="storeCode" value="${owner.storeCode }">
</form>
<input type="hidden" id="qrData" name="QrData" value="">
<input type="hidden" id="QrMessage" name="qrMessage" value="">
<input type="hidden" id="ServerIp" name="serverIp" value="">


<script>
window.onload = function(){
	var time = $('#remainTime').val();
	var hour = parseInt( time / 60);
	var mi = time % 60;
	console.log("time",time);
	console.log("hour",hour);
	console.log("mi",mi);
	if (hour > 0) {
		$('#hour').text(hour + "시간 ");
	}
	if (mi > 0) {
		$('#mi').text(mi + "분");
	}
}


var serverIp = '${serverIp}';
console.log(serverIp);

function out(){
	buyInfo();
}

function ticketSelect(ticketNo,ticketName,ticketPrice,priceFormat){
	//alert(ticketNo);
	$('#selectTicket').css('display','none');
	$('#preparePay').css('display','');
	$('#backBtn').css('display','');
	
	$('#ticketNo').val(ticketNo);
	$('#ticketName').val(ticketName);
	$('#ticketPrice').val(ticketPrice);
	
	$('.ticketName').text(ticketName);
	$('.ticketPrice').text(priceFormat);
	
}

function back(){
	$('#preparePay').css('display','none');
	$('#backBtn').css('display','none');
	$('#selectTicket').css('display','');
	$('#ticketNo').val('');
}

function usedRemainTime(){
	
	var formData = $("#buyInfo").serialize();
	
	$.ajax({
	    url : "<%=request.getContextPath()%>/seat/buyTicket", 
	    type : 'POST', 
	    data : formData, 
	    success : function(data) {
	        //var jsonObj = JSON.parse(data);
	        console.log(data.ticketBuy);
	        console.log(data.remainTime);
	        alert(data.message);
	        
	        //큐알발급
	        sendTo(data.qrInfo);
	        
	    },
	    error : function(xhr, status) {
	        alert("에러 : " + status);
	    }
	}); 
}

function buyInfo(){
	
	//$("form[id='buyInfo']").submit();
	$('#backBtn').css('display','none');
	var formData = $("#buyInfo").serialize();
	
	$.ajax({
	    url : "<%=request.getContextPath()%>/seat/buyTicket", 
	    type : 'POST', 
	    data : formData, 
	    success : function(data) {
	        //var jsonObj = JSON.parse(data);
	        //console.log(data.ticketBuy);
	        console.log(data.remainTime);
	        console.log(data.qr);
	        alert(data.message);
	        
	        //결제
	        //pay();
	        
	        //큐알발급
	        sendTo(data.qrInfo);
	        
	    },
	    error : function(xhr, status) {
	        alert(xhr + " : " + status);
	    }
	}); 
	
}

function pay(){
	var ticketPrice = $('#ticketPrice').val();
	//ticketTotalPrice = parseInt(ticketTotalPrice.replace(/,/g,""));
	var memId = $('input[name=memId]').val();
	var ticketName = $('input[name=ticketName]').val();
	var storeCode = $('input[name=storeCode]').val();
	
	console.log('ticketPrice : ' + ticketPrice);
	console.log('memId : ' + memId);
	console.log('ticketName : ' + ticketName);
	
	
	$.ajax({
		url:"<c:url value='/seat/rent/pay/ready' />",
		data:{ticketPrice : ticketPrice,
			   memId : memId, ticketName : ticketName, storeCode : storeCode},
		type:"post",
		success:function(data){
			$('#seatPay').css('display', '');
			$('#seatPay').attr('src', data.redirectUrl);
			$('#preparePay').css('display', 'none');
			console.log(data.redirectUrl);
			
			//buyInfo();
		},
		error:function(xhr){
			console.log("실패 : "+xhr);
			//console.log('data : ' + data);
			
		}
	});
	
}



function sendTo(qrInfo) {
    Kakao.Auth.login({
      scope: 'PROFILE,TALK_MESSAGE',
      success: function() {
        Kakao.API.request({
          url: '/v2/api/talk/memo/default/send',
          data: {
            template_object: {
              object_type: 'feed',
              content: {
                title: '결제가 완료되었습니다.',
                description: '아래 링크로 큐알코드 확인하기 \nhttp://${serverIp}/study_cafe/qrImage/'+qrInfo+'.png',
                image_url:
                	'http://localhost/study_cafe/qrImage/'+qrInfo+'.png',
                link: {
                    mobile_web_url: 'http://localhost/study_cafe/qrImage/'+qrInfo+'.png',
                    web_url: 'http://localhost/study_cafe/qrImage/'+qrInfo+'.png',
                  },
              },
              buttons: [
                {
                  title: '큐알코드확인하기',
                  link: {
                    mobile_web_url: 'http://${serverIp}/study_cafe/qrImage/'+qrInfo+'.png',
                    web_url: 'http://${serverIp}/study_cafe/qrImage/'+qrInfo+'.png',
                  },
                },
              ],
            },
          },
          success: function(res) {
        	  location.href='<%=request.getContextPath()%>/kiosk/logout';
          },
          fail: function(err) {
          },
        })
      },
      fail: function(err) {
        alert('failed to login: ' + JSON.stringify(err))
      },
    })
  }


</script>