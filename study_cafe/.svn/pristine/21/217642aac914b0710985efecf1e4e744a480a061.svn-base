<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
   i.i-circled.i-light.icon-user{
       font-size: xx-large;
   }
   
   i[data-toggle=dropdown]{
      cursor: pointer;
   }
</style>

<section class="container clearfix">

	<div>
		<h1>소모임게시판</h1>
	</div>
	
	<input type="hidden" id="studygroupNo" name="studygroupNo" value="${sgv.studygroupNo }"/>
  	<input type="hidden" id="loginUser" name="memId" value="${loginUser.memId}"/>
	
	<div>
		<div class="row" style="margin-bottom: 30px;">
			<div class="col-md-6">
				<div>
					<button class="btn btn-warning" onclick="go_action('<c:url value='/stb/list' />', '#detailForm');"><i class="icon-list"></i> 목록</button>
				</div>
			</div>
			<div class="col-md-6" style="text-align: right;">
				<c:if test="${loginUser != null && loginUser.memId eq sgv.memId }">
					<button class="btn btn-teal mb-2" onclick="go_action('<c:url value='/stb/modifyForm' />', '#detailForm');"><i class="icon-book3"></i> 수정</button>
					<button class="btn btn-danger mb-2" onclick="go_action('<c:url value='/stb/remove' />', '#detailForm');"><i class="icon-line-trash-2"></i> 삭제</button>
				</c:if>
			</div>
		</div>
		<div class="card">
			<div class="card-header" style="padding: 20px 40px;">
				<div class="table table-hover table-mails mb-0 mail-new" style="display: contents;">
				 	<div class="row">
					 	<div class="col-md-6" style="text-align: left;">
					 		<h4 class="card-title">${sgv.studygroupTitle}</h4>
					 	</div>
					 	<div class="col-md-6" style="text-align: right;">
					 		<button type="button" id="scrapBt" onclick="studyGroupScrapFn()" data-toggle="button" class="btn no-padding bg-trans d-inline-block">
				             	<i class="far fa-star text-muted text-warning" style="font-size: x-large;"></i>
				         	 </button> 
					 	</div>
					 </div>
	       		</div>
				<div class="row">
					<div class="col-sm-8">
						<p class="card-text">작성자 : ${sgv.memId}</p>
					</div>
					<div class="col-sm-4">
						<p class="card-text float-left mb-0">조회수 : ${sgv.studygroupCnt}</p>
						<p class="card-text float-right">작성일 : <fmt:formatDate value="${sgv.studygroupRegDate}" pattern="yyyy-MM-dd HH:mm"/></p>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div style="padding: 20px;" class="card-text">${sgv.studygroupContent}</div>
			</div>
		</div>
	</div>
   
	<form:form commandName="studygroupFormVO" action="detail" method="post" id="detailForm">
		<form:hidden path="studygroupVO.studygroupNo" id="detailNo"/>
		<form:hidden path="studygroupVO.memId" id="memId" value="${sgv.studygroupNo}"/>
		
		<form:hidden path="searchStudygroupVO.searchCondition"/>
		<form:hidden path="searchStudygroupVO.searchKeyword"/>
		<form:hidden path="searchStudygroupVO.pageIndex"/>
		<form:hidden path="searchStudygroupVO.pageUnit"/>
		
	</form:form>

	<c:import url="/replySG/list" >
		<c:param name="searchReplyVO.studygroupNo" value="${sgv.studygroupNo }" />
		<c:param name="tableName" value="studygroup" />
	</c:import>	
</section>

<script>
window.onload=function() {
	var data = {
		"studygroupNo" : $("#studygroupNo").val(),
		"memId" : $("#loginUser").val()
	}
	
	$.ajax({
		url:"<c:url value='/stb/scrap/count'/>",
		type:"post",
		data:data,
		success:function(data) {
			if(data.scrapFlag == 1) {
				$("#scrapBt").attr("aria-pressed", "true").attr("class", "btn no-padding bg-trans d-inline-block active");
			}else if(data.scrapFlag == 0) {
				$("#scrapBt").attr("aria-pressed", "false").attr("class", "btn no-padding bg-trans d-inline-block");
			}
		}
	});
}

function studyGroupScrapFn() {
	var data = {
		"studygroupNo" : $("#studygroupNo").val(),
		"memId" : $("#loginUser").val()
	}
	
	if($("#scrapBt").attr("aria-pressed", "true") && $("#scrapBt").hasClass("active")) {
		$.ajax({
 			url:"<c:url value='/stb/scrap/remove'/>",
 			type:"post",
 			data:data,
 			success:function(data) {
 				console.log(data);
 			}
 		});
		return;
	}
	
	if($("#scrapBt").attr("aria-pressed", "false")) {
		$.ajax({
			url:"<c:url value='/stb/scrap/regist'/>",
			type:"post",
			data:data,
			success:function(data) {
				console.log(data);
			}
		});
		return;
	}
}
</script>