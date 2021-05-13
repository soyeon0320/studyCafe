<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<div id="reply-section" class="card pt-20" style="margin-top: 20px; padding: 0px 30px;">
   <c:forEach items="${replyList }" var="reply">
      <div id="replyList" class="b-b">
         <div class="row" style="padding: 10px; padding-right: 20px;">
            <div class="col-1" align="center"><i class='i-circled i-light icon-user'></i></div>
            <div class="col-10 replyItem">
               <div>
                  <div class="float-left"><strong>${reply.memId }</strong></div>
                  <div class="float-right" style="opacity: 0.7;"><fmt:formatDate value="${reply.replyRegDate }" pattern="yyyy-MM-dd HH:mm"/></div>
               </div>
               <div style="clear: both;">${reply.replyContent }</div>
            </div>
            <div class="col-1" style="text-align: center;">
            	<c:if test="${loginUser != null && loginUser.memId eq reply.memId }">
	               <i class="icon-line-more-vertical"  data-toggle="dropdown"></i>
	               <div class="dropdown-menu">
	                  <span class="dropdown-item" onclick="reply_modify_view(${reply.replyNo})" >수정</span>
	                  <span class="dropdown-item" onclick="replay_delete(${reply.replyNo})" >삭제</span>
	               </div>
               </c:if>
            </div>
         </div>
      </div>
   </c:forEach>   

	
	<form:form commandName="replyFormVO" action="list" method="post" id="replyForm">
		<div align="right" style="margin-top: 30px;">
			<form:hidden path="tableName"/>
			<form:hidden path="boardVO.freeNo" id="detailNo"/>
			<form:hidden path="boardVO.memId" id="memId" value="${board.memId}"/>
			<input type="hidden" name="boardVO.isModified" value="true"/>
			
			<form:hidden path="searchBoardVO.searchCondition"/>
			<form:hidden path="searchBoardVO.searchKeyword"/>
			<form:hidden path="searchBoardVO.pageIndex"/>
			<form:hidden path="searchBoardVO.pageUnit"/>

			<textarea rows="3" style="padding: 20p;"  name="replyVO.replyContent" required="required" maxlength="900" class="form-control" placeholder="내용을 입력해주세요." ></textarea>
			<input type="hidden" name="replyVO.replyModifyContent" />
			<form:hidden path="replyVO.saveToken" />
			<form:hidden path="replyVO.memId" value="${sessionScope.loginUser.memId}"/>
			<form:hidden path="replyVO.replyNo" id="deleteReplyNo"/>
			<form:hidden path="replyVO.freeNo" id="replyBoardNo" value="${board.freeNo }"/>
			<form:hidden path="searchReplyVO.pageIndex" id="pageIndex"/>
			<button type="button" class="btn btn-success" style="margin-top: 10px;" onclick="reply_regist()"><i class="icon-pencil2"></i> 댓글 등록</button>
		</div>
	</form:form>

	<div class="container clearfix" style="width: fit-content;">
		<ul class="pagination pagination-circle pagination-3d pagination-light">
			<ui:pagination paginationInfo = "${replyPaginationInfo}" type="text" jsFunction="go_reply_page" />
		</ul>    
	</div>
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
				<input type="hidden" id="moidfyReplyWriter">
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

function go_reply_page(pageNo){
	if(!pageNo) pageNo = 1;
	$("#pageIndex").val(pageNo);
	go_action("<c:url value='/board/detail'/>","#replyForm");
}

function replay_delete(replyNo){
	$("#deleteReplyNo").val(replyNo);

	go_action("<c:url value='/reply/remove'/>","#replyForm");
}

function reply_regist(){
	$("#replyBoardNo").val($("#detailNo").val());
	go_action("<c:url value='/reply/regist'/>","#replyForm");
}

function reply_modify_view(replyNo){
	
	var data = {
			replyNo : replyNo,
			tableName: $("input[name=tableName]").val()
	}
	
	$.ajax({
		url:"<c:url value='/reply/modifyView' />",
		type:"post",
		data:data,
		success:function(data){
			open_reply_modify_modal(data.replyVO);
		},
		error:function(xhr){
			console.log(xhr);
			alert("수정 불가");
		}
	});
	
}

function open_reply_modify_modal(replyVO){
	$("#replyModifyModal").modal();
	$("#replyModifyContent").val(replyVO.replyContent);
	$("#moidfySaveToken").val(replyVO.saveToken);
	$("#moidfyReplyWriter").val(replyVO.memId);
	$("#moidfyReplyNo").val(replyVO.replyNo);
}

function modifyReply(){

	$("input[name='replyVO.replyModifyContent']").val($("#replyModifyContent").val());
	$("input[name='replyVO.replyNo']").val($("#moidfyReplyNo").val());
	$("input[name='replyVO.saveToken']").val($("#moidfySaveToken").val());
	$("input[name='replyVO.memId']").val($("#moidfyReplyWriter").val());
	
	
	go_action("<c:url value='/reply/modify'/>","#replyForm");
	
	
}
</script>