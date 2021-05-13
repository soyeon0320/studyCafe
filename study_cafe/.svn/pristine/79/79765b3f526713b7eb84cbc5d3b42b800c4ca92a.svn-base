<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
				
<section>
	<form:form commandName="mailSendHisVO" id="listForm" name="listForm" method="post">
		<form:hidden path="mailNo" id="detailNo" />
		<div class="container clearfix">
			<div class="navbar bg-white b-b">
               <div class="d-flex">
                   <div class="d-inline-flex h-md-down flex align-self-center">
                   <h2>메일발송내역</h2>
                   </div>
               </div>
              <div class="d-flex" style="margin-bottom: 5px;">
                  <div class="btn-group dropdown">
					<form:select cssClass="form-control" path="pageUnit" onchange="go_action('list');">
						<form:options items="${mailSendHisVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/> 
					</form:select>		
                  </div>
              	<a class="btn btn-info" href="sendForm" style="margin-left: 5px;"><i class="icon-email2"></i> 메일작성</a>
             </div>
          	</div>
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th></th>
						<th>번호</th>
						<th>받는사람</th>
						<th width="30%">메일 제목</th>
						<th>발송날짜</th>
						<th>보낸사람</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mailList}" var="mail">
						<tr onclick="go_detail(${mail.mailNo});" style="cursor: pointer;" align="center">
							<td></td>
							<td>${mail.mailNo }</td>
							<td>${mail.reciver }</td>
							<td>${mail.mailTitle }</td>
							<td><fmt:formatDate value="${mail.mailRegDate }" pattern="yyyy-MM-dd" /></td>
							<td>${mail.adminId }</td>
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
		<form:hidden path="pageIndex" id="pageIndex"/>
	</form:form>
</section>
<script>

</script>
