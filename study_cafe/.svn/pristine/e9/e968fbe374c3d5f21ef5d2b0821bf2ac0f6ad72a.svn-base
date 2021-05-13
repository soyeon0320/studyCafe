<%@page import="java.util.Collections"%>
<%@page import="kr.co.scm.store.vo.SummaryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<style>
#pageUnitSelector {
	width: 120px;
}


table th {
	text-align: center;
}

#rentTable td,th {
	padding-bottom: 4px;
	padding-top: 4px;
}
#rentTable th {
	padding-bottom: 4px;
	padding-top: 4px;
}

td.td-title{
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
	max-width: 200px;
}
</style>
<section>
	<form:form commandName="storeFormVO" action="list" id="listForm" name="listForm" method="post">
		<form:hidden path="searchStoreVO.pageUnit" />
		<main class="content mt-5">
		<div class="page-content d-flex flex pl-0 pr-0">
			<div class="d-flex flex">
				<aside class="sidebar sidebar-sm" id="mail-sidebar"
					style="width: 30%;">
					<div class="flex-column d-flex bg-white" style="height: auto;">
						<div class="b-b navbar">
							<h2>매장검색</h2>
						</div>
						<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: auto;">
							<div class="flex slim-scroll"
								style="overflow: hidden; width: auto; height: 100%;">
								<div class="slimScrollDiv">
									<div class="pt-10 ml-3">
										<div class="row">
											<form:select path="searchStoreVO.addrDonmCode"
												cssClass="form-control col-md-3"
												onchange="getSigugunFn(this.value);">
												<option value="">시/도</option>
												<form:options items="${donmList}" itemValue="addrDonmCode"
													itemLabel="addrDonmName" />
											</form:select>
											<form:select path="searchStoreVO.addrSigugunCode"
												cssClass="form-control col-md-3" id="sigugunList">
												<option value="">시/구/군</option>
											</form:select>
											<div class="input-group row col-md-6">
												<form:input path="searchStoreVO.searchKeyword" type="text"
													name="searchStoreVO.searchKeyword"
													cssClass="form-control col-md-8"
													placeholder="가맹점명을 입력해주세요." />
												<span class="input-group-append">
													<button class="btn btn-icon btn-info" type="button"
														id="searchStoreVO.searchKeyword"
														name="searchStoreVO.searchKeyword" onclick="searchFn()">
														<i class="fa fa-fw fa-search"></i><span>검색</span>
													</button>
												</span>
											</div>
										</div>
									</div>
									<div class="pb-30">
										<table class="table table-hover table-mails mb-0">
											<thead>
												<tr align="center">
													<th>No</th>
													<th>가맹점명</th>
													<th>주소</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty storeList }">
													<tr>
														<td colspan="2" align="center"><strong>결과가
																존재하지 않습니다.</strong></td>
													</tr>
												</c:if>
												<c:forEach items="${storeList}" var="store" varStatus="stat">
													<tr style="cursor: pointer;" onclick="getStoreInfoFn('${store.storeCode}')" align="right">
														<td>${stat.count}</td>
														<td>${store.storeName}</td>
														<td class="td-title">${store.storeAddr}</td>
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
				<form:hidden path="searchStoreVO.pageIndex" id="pageIndex"/>
				</form:form>
				<!--inobx sidebar-->
				<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
					<div class="d-flex flex flex-column" style="height: auto;">
						<div class="navbar bg-white b-b">
							<h2>매장 상세 조회</h2>
						</div>
						<div class="portlet-body pt-2 pb-2 pl-3 pr-3" id="detailDiv"
							style="display: none;">
							<div class="row">
								<div class="col-xl-4" align="center">
									<div id="testDonut" style="height: 200px;">
										<!-- 차트위치 -->
									</div>
									<h6>고객의 소리 현황</h6>
								</div>
								
								<div class="col-xl-4" class="col-xl-4" align="center">
									<div id="testChart"  style="height: 200px;">
									<!-- 그래프 위치 -->
									</div>
									<h6>주간 고객 방문현황</h6>
								</div>
								<div class="col-xl-4" align="center">
									<div id="testBar"  style="height: 200px;">
									<!-- 그래프 위치 -->
									</div>
									<h6>일별 매출</h6>								
								</div>
							</div>
							<table class="table table-bordered mb-0">
								<tbody>
									<tr>
										<th width="15%">가맹점코드</th>
										<td width="35%" id="storeCode"></td>
										<th width="15%">가맹점명</th>
										<td width="35%%" id="storeName"></td>
									</tr>
									<tr>
										<th>가맹점주명</th>
										<td id="ownerName"></td>
										<th>전화번호
										</td>
										<td id="storePhone"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td id="storeAddr"></td>
										<th>이메일</th>
										<td id="ownerEmail"></td>
									</tr>
									<tr>
										<th>좌석 수</th>
										<td id="storeTotalSeatPrint"></td>
										<th>스터디룸 수</th>
										<td  id="studyroomCapaPrint"></td>
									</tr>
									<tr>
										<th>계약시작일</th>
										<td id="affiliateRegStartDate"></td>
										<th>계약종료일</th>
										<td  id="affiliateRegEndDate"></td>
									</tr>
								</tbody>
							</table>
							<!-- 렌탈기기 목록 -->
							<div class="mt-20">
								<h5>렌탈기기 목록</h5>
							</div>
							<div class="portlet-body mt-5">
								<table class="table table-hover col-md-12" id="rentTable">
									<thead>
										<tr align="center">
											<th>no</th>
											<th>제조사</th>
											<th>기기명</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody id="storeEquipPrint">
									</tbody>
								</table>
								<div class="container clearfix" style="width: fit-content;">
									<ul class="pagination pagination-circle pagination-3d pagination-light" id="equipPagination">
										<!-- 페이징 생기는곳 -->
									</ul>
								</div>
								<input type="hidden" name="pageIndex" value="1" id="equipPageIndex">
							</div>
						</div>
					</div>

				</div>
				<!--chat content-->
			</div>
		</div>
		</main>

	<input type="hidden" id="label1"> <input type="hidden" id="label2"> <input type="hidden" id="label3"> 
	<input type="hidden" id="value1"> <input type="hidden" id="value2"> <input type="hidden" id="value3">


