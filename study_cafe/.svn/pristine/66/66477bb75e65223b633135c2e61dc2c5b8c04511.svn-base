<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 해당 요청은 CommonController /common/searchStore : OpenWindow에서 열었습니다. -->
<section>



<form:form commandName="storeFormVO" id="listForm" name="listForm" method="post" action="saerchStore" >
	<div class="container" style="margin-top: 20px;">
		<h1>매장검색</h1>
		<hr>
		<div class="input-group">	
			<form:select path="searchStoreVO.addrDonmCode" id="" name="" class="form-control col-md-3" onchange="getSigugun(this.value);">
				<form:option value="">전체/도/남</form:option>
				<form:options items="${donmCodeList}" itemValue="addrDonmCode" itemLabel="addrDonmName"/>
			</form:select>					
			
			<form:select path="searchStoreVO.addrSigugunCode" class="form-control col-md-3" name="" id="sigugunList">
				<form:option value="">전체/시/구/군</form:option>
			</form:select>					
			
			<form:input class="form-control col-md-5" type="text" id="" path="searchStoreVO.storeName" placeholder="지점명을 입력하세요." />
			
			<span class="input-group-append col-me-1">
				<button class="btn btn-info" type="submit" data-card-widget="search" onclick="javascript:$('#pageIndex').val(1);$('#listForm').submit();">
					<i class="fa fa-fw fa-search"></i>검색
				</button>
			</span>
			<form:hidden path="searchStoreVO.storeContractStatus"/>
		</div>
		
		<div style="margin-top: 20px;">
			<table class="table table-hover">
				<colgroup>
					<col width="35%">
					<col>
				</colgroup>
				<thead align="center">
					<tr>
						<th>지점명</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody style="cursor: pointer;">
					<c:forEach items="${storeList }" var="store">
						<tr onclick="selectStore(this);">
							<td align="center">${store.storeName }<input type="hidden" name="storeName" value="${store.storeName }"></td>
							<td>${store.storeAddr }<input type="hidden" name="storeCode" value="${store.storeCode }"></td>
						</tr>
					</c:forEach>
					<c:if test="${storeList eq null }">
						<tr>
							<td colspan="3" align="center">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>		
		</div>
	
		<div id="pagination" style="margin: auto;">
			<%@ include file="/WEB-INF/include/pagination.jsp" %>
			<form:hidden path="searchStoreVO.pageIndex" id="pageIndex" />
		</div>
	</div>
	
</form:form>
</section>
<script>
	function getSigugun(addrDonmCode){
		var data = {
				addrDonmCode:addrDonmCode
		}
		
		$.ajax({
			url:"<c:url value='/common/sigugun'/>",
			method:"post",
			data: data,
			success:function(data){
				setSigugun(data.sigugunCodeList);
			},
			error:function(xhr){
				console.log(xhr);
			}
		});
	}
	
	function setSigugun(sigugunList){
		var resStr = "<option value=''>전체/시/구/군</option>";
		for (var i = 0; i < sigugunList.length; i++) {
			var sigugun = sigugunList[i];
			resStr += "<option value="+sigugun.addrSigugunCode+">"+sigugun.addrSigugunName+"</option>"
		}
		$("#sigugunList").html(resStr);
	}
	
	
	// opener 에서 매장 코드를 셋팅해주는 setter 함수가 필요합니다.
	function selectStore(obj){
		var storeCode = $(obj).find("input[name=storeCode]").val();
		var storeName = $(obj).find("input[name=storeName]").val();
		
		swal({
            title: '매장 선택',
            text: storeName + " 매장을 선택하시겠습니까?",
            type: 'question',
            showCancelButton: true,
            confirmButtonClass: 'btn btn-confirm mt-2',
            cancelButtonClass: 'btn btn-secondary ml-2 mt-2',
            confirmButtonText: '선택',
            cancelButtonText:'취소',
            preConfirm:function(){
        		opener.setStoreCode(storeCode,storeName);
        		window.close();
            },
            allowOutsideClick: false
      	 })
	}
	
	function fn_egov_link_page(pageIndex){
		$("input[name='searchStoreVO.pageIndex']").val(pageIndex);
		$("#listForm").submit();
	}
</script>