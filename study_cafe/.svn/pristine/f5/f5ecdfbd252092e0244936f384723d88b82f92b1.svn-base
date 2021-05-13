<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty message }">
<script>
	window.addEventListener("load",function(){
		swal(
	            {
	                title: '<p>${message }<p>',
	                confirmButtonText: '<p class="mb-0">닫기</p>',
	                confirmButtonClass: 'btn btn-success mt-2'
	            }
	        );
		
	})
</script>
<c:set var="message" value=""/>
</c:if>

