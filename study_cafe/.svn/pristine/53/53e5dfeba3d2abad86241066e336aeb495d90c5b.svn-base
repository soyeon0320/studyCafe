<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<style>
table{
	text-align: center;
}
h3{
	text-align: center;
}
</style>
<section>
	<h3>렌탈기기 목록</h3>
	<form:form commandName="equipFormVO" id="listForm">
	<div class="portlet-box portlet-shodow mb-30">
	<table class="table table-hover mt-20">
		<colgroup>
			<col>
			<col width="10%">
			<col width="10%">
			<col>
			<col>
			<col>
			<col>
			<col>
		</colgroup>
		
		<thead>
			<tr>
			  <th>번호</th>
			  <th>기기코드</th>
			  <th>이용여부</th>
			  <th>대여시작시간</th>
			  <th>대여시간</th>
			  <th>기기명</th>
			  <th>제조사</th>
			  <th>렌탈금액</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty currentEquipList }">
				<tr>
					<td colspan="8">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${currentEquipList}" var="equip" varStatus="status">
				<tr id="equipList" onclick="goModal(this);">
					<input type="hidden" name="storeCode" value="${equip.storeCode}">
					<input type="hidden" name="equipCode" value="${equip.equipCode}">
					<td>${status.count}</td>
					<td style="width: 40px;">
						${equip.equipCode }
					</td>
					
					<td>
						<c:if test="${equip.equipUseable eq 0 }">
							<c:if test="${equip.equipOccufied == 0}">
								<button type="button" class="btn btn-shadow  btn-teal">미사용</button>
							</c:if>
							<c:if test="${equip.equipOccufied == 1}">
								<button type="button" class="btn btn-shadow  btn-danger">사용중</button>
							</c:if>
						</c:if>
						<c:if test="${equip.equipUseable eq 1}">
							<button type="button" class="btn btn-shadow  btn-dark">사용불가</button>
						</c:if>
					</td>
					<td>
						<c:if test="${equip.equipOccufied == 0 }">
							현재 사용 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
						</c:if>
						<c:if test="${equip.equipOccufied==1}">
							<fmt:formatDate value="${equip.equipRentIn}" pattern="yyyy-MM-dd HH:mm"/>
						</c:if>
					</td>
					<td>
					<c:if test="${equip.equipOccufied == 1}">
						<fmt:formatNumber value="${equip.overRentTime/60}" pattern=""/>시간
					</c:if>
					<c:if test="${equip.equipOccufied == 0}">
						현재 사용 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
					</c:if>	
					</td>
					<td>${equip.equipName}</td>
					<td>${equip.equipManufacture}</td>
					<td><fmt:formatNumber value="${equip.equipRentPrice}" pattern="0,000"/>원</td>
				</tr>
			</c:forEach>
		</tbody>
<!-- 		<tbody> -->
<%-- 			<c:if test="${empty currentEquipList}"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="5"> -->
<!-- 						<strong>해당 내용이 없습니다.</strong> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
<%-- 			<c:forEach items="${currentEquipList}" var="equip" varStatus="status"> --%>
<%-- 			<tr onclick="javascript:location.href='<%=request.getContextPath()%>/'"> --%>
<%-- 			  <td>${status.count}</td> --%>
<%-- 			  <td>${equip.equipCode}</td> --%>
<%-- 			  <td>${equip.equipName}</td> --%>
<%-- 			  <td>${equip.equipManufacture}</td> --%>
<%-- 			  <td>${equip.equipUseable}</td> --%>
<!-- 			</tr> -->
<%-- 			</c:forEach> --%>
			
<!-- 		</tbody> -->
	</table>
		<div class="container clearfix" style="width: fit-content;">
	<!-- 		<ul class="pagination pagination-circle pagination-3d pagination-light"> -->
	<%-- 			<ui:pagination paginationInfo = "${equipPaginationInfo}" type="text" jsFunction="go_equip" /> --%>
	<%-- 			<form:hidden path="searchEquipVO.pageIndex" id="equipIndex" /> --%>
	<!-- 		</ul>     -->
		</div>
	</div>  
	</form:form>
</section>

<div class="modal fade" id="detailEquipModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info-light">
				<h5 class="modal-title" id="exampleModalLabel">교육기기 상세 정보</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="" id="detailEquipForm">
					<%-- 				<input type="hidden" name="seatNo" value="${seatList.seatNo}" readonly="readonly"> --%>
					<table class="table table-hover" id="curDetail">

					</table>
					<h5 class="modal-title" id="exampleModalLabel">이용내역</h5>
					<table class="table table-hover mt-20">
						<thead>
							<tr>
								<th>이용자</th>
								<th>대여시간</th>
								<th>반납시간</th>
							</tr>
						</thead>
						<tbody id="equipModal">
						
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="modifyEquip();">수정</button>
			</div>
		</div>
	</div>
