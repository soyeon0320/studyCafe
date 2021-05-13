<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<style>
.i-rounded,
.i-circled,
.i-bordered {
	width: 32px !important;
	height: 32px !important;
	line-height: 32px !important;
	border-radius: 20px;
	margin: 0px;
	float: none;
}

.i-plain{
	width: 28px !important;
	height: 28px !important;
	line-height: 28px !important;
	color: #de0b0b;
	margin: 0px;
	float: none;
}

.icon-search3:before{
    cursor: pointer;
}

.icon-sort1:before{
    
    cursor: pointer;
}
.icon-sort1:hover{
	color: powderblue;
}

table.table.table-bordered.table-hover tbody tr:nth-child(even) {
  background-color : #fcfcfc
}

 input[type=text], select{
 	border: 2px solid #eee;
 	height: 37px;
 	font-weight: bolder;
 }
 input[type=number]{
    width: 50px;
    border: 2px solid #eee;
 }
 input[type=date]{
 	border: 2px solid #eee;
 }
 
 .btn-info{
 	height: 37px;
    margin-bottom: 5px;
 }
 
</style>

<section>
<h1 class="mt-20 mb-20">물품 발주</h1>

<div class="row">
	<div class="col-3">
		<div class="portlet-box portlet-shadow  mb-30" style="height: 96%; overflow: auto; padding: 10px;max-height: 850px;">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
				<div class="flex d-flex flex-column">
					<h3>물품 검색</h3>
				</div>
				<div>
					<form class="search-form-o form-inline" onsubmit="javascript:getProd();return false;">
						<select name="searchType" class="form-control form-control-sm" style="height: 37px !important;" onchange="getProd();">
							<option value="">--전체--</option>
							<c:forEach items="${lprodList }" var="lprod">
								<option value="${lprod.lprodCode }" >${lprod.lprodName }</option>
							</c:forEach>					
						</select>
						<input type="text" class="form-control form-control-sm" placeholder="검색..." name="keyword">
						<button class="bg-trans border0 no-padding"  type="button" onclick="getProd();" ><i class="icon-search3" style="color: #0040d0;"></i></button>
					</form>
				</div>
			</div>
			
			<div class="portlet-body" style="padding: 10px;">
				<table class="table table-bordered table-hover">
					<colgroup>
						<col width="26%">				
						<col width="*">				
						<col width="18%">				
						<col width="10%">				
					</colgroup>
					<thead align="center" style="background-color: #f9f9f9; font-size: smaller;">
						<tr>
							<th>분류코드</th>
							<th>상품명</th>
							<th>재고</th>
							<th><input type="checkbox" onclick="allChk(this);" id="allChk"></th>
						</tr>
					</thead>
					<tbody align="center" id="prodList">
					
					</tbody>			
				</table>
			</div>
		</div>
	</div>

	<div class="col-9" style="height: 900px;">
		<div class="portlet-box portlet-shadow  mb-30">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b">
				<div class="flex d-flex flex-column">
					<h3>장바구니</h3>
				</div>
				<div class="portlet-tools">
					<ul class="nav">
						<li class="nav-item">
							<i class="icon-plus1" onclick="my_toggle('orderBody','cartBody',this);" style="cursor: pointer;" id="cartToggle"></i>
						</li>
					</ul>
				</div>
			</div>
			<div class="portlet-body" style="height: 90%;display: none;overflow: auto;" id="cartBody">
				<div style="text-align: right;" class="mb-10">
					<input class="btn btn-info" type="button" value="발주신청" onclick="order_prod()"> 
				</div>				
				<table class="table table-bordered" style="clear: both;">
					<col width="4%">				
					<col width="10%">				
					<col width="*">				
					<col width="10%">	
					<col width="10%">				
					<col width="10%">				
					<col width="10%">				
					<col width="6%">	
					<thead align="center" style="background-color: #f9f9f9; font-size: smaller;">
						<tr>
							<th><input type="checkbox" id="cartAllChk" onclick="cart_all_chk(this);"></th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>공급가액(원)</th>
							<th>구매 가능 수량</th>
							<th>수량</th>
							<th colspan="2">합계</th>
						</tr>
					</thead>
					<tbody align="center" id="cartList">
					</tbody>			
				</table>
				<div class="portlet-footer" style="text-align: right;">
					<div style="display: inline;font-weight: bold;font-size: large;">
						<span>총 금액</span>
						<span id='totalSum' ></span>
						<input type="hidden" name="orderProductTotalPrice">
					</div>
				</div>
			</div>
		</div>
		
	
	
		<div class="portlet-box portlet-shadow  mb-30" >
		
			<div class="portlet-header flex-row flex d-flex align-items-center b-b">
				<div class="flex d-flex flex-column">
					<h3>발주목록<i class="fa fa-sync-alt" title="새로고침" style="padding-left: 10px;cursor: pointer;" onclick="getOrderList();"></i></h3>
				</div>
				
				<div class="portlet-tools">
					<ul class="nav">
						<li class="nav-item">
							<i class="icon-minus1" onclick="my_toggle('cartBody','orderBody' ,this);" style="cursor: pointer;"></i>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="portlet-body" style="height: 90%"  id="orderBody">
				<div style="float: right;">
					<ul class="nav mb-10">
						<li>
							<i class="icon-calendar3" style="font-size: x-large;padding-right: 5px;"></i>
						</li>
						<li class="nav-item">
							<form class="form-inline" id="orderSearchForm" autocomplete="off">
								<div>
									<input type="text" id="date_timepicker_start" class="form-control form-control-sm" placeholder="~부터" name="startDate">
									<input type="text" id="date_timepicker_end" class="form-control form-control-sm"   placeholder="~까지"  name="endDate">
								</div>
								<select name="searchCondition" onchange="getOrderList(1);" class="form-control form-control-sm" style="height: 37px !important;margin-right: 5px;margin-left: 5px;">
									<option value="">--전체--</option>
										<c:forEach items="${codeList }" var="code">
										<option value="${code.codeId }" >${code.codeIdNm }</option>
									</c:forEach>					
								</select>
								<input class="btn btn-info btn-xs"  type="button" onclick="getOrderList(1);" value="검색" style="margin: 0px; "/>
								<input type="hidden" name="storeCode" value="${sessionScope.loginOwner.storeCode }">
								<input type="hidden" name="pageIndex" value=1 id="pageIndex">
							</form>	
						</li>
					</ul>
				</div>			
			
				<table class="table table-bordered table-hover">
					<colgroup>
						<col width="6%">
						<col width="10%">
						<col>
						<col width="15%">
						<col width="6%">
						<col width="15%">
					</colgroup>
					<thead align="center" style="background-color: #f9f9f9; font-size: smaller;">
						<tr>
							<th>발주번호</th>
							<th>진행상태</th>
							<th>상품</th>
							<th>신청일자</th>
							<th style="text-align: right;">상품수량</th>
							<th style="text-align: right;">금액(원)</th>
						</tr>
					</thead>
					<tbody align="center" style="cursor: pointer;" id="orderList">
						<c:forEach items="${orderList }" var="order" varStatus="status">
							<tr onclick="OpenWindow('detail?orderProductNo=${order.orderProductNo}', 'title',800,900);">
								<td>${order.orderProductNo }</td>
								<td data-role="${order.orderProductStatus}" >${order.orderProductStatusLabel}</td>
								<td align="left">${order.productName }</td>
								<td><fmt:formatDate value="${order.orderProductRegDate }" pattern="yyyy-MM-dd HH:mm"/></td>
								<td align="right">${order.orderProductTotalCount }</td>
								<td align="right"><fmt:formatNumber value="${order.orderProductTotalPrice }" maxFractionDigits="3" /></td>
							</tr>
						</c:forEach>
					</tbody>			
				</table>
				<div class="container clearfix" style="width: fit-content;">
					<ul class="pagination pagination-circle pagination-3d pagination-light" id="orderPagination">
						<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="page_change" />
					</ul> 
				</div>  
			</div>
		</div>


 	</div>
