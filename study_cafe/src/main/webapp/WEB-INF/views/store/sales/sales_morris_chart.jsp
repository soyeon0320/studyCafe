<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>


<div class="row">    
	<div class="col-8">
		<div class="title-block mb-20">
			<h3 style="width: fit-content;display: inline;">월별 매출 통계</h3> 
			<span style="font-size: small;">최근 1년간 월별 매출 통계입니다.</span>
			<span><button class="btn btn-info" onclick="go_excel();">엑셀 다운로드</button></span>
		</div>
		<div>
			<div id="monthlychart" style="height: 250px;"></div>
		</div>
		
		<div class="title-block mb-20">
			<h3 style="width: fit-content;display: inline;">일별 매출 통계</h3>
			<span style="font-size: small;">최근 1달간 일별 매출 통계입니다.</span>
		</div>
		<div>
			<div id="dailychart" style="height: 260px;"></div>
		</div>
		
		<div class="row">
			<div class="col-md-4">
				<div class="fancy-title title-border title-center">
					<h3>상품별 누적매출</h3>
				</div>
				<div>
					<div id="prod-chart" style="height: 260px;"></div>
					
				</div>
			</div>
		
			<div class="col-md-8">
				<div class="fancy-title title-border title-center">
					<h3>시간대별 입퇴실현황</h3>
				</div>
				<div>
					<div id="time-chart" style="height: 280px;"></div>
				</div>
			</div>
		
		
		</div>
	</div>
	
	<div class="col-4">
		<h3 style="width: fit-content;display: inline;">일별  매출내역</h3>
		<span style="font-size: small;">최근 1달간 일별 매출 내역입니다.</span>
		<table class="container" border="1" style="margin: 10px 0px;">
			<thead>
				<tr align="center">
					<th width="25%">날짜</th>
					<th width="18%">좌석매출</th>
					<th width="18%">스터디룸매출</th>
					<th width="18%">교육기기매출</th>
					<th width="21%">합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dailySalesByTypeDesc }" var="sale">
				<tr>
					<td align="center"><p class="m-0">20<fmt:formatDate value="${sale.day }" pattern="yy년 MM월 dd일" /></p></td>
					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.seatSales }" />원 </td>
					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.studyroomSales }" />원 </td>
					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.equipSales }" />원 </td>
					<td align="right" style="padding-right: 5px;"><fmt:formatNumber value="${sale.seatSales + sale.studyroomSales + sale.equipSales }" />원 </td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div> 

</div>

<script>
function go_excel(){
	
	location.href="<%=request.getContextPath()%>/store/downExcel";
	
	
}

</script>


<script>


//라인 차트

new Morris.Line({

    // ID of the element in which to draw the chart.

    element: 'monthlychart',

    // Chart data records -- each entry in this array corresponds to a point on

    // the chart.

    data: [

    	<c:forEach items="${monthlySalesListBySeat }" var="sale">
		{ 'period':
			'20<fmt:formatDate value="${sale.seatOut }" pattern="yy-MM" />'
		, count: '${sale.seatTotalTime }'
		},
	 
	</c:forEach>

    ],

    // The name of the data record attribute that contains x-values.

    xkey: 'period',

    // A list of names of data record attributes that contain y-values.

    ykeys: ['count'],

    // Labels for the ykeys -- will be displayed when you hover over the

    // chart.

    labels: ['월별매출(원)']

});

//라인 차트

new Morris.Bar({

    // ID of the element in which to draw the chart.

    element: 'dailychart',

    // Chart data records -- each entry in this array corresponds to a point on

    // the chart.

    data: [
		<c:forEach items="${dailySalesByType }" var="sale">
			{ d:
				'20<fmt:formatDate value="${sale.day }" pattern="yy-MM-dd" />'
			, x: '${sale.seatSales }*50'
			, y: '${sale.studyroomSales }'
			, z: '${sale.equipSales }'
			},
		 
		</c:forEach>
        

    ],
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


// var total = ${salesByType.seat*50 + salesByType.studyroom + salesByType.eqiup}/100;
// var seat
// var studyroom
// var s

// 도넛 차트

Morris.Donut({

    element: 'prod-chart',

    data: [
    	

        { label: "좌석", value: ${salesByType.seat}*50 },

        { label: "스터디룸", value: ${salesByType.studyroom}},

        { label: "교육기기", value: ${salesByType.eqiup} },
        
    ],
    colors: [
      '#347ae3',
      '#7dc835',
      '#69c1e6',
    ],
    
    formatter: function (x) { return x + "원"; }

});


Morris.Area({

    element: 'time-chart',

    data: [
    	<c:forEach items="${hourlyInOutList }" var="inout">
		{ x: '<fmt:formatNumber type="number" value="${inout.hour }" pattern="00" />시'
		 , y: '${inout.checkInCnt }'
		 , z: '${inout.checkOutCnt }'
		},
	 
		</c:forEach>
      ],
      xkey: 'x',
      ykeys: ['y', 'z'],
      labels: ['입실(명)', '퇴실(명)'],
      parseTime: false,

});





</script>