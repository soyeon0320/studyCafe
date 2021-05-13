<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div role="tabpanel" class="tab-pane active show" id="tb2">
    <div class="bg-white  p-3 border1 rounded" style="font-size: larger;">
   		<div class="">
			<div class="mb-10">
				<h4 style="display: inline;">대표 이미지 <button type="button" onclick="modify_front_img();" class="btn btn-sm btn-info">수정</button></h4>
			</div>
			<form action="" id="sendForm" enctype="multipart/form-data">
				<input type="file" id="modifyFront" name="file" style="display: none;" onchange="modify_front_img(this);">
				<input type="hidden" name="storeCode" value="${owner.storeCode }">
			</form>
			<div>
				<img id="frontImg" src="${loginStore.storeImageUrl}" alt="" class="mb-10"  style="max-height: 300px;">
			</div>
		</div>
		
		<div class="p-3" style="font-size: large !important;">
			<h5 class="fs-1x mb-0 font400">${owner.ownerName }</h5>
			<p class="text-muted">
			${owner.storeName }<br><i class="fa fa-map-marker text-muted mr-2 fs12"></i>
			${owner.storeAddr }
			</p>
		</div>
    
    
        <div class="row mb-2">
            <div class="col-6">
                <small class="text-muted">가맹주명</small>
                <div class="font500">${owner.ownerName }
                </div>
            </div>
            <div class="col-6">
                <small class="text-muted">Email</small>
                <div class="font500">${owner.ownerEmail }</div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-6">
                <small class="text-muted">가맹주 전화번호</small>
                <div class="font500">${owner.ownerTel }
                </div>
            </div>
            <div class="col-6">
                <small class="text-muted">계약 상태</small>
                <div class="font500">
                	<c:if test="${owner.ownerContractStatus == 'Y'}">
                		계약중
                	</c:if>
                </div>
            </div>
        </div>
        
        <div class="row mb-2">
            <div class="col-6">
                <small class="text-muted">계약 시작일</small>
                <div class="font500">
                <fmt:formatDate value="${owner.affiliateRegStartDate }" pattern="yyyy-MM-dd"/>
                </div>
            </div>
            <div class="col-6">
                <small class="text-muted">계약 종료일</small>
                <div class="font500">
                	<fmt:formatDate value="${owner.affiliateRegEndDate}" pattern="yyyy-MM-dd"/>
                </div>
            </div>
        </div>
    </div>
    
</div>


<script>
window.addEventListener("load",function(){
	if($("#frontImg").attr("src") == "") {
		$("#frontImg").attr("src", "<%=request.getContextPath()%>/resources/images/store/noImage.jpg");
	}else {
		$("#frontImg").attr("src","${loginStore.storeImageUrl}");
	}
});

</script>

<script>

function modify_front_img(file){
	if(!file) {
		$("#modifyFront").trigger("click");
		return;
	}
	
	var exten = file.value.substr(file.value.lastIndexOf(".")); 
	if(!(exten == '.jpg' || exten == '.jpeg' || exten == '.png')){
		alert("이미지만 가능합니다."); 
		$("#modifyFront").val("");
		return;
	}
	
	
	var sendingData = new FormData();
	sendingData.append('file',$('#modifyFront')[0].files[0]);
	
	$.ajax({
	  	data: sendingData,
	  	type: "POST",
	  	url: "<c:url value='/store/modify/frontImg' />",
	  	contentType: false,	    	
	  	processData: false,
	  	success: function(data) {
	  		$("#frontImg").attr("src",data);
	  	}
	});
}


</script>