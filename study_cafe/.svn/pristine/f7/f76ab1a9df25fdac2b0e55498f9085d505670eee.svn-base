<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<style>
.table td, .table{
	background: aliceblue; 
}
.table thead th{
 	background: wheat; 
}

.equip:hover{
 	text-align:center; background:springGreen; 
 }

</style>
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
   	
   <div class="row">
		<div class="row mb-20 mt-20" id=""  style="text-align: center; padding: 0px 70px;">
		<div class="col-6">
			<div class="portlet-box portlet-shadow  mb-15" style="height: 98%; overflow: auto;">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
				<div class="flex d-flex flex-column col-11">
					<h3>${equipList[0].equipName}</h3>
				</div>
				<c:if test="${equipList[0].equipUseable eq 0 }">
					<c:if test="${equipList[0].equipOccufied eq 0}">
						<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3">대여가능</button>
					</c:if>
					<c:if test="${equipList[0].equipOccufied eq 1}">
						<button type="button" class="btn btn-shadow  btn-danger mb-3 mr-3">대여불가</button>
					</c:if>
				</c:if>
				<c:if test="${equipList[0].equipUseable eq 1}">
					<button type="button" class="btn btn-shadow  btn-dark mb-3 mr-3">수리중</button>
				</c:if>
				<div>
					<!-- 톱니바퀴 -->
				</div>
			</div>
			
			<div class="portlet-body" style="padding: 10px;">
				
					<div class="iCard border1 p-2 rounded bg-white">
	                    <a href="#">
	                        <img src="<%=request.getContextPath()%>/resources/images/equip/EP59.jpg" alt="" class="img-fluid rounded" style="height: 100px;">
	                    </a>
	                    <div class="iCard-content p-1 pt-15 pb-15">
	                        <h3 class="fs16 text-dark font400 mb-5 text-capitalize"></h3>
	                        <span class="iCard-meta fs12 d-block mb-15">12.9형<strong class="font600"> iPad Pro</strong> </span>
	                        <div class="thumbnails-group mb-15">
	                        
	                        </div>
	                        <div class="pt-15 b-t text-right">
	                            <div class="row align-items-center">
	                                <div class="col-5 text-left b-r">
	                                    <span class="d-block pb-1 fs13">시간당 4천원</span>
	                                </div>
	                                <div class="col-6">
	                                <c:if test="${equipList[0].equipUseable eq 0}">
	                                	<c:if test="${equipList[0].equipOccufied eq 0}">
	                                    <a href="tbRent?equipCode=${equipList[0].equipCode}" class="btn btn-shadow btn-info">
	                                        <i class="fa fa-arrow-right"></i>
	                                         	결제
	                                    </a>
	                                    </c:if>
	                                    <c:if test="${equipList[0].equipOccufied eq 1}">
	                                   	 대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                    </c:if>
	                                </c:if>
	                                <c:if test="${equipList[0].equipUseable eq 1}">
	                                	대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                </c:if>    
	                                </div>
	
	                            </div>
	                        </div>
	                    </div>
	                </div>
				
				</div>
			</div>
        </div>
		
		<div class="col-6">
			<div class="portlet-box portlet-shadow  mb-15" style="height: 98%; overflow: auto;">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
				<div class="flex d-flex flex-column col-11">
					<h3>${equipList[1].equipName }</h3>
				</div>
				<c:if test="${equipList[1].equipUseable eq 0}">
					<c:if test="${equipList[1].equipOccufied eq 0}">
					<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3">대여가능</button>
					</c:if>
					<c:if test="${equipList[1].equipOccufied eq 1}">
					<button type="button" class="btn btn-danger  btn-danger mb-3 mr-3">대여불가</button>
					</c:if>
				</c:if>
				<c:if test="${equipList[1].equipUseable eq 1}">
					<button type="button" class="btn btn-shadow  btn-dark mb-3 mr-3">수리중</button>
				</c:if>
				<div>
					<!-- 톱니바퀴 -->
				</div>
			</div>
			
			<div class="portlet-body" style="padding: 10px;">
				
				<div class="iCard border1 p-2 rounded bg-white">
	                    <a href="#">
	                        <img src="<%=request.getContextPath()%>/resources/images/equip/${equipList[1].equipCode}.jpg" alt="" class="img-fluid rounded" style="height: 100px;">
	                    </a>
	                    <div class="iCard-content p-1 pt-15 pb-15">
	                        <h3 class="fs16 text-dark font400 mb-5 text-capitalize"></h3>
	                        <span class="iCard-meta fs12 d-block mb-15"> Galaxy Book <strong class="font600">NT750XDA</strong> </span>
	                        <div class="thumbnails-group mb-15">
	              					
	                        </div>
	                        <div class="pt-15 b-t text-right">
	                            <div class="row align-items-center">
	                                <div class="col-5 text-left b-r">
	                                    <span class="d-block pb-1 fs13">시간당 4천원</span>
	                                </div>
	                                <div class="col-6">
	                                <c:if test="${equipList[1].equipUseable eq 0}">	
	                                	<c:if test="${equipList[1].equipOccufied eq 0 }">
	                                    <a href="tbRent?equipCode=${equipList[1].equipCode}" class="btn btn-shadow btn-info">
	                                        <i class="fa fa-arrow-right"></i>
	                                         	결제
	                                    </a>
	                                    </c:if>
	                                    <c:if test="${equipList[1].equipOccufied eq 1}">
	                                   	 대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                    </c:if>
	                                </c:if>
	                                <c:if test="${equipList[1].equipUseable eq 1}">
	                                	대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                </c:if>
	                                </div>
	
	                            </div>
	                        </div>
	                    </div>
	                </div>
			</div>
		</div>
		</div>
		
		<div class="col-6">
			<div class="portlet-box portlet-shadow  mb-15" style="height: 98%; overflow: auto;">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
				<div class="flex d-flex flex-column col-11">
					<h3>${equipList[2].equipName}</h3>
				</div>
				<c:if test="${equipList[2].equipUseable eq 0 }">
					<c:if test="${equipList[2].equipOccufied eq 0}">
					<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3">대여가능</button>
					</c:if>
					<c:if test="${equipList[2].equipOccufied eq 1}">
					<button type="button" class="btn btn-danger  btn-danger mb-3 mr-3">대여불가</button>
					</c:if>
				</c:if>
				<c:if test="${equipList[2].equipUseable eq 1}">
					<button type="button" class="btn btn-danger  btn-dark mb-3 mr-3">수리중</button>
				</c:if>
				<div>
					<!-- 톱니바퀴 -->
				</div>
			</div>
			
			<div class="portlet-body" style="padding: 10px;">
				
				<div class="iCard border1 p-2 rounded bg-white">
	                    <a href="#">
	                        <img src="<%=request.getContextPath()%>/resources/images/equip/${equipList[2].equipCode}.jpg" alt="" class="img-fluid rounded" style="width:130px; height: 100px;">
	                    </a>
	                    <div class="iCard-content p-1 pt-15 pb-15">
	                        <h3 class="fs16 text-dark font400 mb-5 text-capitalize"></h3>
	                        <span class="iCard-meta fs12 d-block mb-15"><strong class="font600">SM-T500NZAEKOO</strong> </span>
	                        <div class="thumbnails-group mb-15">
	                        	
	                        </div>
	                        <div class="pt-15 b-t text-right">
	                            <div class="row align-items-center">
	                                <div class="col-5 text-left b-r">
	                                    <span class="d-block pb-1 fs13">시간당 4천원</span>
	                                </div>
	                                <div class="col-6">
	                                <c:if test="${equipList[2].equipUseable eq 0}">
	                                    <c:if test="${equipList[2].equipOccufied eq 0 }">
	                                    <a href="tbRent?equipCode=${equipList[2].equipCode}" class="btn btn-shadow btn-info">
	                                        <i class="fa fa-arrow-right"></i>
	                                         	결제
	                                    </a>
	                                    </c:if>
	                                    <c:if test="${equipList[2].equipOccufied eq 1}">
	                                    	대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                    </c:if>
	                                </c:if>
	                                <c:if test="${equipList[2].equipUseable eq 1}">
	                                	대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                </c:if>
	                                </div>
	
	                            </div>
	                        </div>
	                    </div>
	                </div>
			</div>
		</div>
		
		</div>
		
		<div class="col-6">
			<div class="portlet-box portlet-shadow  mb-15" style="height: 98%; overflow: auto;">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b" style="padding: 5px;">
				<div class="flex d-flex flex-column col-11">
					<h3>${equipList[3].equipName}</h3>
				</div>
				<c:if test="${equipList[3].equipUseable eq 0 }">
					<c:if test="${equipList[3].equipOccufied eq 0}">
					<button type="button" class="btn btn-shadow  btn-teal mb-3 mr-3">대여가능</button>
					</c:if>
					<c:if test="${equipList[3].equipOccufied eq 1}">
					<button type="button" class="btn btn-danger  btn-danger mb-3 mr-3">대여불가</button>
					</c:if>
				</c:if>
				<c:if test="${equipList[3].equipUseable eq 1}">
					<button type="button" class="btn btn-danger  btn-dark mb-3 mr-3">수리중</button>
				</c:if>
				<div>
					<!-- 톱니바퀴 -->
				</div>
			</div>
			<div class="portlet-body" style="padding: 10px;">
				<div class="iCard border1 p-2 rounded bg-white">
	                <a href="#">
	                    <img src="<%=request.getContextPath()%>/resources/images/equip/${equipList[3].equipCode}.png" alt="" class="img-fluid rounded" style="width:100px; height: 100px;">
	                </a>
	                <div class="iCard-content p-1 pt-15 pb-15">
	                    <h3 class="fs16 text-dark font400 mb-5 text-capitalize"></h3>
	                    <span class="iCard-meta fs12 d-block mb-15"><strong class="font600">A14 Bionic 칩</strong> </span>
	                    <div class="thumbnails-group mb-15">
	                    
	                    </div>
	                    <div class="pt-15 b-t text-right">
	                        <div class="row align-items-center">
	                            <div class="col-5 text-left b-r">
	                                <span class="d-block pb-1 fs13">시간당 4천원</span>
	                            </div>
	                            <div class="col-6">
	                                <c:if test="${equipList[3].equipUseable eq 0}">
	                                    <c:if test="${equipList[3].equipOccufied eq 0 }">
	                                    <a href="tbRent?equipCode=${equipList[3].equipCode}" class="btn btn-shadow btn-info">
	                                        <i class="fa fa-arrow-right"></i>
	                                         	결제
	                                    </a>
	                                    </c:if>
	                                    <c:if test="${equipList[3].equipOccufied eq 1}">
	                                    	대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                    </c:if>
	                                </c:if>
	                                <c:if test="${equipList[3].equipUseable eq 1}">
	                                	대여 불가 <img alt="" src="<%=request.getContextPath()%>/resources/images/x.png" style="width: 20px;">
	                                </c:if>
                                </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
			</div>
		</div>
       </div>
	 </div>
	</div>
		
</div>
<script>
function go_equip(pageIndex) {
	$("#equipIndex").val(pageIndex);
	go_action("main");
}
</script>