<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<section>
	<div style="padding: 20px;">
		<div>
			<form:form commandName="errorLogVO" method="get" id="errorForm">
				<form:hidden path="pageIndex" id="pageIndex"/>
			
				<div id="keyword" class="card-tools float-right mb-20" style="width:550px;">
					<div class="input-group row" style="margin-left:0px">	
						<form:select path="pageUnit" cssClass="form-control col-md-3" onchange="javascript:$('#errorForm').submit();">
							<form:options items="${errorLogVO.pageUnitSelector}" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
						</form:select>
						<form:select cssClass="form-control col-md-3" path="searchCondition">
							<form:options items="${codeList}" itemValue="codeId" itemLabel="codeIdNm"/>
						</form:select>
						<form:input type="text" path="searchKeyword" name="searchKeyword" cssClass="form-control col-md-5" placeholder="검색어를 입력해주세요."/>
						<span class="input-group-append">
							<button class="btn btn-info" type="button" onclick="javascript:$('#pageIndex').val(0);$('#errorForm').submit();">
								<i class="fa fa-fw fa-search"></i><span>검색</span>
							</button>
						</span>
					</div>
				</div>			
			</form:form>
		</div>
	
		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col width="4%">			
				<col width="6%">			
				<col width="10%">			
				<col>			
				<col>			
				<col width="10%">			
			<%-- 	<col>			
				<col>			
				<col> --%>			
			</colgroup>
	        <thead align="center">
	            <tr>
					<th>번호</th>
					<th>이용자구분</th>
					<th>ID</th>
					<th>요청IP</th>
					<th>요청URI</th>
					<th>발생 시간</th>
				<!-- 	<th>발생원인</th>
					<th>파라미터</th>
					<th>메시지</th> -->
	            </tr>
	        </thead>
	        <tbody style="cursor: pointer;">
	        	<c:forEach items="${logList }" var="log">
	        		<tr onclick="error_detail(${log.errorLogNo})">
						<td align="center">${log.rnum }</td>		        		
						<td>${log.loginActor }</td>		        		
						<td>${log.loginId }</td>		        		
						<td>${log.requestIP }</td>		        		
						<td>${log.requestURI }</td>		        		
						<td><fmt:formatDate value="${log.errorRegDate }" pattern="yyyy-MM-dd HH:mm" /></td>		        		
					<!-- 	<td>-</td>		        		
						<td>-</td>		        		
						<td>-</td>		 -->        		
	        		</tr>
	        	</c:forEach>
	        	<c:if test="${logList == null || logList.size() == 0 }">
	        		<tr>
	        			<td colspan="9" align="center">검색 자료가 없습니다.</td>
	        		</tr>
	        	</c:if>
	        </tbody>
		</table>
	</div>
	<div class="container clearfix" style="width: fit-content;">
		<ul class="pagination pagination-circle pagination-3d pagination-light">
			<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_error_list" />
			
		</ul>    
	</div>

	<div class="modal fade" id="errorDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-info-light">
					<h4 class="modal-title" id="exampleModalLabel">상세 내용</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="padding: 10px;">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-10">
						<h5>발생 원인</h5>
						<article id="cause"></article>
					</div>
					<div class="mb-10">
						<h5>내용</h5>
						<article id="errorMessage"></article>
					</div>

					<div>
						<h5>변수</h5>
						<article id="params"></article>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
function go_error_list(pageIndex){
	$("#pageIndex").val(pageIndex);
	$("#errorForm").submit();
}

function error_detail(errorLogNo){
	$.getJSON("<c:url value='/error/detail' />" + "?errorLogNo="+errorLogNo, function(result){
		$("#cause").text(result.errorLogVO.cause);
		$("#errorMessage").text(result.errorLogVO.message);
		$("#params").text(result.errorLogVO.params);
	});
	
	$("#errorDetailModal").modal();
}
</script>