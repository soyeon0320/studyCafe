<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


    
<div class="container clearfix" style="width: fit-content;">
	<ul class="pagination pagination-circle pagination-3d pagination-light">
		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_egov_link_page" />
	</ul>    
</div>    
    
    