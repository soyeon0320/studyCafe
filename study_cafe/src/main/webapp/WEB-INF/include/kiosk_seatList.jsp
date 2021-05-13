<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	td,th{
		padding: 0px;
		width: 0px; 
		height: 0px;
/* 		border-radius: 10px; */
	}
	
	td.seatE, td.seatN, td.seatW, td.seatS{
		background-size: 45px;
		background-repeat: no-repeat;
/* 		width: 30px; */
		height: 30px;
		text-align: center;
		background-position: center;
	}
	
	td.seatE{ background-image: url('<c:url value="/resources/images/seat/seatE.png" />'); }
	td.seatN{ background-image: url('<c:url value="/resources/images/seat/seatN.png" />'); }
	td.seatW{ background-image: url('<c:url value="/resources/images/seat/seatW.png" />'); }
	td.seatS{ background-image: url('<c:url value="/resources/images/seat/seatS.png" />'); }
	
	
	td.seatE.seatUse0, td.seatN.seatUse0, td.seatW.seatUse0, td.seatS.seatUse0, td.unused {
		background-color: #e5f2ff;
	}
	td.seatE.seatUse1, td.seatN.seatUse1, td.seatW.seatUse1, td.seatS.seatUse1, td.used{
		background-color: #3471b4;
	}
/* 	img{
		display: block;
		width: 100%;
	} */
	#seatMap, #unLocatedSeat{
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

			<p style="text-align: center;font-size: x-large; margin-bottom: 10px;">
				이용 현황 : ${storeUseInfo.storeCurrentSeat}/${storeUseInfo.storeLocatedSeat }
			</p>
		<div id="seat" name="seat" class="" style="text-align: center;">
	
		<fmt:parseNumber var="x" type="number" value="${store.STORE_WIDTH }"/>
		<fmt:parseNumber var="y" type="number" value="${store.STORE_HEIGHT }"/>
				
		<table align="center">
			<tr style="">
				<td class="unused" style="width: 43px; height: 30px;"></td>
				<td style="padding: 0px 10px;font-size: x-large;">이용가능</td>
				<td class="used" style="width: 43px; height: 30px;"></td>
				<td style="padding: 0px 10px;font-size: x-large;">이용중</td>
			</tr>
		</table>
	
		<table class="table"  id="seatMap" style="width: 600px; height: 500px; margin: auto;" >
			<c:set var="location" value="1"/>
			<c:set var="listCnt" value="0" />
			<c:set var="seat" value="${locatedList[listCnt] }" />
			<c:set var="usableSeat" value="0"  />
			
			<c:forEach begin="0" end="${y-1 }" varStatus="col">
				<tr>
					<c:forEach begin="${(col.count-1)*x }" end="${(col.count*x -1) }" varStatus="row" >
						<c:if test="${seatMap[location-1] == '0' }">
							<td style="border: hidden;">
								<input type="hidden" name="seatLocation" value="${location }">
							</td>						
						</c:if>
					
						<c:if test="${seatMap[location-1] != '0' }">
							<td id="seat${seat.seatNo }" onclick="seatSelect('${seat.seatNo }','${listCnt + 1 }','${seat.seatOccufied}','${seat}');" class="seat${seat.seatDirection } seatUse${seat.seatOccufied} "  class="seat${seat.seatDirection } seatUse${seat.seatOccufied} " style="border: hidden;">
								<input type="hidden" name="seatLocation" value="${location }">
								<input type="hidden" name="seatNo" value="${seat.seatNo }">
								<input type="hidden" name="seatUseable" value="${seat.seatUseable }">
								<input type="hidden" name="seatInfo" value="${seat.seatInfo }">
								<input type="hidden" name="isModified" value="">
								<input type="hidden" name="seatDirection" value="${seat.seatDirection }">
								<c:set var="listCnt" value="${listCnt + 1 }"  /> 
								<strong style="color: black;">${listCnt}</strong>
								<c:set var="seat" value="${locatedList[listCnt] }"  />
								
								<c:if test="${seat.seatOccufied != 0}">
									<c:set var="usableSeat" value="${usableSeat + 1 }"  />
								</c:if>
								
							</td>
						</c:if>
							<c:set var="location" value="${location + 1 }"  />
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
</div>
