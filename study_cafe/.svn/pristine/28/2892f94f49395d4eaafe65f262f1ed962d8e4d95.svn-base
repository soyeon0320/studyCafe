<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>    

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
      <h1>정보게시판</h1>
   </div>
   
   <input type="hidden" id="infoNo" name="infoNo" value="${info.infoNo}"/>
   <input type="hidden" id="loginUser" name="memId" value="${loginUser.memId}"/>
   
   <div>
      <div class="row" style="margin-bottom: 30px;">
         <div class="col-md-6">
            <div>
               <button class="btn btn-warning" onclick="go_action('<c:url value='/info/list' />', '#detailForm');"><i class="icon-list"></i> 목록</button>
            </div>
         </div>
         <div class="col-md-6" style="text-align: right;">
         	<c:if test="${loginUser != null && loginUser.memId eq info.memId }">
	            <button class="btn btn-teal mb-2" onclick="go_action('<c:url value='/info/modifyForm' />', '#detailForm');"><i class="icon-book3"></i> 수정</button>
	            <button class="btn btn-danger mb-2" onclick="go_action('<c:url value='/info/remove' />', '#detailForm');"><i class="icon-line-trash-2"></i> 삭제</button>
         	</c:if>
         </div>
      </div>
      <div class="card">
         <div class="card-header" style="padding: 20px 40px;">
        	 <div class="table table-hover table-mails mb-0 mail-new" style="display: contents;">
	            <div class="row">
				 	<div class="col-md-6" style="text-align: left;">
				 		<h4 class="card-title">${info.infoTitle}</h4>
				 	</div>
				 	<div class="col-md-6" style="text-align: right;">
				 		<button type="button" id="scrapBt" onclick="infoScrapFn()" data-toggle="button" class="btn no-padding bg-trans d-inline-block">
				        	<i class="far fa-star text-muted text-warning" style="font-size: x-large;"></i>
				        </button> 
				 	</div>
				 </div>
	        </div>
            <div class="row">
               <div class="col-sm-8">
                  <p class="card-text">작성자 : ${info.memId}</p>
               </div>
               <div class="col-sm-4">
                  <p class="card-text float-left mb-0">조회수 : ${info.infoCnt}</p>
                  <p class="card-text float-right">작성일 : <fmt:formatDate value="${info.infoRegDate}" pattern="yyyy-MM-dd HH:mm"/></p>
               </div>
            </div>
         </div>
         <div class="card-body">
			<div style="padding: 20px; min-height: 300px;" class="card-text">${info.infoContent}</div>
			<c:if test="${info.attachList.size() > 0 }">
				<div id="attachList">
					<c:forEach items="${info.attachList }" var="attach">
						<div class="pl-20 ">첨부파일 : <strong>${attach.attachOriginName } </strong> 
							<a href="javascript:location.href='/scm/getFile?attachNo=${attach.attachNo}&attachCount=${attach.attachCount }'" class="btn btn-sm btn-icon btn-secondary mb-2 ml-2">
                                                <i class="icon-line-download"></i>
                                                	다운로드
                                            </a>
						</div>
					</c:forEach>
				</div>
			</c:if>
         </div>
      </div>
   </div>
   
   <form:form commandName="infoFormVO" action="detail" method="post" id="detailForm">
     	<form:hidden path="infoVO.memId" id="memId" value="${info.memId}"/>
	    <form:hidden path="searchInfoVO.searchCondition"/>
	    <form:hidden path="searchInfoVO.searchKeyword"/>
	    <form:hidden path="searchInfoVO.pageIndex"/>
	    <form:hidden path="searchInfoVO.pageUnit"/>
	    <form:hidden path="infoVO.infoNo" />
	    
   </form:form>

	<c:import url="/replyInfo/list" >
		<c:param name="searchReplyVO.infoNo" value="${info.infoNo }" />
		<c:param name="tableName" value="info" />
	</c:import>	
	
</section>

<script>
window.onload=function() {
	var data = {
		"infoNo" : $("#infoNo").val(),
		"memId" : $("#loginUser").val()
	}
	
	$.ajax({
		url:"<c:url value='/info/scrap/count'/>",
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

function infoScrapFn() {
	var data = {
		"infoNo" : $("#infoNo").val(),
		"memId" : $("#loginUser").val()
	}
	
	if($("#scrapBt").attr("aria-pressed", "true") && $("#scrapBt").hasClass("active")) {
		$.ajax({
 			url:"<c:url value='/info/scrap/remove'/>",
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
			url:"<c:url value='/info/scrap/regist'/>",
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