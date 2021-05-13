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
	<form:form commandName="ticketFormVO" id="listForm" name="listForm" method="post">
		<form:hidden path="ticketVO.ticketNo" id="detailNo" />
		
		<div class="container clearfix">
			<div class="navbar bg-white b-b form-row">
                   <div class="d-inline h-md-down flex align-self-center">
                   <h2>이용권 목록</h2>
                   </div>
              <div class="d" style="margin-bottom: 5px;">
                  <div class="btn-group dropdown">
					<form:select id="pageUnitSelector" cssClass="form-control" path="searchTicketVO.pageUnit" onchange="go_action('list');">
						<form:options items="${ticketFormVO.searchTicketVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/> 
					</form:select>		
					<form:select cssClass="form-control" path="searchTicketVO.searchCondition" onchange="go_action('list');">
						<form:options items="${statusList }" itemValue="codeId" itemLabel="codeIdNm" />
					</form:select>	
                  </div>
              	<a class="btn btn-info" href="javascript:OpenWindow('registForm','이용권 등록',800,600);" style="margin-left: 5px;"><i class="icon-ticket"></i> 상품등록</a>
             </div>
          	</div>
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th width="5%"></th>                                            
						<th>번호</th>
						<th width="30%">이용권 명</th>
						<th>가격</th>
						<th>종류</th>
						<th>판매여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty ticketList }">
						<tr>
							<td colspan="6" align="center">
								<strong>게시글이 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>
				
					<c:forEach items="${ticketList}" var="ticket">
						<tr onclick="javascript:OpenWindow('detail?ticketVO.ticketNo=${ticket.ticketNo}','이용권상세조회',800,600);" style="cursor: pointer;" align="center">
							<td></td>
							<td>${ticket.ticketNo }</td>
							<td>${ticket.ticketName }</td>
							<td>${ticket.ticketPrice }</td>
							<td>${ticket.ticketKind }</td>
							<c:choose>
								<c:when test="${ticket.ticketStatus eq 'Y'}">
									<td>판매중</td>
								</c:when>
								<c:when test="${ticket.ticketStatus eq 'N'}">
									<td>판매불가</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div>    
		<form:hidden path="searchTicketVO.pageIndex" id="pageIndex"/>
	</form:form>
</section>
