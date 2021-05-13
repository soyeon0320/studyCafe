<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="javascript:confirmLogout();" class="btn btn-block btn-icon btn-rounded btn-xl btn-dark mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">로그아웃</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="#" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-primary mb-2"
           			data-toggle="modal" data-target="#exampleModalCenter">
                    <i class="icon-bullhorn1"></i>
                    	<p class="mb-0" style="font-size: x-large;">이용안내보기</p>
                </a>
          	 </li>
       </ul>
   </header>
   
   <!-- Modal -->
   <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered" role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h3 class="modal-title" id="exampleModalLongTitle" style="font-size: 1.5rem;">이용안내</h3>
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                       <span aria-hidden="true">&times;</span>
                   </button>
               </div>
               <div class="modal-body" style="font-size: large;">
                   <p><i class="icon-bullhorn1"></i> 휴대폰 무음<p>
                   <p><i class="icon-bullhorn1"></i> 통화 금지<p>
                   <p><i class="icon-bullhorn1"></i> 잡담 금지<p>
                   <p><i class="icon-bullhorn1"></i> 음식물 취식금지<p>
                   <p><i class="icon-bullhorn1"></i> 좌석 이동불가<p>
                   <p><i class="icon-bullhorn1"></i> 화장실 비밀번호 #1004#<p>
                   <p><i class="icon-bullhorn1"></i> 연중무휴 00:00 ~ 24:00 운영중<p>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-primary" data-dismiss="modal"><p class="m-0">닫기</p></button>
               </div>
           </div>
       </div>
   </div>
   
   <div style="height: fit-content;  margin-top: 100px;">
   		<h3 style=" text-align: center;">이용유형을 선택하세요.</h3>
   </div>
   <div class="row mb-20 mt-20" id="select_1"  style="text-align: center; padding: 0px 70px;">
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-info" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;"
				onclick="checkResev();">
				<p class="mb-20">좌석</p>
				<p class="mb-0">스터디룸</p>
			</button>
		</div>
		<div class="col-6">
<%-- 			<c:forEach items="${studyroomIn}" var="sti"> --%>
<%-- 				<c:if test="${empty sti.studyroomIn}"> --%>
<!-- 				<button type="button" class="btn btn-gradient btn-block btn-xl btn-gradient-warning" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;" -->
<!-- 					onclick="checkEquip();"> -->
<!-- 					<p class="mb-0">교육기기</p> -->
<!-- 				</button> -->
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
			<button type="button" class="btn btn-block btn-xl btn-success" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;"
				onclick="checkEquip();">
				<p class="mb-0">교육기기</p>
			</button>
		</div>
	</div>
   <div class="row mb-20 mt-20" id="select_2"  style="text-align: center; padding: 0px 70px; display: none">
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-outline" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;"
				onclick="javascrip:location.href='<c:url value='/seat/view'/>'">
				<p class="mb-20">좌석</p>
				<p class="mb-0">${owner.storeCurrentSeat}/${owner.storeTotalSeat }</p>
			</button>
		</div>
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-outline" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;"
				onclick="javascrip:location.href='<c:url value='/str/view'/>'">
				<p class="mb-20">스터디룸</p>
				<p class="mb-0">${owner.storeCurrentRoom}/${owner.storeTotalRoom }</p>
			</button>
		</div>
		<div class="container" style="text-align: center;">
			<button class="btn btn-icon btn-rounded btn-xl btn-outline mt-30" type="button" onclick="selectAgain();">
				<i class="icon-line-chevron-left"></i>
				<p class="mb-0" style="font-size: x-large;">다시 선택 하기</p></button>
		</div>
	</div>		
   <div class="row mb-20 mt-20" id="select_3"  style="text-align: center; padding: 0px 70px; display: none">
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-outline-success" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;"
				onclick="javascrip:location.href='<c:url value='/equip/notebook'/>'">
				<p class="mb-20">노트북</p>
			</button>
		</div>
		<div class="col-6">
			<button type="button" class="btn btn-block btn-xl btn-outline-success" style="font-size: xxx-large;letter-spacing: 10px;height: 300px;"
				onclick="javascrip:location.href='<c:url value='/equip/tablet'/>'">
				<p class="mb-20">태블릿</p>
			</button>
		</div>
		<div class="container" style="text-align: center;">
			<button class="btn btn-icon btn-rounded btn-xl btn-outline mt-30" type="button" onclick="selectAgain();">
				<i class="icon-line-chevron-left"></i>
				<p class="mb-0" style="font-size: x-large;">다시 선택 하기</p></button>
		</div>
	</div>		
