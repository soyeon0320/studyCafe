<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>    

<form:form commandName="mailSendHisVO" action="detail" method="post" id="mailForm">
	<form:hidden path="pageIndex"/>
    <form:hidden path="pageUnit"/>
	<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content">
		<div class="d-flex flex flex-column">
		    <div class="navbar bg-white b-b">
		        <div class="d-flex">
		            <div class="d-inline-flex h-md-up flex align-self-center">
		                <button type="button" data-toggle="dropdown" data-target="#mail-sidebar" class="btn btn-gradient-danger mr-1 h-md-up rounded btn-sm">
		                    <i class="fa fa-align-left"></i>
		                </button>
		            </div>
		            <div class=" mr-2 btn-group dropdown">
		                <a href="javascript:go_action('list','#mailForm');" data-toggle="tooltip" data-placement="bottom" title="" class="btn btn-outline-light text-secondary btn-sm" data-original-title="목록으로">
		                    <i class="fa fa-reply"></i>
		                </a>
		            </div>
		        </div>

		    </div>
		    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="flex slim-scroll" style="overflow: hidden; width: auto; height: 100%;">
		        <div class="p-4">
		            <div>
		            	<div class="p-0 row">
			                <h5 class="col-md-10">제목 : ${mail.mailTitle}</h5>
			                <p class="text-xs text-muted col-md-2" style="text-align: center;"><fmt:formatDate value="${mail.mailRegDate }" pattern="yyyy-MM-dd" /></p>
		                </div>
		                <div class="py-3 b-t">
		                	보낸사람 : 관리자( ${mail.adminId} )
		                </div>
		                <div class="py-3 b-t b-b">
		                	받는사람 : 
		                	<ul class="nav">
		                		<c:forEach items="${addrList}" var="addr">
			                		<li class="nav-item"><i class="icon-user-alt"></i>${addr.storeName}(${addr.ownerEmail})</li>&emsp;
		                		</c:forEach>
		                	</ul>
		                </div>
		                <div class="pt-1" style="height: 200px;">
		                    ${mail.mailContent}
		                </div>
		                <div class="py-3 b-b">
	
		                </div>
		            </div>
		        </div>
		    </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 845px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div><!-- content-->
		</div>
	</div>
</form:form>

