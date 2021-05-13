<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<style>
	#pageUnitSelector {
		width: 120px;
	}
	
	td.td-title{
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
	max-width: 200px;
}
</style>			
				
<section>
	<form:form commandName="mailSendHisVO" id="listForm" name="listForm" method="post">
		<form:hidden path="mailNo" id="detailNo" />
		
		<main class="content mt-5">
		<div class="page-content d-flex flex pl-0 pr-0">
			<div class="d-flex flex">
				<aside class="sidebar sidebar-sm" id="mail-sidebar"
					style="width: 40%;">
					<div class="flex-column d-flex bg-white" style="height: auto;">
						<div class="b-b navbar">
							<h2>보낸메일목록</h2>
						</div>
						<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: auto;">
							<div class="flex slim-scroll"
								style="overflow: hidden; width: auto; height: 100%;">
								<div class="slimScrollDiv">
									<div class="pt-10 ml-3 mr-3 float-right">
										<div class="btn-group dropdown">
											<form:select cssClass="form-control" path="pageUnit" onchange="go_action('list');">
												<form:options items="${mailSendHisVO.pageUnitSelector }" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/> 
											</form:select>			
										</div>
										<a class="btn btn-info" href="sendForm" style="margin-left: 5px;"><i class="icon-email2"></i> 메일작성</a>
									</div>
									<div class="pb-30">
										<table class="table table-hover table-mails mb-0">
											<thead>
												<tr align="center">
													<th></th>
													<th>번호</th>
													<th>받는사람</th>
													<th width="30%">메일 제목</th>
													<th>발송날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${mailList}" var="mail">
													<tr onclick="getMailDetail(${mail.mailNo});" style="cursor: pointer;" align="center">
														<td></td>
														<td>${mail.rnum }</td>
														<td>${mail.reciver }</td>
														<td class="td-title">${mail.mailTitle }</td>
														<td><fmt:formatDate value="${mail.mailRegDate }" pattern="yyyy-MM-dd" /></td>
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
						</div>
					</div>
				</aside>
				<form:hidden path="pageIndex" id="pageIndex"/>
				</form:form>
				<!--inobx sidebar-->
				<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
					<div class="d-flex flex flex-column" style="height: auto;">
						<div class="navbar bg-white b-b">
						</div>
						<div class="portlet-body"  id="detailDiv" style="display: none;">
						<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
							<div class="d-flex flex flex-column">
							    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="flex slim-scroll" style="overflow: hidden; width: auto; height: 100%;">
							        <div class="p-4">
							            <div>
							            	<div class="p-0 row">
								                <h5 class="col-md-10">제목 : <span class="text-xs text-muted col-md-2" style="text-align: center;" id="mailTitle"></span></h5>
								                <p class="text-xs text-muted col-md-2" style="text-align: center;" id="mailRegDate"></p>
							                </div>
							                <div class="py-3 b-t">
							                	보낸사람 : 관리자( <span id="adminId"></span> )
							                </div>
							                <div class="py-3 b-t b-b">
							                	받는사람 : 
							                	<ul class="nav" id="addrList">
								                		<li class="nav-item"><i class="icon-user-alt"></i>sdf(sdf)</li>&emsp;
							                	</ul>
							                </div>
							                <div class="pt-1" style="height: 200px;" id="mailContent">
							                
							                </div>
							                <div class="py-3 b-b">
						
							                </div>
							            </div>
							        </div>
							    </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 845px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div><!-- content-->
							</div>
						</div>
						</div>
					</div>

				</div>
				<!--chat content-->
			</div>
		</div>
		</main>
</section>
<script>
	function getMailDetail(mailNo){
	 var data = {"mailNo":mailNo};
	 
		$.ajax({
			url:"<c:url value='/mail/detail'/>",
			type:"post",
			data:data,
			success:function(data) {
				$("#detailDiv").css("display", "");
				setMailDetail(data.mail);
				setSendAddr(data.addrList);
			}
		});
	}
 
	function setMailDetail(mail){
	 $("#mailTitle").html(mail.mailTitle);
	 $("#mailRegDate").html(getTimeStamp(mail.mailRegDate));
	 $("#adminId").html(mail.adminId);
	 $("#mailContent").html(mail.mailContent);
	}

	function setSendAddr(addrList) {
		var str = "";	
		 $.each(addrList, function(idx, item){
			 str += "<li class='nav-item'><i class='icon-user-alt'></i>"+item.storeName+"("+item.ownerEmail+")</li>&emsp;"
		 });
		 
		$("#addrList").html(str);
	}
</script>