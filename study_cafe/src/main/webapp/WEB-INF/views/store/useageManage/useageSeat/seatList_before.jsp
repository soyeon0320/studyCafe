<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<style>
td {
	padding: 0px;
	width: 50px;
	height: 50px;
}

td.seatE, td.seatN, td.seatW, td.seatS {
	background-size: 50px;
	background-repeat: no-repeat;
	width: 50px;
	height: 50px;
	text-align: center;
	background-position: center;
}

td.seatE {
	background-image:
		url('<c:url value="/resources/images/seat/seatE.png" />');
}

td.seatN {
	background-image:
		url('<c:url value="/resources/images/seat/seatN.png" />');
}

td.seatW {
	background-image:
		url('<c:url value="/resources/images/seat/seatW.png" />');
}

td.seatS {
	background-image:
		url('<c:url value="/resources/images/seat/seatS.png" />');
}

td.seatE.seatUse0, td.seatN.seatUse0, td.seatW.seatUse0, td.seatS.seatUse0
	{
	background-color: springgreen;
}

td.seatE.seatUse1, td.seatN.seatUse1, td.seatW.seatUse1, td.seatS.seatUse1
	{
	background-color: red;
}
/* 	.img-fluid{ */
/* 		width: 540px; */
/* 		height: 270px; */
/* 	} */

/* 	img{
		display: block;
		width: 100%;
	} */
#seatMap, #unLocatedSeat {
	display: table;
	border-collapse: separate;
	box-sizing: border-box;
	text-indent: initial;
	border-spacing: 0px;
	-webkit-border-horizontal-spacing: 0px;
	-webkit-border-vertical-spacing: 0px;
	border-color: grey;
}
</style>

<section>
	<div class="col-sm-12">
		<div style="padding: 10px; float: left;" class="col-sm-6">
			<fmt:parseNumber var="x" type="number" value="${store.STORE_WIDTH }" />
			<fmt:parseNumber var="y" type="number" value="${store.STORE_HEIGHT }" />
			<div style="display: block;">
				<h3 align="center" style="display: inline;">현재 좌석 현황</h3>
				<!-- 			<button style="display: inline; float: right;" class="btn btn-info" onclick="modifySeatMap();">수정</button> -->
			</div>
			<table align="center">
				<tr>
					<th style="background-color: springgreen; width: 50px;"></th>
					<td>미사용</td>
					<th style="background-color: red; width: 50px;"></th>
					<td>이용중</td>
				</tr>
			</table>
			<br>
			<!-- 		<form action="modify_seat" style="clear: both;" id="locatedSeat"> -->
			<table class="table table-bordered" id="seatMap">
				<c:set var="location" value="1" />
				<c:set var="listCnt" value="0" />
				<c:set var="seat" value="${locatedList[listCnt] }" />

				<c:forEach begin="0" end="${y-1 }" varStatus="col">
					<tr>
						<c:forEach begin="${(col.count-1)*x }" end="${(col.count*x -1) }"
							varStatus="row">
							<c:if test="${seatMap[location-1] == '0' }">
								<td ondrop="dropSeat(event)" ondragover="allowDrop(event);">
									<input type="hidden" name="seatLocation" value="${location }">
								</td>
							</c:if>

							<c:if test="${seatMap[location-1] != '0' }">
								<td id="seat${seat.seatNo }" onclick="goModal(this);"
									class="seat${seat.seatDirection } seatUse${seat.seatOccufied}"
									ondrop="dropToExchange(event);" ondragover="allowDrop(event);"
									ondragstart="drag(event);" draggable="true"><input
									type="hidden" name="seatLocation" value="${location }">
									<input type="hidden" name="seatNo" value="${seat.seatNo }">
									<input type="hidden" name="seatUseable"
									value="${seat.seatUseable }"> <input type="hidden"
									name="seatInfo" value="${seat.seatInfo }"> <input
									type="hidden" name="isModified" value=""> <input
									type="hidden" name="seatDirection"
									value="${seat.seatDirection }"> <input type="hidden"
									name="storeCode" value="${seat.storeCode }"> <strong>${seat.seatNo }</strong>
									<c:set var="listCnt" value="${listCnt + 1 }" /> <c:set
										var="seat" value="${locatedList[listCnt] }" /></td>
							</c:if>
							<c:set var="location" value="${location + 1 }" />
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<!-- 		</form> -->

		</div>

		<div class="col-sm-6" style="float: right;">
			<h1>스터디룸</h1>

			<span>총 좌석 현황 :</span>

			<div class="pt50 pb20" id="portfolio">
				<div class="container">
					<h3 class="text-center font700 text-uppercase h3 mb60">스터디룸 예약
						현황</h3>

					<div class="row">
						<c:forEach items="${studyRoom }" var="str">
							<div class="col-md-6 mb30">
								<a onclick="goStr(this)" id="room${str.studyroomNo }" class="folio-card"> <img
									src="<%=request.getContextPath()%>${str.studyroomImage }"
									class="img-fluid" style="width: 540px; height: 270px;"> <input
									type="hidden" name="studyroomNo" value="${str.studyroomNo }">
									<input type="hidden" name="storeCode" value="${str.storeCode }">
									<input type="hidden" name="totalCount" value="${totalCount}">
									<!--                         	<input type="hidden" name="currPage"> -->
									<!--                         	<input type="hidden" name="pageSize"> -->
								</a>
								<div class="folio-overlay">
									<div class="folio-content">
										<h4>${str.studyroomName }(${str.studyroomCapa}인)</h4>
									</div>
								</div>
							</div>
							<!--/col-->
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- col 12 -->

