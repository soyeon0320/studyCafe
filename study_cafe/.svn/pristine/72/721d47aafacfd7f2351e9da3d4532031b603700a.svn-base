<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header
		============================================= -->
<aside id="page-aside" class=" page-aside aside-fixed">
                <div class="sidenav whiteNav">
				   <a class="nav-thumbnail app-logo d-flex flex flex-row align-items-center overflow-hidden justify-content-center" style="padding: 35px; background-color: white;" href="<%=request.getContextPath() %>/admin/main">
				       <i class="icon-book-reader d-inline-flex mr-2 avatar40 shadow-sm text-primary-light rounded-circle align-items-center justify-content-center fs-1x"></i>
				       <span class="font500" style="font-size: 1.5em;">Spring Study</span>
				   </a>
                    <div class="flex">
                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="aside-content slim-scroll" style="overflow: hidden; width: auto; height: 100%;">
                <ul class="metisMenu" id="metisMenu">
						<li> <i class="icon-store nav-thumbnail"></i>
                        <a class="has-arrow" href="" onclick="setMenu(this);" id="menu_admin_store">
                            <span class="nav-text">
                                	가맹점 관리	 
                            </span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li>
                          		<span class="nav-thumbnail">01</span>
                                <a href="<%=request.getContextPath()%>/contract/list">계약 관리</a>
                            </li>
                            <li>
                            	<span class="nav-thumbnail">02</span>	
                                <a href="<%=request.getContextPath()%>/storeEquip/list">매장 관리</a>
                            </li>
                            <li><span class="nav-thumbnail">03</span>
                                <a href="<%=request.getContextPath()%>/mail/list">안내사항 관리</a>
                            </li>
                        </ul>
                    </li>

                    <li>  <i class="icon-boxes nav-thumbnail"></i>
                        <a class="has-arrow" href="javascript:void(0)" onclick="setMenu(this);" id="menu_admin_stock">

                            <span class="nav-text">
                                	물류 관리
                            </span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><span class="nav-thumbnail">01</span>
                                <a href="<%=request.getContextPath()%>/supply/list">물품 관리</a>
                            </li>
                            <li><span class="nav-thumbnail">02</span>
                                <a href="<%=request.getContextPath()%>/orderProduct/list">발주 관리</a>
                            </li>
                            <!-- <li>
                                <span class="nav-thumbnail">Hz</span>
                                <a href="#">상품 관리</a>
                            </li> -->
                        </ul>
                    </li><!--Menu-item-->
                   <!--  <li> <i class="icon-Tablet"></i>
                        <a class="has-arrow" href="javascript:void(0)" onclick="setMenu(this);" id="menu_admin_sale">	

                            <span class="nav-text">
                         	       영업 관리 
                            </span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li>
                                <span class="nav-thumbnail"><i class="fa fa-inbox"></i></span>
                                <a href="#">점검 관리</a>
                            </li>
                        </ul> 
                    </li> -->

                    <li> <i class="icon-ticket nav-thumbnail"></i>
                        <a href="<%=request.getContextPath()%>/ticket/list"><span class="nav-text">이용권 관리  </span></a>
                    </li><!--Menu-item-->
                    
                    <li> <i class="icon-banknote nav-thumbnail"></i>
                        <a href="<%=request.getContextPath()%>/admin/sales" onclick="setMenu(this);">
                            <span class="nav-text">
                                	매출관리
                            </span>
                        </a>
                    </li><!--Menu-item-->
                  
                    <li><i class="icon-line-smile nav-thumbnail"></i>
                        <a href="<%=request.getContextPath() %>/vocManage/list" onclick="setMenu(this);">
                            <span class="nav-text">
                                	고객센터 관리
                            </span>
                        </a>
                    </li><!--Menu-item-->
                    
                    <li><i class="icon-user nav-thumbnail"></i>
                        <a href="<%=request.getContextPath()%>/admin/member/list" onclick="setMenu(this);">
                            <span class="nav-text">
                                	회원 관리
                            </span>
                        </a>
                        
                    </li><!--Menu-item-->
					
                    <li><i class="icon-line-message-circle nav-thumbnail"></i>
                        <a href="<%=request.getContextPath()%>/admin/talk" onclick="setMenu(this);">
                            <span class="nav-text">
                                	알림톡 관리
                            </span>
                        </a>
                    </li><!--Menu-item-->
                    <li> <i class="icon-clipboard-list nav-thumbnail"></i>
                        <a class="has-arrow" href="javascript:void(0)" onclick="setMenu(this);" id="menu_admin_board">

                            <span class="nav-text">
                                	게시판 관리
                            </span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li>
                                <span class="nav-thumbnail">01</span>
                                <a href="<%=request.getContextPath()%>/notice/listAdminVer">공지사항 관리</a>
                            </li>
                            <li>
                                <span class="nav-thumbnail">02</span>
                                <a href="#">자유게시판 관리</a>
                            </li>
                            <li>
                                <span class="nav-thumbnail">03</span>
                                <a href="#">정보게시판 관리</a>
                            </li>
                            <li>
                                <span class="nav-thumbnail">04</span>
                                <a href="#">소모임게시판 관리</a>
                            </li>
                        </ul>
                    </li><!--Menu-item-->
                    <li> <i class="icon-line-cog nav-thumbnail"></i>
                        <a class="has-arrow" href="javascript:void(0)" onclick="setMenu(this);" id="menu_admin_system">

                            <span class="nav-text">
                                	시스템 관리 
                            </span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li>
                                <span class="nav-thumbnail">01</span>
                                <a href="<c:url value="/error/main" />">에러 로그</a>
                            </li>
                            <li>
                                <span class="nav-thumbnail">02</span>
                                <a href="<c:url value="/sym/ccm/ccc/SelectCcmCmmnClCodeList.do" />">공통분류코드 관리</a>
                            </li>
                            <li>
                                <span class="nav-thumbnail">03</span>
                                <a href="<c:url value="/sym/ccm/cca/SelectCcmCmmnCodeList.do" />">공통코드 관리</a>
                            </li>
                        </ul>
                    </li><!--Menu-item-->

                </ul>
            </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 541.517px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div><!-- aside content end-->
        </div><!-- aside hidden scroll end-->
        <div class="aside-footer p-3 pl-25">

        </div><!-- aside footer end-->
    </div><!-- sidenav end-->
</aside>

