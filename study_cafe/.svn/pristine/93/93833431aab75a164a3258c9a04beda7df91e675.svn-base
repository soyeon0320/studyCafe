<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/main" class="btn btn-block btn-icon btn-rounded btn-xl btn-dark mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/loginForm" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-primary mb-2">
                    <i class="icon-study"></i>
                    	<p class="mb-0" style="font-size: x-large;">예약하러가기</p>
                </a>
          	 </li>
       </ul>
   </header>
   
	   <form id="rentInfo" action="" method="post"> 
			<input type="hidden" id="qrInfo" value=""> 
			<input type="hidden" name="type" value=""> 
			<input type="hidden" name="no" value="">
			
		<!-- 	<button type="button" onclick="go_QRCheck();">제출</button>
			<button type="button" onclick="go_QRCheck('Seat');">좌석</button> 
			<button type="button" onclick="go_QRCheck('StudyRoom');">스터디룸</button> -->
		</form>
	
	   <form id="equipRent" action="" method="post"> 
		 	<input type="hidden" id="equipQr" value="">
			<input type="hidden" name="type" value=""> 
			<input type="hidden" name="rentEquipNo" value="">
	   </form>
   
   <div id="QRCheck">
   
	   <h3 style=" text-align: center; margin-top: 80px;">카메라에 큐알코드를 입력해주세요.</h3>
	   
	   <div id="output">
	
			<div id="outputMessage">
		
				QR코드를 카메라에 노출시켜 주세요
		
			</div>
			<span id="outputData"></span>	
		  	
		
		</div>
	   
	   <div id="frame" style="text-align: center;">
	
			<div id="loadingMessage">
		
				🎥 비디오 스트림에 액세스 할 수 없습니다<br>웹캠이 활성화되어 있는지 확인하십시오
		
			</div>
		
			<canvas id="canvas"></canvas>
		
		</div>
	</div>

</div>

<script>
var form;

window.addEventListener("load",function(){
	form = $('#rentInfo');
});


function go_QRCheck(type){
	var qrInfo = $('#qrInfo').val();
// 	$('input[name=type]').val(qrInfo.split('_')[0]);
	$('input[name=type]').val(type);
// 	$('input[name=no]').val(qrInfo.split('_')[1]);
	var qrType = sessionStorage.getItem('qrType');
	form.attr('action', '<%=request.getContextPath()%>/QR/' + qrType );
	form.submit();
}

</script>


<script type="text/javascript">	
	// QR

	document.addEventListener("DOMContentLoaded", function() {

		

		var video = document.createElement("video");		

		var canvasElement = document.getElementById("canvas");

		var canvas = canvasElement.getContext("2d");

		var loadingMessage = document.getElementById("loadingMessage");

		var outputContainer = document.getElementById("output");


 
		var outputMessage = document.getElementById("outputMessage");


 
		var outputData = document.getElementById("outputData");
		var userName = document.getElementById("userName");
		var seatNo = document.getElementById("seatNo");

		

		function drawLine(begin, end, color) {

			

			canvas.beginPath();

			canvas.moveTo(begin.x, begin.y);

			canvas.lineTo(end.x, end.y);

			canvas.lineWidth = 4;

			canvas.strokeStyle = color;

			canvas.stroke();

                }

	    

	        // 카메라 사용시

		navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {

			

      		        video.srcObject = stream;

      		        video.setAttribute("playsinline", true);      // iOS 사용시 전체 화면을 사용하지 않음을 전달

         		video.play();

      		        requestAnimationFrame(tick);

		});



		function tick() {

			

			loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

			

			if(video.readyState === video.HAVE_ENOUGH_DATA) {

				

        		      loadingMessage.hidden = true;

        		      canvasElement.hidden = false;

        		      outputContainer.hidden = false;

        		

        		      // 읽어들이는 비디오 화면의 크기

        		      canvasElement.height = video.videoHeight;

        	 	      canvasElement.width = video.videoWidth;

        		

        		      canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);

        		      var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);


 


        		      var code = jsQR(imageData.data, imageData.width, imageData.height, {



                                    inversionAttempts : "dontInvert",

        		      });
                              // QR코드 인식에 성공한 경우

                              if(code) {

                                     // 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성

                                    drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");

                                    drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");

                                    drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");

                                    drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000");
                                    outputMessage.hidden = true;
                                    outputData.parentElement.hidden = false;

                                    // QR코드 메시지 출력
									// code 형식  : 이용유형_예약번호
									
                                    var qrInfo = code.data;
									console.log(qrInfo);
                                    var type = qrInfo.split('_')[0];
                                    
                                    if(type == 'Seat' || type == 'StudyRoom'){
										$('#rentInfo input[name=type]').val(qrInfo.split('_')[0]);
										$('#rentInfo input[name=no]').val(qrInfo.split('_')[1]);
										var qrType = sessionStorage.getItem('qrType');
										form.attr('action', '<%=request.getContextPath()%>/QR/' + qrType);
										form.submit();
										
                                    }
									
									if(type == 'tablet'){
										
										$('#equipRent input[name=type]').val(qrInfo.split('_')[0]);
										$('#equipRent input[name=rentEquipNo]').val(qrInfo.split('_')[1]);
										$('#equipRent').attr('action', '<%=request.getContextPath()%>/QR/rentOut');
										$('#equipRent').submit();
									}
                                    // return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
                                    return;
                              }
                              // QR코드 인식에 실패한 경우 
                              else {
                                    outputMessage.hidden = false;
                                    outputData.parentElement.hidden = true;
                              }
                      }
      		      requestAnimationFrame(tick);
		}

	});

</script>