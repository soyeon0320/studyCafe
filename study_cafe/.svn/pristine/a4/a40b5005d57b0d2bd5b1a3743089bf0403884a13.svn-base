<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<style>
	#pageUnitSelector {
		width: 120px;
	}
</style>			
				
<section>
<form:form commandName="vocFormVO" id="listForm" name="listForm" method="post">
	<form:hidden path="vocVO.vocNo" id="detailNo" />
<main class="content">
	<div class="page-content d-flex flex pl-0 pr-0 mt-3">
	  <div class="d-flex flex">
	     <aside class="sidebar sidebar-sm bg-white pl-2" id="mail-sidebar">
	        <div class="flex-column d-flex">
	            <div class="b-b navbar">
	            </div>
						<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: auto;">
							<div class="flex slim-scroll"
								style="overflow: hidden; width: auto; height: auto;">
								<ul class="nav pb-3 pt-3">
									<span><strong><i class="icon-line-grid mr-3"></i>답변현황</strong></span>
									<c:forEach items="${statusCntList }" var="statusCnt">
										<li class="nav-item"  onclick="go_changeList('${statusCnt.vocStatus }');" style="cursor: pointer;"><i class="icon-chat-3 mr-3"></i>${statusCnt.vocStatus }
											<span class="d-inline-block ml-2 text-dark"><strong>${statusCnt.vocStatusCnt }</strong> 건</span>
										</li>
									</c:forEach>
									<li class="nav-item p-3 b-t mt-3">
								</ul>

							</div>
						</div>
					</div>
	</aside><!--inobx sidebar--> 
	<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
	    <div class="d-flex flex flex-column">
	        <div class="navbar bg-white b-b">
	            <div class="d-flex">
	            	<h5>고객의 소리 접수내역</h5>
	            </div>
	            <div class="d-flex">
	                <div class="btn-group dropdown">
						<form:select id="pageUnitSelector" cssClass="form-control" path="searchVocVO.pageUnit" onchange="go_action('list');">
							<form:options items="${vocFormVO.searchVocVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/> 
						</form:select>		
						<form:select cssClass="form-control" path="searchVocVO.searchCondition" onchange="go_action('list');">
							<form:options items="${statusList }" itemValue="codeId" itemLabel="codeIdNm" />
						</form:select>	
	                </div>
	            </div>
	        </div>
			<div class="slimScrollDiv">
				<div class="pb-30">
					<table class="table table-hover table-mails mb-0">
						<thead>
							<tr align="center">
								<th>번호</th>
								<th>답변여부</th>
								<th>종류</th>
								<th width="40%" >제목</th>
								<th>작성일자</th>
								<th>방문지점</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty vocList }">
								<tr>
									<td colspan="7" align="center">
										<strong>게시글이 존재하지 않습니다.</strong>
									</td>
								</tr>
							</c:if>
								<c:forEach items="${vocList}" var="voc">
									<tr onclick="go_detail(${voc.vocNo})" style="cursor: pointer;" align="center">
										<td>${voc.vocNo }</td>
										<c:choose>
											<c:when test="${voc.vocStatus eq '답변대기' }">
												<td><span class="badge text-white-light badge-danger ml-1 badge-text">답변대기</span></td>
											</c:when>
											<c:when test="${voc.vocStatus eq '답변완료' }">
												<td><span class="badge text-white-light badge-success ml-1 badge-text" style="color: #ffffff;">답변완료</span></td>
											</c:when>
										</c:choose>
										<td>${voc.vocKind }</td>
										<td style="text-align: left;">${voc.vocTitle }</td>
										<td><fmt:formatDate value="${voc.vocRegDate }" pattern="yyyy-MM-dd" /></td>
										<td>${voc.storeName }</td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div> 
	    </div>
	</div><!--chat content-->
	        </div>
	    </div>
	</main>
			<form:hidden path="searchVocVO.pageIndex" id="pageIndex"/>
	</form:form>
</section>
<script>
	function go_changeList(vocStatus){
// 		alert(vocStatus);

		if (vocStatus == "답변대기") {
			$("select[name='searchVocVO.searchCondition']").find("option:eq(1)").prop("selected", true);
			go_action('list');
		}else if (vocStatus == "답변완료") {
			$("select[name='searchVocVO.searchCondition']").find("option:eq(2)").prop("selected", true);
			go_action('list');
		}



	}


</script>


