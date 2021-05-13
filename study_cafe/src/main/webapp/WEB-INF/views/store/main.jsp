<%@page import="java.util.Collections"%>
<%@page import="kr.co.scm.store.vo.SummaryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<style>
	.myShadow{
	
		box-shadow: 0 2px 10px rgb(44 45 58 / 10%), 0 -2px 0 #e1eaea;
	}
	
	tbody.summary-body tr td{
		padding: 4px !important;
	}

</style>

<section>
	<div class="mb-30 mt-20">
		<div class="row">
			<div class="col-lg-3 col-md-6 ">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb avatar bg-warning rounded-circle avatar60 shadow-sm">
			                <i class="icon-clipboard-check"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;"> ${loginStore.newReserv}건</span>
			                <span class="list-content" style="font-size: larger;">신규 예약</span>
			            </div>
			        </div>
			    </div>
			</div><!--col-->		
			
			<div class="col-lg-3 col-md-6 ">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb avatar si-colored-twitter rounded-circle avatar60 shadow-sm">
			                <i class="icon-group"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;">${storeUseInfo.storeCurrentSeat}/${storeUseInfo.storeLocatedSeat }</span>
			                <span class="list-content" style="font-size: larger;">좌석</span>
			            </div>
			        </div>
			    </div>
			</div><!--col-->
			
			<div class="col-lg-3 col-md-6 ">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb avatar bg-danger rounded-circle avatar60 shadow-sm">
			                <i class="icon-line-home"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;">${storeUseInfo.storeCurrentRoom}/${storeUseInfo.storeTotalRoom }</span>
			                <span class="list-content" style="font-size: larger;">스터디룸</span>
			            </div>
			        </div>
			    </div>
			</div><!--col-->
		
			<div class="col-lg-3 col-md-6">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb bg-success text-success-light avatar rounded-circle avatar60 shadow-sm">
			                <i class="icon-chart-line"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;"><fmt:formatNumber value="${todaySale }" maxFractionDigits="3" />원</span>
			                <span class="list-content" style="font-size: larger;">실시간 매출 </span>
			            </div>
			        </div>
			    </div>
			</div><!--col-->
		
		</div>	
	</div>
	
	
	<div class="row mt-20">
		<div class="col-4">
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">주간 이용자 수</h3>
					</div>
				</div>
				<div class="portlet-body">
					<div id="testChart">
					</div>
				</div>		
			</div>
			
		</div>
		
		<div class="col-5">
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">일자별 요약</h3>
					</div>
				</div>
				
				<div class="portlet-body">
					<table class="table table-hover">
						<colgroup>
							<col width="20%">
							<col>
							<col>
							<col width="30%">
							<col>
							<col>
						</colgroup>
						<thead style="background-color: #dee4e936;">
							<tr align="center">
								<th>일자</th>
								<th>방문자</th>
								<th>기기이용</th>
								<th>매출액(원)</th>
								<th>후기</th>
								<th>문의</th>
							</tr>
						</thead>
						
						<tbody class="summary-body">
							<c:set var="totalUsing" value="0" />
							<c:set var="totalEquipUsing" value="0" />
							<c:set var="totalSales" value="0" />
							<c:set var="totalReviewCnt" value="0" />
							<c:set var="totalVocCnt" value="0" />
							
							<c:forEach items="${weeklySummary }" var="item" varStatus="status">
								<tr style="text-align: right;">
									<td style="text-align: left;"><fmt:formatDate value="${item.day}" pattern="yyyy-MM-dd"/></td>
									<td>${item.usingCnt }</td>
									<td>${item.equipUseCnt }</td>
									<td><fmt:formatNumber value="${item.sales }" maxFractionDigits="3" /></td>
									<td>${item.reviewCnt }</td>
									<td>${item.vocCnt }</td>
								</tr>
							<c:set var="totalUsing" value="${totalUsing + item.usingCnt  }" />
							<c:set var="totalEquipUsing" value="${totalEquipUsing + item.equipUseCnt  }" />
							<c:set var="totalSales" value="${totalSales + item.sales  }" />
							<c:set var="totalReviewCnt" value="${totalReviewCnt + item.reviewCnt  }" />
							<c:set var="totalVocCnt" value="${totalVocCnt + item.vocCnt  }" />
							</c:forEach>
								<tr style="text-align: right;font-weight: bolder;">
									<td align="left">7일 총계</td>
									<td>${totalUsing }명</td>
									<td>${totalEquipUsing }건</td>
									<td><fmt:formatNumber value="${totalSales }" maxFractionDigits="3" />원</td>
									<td>${totalReviewCnt }건</td>
									<td>${totalVocCnt }건</td>
								</tr>
						</tbody>
					
					</table>
				</div>		
			</div>
			
			
			
		
		
		</div>
		
		<div class="col-3">

		
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">고객의 소리 내역</h3>
					</div>
				</div>
				<div class="portlet-body" >
					<div id="testDonut">
					
					</div>
				</div>		
			</div>
			
			
		</div>
	</div>
	
	<div class="row mt-20">
		<div class="col-4">
		<div class="portlet-box portlet-shadow  mb-30">
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">최근 예약 내역</h3>
					</div>
				</div>
					
				<div class="portlet-body">
					<table class="table mt-20">
						<colgroup>
							<col width="">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						
						<thead style="background-color: #dee4e936;">
							<tr align="center">
								<th>예약번호</th>
								<th>회원</th>
								<th>스터디룸 번호</th>
								<th>예약날짜</th>
								<th>예약 등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${recentReservHistory}" var="reservation">
								<tr align="center">
									<td>${reservation.studyroomReservNo}</td>
									<td>${reservation.memName}</td>
									<td>${reservation.studyroomNo}번 방</td>
									<td>
									<fmt:formatDate value="${reservation.studyroomReservStart}" pattern="MM/dd일 HH"/><fmt:formatDate value="${reservation.studyroomReservEnd}" pattern="~HH시"/>
									</td>
									<td><fmt:formatDate value="${reservation.studyroomReservDate}" pattern="MM/dd"/></td>
								</tr>
							</c:forEach>
							<c:if test="${recentReservHistory.size() == 0}">
								<tr>
									<td colspan="5" align="center">예약 내역이 없습니다..😢</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>		
			</div>
		</div>
		
		<div class="col-5">
			<div class="portlet-box portlet-shadow  mb-30">
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">매장 이용 후기</h3>
					</div>
				</div>
				<div class="portlet-body">
					<table class="table mt-20">
						<colgroup>
							<col width="20%">
							<col width="">
							<col width="20%">
						</colgroup>
						
						<thead style="background-color: #dee4e936;">
							<tr align="center">
								<th>회원</th>
								<th>내용</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${storeReivew}" var="review" end="4">
								<tr align="center">
									<td>${review.memId }</td>
									<td align="left">${review.reviewContent }</td>
									<td><fmt:formatDate value="${review.reivewRegDate}" pattern="MM/dd"/></td>
								</tr>
							</c:forEach>
							<c:if test="${storeReivew.size() == 0}">
								<tr>
									<td colspan="3" align="center">내역이 없습니다...</td>
								</tr>
							</c:if>
						</tbody>
					</table>				
				</div>		
			</div>		
		</div>
		<div class="col-3">
		<div class="portlet-box portlet-shadow  mb-30">
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">본사 메일 수신 목록</h3>
					</div>
				</div>
				<div class="portlet-body">
					<table class="table mt-20">
						<colgroup>
							<col width="15%">
							<col width="">
							<col width="20%">
						</colgroup>
						
						<thead style="background-color: #dee4e936;">
							<tr align="center">
								<th>번호</th>
								<th>제목</th>
								<th>발송일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${receviedMail}" var="mail">
								<tr align="center">
									<td>${mail.mailNo }</td>
									<td align="left">${mail.mailTitle }</td>
									<td><fmt:formatDate value="${mail.mailRegDate}" pattern="MM/dd"/></td>
								</tr>
							</c:forEach>
							<c:if test="${receviedMail.size() == 0}">
								<tr>
									<td colspan="3" align="center">발송 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>				
				</div>		
			</div>
		</div>
	

	</div>
	

