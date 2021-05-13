<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>
<div class="content-wrap" style="padding-top: 40px; padding-bottom: 40px;">
	<div class="container clearfix">
		<h1>상품 등록</h1>
			<div class="form-result"></div>
			<div class="row">
				<div class="col-lg-12">
					<form class="row" id="supplyForm" action="regist" method="post">
						<div class="form-process">
							<div class="css3-spinner">
								<div class="css3-spinner-scaler"></div>
							</div>
						</div>
						<div class="col-6 form-group">
							<label>상품 분류</label>
							<select class="form-control required" name="lprodCode" id="lprodCode" onclick="formList();">
								<option value="" style="display: ">선택</option>
								<c:forEach items="${lprodList}" var="lprod">
									<option value="${lprod.lprodCode}">${lprod.lprodName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-6 form-group">
							<label>상품명:</label>
							<input type="text" name="productName" id="productName" class="form-control required" value="" placeholder="상품명을 입력해주세요.">
						</div>
						<div class="col-12 form-group">
							<label>금액:</label>
							<input type="number" name="productPrice" id="productPrice" class="form-control required" value="" placeholder="금액을 입력해주세요.">
						</div>
						<div class="col-6 form-group rent">
							<label>제조사:</label>
							<input type="text" name="productEquipManufacture" id="productEquipManufacture" class="form-control required equip" value="" placeholder="상품명을 입력해주세요.">
						</div>
						<div class="col-6 form-group rent">
							<label>대여 금액:</label>
							<input type="number" name="productEquipRentPrice" id="productEquipRentPrice" class="form-control required equip" value="" placeholder="대여 금액을 입력해주세요.">
						</div>
						<div class="col-12 form-group">
							<label>수량:</label>
							<input type="number" name="productQuantity" id="productQuantity" class="form-control required" value="" placeholder="수량을 입력해주세요.">
						</div>
						
						<div class="col-12">
							<div class="form-group">
								<label>상세설명:</label>
								<textarea name="productMemo" id="productMemo" class="form-control required" cols="30" rows="5"></textarea>
							</div>
						</div>
						
						<div class="col-6 form-group">
							<label>판매여부:</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input required" type="radio" name="productUseable"id="productUseableYES" value="판매중">
								<label class="form-check-label nott" for="productUseableYES">예</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="productUseable"id="productUseableNO" value="판매불가">
								<label class="form-check-label nott" for="productUseableNO">아니오</label>
							</div>
						</div>


						<div class="col-12">
							<button type="button" class="btn btn-secondary" onclick="prod_submit_go();">등록완료</button>
							<button type="reset" class="btn btn-secondary">초기화</button>
						</div>

					</form>

			</div>

		</div>

	</div>

</div>

<script type="text/javascript">

function prod_submit_go() {
	var lprod=$('select option:selected').val();
		var form = $('#supplyForm');
	// 	alert('등록완료');
		
	if (lprod != 'P101' && lprod != 'P102') {
		$('.equip').val(1);
	}

		
	if (lprod == "") {
		alert('상품분류 선택은 필수입니다.');
		lprod_check();
		return;
	}
	
	if ($("input[name='productName']").val() == "") {
		alert('상품명은 필수입니다.');
		$("input[name='productName']").focus();
		lprod_check();
		return;
	}
	
	
	var productPrice = $("input[name='productPrice']").val();
	if (productPrice == 0 || productPrice < 0 || productPrice == "") {
		alert('1원 이상 입력해주십시오.');
		$("input[name='productPrice']").focus();
		lprod_check();
		return;
	}
	
	if ($("input[name='productEquipManufacture']").val() == "") {
		alert('제조사 입력은 필수입니다.');
		$("input[name='productEquipManufacture']").focus();
		lprod_check();
		return;
	}
	
	var productEquipRentPrice = $("input[name='productEquipRentPrice']").val();
	if (productEquipRentPrice == 0 || productEquipRentPrice < 0 || productEquipRentPrice == "") {
		alert('1원 이상 입력해주십시오.');
		$("input[name='productPrice']").focus();
		lprod_check();
		return;
	}

	var productQuantity = $("input[name='productQuantity']").val();
	if (productQuantity == 0 || productQuantity < 0 || productQuantity == "") {
		alert('1개 이상 입력해주십시오.');
		$("input[name='productQuantity']").focus();
		lprod_check();
		return;
	}

	if ($('input:radio[name="productUseable"]').is(':checked') == false) {
		alert('판매여부 선택은 필수입니다.');
		lprod_check();
		return;
	}

	form.submit();
}

function lprod_check() {
	var lprod=$('select option:selected').val();
	if (lprod != 'P101' || lprod != 'P102') {
		$('.rent input').val("");
	}
}

window.onload = function(){
var lprod=$('select option:selected').val();
	$('.rent').hide();
}

function formList() {
	var lprod=$('select option:selected').val();
	
	if (lprod == 'P101' || lprod == 'P102') {
		$('.rent').show();
	} else {
		
		$('.rent').hide();
	}
	
}

</script>


</section>