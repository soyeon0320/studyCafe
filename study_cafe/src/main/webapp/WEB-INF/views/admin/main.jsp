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
	
	tbody.ranking-body tr td{
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
			                <i class="icon-line-archive"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;">${adminHeader.contractCnt }건</span>
			                <span class="list-content" style="font-size: larger;">신규 계약</span>
			            </div>
			        </div>
	                <a href="<%=request.getContextPath() %>/contract/list" class="d-flex text-muted flex text-right flex-row align-items-center justify-content-end pt-5 pb-5 pl-4 pr-4 bg-light">더보기..
	               		<i class="fa fa-chevron-right ml-2 fs12 mt-1"></i>
	                </a>

			    </div>
			</div><!--col-->		
			
			<div class="col-lg-3 col-md-6 ">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb avatar si-colored-twitter rounded-circle avatar60 shadow-sm">
			                <i class="icon-line-paper"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;">${adminHeader.orderCnt } 건</span>
			                <span class="list-content" style="font-size: larger;">발주 대기 목록</span>
			            </div>
			        </div>
   	                <a href="<%=request.getContextPath() %>/orderProduct/list" class="d-flex text-muted flex text-right flex-row align-items-center justify-content-end pt-5 pb-5 pl-4 pr-4 bg-light">더보기..
   	                	<i class="fa fa-chevron-right ml-2 fs12 mt-1"></i>
   	                </a>
			    </div>
			</div><!--col-->
			
			<div class="col-lg-3 col-md-6 ">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb avatar bg-danger rounded-circle avatar60 shadow-sm">
			                <i class="icon-line2-question"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;">${adminHeader.vocCnt } 건</span>
			                <span class="list-content" style="font-size: larger;">미응답 고객 문의</span>
			            </div>
			        </div>
	                <a href="<%=request.getContextPath() %>/vocManage/list" class="d-flex text-muted flex text-right flex-row align-items-center justify-content-end pt-5 pb-5 pl-4 pr-4 bg-light">더보기..
	                	<i class="fa fa-chevron-right ml-2 fs12 mt-1"></i>
	                </a>			        
			        
			    </div>
			</div><!--col-->
		
			<div class="col-lg-3 col-md-6">
			    <div class="list bg-white myShadow">
			        <div class="list-item">
			            <div class="list-thumb bg-success text-success-light avatar rounded-circle avatar60 shadow-sm">
			                <i class="icon-user-plus"></i>
			            </div>
			            <div class="list-body text-right">
			                <span class="list-title fs-1x" style="font-size: 20px !important;">${adminHeader.memberCnt } 명</span>
			                <span class="list-content" style="font-size: larger;">신규 가입자 수(한달)</span>
			            </div>
			        </div>
	                <a href="<%=request.getContextPath() %>/admin/member/list" class="d-flex text-muted flex text-right flex-row align-items-center justify-content-end pt-5 pb-5 pl-4 pr-4 bg-light">더보기..
	                	<i class="fa fa-chevron-right ml-2 fs12 mt-1"></i>
	                </a>			        
			        
			    </div>
			</div><!--col-->
		
		</div>	
	</div>
	
	
	<div class="row mt-20">
		<div class="col-4">
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">재고 부족 상품 목록</h3>
					</div>
				</div>
				
				<div class="portlet-body">
					<div id="productRemain">
						<table class="table">
							<colgroup>
								<col width="16%">
								<col width="*">
								<col width="24%">
							</colgroup>
							<thead align="center" style="background-color: #dee4e936;">
								<tr>
									<th>카테고리</th>
									<th>상품명</th>
									<th>재고(개)</th>
								</tr>
							</thead>
							
							<tbody class="ranking-body" align="center">
								<c:forEach items="${lowRemainList }" var="product">
									<tr><td>${product.lprodName }</td><td>${product.productName }</td><td>${product.productQuantity }</td></tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>		
			</div>
					

		</div>
		
		<div class="col-5">
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">매출 통계</h3>
					</div>
				</div>
				
				<div class="portlet-body">
					<div id="totalPrice">
					
					</div>
				</div>		
			</div>			
		</div>
		
		<div class="col-3">

		
			<div class="portlet-box portlet-shadow  mb-30" >
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">월간 지역별 이용률</h3>
					</div>
				</div>
				<div class="portlet-body">
					<div id="regionDonut">
					
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
						<h3 style="">주간 고객의 소리 분포도</h3>
					</div>
				</div>
				<div class="portlet-body" style="min-height: 437px;">
					<div id="vocBar">
						
						
					</div>
				</div>		
			</div>
		</div>
		
		<div class="col-5">
			<div class="portlet-box portlet-shadow  mb-30">
				<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
					<div class="flex d-flex flex-column">
						<h3 style="">전체 이용수</h3>
					</div>
				</div>
				<div class="portlet-body" style="min-height: 437px;">
					<div id="totalUse">
					
					</div>
				</div>		
			</div>		
		</div>
		<div class="col-3">
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
								<c:forEach items="${rankingStoreList }" var="store">
									<tr>
										<td>${store.rnum }</td>
										<td>${store.storeName }</td>
										<td>${store.useCnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>		
			</div>
		</div>
	 

	</div>
</section>

<script type="text/javascript">
window.onload=function(){
	myChart();
}

</script>




<script type="text/javascript">

function myChart(){
	Morris.Bar({
	    element: 'vocBar',
	    data: [
	    	<c:forEach items="${vocStatic}" var="voc" varStatus="status">
		    	{ y:'<fmt:formatDate value="${voc.day  }" pattern="MM/dd"/>일',a : ${voc.p01 }, b : ${voc.p02 },c : ${voc.p03 } }
		    	<c:if test="${!status.last }">,</c:if>
	    	</c:forEach>
	      ],
	      xkey: 'y',
	      ykeys:  ['a','b','c'],
	      labels: ['칭찬','건의','불만'],
	      barColors: [
		      '#28a745',
		      '#ffc107',
		      '#dc3545'
		    ],
	      stacked: true
	      
	});

	Morris.Donut({
		element:'regionDonut',
	    data: [
	    	<c:forEach items="${regionStatic}" var="region" varStatus="status">
		    	{ label: '${region.region }', value: ${region.usePer }  }
		    	<c:if test="${!status.last }">,</c:if>
	    	</c:forEach>
	    ],
	    formatter: function (x) { return x +"%"; },
	    colors : ['#fd7e14','#6f42c1','#e83e8c','#28a745','#ffc107','#dc3545','#343a40']
	});
	
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
	Morris.Line({
		  element: 'totalPrice',
		  data: [
		    	<c:forEach items="${monthlySales }" var="sale" varStatus="status">
					{ d:
						'20<fmt:formatDate value="${sale.period }" pattern="yy-MM-dd" />'
					, x: '${sale.ticketSales + sale.prodSales }'
					}
					<c:if test="${!status.last }">,</c:if>
				</c:forEach>
			  ],
			    xkey: 'd',
			    ykeys: 'x',
			    labels: ['월 매출(원)'],
	});
	
}
</script>