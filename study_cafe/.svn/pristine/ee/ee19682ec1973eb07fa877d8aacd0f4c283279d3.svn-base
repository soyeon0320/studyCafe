<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<style>
	.available{
		background-color: #e0fed3;
		cursor: pointer;
		font-weight: bolder;
	}
	.available:hover{
		background-color: #0aba16;
	}
	.occupied{
		opacity: .3;
		font-weight: bolder;
		background-color: #eaeaea;
	}
	.info-btn, .info-btn:hover,.info-btn:focus{
		border: 0px;
		width: 20px;
	    height: 20px;
	    display: inline;
	    vertical-align: sub;
	    margin-left: 10px;
	    opacity: unset;
	}
	.standby{
		background-color: #0aba16;
	}
	
	
</style>
<div style="color: rgb(255,234,0);">
	
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/rent" class="btn btn-block btn-icon btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line-chevron-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">뒤로가기</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="javascript:confirmLogout();" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
          	 </li>
       </ul>
   </header>
	
	<h3 class="mb-0" align="center" style="color: rgb(255,234,0);">스터디룸 예약</h3>
	<div id="search-area">
		<div id="storeImg" class="mb-20">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2500" style="height: 370px;">
				
					<!-- The slideshow -->
					<div class="carousel-inner">
						<c:set var="cnt" value="0" />
						<c:forEach items="${studyRoomList }" var="studyroom" >
							<div class="carousel-item <c:if test="${cnt == 0 }">active</c:if>  mt-30" style="padding: 0px 50px; color: black;">
								<div class="iCard border1 p-2 rounded bg-white" style="width: 60%; margin: auto;">
									<div style="width: fit-content; margin: auto;">
				                       <a href="#">
				                           <img src="<%=request.getContextPath() %>/${studyroom.studyroomImage }" alt="${studyroom.studyroomName } 사진" class="img-fluid rounded" style="max-height: 100%;">
				                       </a>
									</div>
			                       <div class="iCard-content p-1 mt-15 pb-15 b-t">
			                       		<div class="row">
				                           <h3 class="col-5 fs16 text-dark mb-0 font400 b-r pr-0">${studyroom.studyroomName }</h3>
				                           <div class="col-2 text-left b-r pr-0">
		                                       <span class="pb-1">${studyroom.studyroomCapa }인</span>
		                                   </div>
		                                   <div class="col-5">
	                                   		   <a href="javascript:getTimeTable(${studyroom.studyroomNo });" class="btn btn-gradient-success btn-icon btn-icon-right btn-sm">
		                                           <i class="fa fa-arrow-right"></i>선택하기
		                                       </a>
		                                   </div>
			                       		</div>
			                       </div>
			                   </div>
			                </div>
			                <c:set var="cnt" value="${cnt + 1 }"  /> 
						</c:forEach>
						
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#myCarousel" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>		
			</div>
		
		<div id="time-area" style="margin-top: 20px; width:80%; margin:auto; display: none;">
			
			<div align="center" style="display: block; margin-bottom: 10px;" >
				<strong >시간을 선택하세요.</strong>
			</div>
			
			
			<table class="table table-bordered" style="">
				<tr id="amList" align="center">
					<th style="width: 20px; padding: 10px 0px;">오전</th>
				</tr>			
 
				<tr id="pmList" align="center">
					<th style="width: 20px; padding: 10px 0px;">오후</th>
				</tr>			
			</table>
			
			<div style="clear: both; margin-bottom: 50px;">
				<div style="float: right;">
					<ul style="display: inline;">
						<li style="display: inline;">선택</li>
						<li style="display: inline;"><input class="info-btn"  disabled="disabled" style="background-color: #e0fed3;" type="button"></li>
					</ul>

					<ul style="display: inline;">
						<li style="display: inline;">불가</li>
						<li style="display: inline;"><input class="info-btn" disabled="disabled" style="background-color: #eaeaea;" type="button"></li>
					</ul>
				</div>
			</div>
			
			<div>
				<form action="<c:url value="/str/rent" />" id="rentForm" method="post">
					<input type="text" name="memId">				
					<input type="text" name="studyroomNo">				
					<input type="text" name="studyroomReservStart">				
					<input type="text" name="studyroomReservEnd">				
					<input type="text" name="studyroomUsePrice">				
					<input type="text" name="tid">				
					<button type="button"  onclick="rentSubmit();" class="btn-xl btn btn-block btn-outline-success" style="clear: both; display: block; font-weight: bold;">다음단계</button>
				</form>
			</div>
			
		</div> <!-- /time-area -->
	</div>
</div>

