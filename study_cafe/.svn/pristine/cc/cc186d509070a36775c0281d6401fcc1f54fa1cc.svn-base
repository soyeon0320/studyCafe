<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
<div class="container mt-30">

	<div class="portlet-box portlet-shadow" >
		<div class="portlet-header flex-row flex d-flex align-items-center b-b">
			<div class="flex d-flex flex-column">
				<h1>반품 신청</h1>
			</div>
			<div class="portlet-tools">
				<input type="button" class="btn btn-info" value="전체 반품" onclick="refund('all');">
				<input type="button" class="btn btn-info" value="반품신청" onclick="refund();">
				<input type="button" class="btn btn-light" value="취소" onclick="history.go(-1);">
			</div>
		</div>
	
		<div class="portlet-body">
			<table class="table table-bordered">
				<colgroup>
					<col style="background-color: #adb5bd">
					<col>
					<col style="background-color: #adb5bd">
					<col>
				</colgroup>
			
				<tr>
					<th style="text-align:right;">신청일자</th>
					<td><fmt:formatDate value="${orderDetail.orderProductRegDate }" pattern="yyyy-MM-dd HH:mm"/></td>
					<th style="text-align:right;">주소</th>
					<td>${orderDetail.storeAddr }</td>
				</tr>
				<tr>
					<th style="text-align:right;">발주번호</th>
					<td>${orderDetail.orderProductNo }</td>
					<th style="text-align:right;">가맹점명</th>
					<td>${orderDetail.storeName }</td>
				</tr>
				<tr>
					<th style="text-align:right;">진행상태</th>
					<td>${orderDetail.orderProductStatusLabel }</td>
					<th style="text-align:right;">연락처</th>
					<td>${orderDetail.ownerTel }</td>
				</tr>
				<tr>
					<th style="text-align:right;">위치</th>
					<td>${orderDetail.orderDeliveryLocation }</td>
					<th style="text-align:right;">가맹주</th>
					<td>${orderDetail.ownerName }</td>
				</tr>
			</table>
		
		<div style="overflow: auto;" >
			<table class="table table-bordered">
				<thead style="background-color: #adb5bd" align="center">
					<tr>
						<th>No</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>상품종류</th>
						<th>공급가액</th>
						<th>주문 수량</th>
						<th>합계</th>
					</tr>
				</thead>
				
				<tbody id="productList" align="center">
					<c:forEach items="${orderProductList }" var="product" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${product.productCode}<input type="hidden" name="productCode"  value="${product.productCode}"></td>
							<td>${product.productName }</td>
							<td>${product.lprodName }</td>
							<td align="right"><fmt:formatNumber value="${product.productPrice }" maxFractionDigits="3" />원</td>
							<td align="right"><input type="number" min="0" max="${product.orderProductQuantity }" name="orderProductQuantity" value="${product.orderProductQuantity }"> 개</td>
							<td align="right"><fmt:formatNumber value="${product.orderProductQuantity * product.productPrice}" maxFractionDigits="3" />원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="float: right; font-size: larger;">
				<span>총 금액</span>
				<strong><fmt:formatNumber value="${orderDetail.orderProductTotalPrice }" maxFractionDigits="3" /> 원</strong>
			</div>
		</div>
	</div>
	</div>
	
	
</div>
</section>
<script>

	function refund(str){
		
		
		var orderProductNo = '${orderDetail.orderProductNo}';
		
		var refundItems = new Array();
		var remainItems = new Array();
				
		if(!str){
			
			var productList = $("#productList").children("tr");

			for (var i = 0; i < productList.length; i++) {
				var item = productList.eq(i);
				var productCode = item.find("input[name=productCode]").val();
				var refundCnt = parseInt(item.find("input[name=orderProductQuantity]").val());
				var remainCnt = parseInt(item.find("input[name=orderProductQuantity]").attr("max")) - refundCnt;
				
				var refundItem = {
						orderProductNo:orderProductNo,
						productCode:productCode,
						refundProductQuantity:refundCnt
				};
				
				refundItems.push(refundItem);
				
				
				if(remainCnt != 0){
					var remainItem = {
							orderProductNo:orderProductNo,
							productCode:productCode,
							orderProductQuantity:remainCnt						
					};
					
					remainItems.push(remainItem);
				}
				
			}
		}else{

			var productList = $("#productList").children("tr");

			for (var i = 0; i < productList.length; i++) {
				var item = productList.eq(i);
				
				var productCode = item.find("input[name=productCode]").val();
				var refundCnt = parseInt(item.find("input[name=orderProductQuantity]").val());
				
				var refundItem = {
						orderProductNo:orderProductNo,
						productCode:productCode,
						refundProductQuantity:refundCnt
				};
				
				refundItems.push(refundItem);
			}
		}
		
		
		var refundVO = {
				remainItems : remainItems,
				refundItems : refundItems,
				orderVO:{
							orderProductNo:orderProductNo,
							storeCode:'${orderDetail.storeCode }'
						}
		}
		
		
		 
 		$.ajax({
			url:"refund",
			type:"post",
	    	dataType : 'json',
	    	processData : true,
	    	contentType : "application/json; charset=UTF-8",			
			data : JSON.stringify(refundVO),
			success:function(data){
   				swal({
                    title:'물품 반품',
                    text: '반품되었습니다.',
                    type: 'success',
                    onClose: () => {
						location.href='detail?orderProductNo='+orderProductNo;
                      }
                  })
			},
			error:function(xhr){
				alert("에러");
				console.log(xhr);
			}
		});
	 
	}

</script>


