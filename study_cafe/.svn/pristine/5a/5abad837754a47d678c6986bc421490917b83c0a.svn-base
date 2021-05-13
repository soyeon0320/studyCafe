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
	background-color: #e5f2ff;
}

td.seatE.seatUse1, td.seatN.seatUse1, td.seatW.seatUse1, td.seatS.seatUse1
	{
	background-color: #3471b4;
}
td.seatE.seatUse0.seatUseableN, td.seatN.seatUse0.seatUseableN, td.seatW.seatUse0.seatUseableN, td.seatS.seatUse0.seatUseableN{
	background-color: #fa625e;
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
	<div class="col-sm-12 mt-30">
		<div style="padding: 10px; float: left;" class="col-sm-6">
			<fmt:parseNumber var="x" type="number" value="${store.STORE_WIDTH }" />
			<fmt:parseNumber var="y" type="number" value="${store.STORE_HEIGHT }" />
			<div style="display: block;">
				<h3 align="center" style="display: inline;">현재 좌석 현황 ${owner.storeCurrentSeat}/${owner.storeTotalSeat }</h3>
			</div>
			<div class="portlet-box portlet-shadow  mb-30">
				<div class="portlet-body mt-15">
					<table align="center">
						<tr>
							<th style="background-color: #e5f2ff; width: 50px;"></th>
							<td>미사용</td>
							<th style="background-color: #3471b4; width: 50px;"></th>
							<td>이용중</td>
							<th style="background-color: #fa625e; width: 50px;"></th>
							<td style="width: 60px;">사용불가</td>
						</tr>
					</table>
					<br>
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
										<td id="seat${seat.seatNo }" onclick="goModal(this);" class="seat${seat.seatDirection } seatUse${seat.seatOccufied} seatUseable${seat.seatUseable}"
											ondrop="dropToExchange(event);" ondragover="allowDrop(event);" ondragstart="drag(event);" draggable="true">
											
											<input type="hidden" name="seatLocation" value="${location }">
											<input type="hidden" name="seatNo" value="${seat.seatNo }">
											<input type="hidden" name="seatUseable" value="${seat.seatUseable }"> 
											<input type="hidden" name="seatInfo" value="${seat.seatInfo }"> 
											<input type="hidden" name="isModified" value=""> 
											<input type="hidden" name="seatDirection" value="${seat.seatDirection }"> 
											<input type="hidden" name="storeCode" value="${seat.storeCode }"> 
											<strong>${seat.seatNo }</strong>
											
											<c:set var="listCnt" value="${listCnt + 1 }" /> 
											<c:set var="seat" value="${locatedList[listCnt] }" />
											
										</td>
									</c:if>
									<c:set var="location" value="${location + 1 }" />
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	
		<div class="col-sm-6" style="float: right;padding: 10px;">
			<h3 align="center" style="display: inline;">스터디룸 이용 현황 ${owner.storeCurrentRoom}/${owner.storeTotalRoom }</h3>
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-body" style="height: 831px;margin-top:15px;">
					<div style="float: right;">
						<ul class="nav mb-10">
							<li>
								<i class="icon-calendar3" style="font-size: x-large;padding-right: 5px;"></i>
							</li>
							<li class="nav-item">
								<form:form commandName="rentStudyRoomVO" class="form-inline" autocomplete="off" method="get" action="seatList" id="searchForm">
									<div>
										<form:input type="text" id="date_timepicker_start" class="form-control form-control-sm" placeholder="~부터"  path="searchReservStart"/>
										<form:input type="text" id="date_timepicker_end"  class="form-control form-control-sm"   placeholder="~까지"  path="searchReservEnd"/>
									</div>
									<form:select path="searchCondition" onchange="javascript:$('#searchForm').submit();" class="form-control form-control-sm" style="height: 32px !important;margin-right: 5px;margin-left: 5px;">
										<option value="">--전체--</option>
										<form:options items="${studyRoom}" itemValue="studyroomNo" itemLabel="studyroomLabel" />
									</form:select>
									<input class="btn btn-info btn-xs"  type="submit" onclick="" value="검색" style="margin: 0px; "/>
									<input type="hidden" value=1 name="pageIndex" id="pageIndex" />
								</form:form>	
							</li>
						</ul>
					</div>	
					
					<div style="clear: both;" class="row mb-15">	
						<c:forEach items="${studyRoom}" var="room">
							<div class="col-3">
								<div class="border1 p-2 rounded bg-white">
									<div class="p-1" style="text-align: center; cursor: pointer;" onclick="javascript:$('#searchCondition').val(${room.studyroomNo});$('#searchForm').submit();">
										<h3 class="fs16 text-dark">${room.studyroomName} (${room.studyroomCapa })인</h3>
										<c:if test="${room.studyroomOcup == 0}">
											<span class="d-block bg-success">이용가능</span>
										</c:if>
										<c:if test="${room.studyroomOcup > 0}">
											<span class="d-block bg-info">이용중</span>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<table class="table table-bordered table-hover" >
						<thead align="center" style="background-color: #f9f9f9; font-size: smaller;">
							<tr >
								<th>예약번호</th>
								<th>스터디룸(정원)</th>
								<th>예약일</th>
								<th>등록일</th>
								<th>회원ID</th>
							</tr>
						</thead>
						<tbody style="cursor: pointer;" align="center">
							<c:forEach items="${reservList}" var="reserv">
								<tr>
									<td>${reserv.studyroomReservNo }</td>
									<td>${reserv.studyroomName }(${reserv.studyroomCapa })</td>
									<td>
										<fmt:formatDate value="${reserv.studyroomReservStart}" pattern="MM/dd일 HH"/><fmt:formatDate value="${reserv.studyroomReservEnd}" pattern="~HH시"/>
									</td>
									<td><fmt:formatDate value="${reserv.studyroomReservDate}" pattern="MM/dd HH:mm"/></td>
									<td>${reserv.memId }</td>
								</tr>
							</c:forEach>
							<c:if test="${reservList.size() == 0}">
								<tr>
									<td colspan="5">예약 내역이 없습니다.</td>
								</tr>								
							
							</c:if>
							
						</tbody>			
					</table>

					<div class="container clearfix" style="width: fit-content;">
						<ul class="pagination pagination-circle pagination-3d pagination-light">
							<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="set_pageIndex" />
						</ul>    
					</div>    
					<input type="hidden" id="pageIndex"/>
				</div>
				
			</div>
		</div>
	</div>
	<!-- col 12 -->
	
	
</section>
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
				<div class="container clearfix" style="width: fit-content;">
					<ul class="pagination pagination-circle pagination-3d pagination-light" id="seatPage">
					
					</ul>    
				</div>
				<input type="hidden" id="seatListPageIndex" value=1> 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<script>
	
	window.addEventListener("load",function(){
		setPicker();
	});

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
		var pageIndex = $("#seatListPageIndex").val();
		
		$("#seat_no").text(seatNo);
		$("#detailSeatForm input[name=seatNo]").val(seatNo);
		$("#seatModal").modal();


		$.ajax({
			url : "seatList",
			method : "post",
			data : {
				seatNo : seatNo,
				storeCode : storeCode,
				pageIndex : pageIndex
			},
			success : function(data) {
				detailSeatList(data.seatList);
				currentDetail(data.currentDetailSeat);
				
				set_paging(data.paginationInfo, 'go_seatPage', '#seatPage');
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
			var tr = "<tr><td colspan='3' style='text-align:center;'><strong>해당내용이 없습니다.</strong></td></tr>"
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
				} else if (dsl.seatOut == null) {
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
		}else{
			curDe += "<tr><th style='width:30px;'>좌석번호</th><td>"
				   + dsList.seatNo
				   + "</td><th style='width:30px;'>이용자</th><td>"
				   + "-"
				   + "</td></tr> <tr> <th style='width:30px;'>좌석상태</th><td>사용불가</td>"
				   + "<th>이용시간</th><td> - "
				   + "</td></tr> <tr><th style='width:30px;'>입실시간</th><td>"
				   + "- </td></tr>"
			$("#curDetail").html(curDe);	   
		}
	}
	
	
	function setPicker(){
		$(function(){
			$('#date_timepicker_start').datetimepicker({
				format:'Y/m/d',
				onShow:function( ct ){
					this.setOptions({
					maxDate:$('#date_timepicker_end').val()?$('#date_timepicker_end').val():false
					});
				},
				timepicker:false
			});
			
			$('#date_timepicker_end').datetimepicker({
				format:'Y/m/d',
				onShow:function( ct ){
				this.setOptions({
						minDate:$('#date_timepicker_start').val()?$('#date_timepicker_start').val():false
					});
				},
				timepicker:false
			});
		});
	}
	
	function set_pageIndex(pageIndex){
		$("#pageIndex").val(pageIndex);
		$("#searchForm").submit();
	}
	
	function go_seatPage(pageIndex){
		$("#seatListPageIndex").val(pageIndex);
		goModal(obj);
	}
	
</script>
