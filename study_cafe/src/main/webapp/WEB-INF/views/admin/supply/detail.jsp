<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>
<div class="content-wrap" style="padding-top: 40px; padding-bottom: 40px;">
	<div class="container clearfix">
		<h1>상품 상세조회</h1>
			<div class="form-result"></div>
			<div class="row">
				<div class="col-lg-12">
					<form class="row" id="supplyForm">
						<div class="form-process">
							<div class="css3-spinner">
								<div class="css3-spinner-scaler"></div>
							</div>
						</div>
						<div class="col-6 form-group">
							<label>상품 분류</label>
							<input type="text" name="lprodName" id="lprodName" class="form-control required" value="${product.lprodName}" readonly="readonly">
							<input type="hidden" name="lprodCode" value="${product.lprodCode}">
						</div>
						<div class="col-6 form-group">
							<label>상품명:</label>
							<input type="text" name="productName" id="productName" class="form-control required" value="${product.productName}" readonly="readonly">
						</div>
						<div class="col-12 form-group">
							<label>금액:</label>
							<input type="number" name="productPrice" id="productPrice" class="form-control required" value="${product.productPrice}" readonly="readonly">
						</div>
						<div class="col-6 form-group rent" >
							<label>제조사:</label>
							<input type="text" name="productEquipManufacture" id="productEquipManufacture" class="form-control required" value="${product.productEquipManufacture}" readonly="readonly">
						</div>
						<div class="col-6 form-group rent">
							<label>대여 금액:</label>
							<input type="number" name="productEquipRentPrice" id="productEquipRentPrice" class="form-control required" value="${product.productEquipRentPrice}" readonly="readonly">
						</div>
						<div class="col-12 form-group">
							<label>수량:</label>
							<input type="number" name="productQuantity" id="productQuantity" class="form-control required" value="${product.productQuantity}" readonly="readonly">
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>상세설명:</label>
								<textarea name="productMemo" id="productMemo" class="form-control required" cols="30" rows="5" readonly="readonly">${product.productMemo}</textarea>
							</div>
						</div>
						<div class="col-6 form-group">
							<label>판매여부:</label><br>
							<input type="text" name="productUseable" id="productUseable" class="form-control required" value="${product.productUseable}" readonly="readonly">
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-secondary" onclick="prod_modify_go();">수정</button>
						</div>
				</form>
			</div>

		</div>

	</div>

</div>

<script type="text/javascript">
window.onload = function(){
	var lprod=$("input[name='lprodCode']").val();
	console.log(lprod);
	if (lprod == 'P101' || lprod == 'P102') {
		$('.rent').show();
	} else {
		$('.rent').hide();
	}
}

function prod_modify_go() {
	location.href="<%=request.getContextPath()%>/supply/modifyForm?productCode=${product.productCode}";
}



</script>


</section>