</section>

<script>
var storeCodeParam = "";

function getSigugunFn(param) {
	var data = {
		"addrDonmCode" : param
	};
	
	$.ajax({
		url:"<c:url value='/storeEquip/sigugun'/>",
		type:"post",
		data:data,
		success:function(data) {
			setSigugunFn(data.sigugunList);
		}
	});
}

function setSigugunFn(sigugunList) {
	var str = "<option value=''>시/구/군</option>";
	$.each(sigugunList, function(idx, item) {
		
		str += "<option value=" + item.addrSigugunCode + ">" + item.addrSigugunName + "</option>";
	});
	
	$("#sigugunList").html(str);
}

function searchFn() {
	$("form[name='listForm']").submit();
}

function getStoreInfoFn(storeCode) {
	var data = {
		"storeCode" : storeCode
		,"pageIndex" : $("#reviewPageIndex").val()
	}	
	
	$.ajax({
		url : "<c:url value='/storeEquip/detail'/>"
		,type : "post"
		,data : data
		,success : function(data){
			$("#detailDiv").css("display", "");
			storeCodeParam = data.store.storeCode;
			setStoreInfo(data.store);
			getStoreEquipInfoFn();
			
			myChart(data);
		}
	});
	
}


function setStoreInfo(store) {
	$("#storeCode").html(store.storeCode);
	$("#storeName").html(store.storeName);
	$("#ownerName").html(store.ownerName);
	$("#storePhone").html(store.storePhone);
	$("#storeAddr").html(store.storeAddr);
	$("#ownerEmail").html(store.ownerEmail);
	$("#storeTotalSeatPrint").html(store.storeTotalSeat);
	$("#studyroomCapaPrint").html(store.studyroomCapa);
	$("#affiliateRegStartDate").html(getTimeStamp(store.affiliateRegStartDate).substr(0,10));
	$("#affiliateRegEndDate").html(getTimeStamp(store.affiliateRegEndDate).substr(0,10));
}


