<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<style>
	.fc-past{
		opacity: .3;
		cursor: default;
	}
	.fc-today, .fc-future{
		cursor: pointer;
		font-weight: bolder;
	}
	
	
	.fc-other-month:hover{
		background-color:white;
		cursor: default;
	}
	
	.fc-sun{ color:red; }
	
	.fc-active{
		background-color:powderblue !important;
	}
	
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
	span.history-span{
	    width: auto !important;
	    height: auto !important;
	    line-height: 1 !important;
	    padding: .35rem .35rem;
	    border-radius: 4px;
	    font-size: .8rem;
	    position: relative;
	    display: inline-block !important;
	    background-color: #ccf5e36b !important;
	    color: #147831e3;
	    border-color: rgb(113 218 85 / 20%);
}
	
</style>
<section>
	<h3 align="center">스터디룸 예약</h3>
	<div id="search-area">
		<div class="input-group">	
			<h4 style="display: inline; padding-right: 10px;">매장검색</h4>
			<select id="donmList" name="addrDonmCode" class="form-control col-md-3" onchange="getSigugun(this.value);">
				<option value="">전체/도/남</option>
				<c:forEach items="${donmCodeList}" var="donm">
					<option value="${donm.addrDonmCode }">${donm.addrDonmName }</option>
				</c:forEach>
			</select>					
			
			<select class="form-control col-md-3" name="addrSigugunCode" id="sigugunList" onchange="getStoreList(this.value)">
				<option value="">전체/시/구/군</option>
			</select>					

			<select class="form-control col-md-5" id="storeList" onchange="getStoreStudyRoom(this.value);">
				<option disabled="disabled">매장을 선택해 주세요.</option>
			</select>					
		</div>
		<div id="historyBar" style="text-align: right;margin: 10px;">
		
		</div>
		<div class="row" style="margin-top: 30px;" >
			<div class="col-6" id="calendar-area" style="display: none;">
			
				<div id="calendar" class="fc fc-unthemed fc-ltr">
				
				</div>
			
			</div>
		
			<div class="col-6" id="room-area" style="display: none;">
				<div class="row">
					<h4 class="col-4" style="display: inline;" id="storeName"></h4>				
					<div class="col-8">
						<select class="form-control" style="display: inline; margin-bottom: 10px;" id="selectRoom" onchange="setImgPreview(this.value);">
						</select>
					</div>
				</div>
				
				<div id="studyRoom_preview">
					<img alt="" src="" id="roomPreview" width="100%;">
				</div>
			</div>
		</div>
		
		<div id="time-area" style="margin-top: 40px; display: none;">
			
			<div style="display: block; margin-bottom: 10px;" >
				<strong>시간을 선택하세요.(시간당 5천원) </strong>
				<i class="icon-line-alert-circle" style="font-size: 1.3em;vertical-align: middle;" data-toggle="tooltip" title="" 
					data-placement="right" data-original-title="예약시간은 최대 6시간까지 할 수 있으며, 현재 시간부터 30일 이내만 예약이 가능합니다. 예약 시간 이후에는 환불 및 취소가 불가합니다."
					onclick="mySWAL(this);"
					></i>
				<strong style="float: right;display: none;" id="preSum"></strong>
			</div>
			
			
			<table class="table table-bordered">
				<tr id="amList" align="center">
					<th>오전</th>
				</tr>			

				<tr id="pmList" align="center">
					<th>오후</th>
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
				<form action="<c:url value="/rent/studyRoom" />" id="rentForm" method="post">
					<input type="hidden" name="memId">				
					<input type="hidden" name="studyroomNo">				
					<input type="hidden" name="studyroomReservStart">				
					<input type="hidden" name="studyroomReservEnd">				
					<input type="hidden" name="studyroomUsePrice">				
					<input type="hidden" name="pickDate">				
					<input type="hidden" name="storeCode">				
					<input type="hidden" name="tid">				
					<button type="button"  onclick="rentSubmit();" class="btn-xl btn btn-block btn-outline-success" style="clear: both; display: block; font-weight: bold;">다음단계</button>
				</form>
			</div>
			
		</div>
	</div>
<form id="imgList"></form>
<input type="hidden" id="pickDate">


