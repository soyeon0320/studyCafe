<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
	h1,td{
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
	td{
		text-align: left;
	}
	thead{
		background-color :#b1b1b121;
	}
</style>
<script>
	/* 글 목록 화면 function */
	function fn_egov_selectList() {
		document.orderListViewFrom.action = "<c:url value='/orderProduct/list'/>";
	   	document.orderListViewFrom.submit();
	}
	
	/* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	document.orderListViewFrom.elements['searchOrderListViewVO.pageIndex'].value = pageNo;
    	document.orderListViewFrom.action = "<c:url value='/orderProduct/list'/>";
       	document.orderListViewFrom.submit();
    }
</script>
<section>
	<h1>발주내역 목록</h1>
	<form:form action="orderSuccess" commandName="orderListViewFormVO" id="orderListViewFrom" name="orderListViewFrom" method="post">
	<button class="icon-chevron-right btn btn-secondary">처리대기</button>
	
	<form:select path="searchOrderListViewVO.pageUnit" onchange="fn_egov_selectList()">
		<option value="2" ${searchOrderListViewVO.pageUnit eq 2 ? 'selected':'' } >2</option>
		<form:options items="${orderListViewFormVO.searchOrderListViewVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
	</form:select>
	<select name="searchOrderListViewVO.searchCondition" id="searchOrderListViewVO.searchCondition">
		<option value="p" ${searchOrderListViewVO.searchCondition eq 'p' ? 'selected':'' }>가맹점명</option>
	</select>
	<input type="text" placeholder="검색어를 입력하세요." id="searchOrderListViewVO.searchKeyword" name="searchOrderListViewVO.searchKeyword" value="${searchOrderListViewVO.searchKeyword }"/>
	<span class="input-group-append col-me-1">
		<button class="btn btn-primary" type="button" onclick="fn_egov_selectList();" 
		data-card-widget="search">
			<i class="fa fa-fw fa-search"></i>검색
		</button>
	</span>
	<div>
		<input id="content" type="text" name="content"/>
		<input type="button" id="execute" value="QR코드 생성"/>
		<img id="img"  onload="this.style.display = 'block'"/>
	</div>
	
	<div style="float: right;display: inline;">
		<span><i class="i-circled i-light icon-refresh"></i></span>
	</div>
	
	<form action="orderSuccess" name="chkOrder" method="post" style="clear: both;">
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
			<tbody>
				<c:if test="${empty orderManagePagingList }">
					<tr>
						<td colspan="6">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${orderManagePagingList }" var="oml" varStatus="status">
				<c:if test="${oml.orderProductStatus eq 'OS01' }">
					<tr style="cursor: pointer;">
					  <th>
					  	<input type="checkbox" name="chkOrder" value="${oml.orderProductNo }">
					  </th>
					  <td>${status.count }</td>
					  <td onclick="OpenWindow('orderDetail?orderProductNo=${oml.orderProductNo}', '발주목록 상세', 800, 600)">${oml.orderProductNo }</td>
					  <td>${oml.storeName}</td>
					  <td>${oml.productName }</td>
					  <td><fmt:formatNumber value="${oml.orderProductTotalPrice }" maxFractionDigits="3" /> 원</td>
					  <td>
					  	<fmt:formatDate value="${oml.orderProductRegDate }" pattern="yyyy-MM-dd"/>
					  </td>
					</tr>
				</c:if>
				</c:forEach>
		</tbody>
		</table>
	<button class="btn btn-info icon-chevron-right" type="button" onclick="checkData()">발주확인</button>
	<div id="pagination" style="margin: auto;">
		<%@ include file="/WEB-INF/include/pagination.jsp" %>
		<form:hidden path="searchOrderListViewVO.pageIndex"/>
	</div>
	</form>
	</form:form>
	<div class="btn-orderManage">
	<button class="btn btn-light icon-chevron-right">배송중</button>
	<button class="btn btn-success icon-chevron-right" onclick="orderManage('#delivery', this)">배송완료</button>
	<button class="btn btn-light icon-chevron-right" onclick="orderManage('#refundWa', this)">반품대기</button>
	<button class="btn btn-light icon-chevron-right" onclick="orderManage('#refundSu', this)">반품완료</button>
	</div>
	<div class="deliverySuccess" id="delivery">
	<table class="table table-hover mt-20">
		<thead>
			<tr>
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
			<c:if test="${empty orderManagePagingList }">
				<tr>
					<td colspan="7">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${orderManagePagingList}" var="oml" varStatus="status">
			<c:if test="${oml.orderProductStatus eq 'OS03'}">
				<tr>
				  <td>${status.count }</td>
				  <td onclick="OpenWindow('orderDetail?orderProductNo=${oml.orderProductNo}', '발주목록 상세', 800, 600)">${oml.orderProductNo }</td>
				  <td>${oml.storeName}</td>
				  <td>${oml.productName}</td>
				  <td><fmt:formatNumber value="${oml.orderProductTotalPrice}" maxFractionDigits="3" /> 원</td>
				  <td>
				  	<fmt:formatDate value="${oml.orderProductRegDate}" pattern="yyyy-MM-dd"/>
				  </td>
				  <td>
				  	<button type="button" class="btn btn-shadow  btn-purple mb-3 mr-3"><c:out value="배송완료"></c:out></button>
				  </td>
				</tr>
			</c:if>
			</c:forEach>
			
		</tbody>
	</table>
	</div>
	<form action="refundSuccess" name="refundReq" method="post">
	<div class="refundWait" id="refundWa" style="display: none;">
	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>
			  	<input type="checkbox" name="reCheckAll" id="refChekAll" onclick="refundCheckAll()">
			  	<input type="hidden" name="refund" id="refund" value="">
			  </th>
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
			<c:if test="${empty orderManagePagingList}">
				<tr>
					<td colspan="7">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${orderManagePagingList}" var="oml" varStatus="status">
			<c:if test="${oml.orderProductStatus eq 'OS05'}">
				<tr>
				  <td>
				  	<input type="checkbox" name="refundChk" value="${oml.orderProductNo}">
				  </td>
				  <td>${status.count }</td>
				  <td onclick="OpenWindow('orderDetail?orderProductNo=${oml.orderProductNo}', '발주목록 상세', 800, 600)">${oml.orderProductNo }</td>
				  <td>${oml.storeName}</td>
				  <td>${oml.productName }</td>
				  <td><fmt:formatNumber value="${oml.orderProductTotalPrice}" maxFractionDigits="3" /> 원</td>
				  <td>
				  	<fmt:formatDate value="${oml.orderProductRegDate}" pattern="yyyy-MM-dd"/>
				  </td>
				  <td>
				  	<button type="button" class="btn btn-shadow  btn-warning mb-3 mr-3"><c:out value="반품대기"></c:out></button>
				  </td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
	<button class="btn btn-info icon-chevron-right" type="button" onclick="refundData()">반품처리</button>
	</div>
	</form>
	<div class="refundSuccess" id="refundSu" style="display: none;">
	<table class="table table-hover mt-20">
		<thead>
			<tr>
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
			<c:if test="${empty orderManagePagingList }">
				<tr>
					<td colspan="7">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${orderManagePagingList }" var="oml" varStatus="status">
			<c:if test="${oml.orderProductStatus eq 'OS06' }">
				<tr>
				  <td>${status.count }</td>
				  <td onclick="OpenWindow('orderDetail?orderProductNo=${oml.orderProductNo}', '발주목록 상세', 800, 600)">${oml.orderProductNo }</td>
				  <td>${oml.storeName}</td>
				  <td>${oml.productName }</td>
				  <td><fmt:formatNumber value="${oml.orderProductTotalPrice }" maxFractionDigits="3" /> 원</td>
				  <td>
				  	<fmt:formatDate value="${oml.orderProductRegDate }" pattern="yyyy-MM-dd"/>
				  </td>
				  <td>
				  	<button type="button" class="btn btn-shadow  btn-danger mb-3 mr-3"><c:out value="반품완료"></c:out></button>
				  </td>
				</tr>
			</c:if>
			</c:forEach>
			
		</tbody>
	</table>
	</div>
<!-- 	<div id="pagination" style="margin: auto;"> -->
<%-- 		<%@ include file="/WEB-INF/include/pagination.jsp" %> --%>
<!-- 	</div> -->
	
	<script>
		window.onload=function(){
			
			$('#execute').click(function(){
				alert('s');
			
				url="<%=request.getContextPath()%>/orderProduct/qr";
				
				var content = $("#content").val();
				$("#img").attr("src", url + "?content="+content);
			});
	
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
	 
	        $('input:checkbox[name=chkOrder]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	            chkArray.push(this.value);
	        });
	        $('#test').val(chkArray);
	        
	        $("form[name='orderListViewFrom']").submit();
	        
	        alert($('#test').val()); 
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
// 			$(tabId).show().attr("class","refundWait");
// 			$("div.btn-list .button-red").removeClass("button-red").addClass("button-blue");
// 			$(obj).removeClass("button-blue").addClass("button-red");
			
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
	        });
	        $('#refund').val(chkArray);
	        
	        $("form[name='refundReq']").submit();
	        
	        alert($('#refund').val()); 
	    }
	</script>
</section>
