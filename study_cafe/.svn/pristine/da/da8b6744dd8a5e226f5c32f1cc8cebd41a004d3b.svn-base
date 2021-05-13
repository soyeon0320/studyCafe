<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
           		<a href="<%=request.getContextPath() %>/equip/notebook" class="btn btn-block btn-icon btn-rounded btn-xl btn-light mb-2">
                    <i class="icon-line-chevron-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">노트북 다시 선택하기</p>
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
	<input type="hidden" id="remainTime" value="${remainTime}">
	<input type="hidden" id="curSeatTime" value="${curSeatTime}">
	<h3 class="h">${loginUser.memName }님 보유시간 : 
		<span id="hour"></span><span id="mi"></span></h3>
	<c:if test="${empty curSeatTime}">
	<h5 class="h">${loginUser.memName}님 좌석을 이용중이지 않습니다.</h5>
	</c:if>
	<c:if test="${not empty curSeatTime}">
	<h5 class="h">${loginUser.memName}님 좌석을  현재 
	 <span id="curHour"></span> <span id="curMi"></span> 이용중 입니다. </h5>
	</c:if>
	
<!-- 	<div class="portlet-box portlet-shadow  mb-30 mt-20" > -->
<!-- 		<div class="portlet-body"> -->
<!-- 			<div class="row" style="text-align: center;"> -->
<!-- 				<span class='col-4'>실시간 좌석 이용현황</span> -->
<%-- 				<c:if test="${currentMemSeat.seatOccufied eq 1}"> --%>
<%-- 				<span class='col-4'>${currentMemSeat.seatNo}번 좌석  --%>
<!-- 					<button type="button" class="btn btn-shadow  btn-teal">이용중</button> -->
<!-- 				</span> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${currentMemSeat.seatOccufied eq 0}"> --%>
<!-- 				<span class='col-4'>좌석 이용 X</span> -->
<%-- 				</c:if> --%>
				