<div class="modal fade" id="preCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle" style="font-size: x-large;">결제 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="height: 270px;">
				<table class="table table-borderless" style="font-size: x-large;">
					<colgroup>
						<col width="25%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th style="text-align: right;">매장</th>
							<td id="preStoreName"></td>
						</tr>		
						<tr>
							<th style="text-align: right;">예약날짜</th>
							<td id="preReservDate"></td>
						</tr>		
						<tr>
							<th style="text-align: right;">스터디룸</th>
							<td id="preRoomInfo"></td>
						</tr>
						<tr>
							<td id="preModalTotal" style="text-align: right;font-weight:  bolder;font-size: x-large;" colspan="2"></td>
						</tr>
					</tbody>				
				</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-success" onclick="pay();">결제</button>
            </div>
        </div>
    </div>
</div>
</section>

<script>
	function getSigugun(addrDonmCode){
		var data = {
				addrDonmCode:addrDonmCode
		}
		
		$.ajax({
			url:"<c:url value='/common/sigugun'/>",
			method:"post",
			data: data,
			success:function(data){
				setSigugun(data.sigugunCodeList);
			},
			error:function(xhr){
				console.log(xhr);
			}
		});
	}
	
	function setSigugun(sigugunList){
		var resStr = "<option value=''>전체/시/구/군</option>";
		for (var i = 0; i < sigugunList.length; i++) {
			var sigugun = sigugunList[i];
			resStr += "<option value="+sigugun.addrSigugunCode+">"+sigugun.addrSigugunName+"</option>"
		}
		$("#sigugunList").html(resStr);
		$("#sigugunList").trigger("change");
	}

	function getStoreList(addrSigugunCode){
		var data = {
				addrDonmCode:$("select[name=addrDonmCode]").val(),
				addrSigugunCode:addrSigugunCode
		}
		$.ajax({
			url:"<c:url value='/rent/get/storeCode'/>",
			method:"post",
			data: data,
			success:function(data){
				setStoreList(data.storeList);
			},
			error:function(xhr){
				console.log(xhr);
			}
		});
	}
	
	function setStoreList(storeList){
		var resStr = '<option value="">매장을 선택해 주세요.</option>';
		
		if(storeList.length == 0){
			resStr = "<option value=''>예약 가능한 매장 없음</option>";
		}else{
			for (var i = 0; i < storeList.length; i++) {
				var store = storeList[i];
				if(store.studyroomCnt != 0)
				resStr += "<option value="+store.storeCode+">"+store.storeName+"</option>";
			}
		}
		$("#storeList").html(resStr);
	}
	
	function getStoreStudyRoom(storeCode){
		$("#calendar-area").hide();
		$("#calendar-area").fadeIn("50");
		selectDate();
	}	
	
	
	function selectDate(pickDate){
		if(!pickDate)pickDate = Date.UTC(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$("#pickDate").val(pickDate);
		
		var data = {
			storeCode:$("#storeList").val()
		}
		
		$.ajax({
			url:"<c:url value='/rent/get/studyRoom'/>",
			method:"post",
			data:data,
			success:function(data){
				setStudyRoomList(data.studyRoomList);
			},
			error:function(xhr){
				console.log(data);
			}
			
		});
	}
	
	function setStudyRoomList(studyRoomList){
		$("#selectRoom").html("");
		$("#imgList").html("");
		
		if(studyRoomList.length == 0){
            swal_alert('이용 가능한 스터디룸이 없습니다.');
			$("#calendar-area").hide();
			$("#room-area").hide();
			$("#time-area").hide();
			
			return;
		}
		
		for (var i = 0; i < studyRoomList.length; i++) {
			var studyRoom = studyRoomList[i];
			var option = "<option></option>";
			$("#selectRoom").append($(option).val(studyRoom.studyroomNo).text(studyRoom.studyroomName + " (" + studyRoom.studyroomCapa + ")인 "));
			var myinput = "<input type='hidden' id=room"+studyRoom.studyroomNo+" value=<%=request.getContextPath()%>"+studyRoom.studyroomImage+">";
			$("#imgList").append(myinput);
			
		}
		setImgPreview(studyRoomList[0].studyroomNo);
		$("#storeName").text($("#storeList option:selected").text());
		$("#room-area").fadeIn("50");
		
	}
	
	function setImgPreview(roomNo){
		$("#roomPreview").hide();
		$("#roomPreview").attr("src",$("#room"+roomNo).val()).fadeIn();
		getTimeTable(roomNo);
	}
	
	function getTimeTable(studyroomNo){
		
		var pickDate =$("#pickDate").val();
		
		var data = {
				studyroomNo:studyroomNo,
				pickDate:pickDate
		}
		
		$.ajax({
			url:"<c:url value='/rent/get/studyRoomSchedule'/>",
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
			var str = "<td class="+cssClass+" onclick='selectTime("+time.time24+",this)'>"+time.time24+inputTag+":00</td>";
			
			i < 12 ? $("#amList").append(str) : $("#pmList").append(str);
		}
		
		$("#time-area").fadeIn("50");
	}
	
	function selectTime(time, obj){
		
		if($(obj).hasClass("occupied")){
            swal_alert("이미 예약된 시간입니다.");
			return;
		}
		
		var className= "standby";
		
		var tdLength = $("td."+className).length;
		
		// 초기 선택
		if(tdLength == 0){
			$(obj).addClass(className);
			setPreTotal(1);
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
			$("#preSum").hide();
			
			$(obj).removeClass(className);
			
		}else{
			
			var hours = $("input[name=hours]").parent("td"); 
				
			for (var i = start+1; i < hours.length; i++) {
				var hour = hours[i];
								
				$(hour).addClass(className);
				
				if(i == end) break;
			}
			
			setPreTotal(end+1-start);
			
		}
		
		// 선택 유효성 검증
		if($("td."+className).length > 6){
            swal_alert('최대 대여 시간은 6시간 입니다.');
			$("td."+className).removeClass(className);
			$("#preSum").hide();
			return;
		}else if($("td.occupied.standby").length > 0){
            swal_alert('이미 예약된 시간입니다.');
			$("td.standby").removeClass(className);
			$("#preSum").hide();
			return;
		}
		
		
		$("#rentForm input[name=studyroomReservStart]").val(start);
		$("#rentForm input[name=studyroomReservEnd]").val(end+1);
		$("#rentForm input[name=studyroomNo]").val($("#selectRoom").val());
		$("#rentForm input[name=memId]").val("test");
		$("#rentForm input[name=studyroomUsePrice]").val(5000);
		$("#rentForm input[name=pickDate]").val($("#pickDate").val());
		
		// 전송할 데이터 셋팅

	}
	
	function setPreTotal(totalTime){
		$("#preSum").text( "총 "+((totalTime)*parseInt(5000)).toLocaleString() +" 원").show();
	}
	
	function rentSubmit(){
		
		if($("td.standby").length == 0) {
			swal_alert('예약 할 시간을 선택 해 주세요.');
			return;
		}
		
		if($("td.standby").length == 1){
			$("#rentForm input[name=studyroomReservStart]").val($("td.standby input[name=hours]").val());
			$("#rentForm input[name=studyroomReservEnd]").val(parseInt($("td.standby input[name=hours]").val())+1);
			
			$("#rentForm input[name=studyroomNo]").val($("#selectRoom").val());
			$("#rentForm input[name=memId]").val("test");
			$("#rentForm input[name=studyroomUsePrice]").val(5000);
			$("#rentForm input[name=pickDate]").val($("#pickDate").val());
			
		}
		preCheck();
	}
	
	function preCheck(){
		$("#preCheckModal").modal();
		var pickDate = $("#rentForm input[name=pickDate]").val();
		var startDate = getTimeStamp(parseInt(pickDate)).substr(0,11);
		
		$("#preStoreName").text($("#storeName").text());
		$("#preReservDate").text(
								startDate + " " +$("#rentForm input[name=studyroomReservStart]").val() 
								 + "-" 
								 + $("#rentForm input[name=studyroomReservEnd]").val() + "시 까지"
								 );
		$("#preRoomInfo").text($("#rentForm input[name=studyroomNo]").val() +"번 방");
		$("#preModalTotal").text($("#preSum").text());
		
	}
	
	
</script>
<script type="text/javascript">

window.addEventListener("load",function(){
	$("#donmList").trigger("change");
	myCalendar();
	$(".fc-today").addClass("fc-active");
});

function myCalendar(){
     $('#calendar').fullCalendar({
        header: {
            left: 'title',
            center: '',
            right: 'prev,next'
        },
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        locale : "ko",
        lang:"ko",
        dayClick:function(date,jsFunction,view){
        	var date1 = new Date();
        	var today = Date.UTC(date1.getFullYear(), date1.getMonth(), date1.getDate());
			var date_reg  = 0 <= date._i - today && date._i - today < 2678400000; // 오늘 ~ 한달 까지만 선택 가능
			if(date_reg){
		    	$(".fc-active").removeClass('fc-active');
		    	$(this).addClass('fc-active');
		    	selectDate(date._i);
			}else{
				swal_alert('오늘 날짜부터 최대 30일까지 예약 가능합니다.');
			}
        }
    }); 
}

function my_choice(obj){
	var parent = $(obj).parent("div");
	
	var storeCode = parent.find("input[name=usedStoreCode]").val();
	var addrDonmCode = parent.find("input[name=usedStoreDonm]").val();
	var addrSigugunCode = parent.find("input[name=usedStoreSigugun]").val();
	
	$("#donmList").val(addrDonmCode);
	$("#sigugunList").val(addrSigugunCode);
	$("#storeList").val(storeCode).trigger("change");
	
	
}


</script>





<script>
function pay(){
	
	
	if(!$("#preCheckModal").hasClass('show')) return;
	
	$("#preCheckModal").modal("hide");
	
	$("#rentForm input[name=storeCode]").val($("#selectRoom").val());
	$.ajax({
		url:"<c:url value='/rent/studyroom/pay/ready' />",
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
	
	$.ajax({
		url:$("#rentForm").attr("action"),
		type:"post",
		data:$("#rentForm").serialize(),
		success:function(data){
			$(".fc-active").trigger("mousedown");
			$(".standby").attr("class","occupied");
			sendTo(data.rentNo);
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
}
</script>


<script>
function sendTo(rentNo) {
    Kakao.Auth.login({
      scope: 'PROFILE,TALK_MESSAGE',
      success: function() {
        Kakao.API.request({
          url: '/v2/api/talk/memo/default/send',
          data: {
            template_object: {
              object_type: 'feed',
              content: {
                title: '예약 완료.',
                description: '예약정보 확인하기 \nhttp://${serverIp}<%=request.getContextPath()%>/rent/test?rentNo='+rentNo,
                image_url:
                	'http://localhost/study_cafe/qrImage/noImg.JPG',
                link: {
                    mobile_web_url: 'http://localhost/study_cafe/qrImage/',
                    web_url: 'http://localhost/study_cafe/qrImage/',
                  },
              },
              buttons: [
                {
                  title: '큐알코드확인하기',
                  link: {
                    mobile_web_url: 'http://localhost/study_cafe/qrImage/',
                    web_url: 'http://localhost/study_cafe/qrImage/',
                  },
                },
              ],
            },
          },
          success: function(res) {
            //alert('success: ' + JSON.stringify(res))
            if (!Kakao.Auth.getAccessToken()) {
		      //alert('Not logged in.');
		      return
		    }
		    Kakao.Auth.logout(function() {
		      //alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
		    })
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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('a3534454a891289cd08358f9b98b5256');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());
</script>

<script type="text/javascript">
window.addEventListener("load",function(){
	get_history();
});


function get_history(){
	var store_history_name = JSON.parse(localStorage.getItem("store_history_name"));
	var store_history_code = JSON.parse(localStorage.getItem("store_history_code"));
	
	if(store_history_name){
		var length = store_history_name.length;
		for (var i = 0; i < length; i++) {
			var storeCode = store_history_code.pop();
			$("#historyBar").append($("<span class='history-span mr-2 mb-2'>"+store_history_name.pop()+"</span>")
										.attr("onclick","javascript:$('#storeList').val('"+storeCode+"');getStoreStudyRoom('"+storeCode+"')")
										.css({
											"cursor": "pointer"
										})
									);
		}
	}
}


</script>