<%
List<SummaryVO> weeklySummary = (List<SummaryVO>)request.getAttribute("weeklySummary");
Collections.sort(weeklySummary);
%>
</section>

<script type="text/javascript">
window.onload=function(){
	myChart();
}
</script>

<script type="text/javascript">

function myChart(){
	Morris.Line({
	    element: 'testChart',
	    data: [
	    	<c:forEach items="${weeklySummary }" var="res" varStatus="status">
	    	{ x: "<fmt:formatDate value='${res.day}' pattern='MM-dd'/>", y: '${res.usingCnt }'}<c:if test="${!status.last }">,</c:if> 
	    	</c:forEach>
	      ],
	      xkey: 'x',
	      ykeys: 'y',
	      labels: ['명'],
	      parseTime: false,
	});
	
	Morris.Donut({
		element:'testDonut',
	    data: [
	    	<c:forEach items="${vocStatic }" var="res" varStatus="status">
	    	{ label: "${res.VOC_KIND }", value: '${res.VOC_KIND_CNT }' }<c:if test="${!status.last }">,</c:if> 
	    	</c:forEach>
	    ],
	    colors: [
		      '#ffc107',
		      '#28a745',
		      '#dc3545'
	    ],
	    formatter: function (x) { return x + "건"; }
	});
}

</script>