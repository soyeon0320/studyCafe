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
<form:form commandName="productFormVO" id="listForm" name="listForm" method="post">
	<form:hidden path="productVO.productCode" id="detailNo" />
<main class="content mt-3">
	<div class="page-content d-flex flex pl-0 pr-0">
	  <div class="d-flex flex">
	     <aside class="sidebar sidebar-sm" id="mail-sidebar">
	        <div class="flex-column d-flex bg-white">
	            <div class="b-b navbar">
	            </div>
						<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: auto;">
							<div class="flex slim-scroll"
								style="overflow: hidden; width: auto; height: 100%;">

								<ul class="nav pb-3 pt-3">
									<li class="nav-item"><a href="" class="nav-link d-block"><i
											class="icon-line-archive mr-3"></i>전체 <span
											class="d-inline-block ml-2 text-dark">(${prodAllCnt})</span></a>
									</li>
									<c:forEach items="${lprodCnt}" var="lprodCnt">
										<li class="nav-item">
											<a href="javascript:change_lprod('${lprodCnt.lprodName}');" class="nav-link d-block">
												<i class="icon-line-archive mr-3"></i>${lprodCnt.lprodName}
												<span class="d-inline-block ml-2 text-dark">(${lprodCnt.lprodCnt})</span>
											</a>
										</li>
									</c:forEach>
									<li class="nav-item p-3 b-t mt-3">
								</ul>

							</div>
						</div>
					</div>
	</aside><!--inobx sidebar-->
	<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
	    <div class="d-flex flex flex-column">
	        <div class="navbar bg-white b-b">
	            <h2>공급물품 목록</h2>
	            <div class="d mb-5">
	                <div class="btn-group dropdown">
		                <form:select id="pageUnitSelector" cssClass="form-control" path="searchProductVO.pageUnit" onchange="go_action('list');">
							<form:options items="${productFormVO.searchProductVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/> 
						</form:select>		
						<form:select cssClass="form-control" path="searchProductVO.searchCondition" onchange="go_action('list');">
							<form:options items="${statusList }" itemValue="codeId" itemLabel="codeIdNm" />
						</form:select>	
						<form:hidden path="searchProductVO.searchKeyword" name="searchProductVO.searchKeyword"/>
	                </div>
                	<a href="javascript:OpenWindow('registForm','상품등록',800,800);" class="btn btn-info mr-1 mb-2">상품등록</a>
	            </div>
	        </div>
						<div class="slimScrollDiv">
							<div class="pb-30"> 
								<table class="table table-hover table-mails mb-0">
									<thead>
										<tr align="center">
											<th>상태</th>
											<th>상품코드</th>
											<th>분류</th>
											<th>상품명</th>
											<th>가격</th>
											<th width="5%">재고</th>
											<th width="1%"></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty prodList }">
											<tr>
												<td colspan="7" align="center">
													<strong>상품이 존재하지 않습니다.</strong>
												</td>
											</tr>
										</c:if>
										<c:forEach items="${prodList}" var="prod">
											<c:choose>
												<c:when test="${prod.productQuantity eq 0}">
													<tr id="prodList" onclick="OpenWindow('detail?productCode=${prod.productCode}','상품상세조회',800,855);"
														style="cursor: pointer; background-color: #fee5e4;">
														<td id="productUseable" name="productUseable" align="center"><span class="badge badge-text badge-danger mr-2 mb-2">재고없음</span></td>
														<td id="productCode" name="productCode" align="center">${prod.productCode}</td>
														<td id="lprodName" name="lprodName" align="center">${prod.lprodName}</td>
														<td id="productName" name="productName" align="center">${prod.productName}</td>
														<td id="productPrice" name="productPrice" align="right"><fmt:formatNumber value="${prod.productPrice}" />원</td>
														<c:choose>
															<c:when test="${prod.productQuantity < 10}">
																<td id="productQuantity" name="productQuantity" align="center"><strong>${prod.productQuantity}</strong></td>
																<td align="left"><span class="badge badge-danger ml-2 mr-2 mb-2">부족</span></td>
															</c:when>
															<c:when test="${prod.productQuantity > 10}">
																<td id="productQuantity" name="productQuantity" align="center"><strong>${prod.productQuantity}</strong></td>
																<td></td>
															</c:when>
														</c:choose>	
													</tr>
												</c:when>
												<c:when test="${prod.productQuantity ne 0}">
														<c:choose>
															<c:when test="${prod.productUseable eq '판매중'}">
															<tr id="prodList"
																onclick="OpenWindow('detail?productCode=${prod.productCode}','상품상세조회',800,855);"
																style="cursor: pointer;" >
																<td id="productUseable" name="productUseable" align="center"><span class="badge badge-text badge-info mr-2 mb-2">판매중</span></td>
															</c:when>
															<c:when test="${prod.productUseable eq '판매불가'}">
														<tr id="prodList"
															onclick="OpenWindow('detail?productCode=${prod.productCode}','상품상세조회',800,855);"
															style="cursor: pointer; background-color: #dfe0e3;" >
																<td id="productUseable" name="productUseable" align="center"><span class="badge badge-text badge-dark mr-2 mb-2" style="color: white;">판매중지</span></td>
															</c:when>
														</c:choose>
														<td id="productCode" name="productCode" align="center">${prod.productCode}</td>
														<td id="lprodName" name="lprodName" align="center">${prod.lprodName}</td>
														<td id="productName" name="productName" align="center">${prod.productName}</td>
														<td id="productPrice" name="productPrice" align="right"><fmt:formatNumber value="${prod.productPrice}" />원</td>
														<c:choose>
															<c:when test="${prod.productQuantity < 10}">
																<td id="productQuantity" name="productQuantity" align="center"><strong>${prod.productQuantity}</strong></td>
																<td align="left"><span class="badge badge-danger ml-2 mr-2 mb-2">부족</span></td>
															</c:when>
															<c:when test="${prod.productQuantity > 10}">
																<td id="productQuantity" name="productQuantity" align="center"><strong>${prod.productQuantity}</strong></td>
																<td></td>
															</c:when>
														</c:choose>	
													</tr>
												</c:when>
											</c:choose>
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
				</div><!--chat content-->
	        </div>
	    </div>
	</main>
	<form:hidden path="searchProductVO.pageIndex" id="pageIndex"/>							
	</form:form>		
</section>

<script>
function change_lprod(lprodName){
// 	alert(lprodName);
	$("input[name='searchProductVO.searchKeyword']").val(lprodName);
	go_search('<c:url value='/supply/list' />');
}


</script>
