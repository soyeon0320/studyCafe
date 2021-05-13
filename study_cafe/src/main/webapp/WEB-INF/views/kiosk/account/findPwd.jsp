<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div>
	<header class="navbar page-header navbar-expand-lg">
       <ul class="nav flex-row mr-auto">
       		<li class="nav-item">
       		</li>       		
           <li class="nav-item">
           		<a href="javascript:history.go(-1);" class="btn btn-block btn-icon btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line-arrow-left"></i>
                    	<p class="mb-0" style="font-size: x-large;">뒤로</p>
                </a>
           </li>
         </ul>
         <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
             <li class="nav-item">
           		<a href="<%=request.getContextPath() %>/kiosk/main" class="btn btn-block btn-icon btn-icon-right btn-rounded btn-xl btn-warning mb-2">
                    <i class="icon-line2-home"></i>
                    	<p class="mb-0" style="font-size: x-large;">메인으로</p>
                </a>
          	 </li>
       </ul>
   </header>
   <div style="height: 300px;">
   <h3 style="color: rgb(255,234,0); text-align: center;">비밀번호 찾기</h3>
   </div>
   

</div>