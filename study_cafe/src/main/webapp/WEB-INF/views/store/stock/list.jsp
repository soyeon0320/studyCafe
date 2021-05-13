<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<section>

	<div class="portlet-box portlet-shadow mt-30">
		<div class="portlet-header flex-row flex d-flex align-items-center" style="padding: 5px;">
			<div class="flex d-flex flex-column">
				<h2 class="pl-10 pt-10" style="padding-left: 25px;">매장 물품 조회</h2>
			</div>
		</div>
		<div class="portlet-body" style="border-top: 1px solid #0000003d;padding-top: 0;padding-right: 0;">
			<div class="d-flex flex">
					<aside class="sidebar sidebar-sm" id="mail-sidebar" style="min-height: 600px;">
						<div class="d-flex bg-white">
							<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
								<div class="flex slim-scroll" style="overflow: hidden; width: auto;border-right: 1px #0000003d solid !important;">
									<ul class="nav pb-3 pt-3">
										<li class="nav-item">
											<a href="javascript:$('input[name=searchKeyword]').val('');stock_list();void(0)" class="nav-link d-block"><i class="icon-line-archive mr-3"></i>전체 </a>
										</li>
									<c:forEach items="${lprodList}" var="item">
										<c:if test="${item.lprodCode != 'P102' && item.lprodCode != 'P101' }">
											<li class="nav-item">
												<a href="javascript:$('input[name=searchKeyword]').val('${item.lprodCode }');stock_list();void(0)" class="nav-link d-block">
													<i class="icon-line-archive mr-3"></i>${item.lprodName}
													<span class="d-inline-block ml-2 text-dark">(${item.lprodCnt})</span>
												</a>
											</li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</aside>
					<div style="display: contents;padding: 30px;">
						<table class="table table-hover table-mails mb-0">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="*%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead style="background-color: #dee4e936;" align="center">
								<tr>
									<th>상품분류</th>
									<th>상품코드</th>
									<th>상품명</th>
									<th>상품수량</th>
									<th>변동일</th>
									<th>수량변경</th>
								</tr>
							</thead>
							
							<tbody align="center">
							
							<c:forEach items="${stockList }" var="stock">
								<tr 
									<c:if test="${stock.storeStockQuantity < 10 }">
										style="background-color:#fee5e4;"
									</c:if>
								>	
									<td>
										<span>${stock.lprodName }</span>
										<input type="hidden" name="lprodName" value="${stock.lprodName }">
									</td>
									<td>
										<span>${stock.productCode }</span>
										<input type="hidden" name="productCode" value="${stock.productCode }">
									</td>
									<td  style="text-align: left;">
										<span>${stock.productName }</span>
										<input type="hidden" name="productName" value="${stock.productName }">
									</td>
									<td>
										<span>${stock.storeStockQuantity }</span>
										<input type="hidden" name="storeStockQuantity" value="${stock.storeStockQuantity }">
									</td>
									<td><fmt:formatDate value="${stock.storeSupplyDate }" pattern="yyyy-MM-dd"/></td>
									<td><button class="btn btn-info" onclick="openModal(this);">변경</button></td>
								</tr>
							</c:forEach>
							
							<c:if test="${stockList.size() == 0 }">
								<tr><td colspan="5">매장에 등록된 상품이 없습니다.<td></tr>
							</c:if>
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
			<form action="stock" id="stockForm">
				<input type="hidden" name="searchKeyword">
				<input type="hidden" name="pageIndex" value=1>
			</form>
		</div>

</section>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info-light">
				<h5 class="modal-title" id="exampleModalLabel">물품 수량 변경</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			
			<div class="modal-body">
				<p>수량</p>
				<form id="modifyForm">
					<input type="hidden" name="productCode" value="">
					<input type="hidden" name="storeCode" value="${sessionScope.loginOwner.storeCode}">
					<input type="number" name="storeStockQuantity"  min="0" >
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="modifyCnt();">수정</button>
			</div>
		</div>
	</div>
</div>
<script>

	function openModal(obj){
		
		var item = $(obj).closest("tr");
		
		$("#modifyForm").children("input[name=productCode]").val(item.find("input[name=productCode]").val());
		$("#modifyForm").children("input[name=storeStockQuantity]")
						.attr("max",item.find("input[name=storeStockQuantity]").val())
						.val(item.find("input[name=storeStockQuantity]").val());
		$("#myModal").modal();
		
	}
	
	
	function modifyCnt(){
		
		var storeCode = $("#modifyForm").children("input[name=storeCode]").val();
		var productCode = $("#modifyForm").children("input[name=productCode]").val();
		var storeStockQuantity = $("#modifyForm").children("input[name=storeStockQuantity]").val();
		
		var stockVO = {
				storeCode :storeCode,
				productCode : productCode,
				storeStockQuantity : storeStockQuantity
		}
		
		$.ajax({
			url:"modifyCnt",
	        method : "post",
	    	data : stockVO,
	    	success : function(data) {
	    		$("#myModal").modal("hide");
	    		swal({
	    			  toast: true,
	    			  position: 'top-end',
	    			  showConfirmButton: false,
	    			  timer: 1000,
	    			  type: 'success',
	    			  timerProgressBar: true,
	    			  icon: 'success',
	    			  title: '물품 수량이 수정되었습니다.',
	    			  onClose: () => {
	    	    	  	location.reload();
	    			  }
	    			})
	    	},
	    	error : function(xhr) {
	    	    alert("error");
	    	    console.log(err);
	    	}
		});		
	}
	
	function go_page(pageIndex){
		$("input[name=pageIndex]").val(pageIndex);
		stock_list();
	}
	
	function stock_list(){
		$("form[id=stockForm]").submit();
	}
</script>