<%-- 				<c:if test="${empty currentMemStudyRoom}"> --%>
<!-- 					<span class='col-4'>스터디룸 -->
<!-- 						<button type="button" class="btn btn-shadow  btn-danger">이용 X</button> -->
<!-- 					</span> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${not empty currentMemStudyRoom}"> --%>
<!-- 					<span class='col-4'>스터디룸 -->
<!-- 						<button type="button" class="btn btn-shadow  btn-teal">이용중</button> -->
<!-- 					</span> -->
<%-- 				</c:if> --%>
<!-- 			</div> -->
<!-- 		</div>		 -->
<!-- 	</div> -->
	
	<div id="selectTicket">
		<h3 class="h">이용시간 선택</h3>
		<div class="row" style="margin: auto;">
			<div class="col-4 mb-20">
				<div class="list bg-success shadow-sm rounded overflow-hidden">
				    <div class="list-item" style="background-color: #3471b4">
				        
				        <div class="list-body text-center" onclick="rentSelect(this);">
				        	<input type="hidden" name="equipTotalPrice" value="5000">
				        	<input type="hidden" name="equipTicket" value="1시간 이용권">
				        	<input type="hidden" name="equipRentOut" value="1">
				        	<img alt="" src="<%=request.getContextPath()%>/resources/images/equip/equipTicket1.png" style="max-width: 100%;">
				            <span class="list-title fs-3x  lineH-1" >5,000</span>원
				        </div>
				    </div>
				</div>
			</div>
			<div class="col-4 mb-20" onclick="">
				<div class="list bg-success shadow-sm rounded overflow-hidden">
				    <div class="list-item" style="background-color: #3471b4">
				        
				        <div class="list-body text-center" onclick="rentSelect(this);">
				        	<input type="hidden" name="equipTotalPrice" value="9000">
				        	<input type="hidden" name="equipTicket" value="2시간 이용권">
				        	<input type="hidden" name="equipRentOut" value="2">
				        	<img alt="" src="<%=request.getContextPath()%>/resources/images/equip/equipTicket2.png" style="max-width: 100%;">
				            <span class="list-title fs-3x  lineH-1" >9,000</span>원
				        </div>
				    </div>
				</div>
			</div>
			<div class="col-4 mb-20">
				<div class="list bg-success shadow-sm rounded overflow-hidden">
				    <div class="list-item" style="background-color: #3471b4">
				        
				        <div class="list-body text-center" onclick="rentSelect(this);">
				        	<input type="hidden" name="equipTotalPrice" value="14000">
				        	<input type="hidden" name="equipTicket" value="3시간 이용권">
				        	<input type="hidden" name="equipRentOut" value="3">
				        	<img alt="" src="<%=request.getContextPath()%>/resources/images/equip/equipTicket3.png" style="max-width: 100%;">
				            <span class="list-title fs-3x  lineH-1" >14,000</span>원
				        </div>
				    </div>
				</div>
			</div>
			<div class="col-4 mb-20">
				<div class="list bg-success shadow-sm rounded overflow-hidden">
				    <div class="list-item" style="background-color: #3471b4">
				        
				        <div class="list-body text-center" onclick="rentSelect(this);">
				        	<input type="hidden" name="equipTotalPrice" value="19000">
				        	<input type="hidden" name="equipTicket" value="4시간 이용권">
				        	<input type="hidden" name="equipRentOut" value="4">
				        	<img alt="" src="<%=request.getContextPath()%>/resources/images/equip/equipTicket4.png" style="max-width: 100%;">
				            <span class="list-title fs-3x  lineH-1" >19,000</span>원
				        </div>
				    </div>
				</div>
			</div>
			<div class="col-4 mb-20">
				<div class="list bg-success shadow-sm rounded overflow-hidden">
				    <div class="list-item" style="background-color: #3471b4">
				        
				        <div class="list-body text-center" onclick="rentSelect(this);">
				        	<input type="hidden" name="equipTotalPrice" value="24000">
				        	<input type="hidden" name="equipTicket" value="5시간 이용권">
				        	<input type="hidden" name="equipRentOut" value="5">
				        	<img alt="" src="<%=request.getContextPath()%>/resources/images/equip/equipTicket5.png" style="max-width: 100%;">
				            <span class="list-title fs-2x  lineH-1" ></span>
				            <span class="list-title fs-3x  lineH-1" >24,000</span>원
				            <input type="hidden" name="memId" value="${loginUser.memId}">
				            <input type="hidden" name="equipName" value="${equip.equipName}">
				            <input type="hidden" name="equipCode" value="${equip.equipCode}">
				        </div>
				    </div>
				</div>
			</div>
			<div class="col-4 mb-20">
				<div class="list bg-success shadow-sm rounded overflow-hidden">
				    <div class="list-item" style="background-color: #3471b4">
				        
				        <div class="list-body text-center" onclick="rentSelect(this);">
				        	<input type="hidden" name="equipTotalPrice" value="28000">
				        	<input type="hidden" name="equipTicket" value="6시간 이용권">
				        	<input type="hidden" name="equipRentOut" value="6">
				        	<img alt="" src="<%=request.getContextPath()%>/resources/images/equip/equipTicket6.png" style="max-width: 100%;">
				            <span class="list-title fs-2x  lineH-1" ></span>
				            <span class="list-title fs-3x  lineH-1" >28,000</span>원
				            <input type="hidden" id="qrData" name="QrData" value="">
				            <input type="hidden" id="QrMessage" name="qrMessage" value="">
				        	<input type="hidden" id="ServerIp" name="serverIp" value="">
				        </div>
				    </div>
				</div>
			</div>
		</div>	
	</div>
	
	<div id="preparePay" style="display: none; text-align: center;">
		<h3 style="margin:20px;">결제정보확인</h3>
		
		<div class="offset-2 col-8">
			<table border="1" width="100%"  style="font-size: large;">
				<tr>
					<th width="30%;">이름</th>
					<td width="70%;">${loginUser.memName }</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>${loginUser.memTel }</td>
				</tr>
				<tr>
					<th>기기이름</th>
					<td>${equip.equipName}</td>                                                                                                                                                                                                                     
				</tr>
				<tr>
					<th>이용권</th>
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
					<td>카카오페이<img src="<%=request.getContextPath()%>/resources/images/kiosk/kakaoLogo.png"></td>
				</tr>
			</table>
			
			<div align="center" style="margin-top: 30px;">
				<p>기기반납 시간 초과후 반납하실 경우</p>
				<p><img alt="" src="<%=request.getContextPath()%>/resources/images/warn.png" style="width: 20px;">
				초과시간 10분당 2,000원 부과</p>
				<p style="font-size: 1.5em; color: #DB4455;">위 정보로 결제를 진행합니다. <br>동의하시면 "결제" 버튼을 눌러주세요.</p>
				<button id="backBtn" style="display: none;" type="button" class="btn  btn-icon btn-icon-left btn-rounded btn-xl" onclick="back();">
				<i class="icon-ticket"></i><span>이용권 다시 선택하기</span></button>
				<button type="button" class="btn  btn-icon btn-icon-right btn-rounded btn-xl btn-warning" onclick="rentEquip();" style="color: black; background-color:#fee500;">
				<span>QR코드 결제하기</span><i class="icon-qrcode1"></i></button>
			</div>
		</div>
		
	</div>
	<hr>
	
	<iframe id="noteBookPay" style="display: none; width: 100%; height: 500px;">
		
	</iframe>
	
