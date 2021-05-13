<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
<div class="container mt-30">

<div class="portlet-box portlet-shadow" >
	<div class="portlet-header flex-row flex d-flex align-items-center b-b">
		<div class="flex d-flex flex-column">
			<h1>발주 내역</h1>
		</div>
		<div class="portlet-tools">
			<ul class="nav">
				<c:if test="${orderDetail.orderProductStatus eq 'OS01' }">
				<li class="nav-item">
					<input type="button" class="btn btn-secondary" value="주문취소" onclick="orderCancle();">
				</li>
				<li class="nav-item">
					<input type="button" class="btn btn-info" value="주문수정" onclick="javascript:location.href='modify?orderProductNo=${orderDetail.orderProductNo }'"> 
				</li>
				</c:if>

				<c:if test="${orderDetail.orderProductStatus eq 'OS03' }">
				<li class="nav-item">
					<input type="button" class="btn btn-secondary" value="반품신청" onclick="javascript:location.href='refund?orderProductNo=${orderDetail.orderProductNo }'">
				</li>
				<li class="nav-item">
					<input type="button" class="btn btn-success" value="수령완료"  onclick="orderConfirm();">
				</li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<div class="portlet-body">

		<table class="table table-bordered" style="clear: both;">
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
						<th>수량</th>
						<th>합계</th>
					</tr>
				</thead>
				
				<tbody align="center">
				<c:forEach items="${orderProductList }" var="product" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${product.productCode}</td>
						<td>${product.productName }</td>
						<td>${product.lprodName }</td>
						<td align="right"><fmt:formatNumber value="${product.productPrice }" maxFractionDigits="3" />원</td>
						<td align="right">${product.orderProductQuantity } 개</td>
						<td align="right"><fmt:formatNumber value="${product.orderProductQuantity * product.productPrice}" maxFractionDigits="3" />원</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<div align="right" style="font-size: larger;">
				<span>총 금액</span>
				<strong><fmt:formatNumber value="${orderDetail.orderProductTotalPrice }" maxFractionDigits="3" /> 원</strong>
			</div>	
		</div>
		
	</div>
</div>
</div>
</section>
<script>
function orderCancle(){
	
	if(!confirm("주문을 취소하시겠습니까?")) return;
	
	var data = {
		orderProductNo:'${orderDetail.orderProductNo }'
	}
	
	$.ajax({
		url:"cancle",
		data:data,
		success:function(data){
			alert("주문이 취소되었습니다.");
			window.parent.location.reload();
			window.close();
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
}

function orderConfirm(){
	
	if(!confirm("물건을 수령하시겠습니까?")) return;
	
	var data = {
		orderProductNo:'${orderDetail.orderProductNo }'
	}
	
	$.ajax({
		url:"confirm",
		data:data,
		method:"post",
		success:function(data){
			alert("수령 완료.");
			window.parent.location.reload();
			location.reload();
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
}
</script>