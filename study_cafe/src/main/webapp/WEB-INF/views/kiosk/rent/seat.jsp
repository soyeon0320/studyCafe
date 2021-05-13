<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/rent" class="btn btn-block btn-icon btn-rounded btn-xl btn-light mb-2">
                    <i class="icon-line-chevron-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">뒤로가기</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="javascript:confirmLogout();" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-dark mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
          	 </li>
       </ul>
   </header>
   
   	<%@ include file="/WEB-INF/include/kiosk_seatList.jsp" %>
   
   
   <form id="seatForm" name="seatForm" action="rent" method="post">
		<input type="hidden" name="seatNo" id="seatNo" value="">  
   </form>
</div>

<script>

function seatSelect(seatNo, viewNo, YN, seat){
	
	if (YN == '1') {
		swal(
	            {
	                title: '<p>' + viewNo + '번 좌석은 이미 이용중인 좌석입니다.<p>',
	                type: 'error',
	                confirmButtonText: '<p class="mb-0">다시 선택하기</p>',
	                confirmButtonClass: 'btn btn-success mt-2'
	            }
	        );
	}else{
		swal({
	        title: '<p>${loginUser.memName }님, ' + viewNo +'번 좌석을 이용하시겠습니까?</p>',
	        type: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '<p class="mb-0">좌석 예약</p>',
	        cancelButtonText: '<p class="mb-0">다시 선택</p>',
	        confirmButtonClass: 'btn btn-success mt-2',
	        cancelButtonClass: 'btn btn-danger ml-2 mt-2',
	        buttonsStyling: false
	    }).then(function () {
	    	//location.href ="<c:url value='/seat/rent'/>";
	    	$('#seatNo').val(seatNo);
	    	
	    	sessionStorage.setItem('viewNo',viewNo);
	    	$("form[id='seatForm']").submit();
	    	
	    }, function (dismiss) {
	        if (dismiss === 'cancel') {
	        	
	        }
	    });
	}
}

</script>