<script>
		
	function getTimeTable(studyroomNo){
		
		$('input[name=studyroomNo]').val(studyroomNo);
		
		$('.carousel').carousel('pause');
		
// 		$('#myCarousel').attr('data-interval','');
		
		var data = {
				studyroomNo:studyroomNo,
		}
		
		$.ajax({
			url:"<c:url value='/str/get/studyRoomSchedule'/>",
			method:"post",
			data:data,
			success:function(data){
				setTimeTable(data.timeList);
			},
			error:function(xhr){
				console.log(xhr)
			}
		});
	}
	
	function setTimeTable(timeList){
		$("#time-area").hide();
		
		$("#amList td, #pmList td").remove();
		
		for (var i = 0; i < timeList.length; i++) {
			var time = timeList[i];
			var cssClass = time.useYn == 0 ? "available" : "occupied";
			var inputTag = "<input type='hidden' name='hours' value="+time.time24+">";
			var str = "<td class="+cssClass+" onclick='selectTime("+time.time24+",this)' style='padding: 0px;color:black;vertical-align: middle;'>"+time.time24+inputTag+":00</td>";
			
			i < 12 ? $("#amList").append(str) : $("#pmList").append(str);
		}
		
		$("#time-area").fadeIn("50");
	}
	
	function selectTime(time, obj){
		
		if($(obj).hasClass("occupied")){
			alert("이미 예약된 시간입니다.");
			return;
		}
		
		var className= "standby";
		
		var tdLength = $("td."+className).length;
		
		// 초기 선택
		if(tdLength == 0){
			$(obj).addClass(className);
			return;
		}else if(tdLength > 1){
			$("td."+className).removeClass(className);
			$(obj).addClass(className);
			return;
		}
			
		// 선택 값 클래스 변경
		var start = parseInt($("td."+className+" input[name=hours]").val());
		var end = parseInt($(obj).children("input[name=hours]").val());
		if(start > end){
			$("td."+className).removeClass(className);
			$(obj).addClass(className);
		}else if(start == end){
			$(obj).removeClass(className);
		}else{
			var hours = $("input[name=hours]").parent("td"); 
				
			for (var i = start+1; i < hours.length; i++) {
				var hour = hours[i];
								
				$(hour).addClass(className);
				
				if(i == end) break;
			}
		}
		
		// 선택 유효성 검증
		if($("td."+className).length > 6){
			alert("최대 대여시간은 6시간 입니다.");
			$("td."+className).removeClass(className);
			return;
		}else if($("td.occupied.standby").length > 0){
			alert("이미 예약된 시간입니다.");
			$("td.standby").removeClass(className);
			return;
		}
		$("#rentForm input[name=studyroomReservStart]").val(start);
		$("#rentForm input[name=studyroomReservEnd]").val(end+1);
		//$("#rentForm input[name=studyroomNo]").val($("#selectRoom").val());
		$("#rentForm input[name=memId]").val("test");
		$("#rentForm input[name=studyroomUsePrice]").val(5000);
		$("#rentForm input[name=pickDate]").val($("#pickDate").val());
		
		// 전송할 데이터 셋팅

	}
	
	function rentSubmit(){
		if($("td.standby").length == 1){
			$("#rentForm input[name=studyroomReservStart]").val($("td.standby input[name=hours]").val());
			$("#rentForm input[name=studyroomReservEnd]").val(parseInt($("td.standby input[name=hours]").val())+1);
			
			//$("#rentForm input[name=studyroomNo]").val($("#selectRoom").val());
			$("#rentForm input[name=memId]").val("test");
			$("#rentForm input[name=studyroomUsePrice]").val(5000);
			$("#rentForm input[name=pickDate]").val($("#pickDate").val());
		}
		
		
		pay();
		
		
	}
	
	
</script>


<script>
function pay(){
	
	$.ajax({
		url:"<c:url value='/str/studyroom/pay/ready' />",
		data:$("#rentForm").serialize(),
		type:"post",
		success:function(data){
			OpenWindow(data.redirectUrl, '결제', 600, 600);
			
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
	
}

function setTid(tid){
	$("#rentForm input[name=tid]").val(tid);
	
	//$("#rentForm").submit();
	
	var formData = $("#rentForm").serialize();
	
	$.ajax({
	    url : "<%=request.getContextPath()%>/str/rent", 
	    type : 'POST', 
	    data : formData, 
	    success : function(data) {
	        alert(data.message);
	        
	        //큐알전송
	        sendTo(data.qrInfo, data.serverIp);
	        
	    },
	    error : function(xhr, status) {
	        alert(xhr + " : " + status);
	    }
	}); 
}

function sendTo(qrInfo, serverIp) {
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
                description: '아래 링크로 큐알코드 확인하기 \nhttp://'+serverIp+'/study_cafe/qrImage/'+qrInfo+'.png',
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
                    mobile_web_url: 'http://'+serverIp+'/study_cafe/qrImage/'+qrInfo+'.png',
                    web_url: 'http://'+serverIp+'/study_cafe/qrImage/'+qrInfo+'.png',
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