</div>
<script>
	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	function go_equip(pageIndex) {
		$("#equipIndex").val(pageIndex);
		go_action("equipList");
	}

	function goModal(obj) {
		console.log(obj);
		var equipCode = $(obj).children("input[name=equipCode]").val();
		var storeCode = $(obj).children("input[name=storeCode]").val();
		
		$("#detailEquipModal").modal();
	
		$.ajax({
			url : "equipDetail",
			method : "post",
			data : {
				equipCode : equipCode,
				storeCode : storeCode
			},
			success : function(data) {
				detailEquipList(data.detailEquipList);
				currentDetail(data.currentEquipOccufied);
			},
			error : function(xhr) {
				alert("error");
			}
		});
	}
	function detailEquipList(equipList) {
		var equipTb = "";
		console.log('교육기기 이용내역'+equipList);
		if (equipList.length == 0) {
			var tr = "<tr><td colspan='3'><strong>해당내용이 없습니다.</strong></td></tr>"
			$("#equipModal").html(tr);
		} else {
			for (var i = 0; i < equipList.length; i++) {
				var equip = equipList[i];
				var equipRentIn = new Date(equipList[i].equipRentIn);
				if (equipList[i].equipRentOut != null) {
					var equipRentOut = new Date(equipList[i].equipRentOut);
					equipTb += "<tr><td>" + equip.memName + "</td>" + "<td>"
							+ getFormatDate(equipRentIn) + "</td>" + "<td>"
							+ getFormatDate(equipRentOut) + "</td></tr>";
				} else if (equipRentOut == null) {
					equipTb += "<tr><td>" + equip.memName + "</td>" + "<td>"
							+ getFormatDate(equipRentIn) + "</td>"
							+ "<td>미반납</td></tr>";
				}
			}
			$("#equipModal").html(equipTb);
		}
	}
	
	function currentDetail(currentEquip){
		var curDe = "";
		var rentIn = new Date(currentEquip.equipRentIn);
			console.log("??" + currentEquip.equipOccufied);
		if(currentEquip.equipOccufied == 0){
			curDe += "<tr><th style='width:100px;'>기기코드</th><td><span id='equipCo'>"
				  	 +  currentEquip.equipCode + "</span></td><th style='width:100px;'>이용자</th><td>"
				  	 + "- </td></tr> <tr> <th style='width:100px;'>대여상태</th><td>대여가능</td>"
				  	 + "<th style='width:110px;'>대여 시작시간</th><td>"
				  	 + "- </td></tr> <tr><th style='width:80px'>상태수정</th><td class=''><input type='radio' id='switch1' name='equipUseable' value='0'>"
				  	 + "<label for='switch2' style='widows:20px;'><span class='label-radio'></span>이용가능</label>"
				  	 + "  <input type='radio' id='switch' name='equipUseable' value='1'><label for='switch2' style='widows:20px;'><span class='label-radio'></span>이용불가</label></td>"
				  	 + "<th style='width:70px;'>대여시간</th><td>-</td></tr>"
			$("#curDetail").html(curDe);
		}else if(currentEquip.equipOccufied == 1){
			curDe += "<tr><th style='width:100px;'>기기코드</th><td>"
			  	 + currentEquip.equipCode + "</td><th style='width:100px;'>이용자</th><td>"
			  	 + currentEquip.memName + "</td></tr> <tr> <th style='width:100px;'>대여상태</th><td>대여중</td>"
			  	 + "<th style='width:100px;'>대여시작 시간</th><td>" + getFormatDate(currentEquip.equipRentIn) +"</td></tr>"
			  	 + "<tr><th style='width:80px;'>상태수정</th><td class=''><input type='radio' id='useSwitch1' name='equipUseable' value='0'>"
			  	 + "<label for='useSwitch1' style='widows:20px;'><span class='label-radio'></span>이용가능</label>"
			  	 + "  <input type='radio' id= 'useSwitch2' name='equipUseable' value='0'><label for='useSwitch2' style='widows:20px;'><span class='label-radio'></span>이용불가</label></td>"
			  	 + "<th style='width:110px;'>대여시간</th><td>-</td></tr>"
			$("#curDetail").html(curDe);
		}
	}
	
	function modifyEquip(){
		var equipUseable = $('input[name="equipUseable"]:checked').val();
		var equipCode = $('#equipCo').text();
		$.ajax({
			url : "<%=request.getContextPath()%>/store/useage/modifyEquipUseable",
			type: "post",
			data: {equipUseable : equipUseable, equipCode : equipCode},
			success : function(data){
				alert('...');
			},
			error : function(error){
				alert("이용여부 수정성공!");
			}
		});
	}
</script>