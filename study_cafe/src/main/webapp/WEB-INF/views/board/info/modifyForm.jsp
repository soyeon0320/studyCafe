<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>   
  
<section class="container clearfix">

	<div>
		<h1>정보게시판</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/info/list' />', '#modifyForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="modifyBt" name="modifyBt" onclick="modifyFn()" value="수정"><i class="icon-book3"></i> 수정</button>
		</div>
	</div>
	
	<form:form commandName="infoFormVO" action="modify" id="modifyForm" name="modifyForm" method="post" enctype="multipart/form-data">
		<form:hidden path="searchInfoVO.searchCondition"/>
		<form:hidden path="searchInfoVO.searchKeyword"/>
		<form:hidden path="searchInfoVO.pageIndex"/>
		<form:hidden path="searchInfoVO.pageUnit"/>
		<form:hidden path="infoVO.saveToken"/>
		<form:hidden path="infoVO.isModified" value="true"/>
	
		<form:input type="hidden" path="infoVO.memId" id="memId" name="memId" value="${info.memId}"/>
		<form:input type="hidden" path="infoVO.infoNo" id="infoNo" name="infoNo" value="${info.infoNo}"/>
		<form:input type="text" id="infoTitle" path="infoVO.infoTitle" maxlength="90" class="mb-20 form-control" value="${info.infoTitle}"/>
	
		<div class="row mb-10">
			<div class="col-2" onclick="javascript:$('#toggleDiv').slideToggle()" style="cursor: pointer;" id="addBtn">
				<span>파일첨부</span>
				<i class="icon-line2-plus"></i>
			</div>
			
			<div class="col-10" style="display: none;" id="toggleDiv">
				<div class="row">
					<div class="col-2">
						<button type="button" class="btn btn-sm btn-light mb-10" onclick="modifyFile();" >추가</button>
					</div>
					<div id="fileTable" class="col-10"  >
						<c:forEach items="${infoVO.attachList }" var="attach">
							<div class="inputRow">
								<span style="display: inline;">${attach.attachOriginName }</span>
								<input type="file" disabled="disabled" style="display: none;">
								<input type="hidden" value="${attach.attachCount }">
								<span class='badge badge-danger' onclick='removeAttachFn(this);' style='cursor: pointer;'>X</span>
							</div>
						</c:forEach>
					</div>
					
					<div id="deleteFileList" style="display: none;"> 
						
					</div>
				</div>
			</div>
		</div>
	
	
		<form:textarea rows="15" id="infoContent" path="infoVO.infoContent" maxlength="900" cssClass="summernote-init"/>
	</form:form>
	
<script>

window.onload=function(){
	$("#addBtn").trigger("click");
}

	function modifyFn() {
		if($("#infoTitle").val()=="") {
			alert("제목을 입력해주세요.");
			$("#infoTitle").focus();
			return;
		}
		if($("#infoContent").val()=="") {
			alert("내용을 입력해주세요.");
			$("#infoContent").focus();
			return;
		}
		
		$("form[name='modifyForm']").submit();
	}
</script>
	
<script type="text/javascript">


function modifyFile() {
	
	if($('div.inputRow input[type=file]').length >= 5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	
	var input=$('<input>').attr({"type":"file","name":"addFromModifyFiles"}).css("display","inline"); 
	var div=$('<div>').addClass("inputRow");
	div.append(input).append("<span class='badge badge-danger' onclick='removeAttachFn(this);' style='cursor: pointer;'><i class='icon-trash-alt1'></i></span>");
	div.appendTo('#fileTable');
	
	$('.card-body').on('change','input[type="file"]',function(event){
		if(this.files[0].size>1024*1024*40){
			alert("파일 용량이 40MB를 초과하였습니다.");
			this.value="";
			$(this).focus();
			return false;
		} 
	});
}

function removeAttachFn(obj){
	if($(obj).parent("div.inputRow").find("input[name=addFromModifyFiles]").length == 0){
		var item =$("<input name=deleteAttachCount />");
		item.val($(obj).parent("div.inputRow").find("input[type=hidden]").val());
		$("#deleteFileList").append(item);
	}
	$(obj).parent('div.inputRow').remove();
}


</script>




</section>

