<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<style>
	td{
		padding: 0px;
		width: 50px; 
		height: 50px;
	}
	
	td.seatE, td.seatN, td.seatW, td.seatS{
		background-size: 50px;
		background-repeat: no-repeat;
		width: 50px;
		height: 50px;
		text-align: center;
		background-position: center;
	}
	
	td.seatE{ background-image: url('<c:url value="/resources/images/seat/seatE.png" />'); }
	td.seatN{ background-image: url('<c:url value="/resources/images/seat/seatN.png" />'); }
	td.seatW{ background-image: url('<c:url value="/resources/images/seat/seatW.png" />'); }
	td.seatS{ background-image: url('<c:url value="/resources/images/seat/seatS.png" />'); }
	
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
<div>
	<div style="padding: 10px;">
		<fmt:parseNumber var="x" type="number" value="${store.STORE_WIDTH }"/>
		<fmt:parseNumber var="y" type="number" value="${store.STORE_HEIGHT }"/>
		<form action="modify_seat" style="clear: both;" id="locatedSeat">
			<table class="table table-bordered"  id="seatMap" style="width: 800px;" >
				<c:set var="location" value="1"/>
				<c:set var="listCnt" value="0" />
				<c:set var="seat" value="${locatedList[listCnt] }" />
				<c:forEach begin="0" end="${y-1 }" varStatus="col">
					<tr>
						<c:forEach begin="${(col.count-1)*x }" end="${(col.count*x -1) }" varStatus="row" >
							<c:if test="${seatMap[location-1] == '0' }">
								<td ondrop="dropSeat(event)" ondragover="allowDrop(event);">
									<input type="hidden" name="seatLocation" value="${location }">
								</td>						
							</c:if>
						
							<c:if test="${seatMap[location-1] != '0' }">
								<td id="seat${seat.seatNo }" onclick="goModal(this);"  class="seat${seat.seatDirection }" ondrop="dropToExchange(event);" ondragover="allowDrop(event);" ondragstart="drag(event);" draggable="true">
									<input type="hidden" name="seatLocation" value="${location }">
									<input type="hidden" name="seatNo" value="${seat.seatNo }">
									<input type="hidden" name="seatUseable" value="${seat.seatUseable }">
									<input type="hidden" name="seatInfo" value="${seat.seatInfo }">
									<input type="hidden" name="isModified" value="">
									<input type="hidden" name="seatDirection" value="${seat.seatDirection }">
									<strong>${listCnt }</strong>
									<c:set var="listCnt" value="${listCnt + 1 }"  /> 
									<c:set var="seat" value="${locatedList[listCnt] }"  />
								</td>
							</c:if>
								<c:set var="location" value="${location + 1 }"  />
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</div>