</div>


<script>
var serverIp = '${serverIp}';
console.log(serverIp);

window.onload = function(){
	var time = $('#remainTime').val();
	var hour = parseInt (time / 60);
	var mi = time % 60;
	if(hour > 0){
		$('#hour').text(hour + "시간");
	}
	if(mi > 0){
		$('#mi').text(mi + "분");
	}
	
	var curTime = $("#curSeatTime").val();
	var curHour = parseInt(curTime / 60);
	var curMi = curTime % 60;
	if(curHour > 0){
		$('#curHour').text(curHour + "시간");
	}
	if(curMi > 0){
		$('#curMi').text(curMi + "분");
	}
}

function out(){
	var qrInfo = $('input[name=QrData]').val();
	var qrMessage = $('input[name=qrMessage]').val();
	var serverIp = $('input[name=serverIp]').val();
	
	alert(qrMessage);
	sendTo(qrInfo, serverIp);
}

function rentSelect(obj){
	var equipTotalPrice = $(obj).children('input[name=equipTotalPrice]').val().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	var equipTicket = $(obj).children('input[name=equipTicket]').val();
	var equipRentOut = $(obj).children('input[name=equipRentOut]').val();
	$('#selectTicket').css('display','none');
	$('#preparePay').css('display','');
	$('#ticketName').text(equipTicket);
	$('#ticketPrice').text(equipTotalPrice);
	$('#equipRentOut').attr('value', equipRentOut);
	$('#backBtn').css('display','');
	$('#noteBookPay').css('display', 'none');
	
}

function back(){
	$('#preparePay').css('display','none');
	$('#backBtn').css('display','none');
	$('#selectTicket').css('display','');
}


function rentEquip(){
	
	$('#backBtn').css('display','none');
	
	var equipTotalPrice = $('#ticketPrice').text();
	equipTotalPrice = parseInt(equipTotalPrice.replace(/,/g,""));
	var memId = $('input[name=memId]').val();
	var equipCode = $('input[name=equipCode]').val();
	var rentOut = $('input[name=rentOut]').val();
	$.ajax({
	    url : "<%=request.getContextPath()%>/equip/tbRent/pay", 
	    type : 'POST', 
	    data : {equipTotalPrice : equipTotalPrice,
	    		memId : memId, equipCode : equipCode,
	    		rentOut : rentOut}, 
	    success : function(data) {
	        console.log(data.qr);
	        $('#qrData').attr('value', data.qrInfo);
	        $('#QrMessage').attr('value', data.message);
	        $('#ServerIp').attr('value', data.serverIp);
	        //결제
	        pay();
	        
	        //큐알발급
// 	        sendTo(data.qrInfo);
// 	        alert(data.message);
	        
	    },
	    error : function(xhr, status) {
	        alert(xhr + " : " + status);
	    }
	}); 
	
}

function pay(){
	var equipTotalPrice = $('#ticketPrice').text();
	equipTotalPrice = parseInt(equipTotalPrice.replace(/,/g,""));
	var memId = $('input[name=memId]').val();
	var equipName = $('input[name=equipName]').val();
	
// 	$("#rentForm input[name=storeCode]").val($("#selectRoom").val());
	$.ajax({
		url:"<c:url value='/equip/rent/pay/ready' />",
		data:{equipTotalPrice : equipTotalPrice,
			   memId : memId, equipName : equipName},
		type:"post",
		success:function(data){
			$('#noteBookPay').css('display', '');
			$('#noteBookPay').attr('src', data.redirectUrl);
			$('#preparePay').css('display', 'none');
		},
		error:function(xhr){
			console.log(xhr);
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
                description: '발급받은 큐알코드로 반납해주세요. \nhttp://'+serverIp+'/study_cafe/qrImage/'+qrInfo+'.png',
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
                    mobile_web_url: 'http://localhost/study_cafe/qrImage/'+qrInfo+'.png',
                    web_url: 'http://localhost/study_cafe/qrImage/'+qrInfo+'.png',
                  },
                },
              ],
            },
          },
          success: function(res) {
            //alert('success: ' + JSON.stringify(res))
        	location.href='<%=request.getContextPath()%>/kiosk/logout';
          },
          fail: function(err) {
            //alert('error: ' + JSON.stringify(err))
          },
        })
      },
      fail: function(err) {
        alert('failed to login: ' + JSON.stringify(err))
      },
    })
  }


</script>