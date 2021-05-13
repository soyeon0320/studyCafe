<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<style>
	#pageUnitSelector {
		width: 120px;
	}
</style>			
				
<section>
	<form:form commandName="ticketFormVO" action="list" id="listForm" name="listForm" method="post">
		<form:hidden path="ticketVO.ticketNo" id="detailNo" />
		
		<main class="content mt-5">
		<div class="page-content d-flex flex pl-0 pr-0">
			<div class="d-flex flex">
				<aside class="sidebar sidebar-sm" id="mail-sidebar"
					style="width: 40%;">
					<div class="flex-column d-flex bg-white" style="height: auto;">
						<div class="b-b navbar">
							<h2>이용권 목록</h2>
						</div>
						<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: auto;">
							<div class="flex slim-scroll"
								style="overflow: hidden; width: auto; height: 100%;">
								<div class="slimScrollDiv">
									<div class="pt-10 ml-3 mr-3 float-right">
										<div class="btn-group dropdown">
											<form:select id="pageUnitSelector" cssClass="form-control" path="searchTicketVO.pageUnit" onchange="go_action('list');">
												<form:options items="${ticketFormVO.searchTicketVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/> 
											</form:select>		
											<form:select cssClass="form-control" path="searchTicketVO.searchCondition" onchange="go_action('list');">
												<form:options items="${statusList }" itemValue="codeId" itemLabel="codeIdNm" />
											</form:select>	
										</div>
										<a class="btn btn-info" href="javascript:OpenWindow('registForm','이용권 등록',800,600);" style="margin-left: 5px;"><i class="icon-ticket"></i><span> 상품등록</span></a>
									</div>
									<div class="pb-30">
										<table class="table table-hover table-mails mb-0">
											<thead>
												<tr align="center">
													<th>번호</th>
													<th width="30%">이용권 명</th>
													<th>가격</th>
													<th>판매여부</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty ticketList }">
													<tr>
														<td colspan="4" align="center">
															<strong>이용권이 존재하지 않습니다.</strong>
														</td>
													</tr>
												</c:if>
											
												<c:forEach items="${ticketList}" var="ticket">
													<tr onclick="getTicketInfoFn('${ticket.ticketNo}');" style="cursor: pointer;" align="center">
														<td>${ticket.ticketNo }</td>
														<td>${ticket.ticketName }</td>
														<td><fmt:formatNumber value="${ticket.ticketPrice }" />원</td>
														<c:choose>
															<c:when test="${ticket.ticketStatus eq 'Y'}">
																<td><span class="badge badge-text badge-teal mr-2 mb-2" style="color: white;">&nbsp;&nbsp;판매중&nbsp;&nbsp;</span></td>
															</c:when>
															<c:when test="${ticket.ticketStatus eq 'N'}">
																<td><span class="badge badge-text badge-danger mr-2 mb-2" style="color: white;">판매중지</span></td>
															</c:when>
														</c:choose>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="container clearfix" style="width: fit-content;">
									<ul class="pagination pagination-circle pagination-3d pagination-light">
										<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
									</ul>  
								</div>
							</div>
						</div>
					</div>
				</aside>
				<form:hidden path="searchTicketVO.pageIndex" id="pageIndex"/>
				</form:form>
				<!--inobx sidebar-->
				<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
					<div class="d-flex flex flex-column" style="height: auto;">
						<div class="navbar bg-white b-b">
						</div>
						<div class="portlet-body mt-15" align="center">
							<div class="fancy-title title-border title-center">
								<h5>이용권별 누적매출</h5>
							</div>
							<div>
								<div id="ticketchart" style="height: 200px;">
									<!-- 그래프 들어갈곳 -->
								</div>
							</div>
						</div>
						
						<div class="portlet-body mt-30 ml-2"  id="detailDiv" align="center" style="display: none;">
							<form action="modify" id="ticketModifyForm" method="post">
								<div class="fancy-title title-border title-center">
									<h5>이용권 정보 변경</h5>
								</div>
								<table class="table table-bordered mb-0">
									<tbody>
										<tr>
											<th width="15%">이용권코드</th>
											<td width="35%">
												<input type="text" class="form-control form-control-sm" name="ticketNo" id="ticketNo" readonly="readonly">
											</td>
											<th width="15%">이용권 명</th>
											<td width="35%">
												<input type="text"  class="form-control form-control-sm" id="ticketName" name="ticketName">
											</td>
										</tr>
										<tr>
											<th>금액</th>
											<td>
												<input type="text"  class="form-control form-control-sm" id="ticketPrice" name="ticketPrice">
											</td>
											<th>종류</th>
											<td>
												<input type="text" class="form-control form-control-sm" name="ticketKind" id="ticketKind" readonly="readonly">											
											</td>
										</tr>
										<tr>
											<th>시간</th>
											<td>
												<input type="number" id="ticketTime2" class="form-control form-control-sm" >
												<input type="hidden" id="resultTime" class="form-control form-control-sm" name="ticketTime">
											</td>
											<th>판매여부</th>
											<td>
												<div class="form-check form-check-inline">
													<input class="form-check-input required" type="radio" name="ticketStatus"id="ticketStatusYES" value="Y">
													<label class="form-check-label nott" for="ticketStatusYES">판매중</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="ticketStatus"id="ticketStatusNO" value="N">
													<label class="form-check-label nott" for="ticketStatusNO">판매중지</label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div>
									<button type="button" class="btn btn-secondary mt-10 float-right" onclick="modify_go();">수정완료</button>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!--chat content-->
			</div>
		</div>
		</main>

