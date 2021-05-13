<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<section class="col-12">

   <div>
      <h1>공지사항</h1>
   </div>
   
   <div>
      <div class="row" style="margin-bottom: 30px;">
         <div class="col-md-6">
            <div>
               <button class="btn btn-warning" onclick="go_action('<c:url value='/notice/list' />', '#detailForm');"><i class="icon-list"></i> 목록</button>
            </div>
         </div>
         <div class="col-md-6" style="text-align: right;">
         	<c:if test="${not empty loginAdmin.adminId }">
            <button class="btn btn-teal mb-2" onclick="go_action('<c:url value='/notice/modifyForm' />', '#detailForm');"><i class="icon-book3"></i> 수정</button>
            <button class="btn btn-danger mb-2" onclick="go_action('<c:url value='/notice/remove' />', '#detailForm');"><i class="icon-line-trash-2"></i> 삭제</button>
            </c:if>
         </div>
      </div>
      <div class="card">
         <div class="card-header" style="padding: 20px 40px;">
            <h4 class="card-title">${noticeFormVO.noticeVO.noticeTitle}</h4>
            <div class="row">
               <div class="col-sm-8">
                  <p class="card-text">작성자 : 관리자</p>
               </div>
               <div class="col-sm-4">
                  <p class="card-text float-left mb-0">조회수 : ${noticeFormVO.noticeVO.noticeCnt}</p>
                  <p class="card-text float-right">작성일 : <fmt:formatDate value="${noticeFormVO.noticeVO.noticeRegDate}" pattern="yyyy-MM-dd HH:mm"/></p>
               </div>
            </div>
         </div>
         <c:if test="${not empty loginAdmin.adminId }">
         <div class="card-body">
		      <div class="input-daterange component-datepicker input-group mb-20">
					<form:input type="text" autocomplete="off" value='' path="noticeFormVO.noticeVO.noticeStart" id="date_timepicker_start" class="form-control text-left disabled" placeholder="" />
					<div class="input-group-prepend"><div class="input-group-text">부터</div></div>
					<form:input type="text" autocomplete="off"  path="noticeFormVO.noticeVO.noticeEnd" id="date_timepicker_end" class="form-control text-left disabled" placeholder="" />
					<div class="input-group-prepend"><div class="input-group-text">까지 상단에 공지로 게시합니다.</div></div>
				</div>
         </div>
         </c:if>
         <div class="card-body">
            <div style="padding: 20px;" class="card-text">${noticeFormVO.noticeVO.noticeContent}</div>
         </div>
      </div>
   </div>
   
   <form:form commandName="noticeFormVO" action="detail" method="post" id="detailForm">
      <form:hidden path="noticeVO.noticeNo" id="detailNo"/>
      <form:hidden path="noticeVO.adminId" id="adminId" value="test"/>
      
      <form:hidden path="searchNoticeVO.searchCondition"/>
      <form:hidden path="searchNoticeVO.searchKeyword"/>
      <form:hidden path="searchNoticeVO.pageIndex"/>
      <form:hidden path="searchNoticeVO.pageUnit"/>
      
   </form:form>
   
</section>



