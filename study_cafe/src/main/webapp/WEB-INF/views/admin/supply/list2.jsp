<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<div class="row">
			<div class="col-md-3 col-lg-2 col-xl-2 hidden-xs hidden-sm">
				<div class="card">
					<div class="card-body no-padding">
						<!-- 카테고리 -->
						ㅎㅇ
					</div><!--end.card-body-->
				</div><!--end.card-->
			</div><!--end.col-->
			
			<div class="col-md-9 col-lg-10 col-xl-10">
			<div class="tabs tabs-bb clearfix" id="tab-9">

				<ul class="tab-nav clearfix">
					<li><a href="#tabs-34">전체</a></li>
					<li><a href="#tabs-35">판매중</a></li>
					<li class="hidden-phone"><a href="#tabs-36">판매불가</a></li>
				</ul>

				<div class="tab-container">
					<div class="tab-content clearfix" id="tabs-34">
					2
					</div>
					<div class="tab-content clearfix" id="tabs-35">
					3
					</div>
					<div class="tab-content clearfix" id="tabs-36">
					4
					</div>

				</div>

			</div>
				<div class="row">
					<div class="col-md-12">
						<div class="clearfix search_form">
							<div class="card form_left">
								<div class="card-body no-padding row">
										<div class="col-sm-10">
											<input type="text" class="_keyword_search form-control typeahead tt-input" placeholder="상품명 검색" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; border: none; background-color: transparent; padding-left: 0" onkeydown="if (event.keyCode==13) SHOP_PROD_LIST.startKeywordSearch()" value="">
										</div>
									<div class="col-sm-2">
										<input type="button" onclick="OpenWindow('registForm','상품등록',800,750);" value="상품등록"> 	
									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="col-md-12">
						<div class="card">
							<div class="table-responsive shop-table check" id="prod_list" style="">
								<table class="table no-margin">

									<thead class="subject _prodListHeaderDeselected" style="display: table-header-group" id="prod_list_header_deselected">
										<tr>
											<th>No</th>
											<th>상품명</th>
											<th>가격</th>
											<th>분류</th>
											<th>상태</th>
											<th>재고</th>
										</tr>
									</thead>
								
								<c:forEach items="${prodList}" var="prod">
								<tr class="content _prodListItem" id="prodList" onclick="OpenWindow('detail?productCode=${prod.productCode}','상품상세조회',800,855);" style="cursor: pointer;">
									<td id="productCode" name="productCode">${prod.productCode}</td>
									<td id="productName" name="productName">${prod.productName}</td>
									<td id="productPrice" name="productPrice">${prod.productPrice}</td>
									<td id="lprodName" name="lprodName">${prod.lprodName}</td>
									<td id="">${prod.productUseable}</td>
									<td id="productQuantity" name="productQuantity">${prod.productQuantity}</td>
								</tr>
								</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<nav class="text-center order_paging" id="prod_list_paging" style=""></nav>
					</div>
				</div>
			</div>
		</div>
		
	<script type="text/javascript">
	
	//팝업창들 띄우기
	//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
								+"height="+ WinHeight +", top="+ wintop +", left=" 
								+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
	}
	
	</script>
	<script type="text/javascript">
		
	function all_list() {
		
	}
	
	
	
	
	</script>
		
		
</section>