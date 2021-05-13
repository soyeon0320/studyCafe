<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
	<div class="container mt-30" align="center">
		<h4>${rentVO.storeName }</h4>
		<img src="http://${serverIp }/study_cafe/qrImage/StudyRoom_${rentVO.studyroomReservNo }.png">
		
		<p>예약 시간 : 
			<fmt:formatDate value="${rentVO.studyroomReservStart }" pattern="MM/dd일 HH시 ~"/>
			<fmt:formatDate value="${rentVO.studyroomReservEnd }" pattern="HH시 까지"/>
		</p>
	</div>
</section>
