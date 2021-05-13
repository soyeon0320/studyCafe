<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
	h1,td,th{
		text-align: center;
	}
	input[type=text], select{
	 	border: 2px solid #eee;
	 	height: 37px;
	 	font-weight: bolder;
 	}
 	
 	.i-rounded,
	.i-circled,
	.i-bordered {
		width: 32px !important;
		height: 32px !important;
		line-height: 32px !important;
		border-radius: 20px;
	}
	.btn{
		margin-bottom: 5px
	}
	thead{
		background-color :#b1b1b121;
	}
</style>
<section>
	<h1>발주내역 목록</h1>
	
	<form:form commandName="orderListViewVO" id="">
	<div class="portlet-box portlet-shadow mb-30">
	<div style="padding: 20px;">
	<button class="btn btn-primary">처리대기</button>
		<span class="input-group-append col-me-1" style="float: right;">
			<button class="btn btn-info" type="button" onclick="supplyManage();" 
			data-card-widget="search">
				<i class="fa fa-fw fa-search"></i>검색
			</button>
		</span>
		<input type="text" placeholder="검색어를 입력하세요." id="searchKeyword" name="searchKeyword" style="float: right;"/>
		<form:select path="searchCondition" style="float:right;" id="searchOrderBefore">
			<option value="">--전체--</option>
			<form:options items="${orderCodeList}" itemValue="codeId" itemLabel="codeIdNm"/>
		</form:select>
<!-- 		<input type="hidden" value=1 name="pageIndex"> -->
<!-- 		<span onclick="refresh();" style="float: right;"><i class="i-circled i-light icon-refresh"></i></span> -->
	</div>
	</form:form>
	
	<form action="orderSuccess" name="orderListViewFrom" method="post" style="clear: both;">
		<table class="table table-hover mt-20">
			<thead>
				<tr>
				  <th>
				  	<input type="checkbox" name="checkAll" id="checkAll" onclick="checkAllorder()">
				  	<input type="hidden" name="test" id="test" value="">
				  </th>
				  <th>번호</th>
				  <th>발주번호</th>
				  <th>가맹점명</th>
				  <th>발주상품</th>
				  <th>총 금액</th>
				  <th>주문일자</th>
				</tr>
			</thead>
			<tbody id="supplyBefore">
					
			</tbody>
		</table>
		<div style="padding-left: 20px;">
		<button class="btn btn-success" type="button" onclick="checkData()" style="float:left;">발주확인</button>
		</div>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light" id="supplyPage" style="align:center;">
			
			</ul>
		</div>
		<input type="hidden" id="supplyPageIndex" value=1>
	</form><br>
	</div>
