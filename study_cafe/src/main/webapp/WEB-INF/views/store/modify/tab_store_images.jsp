<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<div role="tabpanel" class="tab-pane" id="tb1">
	<div class="bg-white  p-3 border1 rounded">
		<div class="">
			<div id="storeImages">
			 <div class="gallery-block grid-gallery pt-10">
		            <div class="container">
		                <div class="heading mb-0" style="text-align: left;">
		                    <h2>매장 이미지</h2>
		                </div>
		            
		   				<div class="pb-3">
							<button type="button" onclick="add_store_img();" class="btn btn-block mb-2 btn-icon btn-info">
								<span>이미지 추가 <i class="fa fa-plus"></i></span>
							</button>
							<input type="file" style="display: none;" id="addImg" onchange="uploadStoreImage(this);">
						</div>
						
		                <div class="row" id="imgList">
		                	<c:forEach items="${imgList }" var="img">
			                    <div class="col-md-6 col-lg-4 item img-item">
			                        <a class="lightbox" href="javascript:void(0)">
			                            <img class="img-fluid image scale-on-hover" src="${img.storeImageName }">
			                            <i role='${img.storeImageNo }' onclick='delete_img(this)'>삭제</i>
			                        </a>
			                    </div>
		                	</c:forEach>
		                </div>
		            </div>
		        </div>
			</div>
		</div>
	</div>
</div>

<script>
window.addEventListener('onload', function(){
    baguetteBox.run('.grid-gallery', { animation: 'slideIn'});
})
</script>
<script>

function add_store_img(){
	if($(".img-item").length >= 9){
		alert("이미지는 최대 9개까지 가능합니다.");
		return;
	}
	$("#addImg").click();
}


function uploadStoreImage(file){
	

	var exten = file.value.substr(file.value.lastIndexOf(".")); 
	if(!(exten == '.jpg' || exten == '.jpeg' || exten == '.png')){
		alert("이미지만 가능합니다."); 
		$("#addImg").val("");
		return;
	}
	
	
	var sendingData = new FormData();
	sendingData.append('file',$('#addImg')[0].files[0]);
	
	$.ajax({
	  	data: sendingData,
	  	type: "POST",
	  	url: "<c:url value='/store/img/insert' />",
	  	contentType: false,	    	
	  	processData: false,
	  	success: function(data) {
	  		set_img_div(data.imageVO);
	  		$("#addImg").val("");
	  	}
	});
}


function set_img_div(imgVO){
	
	var div = $("<div class='col-md-6 col-lg-4 item img-item'></div>");
	var a = $("<a class='lightbox' href='javascript:void(0)'></a>");
	var img = $("<img class='img-fluid image scale-on-hover' src='"+imgVO.storeImageName+"'>");
	var i = $("<i role='"+imgVO.storeImageNo+"' onclick='delete_img(this)'>삭제</i>");
	
	a.append(img);
	div.append(a);
	
	$("#imgList").append(div);
}

function delete_img(obj){
	
	if(!confirm("정말 삭제하시겠습니까?")) return;
	
	var data = {
			storeImageNo:$(obj).attr("role")
	}
	console.log(data);
 	
 	$.ajax({
	  	data: data,
	  	type: "POST",
	  	url: "<c:url value='/store/img/delete' />",
	  	success: function(data) {
	  		$(obj).closest("div.img-item").remove();
	  	}
 	});
}


</script>
	