</div>

<script>
/* var usableSeat = sessionStorage.getItem('usableSeat');
var totalSeat = sessionStorage.getItem('totalSeat');

$('#usableSeat').text(usableSeat);
$('#totalSeat').text(totalSeat); */

function selectType(){
	$('#select_1').css('display','none');
	$('#select_2').css('display','');
}

function selectAgain(){
	$('#select_2').css('display','none');
	$('#select_3').css('display','none');
	$('#select_1').css('display','');
	
}

// 이용여부확인
function checkResev(){
	<c:choose>
		<c:when test="${empty useInfo }">
			// 이용중이 아닐때
			selectType();
		</c:when>
		<c:when test="${!empty useInfo }">
			// 이미 이용중일때
			used();
		</c:when>
	</c:choose>
	
}

// 이미 이용중인 회원
function used(){
	swal({
        title: '이미 ${useInfo.seatNo}번 좌석을 이용중입니다.\n잔여시간 : ${totalRemainTime}분',
        text: '좌석과 스터디룸은 동시에 이용할 수 없습니다.',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: '잔여시간충전',
        cancelButtonText: '닫기',
        confirmButtonClass: 'btn btn-success mt-2',
        cancelButtonClass: 'btn btn-danger ml-2 mt-2',
        buttonsStyling: false
    }).then(function () {
    	//location.href='<c:url value='/kiosk/main'/>';
    	//alert('충전하기-> 이용권 구매페이지로');
    	
    	
    }, function (dismiss) {
        // dismiss can be 'cancel', 'overlay',
        // 'close', and 'timer'
        if (dismiss === 'cancel') {
//          location.href='<c:url value='/kiosk/main'/>';
			location.reload();
        }
    });
}

function checkEquip(){
	var notEmptySeatIn = ${not empty checkSeatIn};
	var notEmptyCurrentMemStudyRoom = ${not empty currentMemStudyRoom};
	var emptySeatIn = ${empty checkSeatIn};
	var emptyCurrentMemStudyRoom = ${empty currentMemStudyRoom};
	console.log("좌석 이용중일 때: " + notEmptySeatIn);
	console.log("스터디룸 이용중일 때: " + notEmptyCurrentMemStudyRoom);
	console.log("좌석 이용중이지 않을 때 : " + emptySeatIn);
	console.log("스터디룸 이용중이지 않을 때: " + emptyCurrentMemStudyRoom);
	
	if(notEmptySeatIn == true || notEmptyCurrentMemStudyRoom == true){
		equipSelect();
	}else if(emptySeatIn == true || emptyCurrentMemStudyRoom == true){
		notUse();
	}

	
}

function equipSelect(){
	$('#select_1').css('display','none');
	$('#select_3').css('display','');
}

function notUse(){
	swal({
        title: '좌석 및 스터디룸 입실 후\n이용가능합니다.',
//         text: '',
        type: 'warning',
//         showCancelButton: true,
//         confirmButtonText: '잔여시간충전',
        cancelButtonText: '닫기',
        confirmButtonClass: 'btn btn-primary mt-2',
//         cancelButtonClass: 'btn btn-danger ml-2 mt-2',
        buttonsStyling: false
    })
//     .then(function () {
//     	//location.href='<c:url value='/kiosk/main'/>';
//     	//alert('입실');
//     }, function (dismiss) {
//         // dismiss can be 'cancel', 'overlay',
//         // 'close', and 'timer'
//         if (dismiss === 'cancel') {
// //             location.href='<c:url value='/kiosk/main'/>';
// 			location.reload();
//         }
//     });
}

</script>

