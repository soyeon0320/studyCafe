<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
<div class="container mt-30">
	<div class="portlet-box portlet-shadow" >
		<div class="portlet-header flex-row flex d-flex align-items-center b-b">
			<div class="flex d-flex flex-column">
				<h1>발주 내역 수정</h1>
			</div>
			<div class="portlet-tools">
				<ul class="nav">
					<li class="nav-item">
						<input type="button" class="btn btn-success" value="수정완료" onclick="modify();">
					</li>
					<li class="nav-item">
						<input type="button" class="btn btn-light" value="취소" onclick="history.go(-1);">
					</li>
				</ul>
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
					<td>${orderDetail.orderProductStatus }</td>
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
	
			<div style="overflow: auto; " >
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
							<td>${product.productCode}<input type="hidden" name="productCode" value="${product.productCode}"></td>
							<td>${product.productName }</td>
							<td>${product.lprodName }</td>
							<td align="right"><input type="hidden" name="productPrice" value="${product.productPrice }" /><fmt:formatNumber value="${product.productPrice }" maxFractionDigits="3" />원</td>
							<td align="right"><input type="number" onchange="calc_price(this);" name="orderProductQuantity" max="${product.productQuantity }" min="0" value="${product.orderProductQuantity }"> 개</td>
							<td align="right" role="price"><fmt:formatNumber value="${product.orderProductQuantity * product.productPrice}" maxFractionDigits="3" />원</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div style="float: right; font-size: larger;">
					<span>총 금액</span>
					<strong id="totalSum"><fmt:formatNumber value="${orderDetail.orderProductTotalPrice }" maxFractionDigits="3" /></strong><strong>원</strong>
				</div>
			</div>
		</div>

		
		
	</div>
</div>
</section>
<script>

function modify(){
	var newCartList = new Array();
	
	var prodCode = $("input[name=productCode]");
	var prodCnt = $("input[name=orderProductQuantity]");
	
	for (var i = 0; i < prodCode.length; i++) {
	
		var prod = {
				productCode : prodCode.eq(i).val(),
				orderProductQuantity : prodCnt.eq(i).val(),
				orderProductNo: ${orderDetail.orderProductNo}
		}
		
		newCartList.push(prod);
	}
	

	swal({
           title: '발주 내역 수정',
           text: "발주 내역을 수정하시겠습니까?",
           type: 'question',
           showCancelButton: true,
           confirmButtonClass: 'btn btn-confirm mt-2',
           cancelButtonClass: 'btn btn-secondary ml-2 mt-2',
           confirmButtonText: '수정',
           cancelButtonText:'취소',
           preConfirm:function(){
           	$.ajax({
           		url:"modify",
           	    method : "post",
           		dataType : 'json',
           		contentType:'application/json; charset=UTF-8',
           		data : JSON.stringify(newCartList),
           		processData : true,
           		//contentType : "application/json; charset=UTF-8",
           		success : function(data) {
           			if(data == "deleted") {
           				window.parent.reload();
           				window.close();
           			}else{
           				swal({
                            title:'발주 내역 수정',
                            text: '발주 내역이 수정되었습니다.',
                            type: 'success',
                            timer: 1500,
                            onClose: () => {
                            	location.href='detail?orderProductNo=${orderDetail.orderProductNo}';
                              }
                          })
           			}
           		},
           		error : function(xhr) {
           		    alert("error");
           		    console.log(err);
           		} 
           	});
           },
           allowOutsideClick: false
  	 })
}

function calc_price(obj){
	var itemSum = parseInt($(obj).closest("tr").find("input[name=productPrice]").val())*parseInt(obj.value);
	$(obj).closest("tr").find("td[role=price]").text(itemSum.toLocaleString()+"원");
}

</script>