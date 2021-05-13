<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<style>
.table td, .table{
	background: aliceblue; 
}
.table thead th{
 	background: wheat; 
}

.equip:hover{
 	text-align:center; background:springGreen; 
 }

</style>
<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/rent" class="btn btn-block btn-icon btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line-chevron-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">뒤로가기</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="javascript:confirmLogout();" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
          	 </li>
       </ul>
   </header>
   	
   <form:form id="listForm" commandName="equipFormVO">
   		<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>번호</th>
			  <th>제품</th>
			  <th>대여여부</th>
			  <th>기기명</th>
			  <th>제조사</th>
			  <th>렌탈금액</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty equipList }">
				<tr>
					<td colspan="5">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${equipList}" var="equip" varStatus="status">
				<tr class="equip" id="equipList">
					<td>${status.count}</td>
					<td><img src="<%=request.getContextPath()%>/resources/images/equip/${equip.equipCode}.jpg" style="width: 50px; height: 50px;"></td>
					<c:if test="${equip.equipOccufied eq 0}">
						<td>
							<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3" onclick="javascript:location.href='<%=request.getContextPath()%>/equip/rent'"><c:out value="대여가능"></c:out></button>
						</td>
					</c:if>
					<c:if test="${equip.equipOccufied eq 1 }">
						<td>
							<button type="button" class="btn btn-shadow  btn-danger mb-3 mr-3"><c:out value="대여불가"></c:out></button>
						</td>
					</c:if>
					<td>${equip.equipName}</td>
					<td>${equip.equipManufacture}</td>
					<td>${equip.equipRentPrice}
					<input type="hidden" name="storeCode" value="${equip.storeCode}">
					<input type="hidden" name="equipCode" value="${equip.equipCode}">
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${equipPaginationInfo}" type="text" jsFunction="go_equip" />
				<form:hidden path="searchRentalEquipVO.pageIndex" id="equipIndex" />
			</ul>    
		</div> 
		
   </form:form>
</div>
<script>
function go_equip(pageIndex) {
	$("#equipIndex").val(pageIndex);
	go_action("main");
}
</script>