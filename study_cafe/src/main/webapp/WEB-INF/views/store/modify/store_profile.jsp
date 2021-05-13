<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.nav-pills .nav-link.active, .nav-pills .show > .nav-link {
    background-color: #007bff;
    color: white;
</style>

<section style="background-color: #f2f6f8;">
	<div class="row fullscreen">
		<div class="col-xl-11 no-padding" style="z-index: 1;">
			<div class="profile-content p-4">
				<div class="profile-cover">
					<img src="<%=request.getContextPath() %>/resources/images/cover1.jpg" alt="" class="img-fluid">
				</div>
				<!-- Nav tabs -->
				<ul class="nav nav-pills profile-tabs pb-3" role="tablist">
				<li role="presentation" class="nav-item"><a class="nav-link active" href="#tb2" aria-controls="tb2" role="tab" data-toggle="tab"><i class="fa fa-user-circle fs10 mr-1"></i> 매장정보</a></li>
				<li role="presentation" class="nav-item"><a class="nav-link " href="#tb1" aria-controls="tb1" role="tab" data-toggle="tab"><i class="fa fa-pencil-alt fs10 mr-1"></i> 매장이미지</a></li>
				<li role="presentation" class="nav-item"><a class="nav-link " href="#tb3" aria-controls="tb3" role="tab" data-toggle="tab"><i class="fa fa-cog fs10 mr-1"></i> 정보수정</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<%@ include file="./tab_store_info.jsp" %>
					<%@ include file="./tab_store_images.jsp" %>
					<%@ include file="./tab_store_setting.jsp" %>
				</div>
				
			</div>
		</div>
		<div class="col-1">
		</div>
	
	</div>
</section>



<script>





</script>