<!-- 	<button class="btn btn-light icon-chevron-right">배송중</button> -->

		<form:form commandName="orderListViewVO"  autocomplete="off" method="get" action="list" id="searchForm">
			<div class="portlet-box portlet-shodow mb-30">
			<div style="padding: 20px;">
				<button class="btn btn-teal" onclick="javascript:$('#orderStatus').val('OS03');$('#condition').val('OS03');$('#searchForm').submit();">배송완료</button>
				<button class="btn btn-warning" onclick="javascript:$('#orderStatus').val('OS05');$('#condition').val('OS05');$('#searchForm').submit();">반품대기</button>
				<button class="btn btn-dark" onclick="javascript:$('#orderStatus').val('OS06');$('#condition').val('OS06');$('#searchForm').submit();">반품완료</button>
				
				<input type="hidden" name="searchCondition" id="condition" value="">	
				<input type="hidden" id="orderStatus" name="orderProductStatus" value="">
				<span class="input-group-append col-me-1" style="float: right;">
					<button class="btn btn-info" type="button" onclick="javascript:$('#searchOrder').val();$('#searchForm').submit();" data-card-widget="search">
						<i class="fa fa-fw fa-search"></i>검색
					</button>
				</span>
				<input type="text" placeholder="검색어를 입력하세요." id="searchOrder" name="searchKeyword" value="" style="float: right;">
				<form:select path="searchCondition" style="float:right;">
					<option value="">--전체--</option>
					<form:options items="${orderCodeList}" itemValue="codeId" itemLabel="codeIdNm"/>
				</form:select>
				<form:hidden path="pageIndex" value="1"  id="pageIndex" />
			</div>
		</form:form>
		<form action="refundSuccess" name="refundReq" method="post">
		<table class="table table-hover mt-20">
			<thead>
				<tr>
 				<c:if test="${orderStatus eq 'OS05' }"> 
				  <th>
				  	<input type="checkbox" name="reCheckAll" id="refChekAll" onclick="refundCheckAll()">
				  	<input type="hidden" name="refund" id="refund" value="">
				  </th>
				</c:if>
		 		 <th>번호</th>
				  <th>발주번호</th>
				  <th>가맹점명</th>
				  <th>발주상품</th>
				  <th>총 금액</th>
				  <th>주문일자</th>
				  <th>처리상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty supplyManageList}">
					<tr>
						<td colspan="7">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${supplyManageList}" var="sup" varStatus="status">
					<tr>
						<c:if test="${orderStatus eq 'OS05'}">
						  <td>
						  	<input type="checkbox" name="refundChk" value="${sup.orderProductNo}">
						  </td>
						</c:if>  
					  <td>${status.count}</td>
					  <td onclick="OpenWindow('orderDetail?orderProductNo=${sup.orderProductNo}', '발주목록 상세', 800, 600)">${sup.orderProductNo }</td>
					  <td>${sup.storeName}</td>
					  <td>${sup.productName}</td>
					  <td style="float: right;"><fmt:formatNumber value="${sup.orderProductTotalPrice}" maxFractionDigits="3" /> 원</td>
					  <td>
					  	<fmt:formatDate value="${sup.orderProductRegDate}" pattern="yyyy-MM-dd"/>
					  </td>
					  <td>
					  	<c:if test="${sup.orderProductStatus eq 'OS05'}">
					  		<button type="button" class="btn btn-warning mb-3 mr-3"><c:out value="반품대기"></c:out></button>
					  	</c:if>
					  	<c:if test="${sup.orderProductStatus eq 'OS03'}">
					  		<button type="button" class="btn btn-teal mb-3 mr-3"><c:out value="배송완료"></c:out></button>
					  	</c:if>
					  	<c:if test="${sup.orderProductStatus eq 'OS06'}">
					  		<button type="button" class="btn btn-dark mb-3 mr-3"><c:out value="반품완료"></c:out></button>
					  	</c:if>
					  </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${orderStatus eq 'OS05'}">
		<div style="padding-left: 20px; ">
		<button class="btn btn-success" type="button" onclick="refundData()">반품처리</button>
		</div>
		</c:if>
		</form>
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_supply" />
				</ul>    
			</div>    
			<input type="hidden" id="pageIndex"/>
		</div>
		
		
	<script>
		function formatDate(date) { 
			var d = new Date(date), 
			month = '' + (d.getMonth() + 1),
			day = '' + d.getDate(), 
			year = d.getFullYear(); 
			
			if (month.length < 2) month = '0' + month; 
			if (day.length < 2) day = '0' + day; 
			
			return [year, month, day].join('-'); 
		}

	
		window.addEventListener("load",function(){
			supplyManage();
			<c:if test="${myMessage != null}">
				swal({
	                    title:'발주 처리',
	                    text: '발주 신청이 처리되었습니다.',
	                    type: 'success'
	                  })
	        <c:set var="myMessage" value="" />
			</c:if>
		});
		
		
		function supplyManage(){
			var pageIndex = $("#supplyPageIndex").val();
			var searchCondition = $("#searchOrderBefore").val();
			var searchKeyword = $("#searchKeyword").val();
			
			var data = {
					orderProductStatus:'OS01',
					pageIndex:pageIndex,
					searchCondition : searchCondition,
					searchKeyword : searchKeyword
			}
			var str = "";
			var page = "";
			$.ajax({
				url:"<%=request.getContextPath()%>/orderProduct/supplyBefore",
				type:"post",
				data: data,
				success:function(data){
			 		 if(data.supplyBeforeList.length != 0){
						 for (var i=0; i< data.supplyBeforeList.length; i++){
							var supplyBeforeList = data.supplyBeforeList[i];
							
							str += "<tr>";
							str += "<td><input type='checkbox' name='chkOrder' value='"+supplyBeforeList.orderProductNo+"'></td>" 
							str += "<td>"+ (i + 1) + "</td>"
							str += "<td>" + supplyBeforeList.orderProductNo+"</td>";
							str += "<td>" + supplyBeforeList.storeName+ "</td>";
							str += "<td>" + supplyBeforeList.productName + "</td>";
							str += "<td style='float:right;'>" + addComma(supplyBeforeList.orderProductTotalPrice) + " 원</td>";
							str += "<td>" + formatDate(supplyBeforeList.orderProductRegDate) + "</td>";
							str += "</tr>";
						}
// 					
					}else{
						str = "<tr><td colspan ='7' align='center'>해당 내용이 없습니다.</td></tr>";
					}
					
					$("#supplyBefore").html(str);
					set_paging(data.supplyBeforePaginationInfo, 'go_supplyBefore', '#supplyPage');
				},
				error:function(xhr){
					console.log(xhr);
				}
			});
		}
		
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
		function checkAllorder(){
		      if( $("#checkAll").is(':checked') ){
		        $("input[name=chkOrder]").prop("checked", true);
		      }else{
		        $("input[name=chkOrder]").prop("checked", false);
		      }
		}
		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
			winleft = (screen.width - WinWidth) / 2;
			wintop = (screen.heigth - WinHeight) / 2;
			var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth 
					+ ",height=" + WinHeight + ", top=" + wintop + ", left=" + winleft +
					+ ", resizable=yes, status=yes"
					);
			win.focus();
		}
		
		function checkData(){
	        var obj = $("[name=chkOrder]");
	        var chkArray = new Array(); 
	 		
	        $("input:checkbox[name='chkOrder']").each(function(){
				
	        	 chkArray.push(this.value);
	        	
	        	if($(this).is(":checked") == true) {
        		  $('#test').val(chkArray);
					
	        		
        		  $("form[name='orderListViewFrom']").submit();
	  		        
	        	}else{
	        	  alert('체크박스를 미체크 하셨습니다. 다시 선택해주세요');
	        		
	        	}

	        });
	        
	    }
	        
		
		function orderManage(tabId,obj){
// 			if($(obj).hasClass("btn-success")){
				
// 				return;
// 			}
			
			if(tabId == '#refundWa'){
				$('div.btn-orderManage .btn-light').removeClass('btn-light').addClass('btn-success');
				$(obj).removeClass('btn-success').addClass('btn-light');
				$(".refundWait").show();
				$(".deliverySuccess").hide();
				$(".refundSuccess").hide();
			}
			if(tabId == '#refundSu'){
				$('div.btn-orderManage .btn-light').removeClass('btn-light').addClass('btn-success');
				$(obj).removeClass('btn-success').addClass('btn-light');
				$(".refundSuccess").show();
				$(".deliverySuccess").hide();
				$(".refundWait").hide();
			}
			if(tabId == '#delivery'){
				$('div.btn-orderManage .btn-light').removeClass('btn-light').addClass('btn-success');
				$(obj).removeClass('btn-success').addClass('btn-light');
				$(".refundSuccess").hide();
				$(".deliverySuccess").show();
				$(".refundWait").hide();
			}
			$(tabId).show().attr("class","refundWait");
			$("div.btn-list .button-red").removeClass("button-red").addClass("button-blue");
			$(obj).removeClass("button-blue").addClass("button-red");
			
		}
		
		function refundCheckAll(){
		      if( $("#refChekAll").is(':checked') ){
		        $("input[name=refundChk]").prop("checked", true);
		      }else{
		        $("input[name=refundChk]").prop("checked", false);
		      }
		}
		function refundData(){
	        var obj = $("[name=refundChk]");
	        var chkArray = new Array(); 
	 
	        $('input:checkbox[name=refundChk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	            chkArray.push(this.value);
	        	
	            if($(this).is(":checked") == true) {
			        $('#refund').val(chkArray);
	        	
			        $("form[name='refundReq']").submit();
	            }else{
	            	
			        alert('체크박스를 미체크 하셨습니다. 다시 선택해주세요'); 
	            }
	        });
	        
	        
	    }
		
		function go_supply(pageIndex){
			$("#pageIndex").val(pageIndex);
			$("#searchForm").submit();
		}
		function go_supplyBefore(pageIndex){
			$("#supplyPageIndex").val(pageIndex);
			supplyManage();
		}
		
// 		function refresh(){
// 			setInterval('supplyManage()', 50000);
// 		}
		
	</script>
</section>
