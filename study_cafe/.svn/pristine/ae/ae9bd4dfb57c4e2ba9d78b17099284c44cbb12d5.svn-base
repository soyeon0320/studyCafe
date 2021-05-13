<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
/* file upload 버튼 스타일*/
::-webkit-file-upload-button { 
	background-color: gray;
	color: #fff;
	margin-top: 2px;
}
</style>
<section class="container clearfix">

	<div>
		<h1>정보게시판</h1>
	</div>
	
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-md-6">
			<div>
				<button class="btn btn-warning" onclick="go_action('<c:url value='/info/list' />', '#registForm');"><i class="icon-list"></i> 목록</button>
			</div>
		</div>
		
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-success mb-2" id="registBt" name="registBt" onclick="registFn()"><i class="icon-pencil2"></i> 등록</button>
		</div>
	</div>
	
	<form:form commandName="infoFormVO" name="registForm" action="regist" method="post" id="registForm" enctype="multipart/form-data">
		<form:hidden path="searchInfoVO.searchCondition"/>
		<form:hidden path="searchInfoVO.searchKeyword"/>
		<form:hidden path="searchInfoVO.pageIndex"/>
		<form:hidden path="searchInfoVO.pageUnit"/>
		<form:hidden path="infoVO.saveToken"/>
		<form:hidden path="infoVO.memId" cssClass="form-control" value="${loginUser.memId }"/>
		<form:hidden path="infoVO.isModified" value="true"/>
		<input type="text" class="form-control mb-20" name="infoVO.infoTitle" placeholder="제목을 입력해주세요."/>

		<div class="row mb-20">
			<div class="col-2" onclick="javascript:$('#toggleDiv').slideToggle()" style="cursor: pointer;">
				<span>파일첨부</span>
				<i class="icon-line2-plus"></i>
			</div>
			
			<div class="col-10" style="display: none;" id="toggleDiv">
				<div class="row">
					<div class="col-2">
						<button type="button" class="btn btn-sm btn-light mb-10" onclick="addFile();">추가</button>
					</div>
					<div id="fileTable" class="col-10"  >
					</div>
				</div>
			</div>
		</div>
		
		<form:textarea cssClass="summernote-init form-control" maxlength="900"  path="infoVO.infoContent"  placeholder="내용을 입력해주세요." cols="30" rows="5" style="margin-top: 0px; margin-bottom: 0px; height: 160px;" />
			

	</form:form>

<script>


</script>

<script>
	function registFn() {
		
		if(!$("input[name='infoVO.infoTitle']").val()){
			$("input[name='infoVO.infoTitle']").focus();
			alert("제목을 입력해 주세요.");
			return;
		}else if($("input[name='infoVO.infoTitle']").val().lenth > 90){
			$("input[name='infoVO.infoTitle']").focus();
			alert("제목은 90자 미만입니다.");
			return;
		}else if(!$("textarea[name='infoVO.infoContent']").val()){
			alert("내용을 입력해 주세요.");
			return;
		}
			
		
		
		$("form[name='registForm']").submit();
	}
</script>


<script type="text/javascript">


function addFile() {
	
	if($('input[name="multipartFiles"]').length > 4){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	
	var input=$('<input>').attr({"type":"file","name":"multipartFiles"}).css("display","inline"); 
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
	$(obj).parent('div.inputRow').remove();
}

</script>



</section>

