<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>


<div class="row mt-20">    
	<div class="col-12">
		<div class="row">
			<div class="col-6">
<!-- 				<div class="title-block mb-20"> -->
<!-- 					<h3 style="width: fit-content;display: inline;">매출순위</h3>  -->
<!-- 					<span style="font-size: small;">최근 1년간 매출 상·하위 5위 지점의 통계입니다.</span> -->
					
<!-- 				</div> -->
				<div class="portlet-box portlet-shadow  mb-30" >
					<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
						<div class="flex d-flex flex-column">
							<h3 style="">월간 가맹점 이용자수 순위</h3>
						</div>
					</div>
					
					<div class="portlet-body">
						<div id="userRanking">
								<table class="table">
									<colgroup>
										<col width="16%">
										<col width="*">
										<col width="30%">
									</colgroup>
									<thead align="center" style="background-color: #dee4e936;">
										<tr>
											<th>순위</th>
											<th>매장명</th>
											<th>이용자 수(명)</th>
										</tr>
									</thead>
									<tbody class="ranking-body" align="center">
										<c:forEach items="${rankingStoreList }" var="store" varStatus="x" begin="0" end="5" >
											<tr>
												<td>${store.rnum }</td>
												<td>${store.storeName }</td>
												<td>${store.useCnt }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div>
			<!-- 					<div id="SalesHighStorechart" style="height: 250px;"></div> -->
							</div>
						</div>
				</div>
			</div>
			<div class="col-6">	
				<div class="portlet-box portlet-shadow  mb-30" >
					<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
						<div class="flex d-flex flex-column">
							<h3 style="">전체 이용수</h3>
						</div>
					</div>
					
					<div class="portlet-body" style="min-height: 400px;">
<!-- 				<div class="title-block mb-20"> -->
<!-- 					<h3 style="width: fit-content;display: inline;">구매금액상위회원</h3> -->
<!-- 					<span style="font-size: small;">최근 1년간 매출 상위 회원리스트입니다.</span> -->
<!-- 				</div> -->
						<div>
	<!-- 					<div id="SalesLowStorechart" style="height: 260px;"></div> -->
							<div id="totalUse" ></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-6">
				<div class="portlet-box portlet-shadow  mb-30" >
					<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
						<div class="flex d-flex flex-column">
							<h3 style="width: fit-content;display: inline;">월별 매출 통계
							</h3> 
						</div>
							<span style="font-size: small; width: content-fit; text-align: left; margin-right: 10px;">최근 1년간 월별 매출 통계입니다.</span>
							<span style="text-align: right;"><button class="btn btn-info" onclick="go_excel();">엑셀 다운로드</button></span>
					</div>
					
					<div class="portlet-body" style="min-height: 300px;">
						<div id="monthlychart" style="height: 250px;"></div>
					</div>
				</div>
			</div>
			<div class="col-6">	
				<div class="portlet-box portlet-shadow  mb-30">
					<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
						<div class="flex d-flex flex-column">
							<h3 style="width: fit-content;display: inline;">일별 매출 통계</h3>
						</div>
						<span style="font-size: small; width: content-fit; text-align: left; margin-right: 10px;">최근 1달간 일별 매출 통계입니다.</span>
					</div>
					<div class="portlet-body" style="min-height: 300px;">
						<div id="dailychart" style="height: 260px;"></div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-md-4">
				<div class="portlet-box portlet-shadow  mb-30">
					<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
						<div class="flex d-flex flex-column">
							<h3>이용권별 누적매출</h3>
						</div>
					</div>
					<div class="portlet-body" style="min-height: 300px;">
						<div id="prod-chart" style="height: 280px;"></div>
					</div>
				</div>
			</div>
		
			<div class="col-md-8">
				<div class="portlet-box portlet-shadow  mb-30">
					<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
						<div class="flex d-flex flex-column">
							<h3 style="width: fit-content;display: inline;">일간 서비스이용 현황</h3>
						</div>
						<span style="font-size: small;">최근 1달간 일별 서비스이용 통계입니다.</span>
						<span><button class="btn btn-info" onclick="go_excel();">엑셀 다운로드</button></span>
					</div>
					<div class="portlet-body" style="min-height: 300px;">
						<div id="time-chart" style="height: 280px;"></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