function setStoreEquipInfo(equipList) {
	$("#storeEquipPrint").empty();
	
	if(equipList.length > 0) {
		$.each(equipList, function(idx, item) {
			var table = $("<tr align='center'></tr>");
			$(table).append("<td>" + item.rnum + "</td>");
			$(table).append("<td>" + item.equipManufacture + "</td>");
			$(table).append("<td>"+ item.equipName + "</td>");
			$(table).append("<td>"+ item.equipCnt + "</td>");
			$(table).append("<td>"+item.equipRentPrice.toLocaleString()+"원</td>");
			$("#storeEquipPrint").append(table);
		});
	}else {
		$("#storeEquipPrint").html("<tr> <td colspan='4'> 데이터가 존재하지 않습니다. </td> </tr>");
	}
}


function getStoreEquipInfoFn() {
	var data = {
		"storeCode" : storeCodeParam,
		"pageIndex" : $("#equipPageIndex").val()
	};
	
	$.ajax({
		url:"<c:url value='/storeEquip/equip/paging'/>",
		type:"post",
		data:data,
		success:function(data) {
			setStoreEquipInfo(data.equipList);
			set_paging(data.paginationInfo, "page_equip", "#equipPagination");
		}
	});
}


function page_equip(pageIndex) {
	$("#equipPageIndex").val(pageIndex);
	getStoreEquipInfoFn();
}


function setChartData(vocStatic){
	var num =1;
	
	
	for (var voc of vocStatic) {
		var label = '#label' + num;
		var value = "#value" + num;
		$(label).val(voc.VOC_KIND);
		$(value).val(voc.VOC_KIND_CNT);

		
		console.log("voc : " + voc.VOC_KIND);
		console.log("voc : " + voc.VOC_KIND_CNT);
		num ++;
	}
	
}




function myChart(dataList){
	$("#testChart").empty();
	$("#testDonut").empty();
	$("#testBar").empty();
	
	var data = [];
	
	for (var i = 0; i < dataList.weeklySummary.length; i++) {
		var week = 	dataList.weeklySummary[i];
		data.push({x:getTimeStamp(week.day).substr(5,5), y:week.usingCnt});
	}
	
	
	Morris.Line({
	    element: 'testChart',
	    data:data,
	      xkey: 'x',
	      ykeys: 'y',
	      labels: ['명'],
	      parseTime: false,
	});
	
	
 	var data=[];
 	
	for (var i = 0; i < dataList.vocStatic.length; i++) {
		var voc = 	dataList.vocStatic[i];
		data.push({label:voc.VOC_KIND, value:voc.VOC_KIND_CNT});
	}
	
	Morris.Donut({
		element:'testDonut',
	    data: data,
	    colors: [
	      'red',
	      '#28a745',
	      'gold',
	    ],
	    formatter: function (x) { return x + "개"; }
	});
	
	
 	var data=[];
 	
	for (var i = 0; i < dataList.dailySalesByType.length; i++) {
		var day = 	dataList.dailySalesByType[i];
		data.push({d:getTimeStamp(day.day).substr(5,5), x:day.seatSales*50, y:day.studyroomSales,z:day.equipSales});
	}
	
	Morris.Bar({
	    element: 'testBar',
	    data:data,
	    barColors: [
	        '#347ae3',
	        '#7dc835',
	        '#69c1e6',
	      ],
	    xkey: 'd',
	    ykeys: ['x','y','z'],
	    labels: ['좌석매출(원)','스터디룸매출(원)','교육기기매출(원)'],
		stacked: true
	});
}

</script>