</section>
<!-- 좌석 모달 -->
<%-- <form:form commandName="ownerUseableStudyRoomFormVO" id="listForm"> --%>
<div class="modal fade" id="seatModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info-light">
				<h5 class="modal-title" id="exampleModalLabel">좌석 상세 정보</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="" id="detailSeatForm">
					<%-- 				<input type="hidden" name="seatNo" value="${seatList.seatNo}" readonly="readonly"> --%>
					<table class="table table-hover" id="curDetail">

					</table>
					<h5 class="modal-title" id="exampleModalLabel">이용내역</h5>
					<table class="table table-hover mt-20">
						<thead>
							<tr>
								<th>이용자</th>
								<th>입실시간</th>
								<th>퇴실시간</th>
							</tr>
						</thead>
						<tbody id="dsList">

						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				<!-- 				<button type="button" class="btn btn-primary" onclick="modifySeat();"></button> -->
			</div>
		</div>
	</div>
</div>
<!-- 스터디룸 모달 -->
<div class="modal fade" id="studyRoomModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	style="display: none;">
	<input type="hidden" id="roomNo">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info-light">
				<h5 class="modal-title" id="exampleModalLabel">스터디룸 상세 정보</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="" id="detailStudyRoomForm">
					<%-- 				<input type="hidden" name="seatNo" value="${seatList.seatNo}" readonly="readonly"> --%>
					<table class="table table-hover" id="curStrDetail">

					</table>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">이용내역</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">예약내역</button>
					<h5 class="modal-title" id="exampleModalLabel">이용내역</h5>
					<table class="table table-hover mt-20">
						<thead>
							<tr>
								<th>이용자</th>
								<th>입실시간</th>
								<th>퇴실시간</th>
							</tr>
						</thead>
						<tbody id="strList">

						</tbody>
					</table>
				</form>
			</div>
			<div class="container clearfix" style="width: fit-content;">
				<ul
					class="pagination pagination-circle pagination-3d pagination-light"
					id="pageUi">
					<%-- 					<ui:pagination paginationInfo = "${studyRoomPaginationInfo}" type="text" jsFunction="go_room" /> --%>
					<%-- 					<form:hidden path="searchRentStudyRoomVO.pageIndex" id="roomIndex"/> --%>
				</ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				<!-- 				<button type="button" class="btn btn-primary" onclick="modifySeat();"></button> -->
			</div>
		</div>
	</div>