<!-- 	<div class="col-4"> -->
<!-- 		<h3 style="width: fit-content;display: inline;">일별  매출내역</h3> -->
<!-- 		<span style="font-size: small;">최근 1달간 일별 매출 내역입니다.</span> -->
<!-- 		<table class="container" border="1" style="margin: 10px 0px;"> -->
<!-- 			<thead> -->
<!-- 				<tr align="center"> -->
<!-- 					<th width="25%">날짜</th> -->
<!-- 					<th width="18%">이용권매출</th> -->
<!-- 					<th width="18%">공급물품매출</th> -->
<!-- 					<th width="21%">합계</th> -->
<!-- 					<th width="18%">이용회원수</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach items="${dailySalesByTypeDesc }" var="sale"> --%>
<!-- 				<tr> -->
<%-- 					<td align="center"><p class="m-0">20<fmt:formatDate value="${sale.day }" pattern="yy년 MM월 dd일" /></p></td> --%>
<%-- 					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.seatSales }" />원 </td> --%>
<%-- 					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.studyroomSales }" />원 </td> --%>
<%-- 					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.equipSales }" />원 </td> --%>
<%-- 					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.seatSales + sale.studyroomSales + sale.equipSales }" />원 </td> --%>
<!-- 				</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
	
<!-- 	</div>  -->

</div>

<script>
function go_excel(){
	
	location.href="<%=request.getContextPath()%>/store/downExcel";
	
	
}


Morris.Line({
	  element: 'totalUse',
	  data: [
		  <c:forEach items="${totalUseForYear}" var="data" varStatus="status">
			  { y:'<fmt:formatDate value="${data.month  }" pattern="MM"/>월', b : ${data.useCnt } }
			  <c:if test="${!status.last }">,</c:if>
		  </c:forEach>
		  ],
		  xkey: 'y',
		  ykeys: 'b',
		  labels: ['이용수(명)'],
		  parseTime: false
});

</script>


<script>


//라인 차트

new Morris.Bar({

    // ID of the element in which to draw the chart.

    element: 'monthlychart',

    // Chart data records -- each entry in this array corresponds to a point on

    // the chart.

    data: [

    	<c:forEach items="${monthlySales }" var="sale">
		{ d:
			'20<fmt:formatDate value="${sale.period }" pattern="yy-MM-dd" />'
		, x: '${sale.ticketSales }'
		, y: '${sale.prodSales }'
		},
	 
		</c:forEach>
	 

    ],

    barColors: [
        '#347ae3',
        '#7dc835',
      ],
    xkey: 'd',
    ykeys: ['x','y'],
    labels: ['이용권매출(원)','공급물품매출(원)'],
	stacked: true

});



new Morris.Bar({

    // ID of the element in which to draw the chart.

    element: 'dailychart',

    // Chart data records -- each entry in this array corresponds to a point on

    // the chart.

    data: [
		<c:forEach items="${dailySales }" var="sale">
			{ d:
				'20<fmt:formatDate value="${sale.period }" pattern="yy-MM-dd" />'
			, x: '${sale.ticketSales }'
			, y: '${sale.prodSales }'
			},
		 
		</c:forEach>
        

    ],
    barColors: [
        '#347ae3',
        '#7dc835',
      ],
    xkey: 'd',
    ykeys: ['x','y'],
    labels: ['이용권매출(원)','공급물품매출(원)'],
	stacked: true
    

});


// var total = ${salesByType.seat*50 + salesByType.studyroom + salesByType.eqiup}/100;
// var seat
// var studyroom
// var s

// 도넛 차트

Morris.Donut({

    element: 'prod-chart',

    data: [
    	
		<c:forEach items="${salesByTicket }" var="ticket">
        { label: "${ticket.ticketName}", value: '${ticket.ticketTime}' },
		
		</c:forEach>
		
        
    ],
//     colors: [
//       '#347ae3',
//       '#7dc835',
//       '#69c1e6',
//     ],
    
    formatter: function (x) { return x + "개"; }

});


Morris.Bar({

    element: 'time-chart',

    data: [
    	<c:forEach items="${dailyCnt }" var="cnt">
    	{ d:
			'20<fmt:formatDate value="${cnt.period }" pattern="yy-MM-dd" />'
		, x: '${cnt.seatUse }'
		, y: '${cnt.studyroomUse }'
		, z: '${cnt.equipUse }'
		},
	 
		</c:forEach>
      ],
      xkey: 'd',
      ykeys: ['x', 'y', 'z'],
      labels: ['좌석이용(명)', '스터디룸이용(명)','교육기기이용(명)'],
      stacked: true

});





</script>