<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<div id="reply-section" class="card pt-20 mt-20 mb-30" style=" padding: 0px 30px;">
    <c:if test="${vocManage ne null}">
      <div id="replyList" class="b-b">
         <div class="row" style="padding: 10px; padding-right: 20px;">
            <div class="col-1" align="center"><i class='i-circled i-light icon-user'></i></div>
            <div class="col-10 replyItem">
               <div>
				  <div class="float-left"><strong>관리자(${vocManage.adminId })</strong></div>               
                  <div class="float-right" style="opacity: 0.7;"><fmt:formatDate value="${vocManage.vocConfirmDate }" pattern="yyyy-MM-dd HH:mm"/></div>
               </div>
	               <div style="clear: both;">${vocManage.vocReplyContent }</div>
            </div>
            <div class="col-1" style="text-align: center;">
            	<c:if test="${loginAdmin ne null}">
	               <i class="icon-line-more-vertical"  data-toggle="dropdown"></i>
	               <div class="dropdown-menu">
	                  <span class="dropdown-item" onclick="reply_modify_view(${vocManage.vocReplyNo})" >수정</span>
	               </div>
               </c:if>
            </div>
         </div>
      </div>
	</c:if>
	
	<form:form commandName="vocManageVO" action="replyList" method="post" id="replyForm">
		<div align="right" style="margin-top: 30px;">
			<form:hidden path="vocNo" id="detailNo"/>
			<input type="hidden" name="isModified" value="true"/>
			<input type="hidden" name="replyModifyContent"/>
			<form:hidden path="searchVocVO.searchCondition"/>
			<form:hidden path="searchVocVO.searchKeyword"/>
			<form:hidden path="searchVocVO.pageIndex"/>
			<form:hidden path="searchVocVO.pageUnit"/>
			
			<form:hidden path="saveToken" />
			<form:hidden path="adminId" value="${loginAdmin.adminId}"/>
			<form:hidden path="vocReplyNo"/>
			<form:hidden path="vocNo" id="vocReplyNo" value="${vocManage.vocNo }"/>
			<form:hidden path="vocVO.vocNo" value="${vocManage.vocNo }"/>
			<c:if test="${loginAdmin ne null}">
				<textarea rows="5" style="padding: 20p;" name="vocReplyContent" required="required" maxlength="900" class="form-control" placeholder="내용을 입력해주세요." ></textarea>
				<button type="button" class="btn btn-success" style="margin-top: 10px;" onclick="reply_regist()"><i class="icon-pencil2"></i> 댓글 등록</button>
			</c:if>
		</div>
	</form:form>
</div>

<div class="modal fade" id="replyModifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info-light">
				<h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<textarea rows="3"   id="replyModifyContent" class="form-control" maxlength="900" required="required" placeholder="내용을 입력해주세요." ></textarea>
				<input type="hidden" id="moidfySaveToken">
				<input type="hidden" id="moidfyReplyNo">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-info" onclick="modifyReply();">수정</button>
			</div>
		</div>
	</div>
</div>

<script>



function reply_regist(){
	$("#vocReplyNo").val($("#detailNo").val());
	go_action("<c:url value='/vocManage/regist'/>","#replyForm");
}

function reply_modify_view(vocReplyNo){
	var data = {
			vocReplyNo : vocReplyNo
	}
	
	$.ajax({
		url:"<c:url value='/vocManage/modifyView' />",
		type:"post",
		data:data,
		success:function(data){
			open_reply_modify_modal(data.vocManage);
		},
		error:function(xhr){
			console.log(xhr);
			alert("수정 불가");
		}
	});
	
}

function open_reply_modify_modal(vocManage){
	$("#replyModifyModal").modal();
	$("#replyModifyContent").val(vocManage.vocReplyContent);
	$("#moidfySaveToken").val(vocManage.saveToken);
	$("#moidfyReplyNo").val(vocManage.vocReplyNo);
}

function modifyReply(){
	$("input[name='replyModifyContent']").val($("#replyModifyContent").val());
	$("input[name='vocReplyNo']").val($("#moidfyReplyNo").val());
	$("input[name='saveToken']").val($("#moidfySaveToken").val());
	
	
	go_action("<c:url value='/vocManage/modify'/>","#replyForm");
	
	
}
</script>