</div>

</section>
<script>

window.onload=function(){
	cartNullChk();
	prodListNullChk();
	orderListNullChk();
	setPicker();
	orderList_refresh();
}

function getProd(){
	var data = {
			"searchType" : $("select[name=searchType]").val(),
			"keyword" : $("input[name=keyword]").val()
	}
	$.ajax({
		url:"search",
		method:"post",
		data:data,
		dataType:"json",
		success:function(data){
			setProdList(data);
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
}

function setProdList(data){
	var res = "";
	for (var i = 0; i < data.result.length; i++) {
		
		var prod = data.result[i];
		var chk = "checked";
		var readOnly = "";
		if(!find_prod("cartList",prod.productCode)) chk = "";
		if(prod.productQuantity == "0") readOnly = "disabled";
		
		res += "<tr>"
			  +"<td style='display: none' class='productCode'>"+ prod.productCode +"<input type='hidden' name='productCode' value="+prod.productCode+"></td>"
			  +"<td class='lprodCode'>"+ prod.lprodCode +"</td>"
			  +"<td class='productName' align='left'>"+ prod.productName +"</td>"
			  +"<td align='right' style='display: none' class='productPrice'>"+ prod.productPrice.toLocaleString() +" 원<input type='hidden' name='productPrice' value="+prod.productPrice+"></td>"
			  +"<td class='productQuantity'>"+ prod.productQuantity +"</td>"
			  +"<td class='chk'><input type='checkbox' onclick='addProd(this)' "+chk +" "+readOnly+"></td>"
			  +"</tr>"
	}
	
	if(res == "") res = "<tr><td colspan='4' align='center'>검색 결과가 없습니다.</td></tr>";

	
	$("#prodList").html(res);
	all_chk_btn_chk();
	if($("#prodList tr td input[type=checkbox][disabled!=disabled]").length == 0) $("#allChk").prop("checked",false);

}


function allChk(obj){
	var flag = $(obj).prop("checked");
	if(flag){
		var addList = $("#prodList tr td input[type=checkbox][disabled!=disabled]").prop("checked",true);
		
		for (var i = 0; i < addList.length; i++) {
			var prod = addList.eq(i);
			var prod_code = prod.closest("tr").find("input[name=productCode]").val();
			if(!find_prod("cartList",prod_code)) addProd(prod);
		}
		
	}else{
		var distractList = $("#prodList tr td input[type=checkbox][disabled!=disabled]").prop("checked",false);
		
		for (var i = 0; i < distractList.length; i++) {
			var prod = distractList.eq(i);
			var prod_code = prod.closest("tr").find("input[name=productCode]").val();
			if(find_prod("cartList",prod_code)) addProd(prod);
		}
		
	}
}

function addProd(obj){
	var prod_code = $(obj).closest("tr").find("input[name=productCode]").val();
	var prod_price = $(obj).closest("tr").find("input[name=productPrice]").val();
	

	if($(obj).prop("checked")){
		var item = $(obj).closest("tr").clone();
		var productQuantity = parseInt(item.children("td.productQuantity").text());
		item.children("td.chk").remove();
		item.children("td.lprodCode").remove();
		item.children("td").css("display","");
		
		item.prepend("<td><input type='checkbox' onclick='cart_chk();'></td>");
		item.append("<td><input type='number' name='orderProductQuantity' min=0 max="+productQuantity+" value=1 onchange='changeCnt(this);'></td>");
		item.append("<td class='sum' align='right' ></td>");
		item.append("<td><i class='i-plain icon-remove' onclick='removeTr(this)'></i></td>");
		$("#cartList").append(item);		
 		
		
	}else{
		
		$("#cartList").find("input[name=productCode][value="+prod_code+"]").closest("tr").remove();
		
	}

 	
	if($("#cartToggle").hasClass("icon-plus1")) $("#cartToggle").trigger("click");
	all_chk_btn_chk();
 	cartNullChk();
 	setTotalSum();
}

function all_chk_btn_chk(){
	if($("#prodList input[type=checkbox][disabled!=disabled]").length 
			== $("#prodList input[type=checkbox][disabled!=disabled]:checked").length){
			$("#allChk").prop("checked",true);
	} else{
		$("#allChk").prop("checked",false);
	}
}


function find_prod(target_id,prod_code){
	if($("#"+target_id).find("input[name=productCode][value="+prod_code+"]").length){
		return true;
	}
	return false;
}

function removeTr(obj){
	var prod_code = $(obj).closest("tr").find("input[name=productCode]").val();
	
	$("#prodList").find("input[name=productCode][value="+prod_code+"]").closest("tr").find("input[type=checkbox]").prop("checked",false);
	$(obj).closest("tr").remove();
	setTotalSum();
	cartNullChk();
}

function cartNullChk(){
	if($("#cartList").children("tr").length == 0) {
		$("#cartList").append("<tr class='nullChk'><td colspan='8' align='center'>장바구니가 비어있습니다.</td></tr>");
	}else{
		$("#cartList").children("tr.nullChk").remove();
	}
}
function prodListNullChk(){
	if($("#prodList").children("tr").length == 0) {
		$("#prodList").append("<tr><td colspan='4' align='center'>상품을 검색해 주세요.</td></tr>");
	}
}
function orderListNullChk(){
	if($("#orderList").children("tr").length == 0) {
		$("#orderList").append("<tr><td colspan='6' align='center'>발주 내역이 없습니다..</td></tr>");
	}
}

function setTotalSum(){
	var prodCode = $("#cartList input[name=productCode]");
	var prodPrice = $("#cartList input[name=productPrice]");
	var prodCnt = $("#cartList input[name=orderProductQuantity]");
	
	var totalPrice = 0;
	for (var i = 0; i < prodCode.length; i++) {
		var price = parseInt(prodPrice.eq(i).val())*parseInt(prodCnt.eq(i).val());
		$("#cartList input[name=productCode]").closest("tr").find("td.sum").eq(i).text(price.toLocaleString() +" 원");
		totalPrice += price;
	}

	$("#totalSum").text(totalPrice.toLocaleString()+" 원");
	$("input[name=orderProductTotalPrice]").val(totalPrice);
}

function changeCnt(obj){
	
	if(obj.value < 0 || !(/^[0-9]*$/.test(obj.value))){
		swal_alert("유효하지 않은 값입니다.");
		obj.value = 0;
		return;
	}
	
	setTotalSum();
	
	
}

function order_prod(){
	
	if($("#cartList tr td input:checked").length == 0){
		swal_alert("상품을 선택해주시길 바랍니다.");
		return;
	}
	
	var productList = new Array();
	
	var prodCode = $("#cartList tr td input:checked").closest("tr").find("input[name=productCode]");
	var prodPrice = $("#cartList tr td input:checked").closest("tr").find("input[name=productPrice]");
	var prodCnt = $("#cartList tr td input:checked").closest("tr").find("input[name=orderProductQuantity]");
	
	for (var i = 0; i < prodCode.length; i++) {
	
		var prod = {
				productCode : prodCode.eq(i).val(),
				productPrice : prodPrice.eq(i).val(),
				orderProductQuantity : prodCnt.eq(i).val()
		}
		
		productList.push(prod);
	}
	
	if(!productList.length){
		swal_alert("상품을 담아주시길 바랍니다..!");
		return;
	}
	
	var orderList = {
			productList:productList,
			orderProductTotalPrice:$("input[name=orderProductTotalPrice]").val(),
			storeCode:"${sessionScope.loginOwner.storeCode}"
	}
	
	swal({
        title: '상품 주문',
        text: productList.length + "종류의 상품을 주문 하시겠습니까?",
        type: 'question',
        showCancelButton: true,
        confirmButtonClass: 'btn btn-confirm mt-2',
        cancelButtonClass: 'btn btn-secondary ml-2 mt-2',
        confirmButtonText: '주문',
        cancelButtonText:'취소',
        preConfirm:function(){
        	$.ajax({
        		url:"regist",
                method : "post",
            	dataType : 'json',
            	data : JSON.stringify(orderList),
            	processData : true,
            	contentType : "application/json; charset=UTF-8",
            	success : function(data) {
        			swal({
                          title:'주문 완료',
                          text: '주문이 완료되었습니다.',
                          type: 'success',
                          onClose: () => {
        						location.href='main';
                            }
                        })
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


function getOrderList(pageIndex){
	if(pageIndex){
		$("#pageIndex").val(pageIndex);
	}
	
	$.ajax({
		url:"orderList",
		type:"post",
		data:$("#orderSearchForm").serialize(),
		success:function(data){
			setOrderList(data.orderList);
			set_paging(data.paginationInfo,'page_change','#orderPagination');
		},
		error:function(xhr){
			console.log(xhr);
		}
	});
}

function setOrderList(orderList){
	
	var resStr ="";
	
	if(orderList.length != 0){
		for (var i = 0; i < orderList.length; i++) {
			var order = orderList[i];
			resStr +="<tr onclick=OpenWindow('detail?orderProductNo="+order.orderProductNo+"','title',800,900);>";
			
			resStr += "<td>"+order.orderProductNo+"</td>";
			resStr += "<td data-role='"+order.orderProductStatus+"'>"+order.orderProductStatusLabel+"</td>";
			resStr += "<td align='left'>"+order.productName+"</td>";
			resStr += "<td>"+order.formatRegDate+"</td>";
			resStr += "<td align='right'>"+order.orderProductTotalCount+"</td>";
			resStr += "<td align='right'>"+order.orderProductTotalPrice.toLocaleString()+"</td>";
			
			resStr +="</tr>"
		}
		
	}else{
		
		resStr ="<tr><td colspan='6' align='center'>검색 결과가 없습니다.</td>"
	}
	
	$("#orderList").html(resStr);
	
}

function page_change(pageIndex){
	getOrderList(pageIndex);
}

function my_toggle(targetId,myId,obj){
	
	if($(obj).attr("class").indexOf("plus1") > 0){
		$("i.icon-minus1").attr("class","icon-plus1")
		$(obj).attr("class","icon-minus1");
	}else{
		$("i.icon-plus1").attr("class","icon-minus1")
		$(obj).attr("class","icon-plus1");
	}
	$("#"+targetId).slideToggle();
	$("#"+myId).slideToggle();
	
}

function cart_all_chk(obj){
	if($(obj).prop("checked")){
		$("#cartList tr td input[type=checkbox]").prop("checked",true);
	}else{
		$("#cartList tr td input[type=checkbox]").prop("checked",false);
	}
}

function cart_chk(){
	if($("#cartList tr td input[type=checkbox]").length == $("#cartList tr td input[type=checkbox]:checked").length){
		$("#cartAllChk").prop("checked",true);
	}else{
		$("#cartAllChk").prop("checked",false);
	}
}
</script>
<script>

function setPicker(){
	$(function(){
		$('#date_timepicker_start').datetimepicker({
			format:'Y/m/d',
			onShow:function( ct ){
				this.setOptions({
				maxDate:$('#date_timepicker_end').val()?$('#date_timepicker_end').val():false
				});
			},
			timepicker:false
		});
		
		$('#date_timepicker_end').datetimepicker({
			format:'Y/m/d',
			onShow:function( ct ){
			this.setOptions({
					minDate:$('#date_timepicker_start').val()?$('#date_timepicker_start').val():false
				});
			},
			timepicker:false
		});
	});
}
</script>
<script>
function orderList_refresh(){  
	setInterval('getOrderList()',50000); 
}
</script>
