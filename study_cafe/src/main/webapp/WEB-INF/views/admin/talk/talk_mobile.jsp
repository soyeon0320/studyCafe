<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section style="padding: 15px;">
	
	<div class="mb-20">
		<h1 align="center" >SPRING STUDY</h1>
	</div>
	<div class="mb-20">
		<p align="center">
		공부하는 사람들이 먼저 찾는 공간, <br> 스프링 스터디 카페 </p>
	</div>
	
    <div class="portlet-box portlet-fullHeight  mb-30">
        <div class="portlet-header flex-row flex d-flex align-items-center b-b">
            <div class="flex d-flex flex-column">
                <h3 style="font-size: 1.2em;">${notitalk.notitalkTitle }</h3> 
            </div>
        </div>
        <div class="portlet-body">
        	<p align="right"><fmt:formatDate value="${notitalk.notitalkRegDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
            <p class="mb-20 text-muted" style="font-size: 1.2em;">
              ${notitalk.notitalkContent } 
            </p>
        </div>
    </div><!--portlet-->

	
	<div>
		<p align="center">
		가맹점주님들과 상생할 수 있는 같은 길을 걸어가겠습니다. <br>
		 감사합니다. </p>
	</div>



</section>