</div>
<%-- <form:hidden path="tabType" id="tabType"/> --%>
<%-- </form:form> --%>
<script>
	// 페이지 이동 (페이징 처리 callback 함수)

	fnGoLink = function(currPage, pageSize, section) {

		fncListSearch();
	}

	function go_room(pageIndex) {
		getRoomList($("a[id="+$("#roomNo").val()+"]"),pageIndex);
	}

	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}

	function goModal(obj) {
		console.log(obj);
		var seatNo = $(obj).children("input[name=seatNo]").val();
		var storeCode = $(obj).children("input[name=storeCode]").val();
		// 		alert(storeCode);
		$("#seat_no").text(seatNo);
		$("#detailSeatForm input[name=seatNo]").val(seatNo);
		// 		$("#detailSeatForm input[name=seatUseable]").val($(obj).children("input[name=seatUseable]").val());
		$("#seatModal").modal();


		$.ajax({
			url : "seatList",
			method : "post",
			data : {
				seatNo : seatNo,
				storeCode : storeCode
			},
			success : function(data) {
				detailSeatList(data.seatList);
				currentDetail(data.currentDetailSeat);
			},
			error : function(xhr) {
				alert("error");
			}
		});
	}
	function detailSeatList(dsList) {
		var dslTb = "";
		console.log(dsList);
		if (dsList.length == 0) {
			var tr = "<tr><td colspan='3'><strong>해당내용이 없습니다.</strong></td></tr>"
			$("#dsList").html(tr);
		} else {
			for (var i = 0; i < dsList.length; i++) {
				var dsl = dsList[i];
				var seatIn = new Date(dsList[i].seatIn);
				if (dsList[i].seatOut != null) {
					var seatOut = new Date(dsList[i].seatOut);
					dslTb += "<tr><td>" + dsl.memId + "</td>" + "<td>"
							+ getFormatDate(seatIn) + "</td>" + "<td>"
							+ getFormatDate(seatOut) + "</td></tr>";
				} else if (seatOut == null) {
					dslTb += "<tr><td>" + dsl.memId + "</td>" + "<td>"
							+ getFormatDate(seatIn) + "</td>"
							+ "<td>미퇴실</td></tr>";
				}
			}
			$("#dsList").html(dslTb);
		}
	}

	function currentDetail(dsList) {
		console.log(dsList);
		var curDe = "";
		var seatIn = new Date(dsList.seatIn);
		if (dsList.seatOccufied == 0) {
			curDe += "<tr><th style='width:30px;'>좌석번호</th><td>"
					+ dsList.seatNo
					+ "</td><th style='width:30px;'>이용자</th> <td>"
					+ "-"
					+ "</td></tr> <tr> <th style='width:30px;'>좌석상태</th><td>이용가능</td> "
					+ " <th style='width:30px;'>이용시간</th><td>"
					+ dsList.seatTotalTime
					+ "</td></tr> <tr><th style='width:30px;'>입실시간</th><td>-</td></tr>"
			$("#curDetail").html(curDe);
		} else if (dsList.seatOccufied == 1) {
			curDe += "<tr><th style='width:30px;'>좌석번호</th><td>"
					+ dsList.seatNo
					+ "</td><th style='width:30px;'>이용자</th> <td>"
					+ dsList.memName
					+ "</td></tr> <tr> <th style='width:30px;'>좌석상태</th><td>이용중</td>"
					+ "<th>이용시간</th><td>" + dsList.seatTotalTime
					+ "</td></tr> <tr><th style='width:30px;'>입실시간</th><td>"
					+ getFormatDate(seatIn) + "</td></tr>"
			$("#curDetail").html(curDe);
		}

	}

	function goStr(obj,pageIndex) {
		$("#roomNo").val($(obj).attr("id"));
		getRoomList(obj,pageIndex);
	}
	function getRoomList(obj,pageIndex){
		if(!pageIndex) pageIndex = 1;
		var studyroomNo = $(obj).children("input[name=studyroomNo]").val();
		var storeCode = $(obj).children("input[name=storeCode]").val();
		var total = $(obj).children("input[name='totalCount']").val();
		$("#detailStudyRoomForm input[name=studyroomNo]").val(studyroomNo);
		$("#studyRoomModal").modal();

		var data = {
				studyroomNo : studyroomNo,
				storeCode : storeCode,
				pageIndex : pageIndex
			}
		
		console.log(data);
		 $.ajax({
			url : "seatList",
			method : "post",
			data : data,
			success : function(data) {
				studyRoomList(data.studyRoomList);
				set_paging(data.studyRoomPaginationInfo,"go_room","#pageUi");
			},
			error : function(xhr) {
				alert("error");
			}
		});
	}

	function studyRoomList(strList) {
		var strTb = "";
		console.log(strList);
		if (strList.length == 0) {
			var tr = "<tr><td colspan='3'><strong>해당내용이 없습니다.</strong></td></tr>"
			$("#strList").html(tr);
		} else {
			for (var i = 0; i < strList.length; i++) {
				var str = strList[i];
				var strIn = new Date(strList[i].studyroomIn);
				if (strList[i].studyroomOut != null) {
					var studyroomOut = new Date(strList[i].studyroomOut);
					strTb += "<tr><td>" + str.memId + "</td>" + "<td>"
							+ getFormatDate(strIn) + "</td>" + "<td>"
							+ getFormatDate(studyroomOut) + "</td></tr>";
				} else if (studyroomOut == null) {
					strTb += "<tr><td>" + str.memId + "</td>" + "<td>"
							+ getFormatDate(strIn) + "</td>"
							+ "<td>미퇴실</td></tr>";
				}
			}
			$("#strList").html(strTb);
		}
	}
</script>
