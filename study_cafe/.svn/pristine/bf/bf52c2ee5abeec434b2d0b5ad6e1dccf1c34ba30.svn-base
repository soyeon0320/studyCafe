<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

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
      <h1>자유게시판</h1>
   </div>
  
  	<input type="hidden" id="freeNo" name="freeNo" value="${board.freeNo }"/>
  	<input type="hidden" id="loginUser" name="memId" value="${loginUser.memId}"/>
  	
   <div>
      <div class="row" style="margin-bottom: 30px;">
         <div class="col-md-6">
            <div>
               <button class="btn btn-warning" onclick="go_action('<c:url value='/board/list' />', '#detailForm');"><i class="icon-list"></i> 목록</button>
            </div>
         </div>
         <div class="col-md-6" style="text-align: right;">
         	<c:if test="${loginUser != null && loginUser.memId eq board.memId }">
	            <button class="btn btn-teal mb-2" onclick="go_action('<c:url value='/board/modifyView' />', '#detailForm');"><i class="icon-book3"></i> 수정</button>
	            <button class="btn btn-danger mb-2" onclick="go_action('<c:url value='/board/remove' />', '#detailForm');"><i class="icon-line-trash-2"></i> 삭제</button>
         	</c:if>
         </div>
      </div>
      <div class="card">
         <div class="card-header" style="padding: 20px 40px;">
            <div class="table table-hover table-mails mb-0 mail-new" style="display: contents;">
				 <div class="row">
				 	<div class="col-md-6" style="text-align: left;">
				 		<h4 class="card-title">${board.freeTitle}</h4>
				 	</div>
				 	<div class="col-md-6" style="text-align: right;">
				 		<button type="button" id="scrapBt" onclick="freeBoardScrapFn()" data-toggle="button" class="btn no-padding bg-trans d-inline-block">
			             	<i class="far fa-star text-muted text-warning" style="font-size: x-large;"></i>
			         	 </button> 
				 	</div>
				 </div>
	        </div>
            <div class="row">
               <div class="col-sm-8">
                  <p class="card-text">작성자 : ${board.memId}</p>
               </div>
               <div class="col-sm-4">
                  <p class="card-text float-left mb-0">조회수 : ${board.freeCnt}</p>
                  <p class="card-text float-right">작성일 : <fmt:formatDate value="${board.freeRegDate}" pattern="yyyy-MM-dd HH:mm"/></p>
               </div>
            </div>
         </div>
         <div class="card-body">
            <div style="padding: 20px;" class="card-text">${board.freeContent}</div>
         </div>
      </div>
   </div>
   
   <form:form commandName="boardFormVO" action="detail" method="post" id="detailForm">
      <form:hidden path="boardVO.freeNo" id="detailNo"/>
      <form:hidden path="boardVO.memId" id="memId" value="${board.memId}"/>
      
      <form:hidden path="searchBoardVO.searchCondition"/>
      <form:hidden path="searchBoardVO.searchKeyword"/>
      <form:hidden path="searchBoardVO.pageIndex"/>
      <form:hidden path="searchBoardVO.pageUnit"/>
      
   </form:form>


   <c:import url="/reply/list" >
      <c:param name="searchReplyVO.freeNo" value="${board.freeNo }" />
      <c:param name="tableName" value="free" />
   </c:import>   
</section>

<script>
window.onload=function() {
	var data = {
		"freeNo" : $("#freeNo").val(),
		"memId" : $("#loginUser").val()
	}
	
	$.ajax({
		url:"<c:url value='/board/scrap/count'/>",
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

function freeBoardScrapFn() {
	var data = {
		"freeNo" : $("#freeNo").val(),
		"memId" : $("#loginUser").val()
	}
	
	if($("#scrapBt").attr("aria-pressed", "true") && $("#scrapBt").hasClass("active")) {
		$.ajax({
 			url:"<c:url value='/board/scrap/remove'/>",
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
			url:"<c:url value='/board/scrap/regist'/>",
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