</section>
<script>
window.onload=function(){
	
	new Morris.Bar({
	
	    // ID of the element in which to draw the chart.
	
	    element: 'ticketchart',
	
	    // Chart data records -- each entry in this array corresponds to a point on
	
	    // the chart.
	
	    data: [
			<c:forEach items="${salesByTicket }" var="sale">
				{ x: '${sale.ticketName }'
				, y: '${sale.ticketTime }'
				},
			</c:forEach>
	    ],
	    barColors: [
	        '#347ae3',
	        '#7dc835',
	      ],
	    xkey: 'x',
	    ykeys: 'y',
	    labels: ['이용권매출(개)'],
		parseTime: false
	});
}

var ticket_No = "";

function getTicketInfoFn(ticketNo){
// 	alert(ticketNo);

	var data = {"ticketNo" : ticketNo};
	
	$.ajax({
		url : "<c:url value='/ticket/modifyForm'/>"
		,type : "post"
		,data : data
		,success : function(data){
			$("#detailDiv").css("display", "");
			setTicket(data.ticket);
		}
		,error : function(error){
			console.log("error : " + error);
		}		
		
	});
}

function setTicket(ticket){
	ticket_No = ticket.ticketNo;
	$("#ticketNo").val(ticket.ticketNo);
	$("#ticketName").val(ticket.ticketName);
	$("#ticketPrice").val(ticket.ticketPrice.toLocaleString());
	$("#ticketKind").val(ticket.ticketKind);
	
	var time = parseInt(ticket.ticketTime);
	var ticketTime = time/60;
	$("#ticketTime2").val(ticketTime);
	
	$("input[name='ticketStatus']:radio[value='"+ticket.ticketStatus+"']").attr('checked', true);
}

function modify_go(){
	var time2 = parseInt($("#ticketTime2").val());
	var resultTime = time2 * 60 ;
	$("#resultTime").val(resultTime);
	console.log("resultTime : "+ resultTime);
	
	var form = $("#ticketModifyForm");
	$.ajax({
		url : "<c:url value='/ticket/modify'/>"
		,type : "post"
		,data: form.serialize()
		,success : function(data){
			alert("이용권 정보변경 완료되었습니다.");
			window.location.reload();
		}
		,error : function(error){
			console.log(error);
		}		
	});
	
	
}



</script>
