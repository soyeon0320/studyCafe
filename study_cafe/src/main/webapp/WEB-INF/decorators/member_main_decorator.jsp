<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:if test="${!empty loginUser }">
	<c:set value="${loginUser.useInfoVO }" var="useInfo" scope="session" />
</c:if>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Common Plugins CSS (all plugins css file compile into one file by gulp) -->
    <link href="<%=request.getContextPath() %>/resources/css/plugins/plugins.css" rel="stylesheet">
	<!-- Bootstrap-->
    <link href="<%=request.getContextPath() %>/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- sweet-alerts -->
    <link href="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.css" rel="stylesheet">
    <!--fonts-->
    <link href="<%=request.getContextPath() %>/resources/css/font-icons.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/resources/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/lib/chartist/chartist.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/resources/css/chartist-custom.css" rel="stylesheet" />
    
    <!-- datepicker -->
    <link href="<%=request.getContextPath() %>/resources/lib/dt-picker/jquery.datetimepicker.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/picker-custom.css" rel="stylesheet">
    
    <!-- jvectormap -->
    <link href="<%=request.getContextPath() %>/resources/lib/vector-map/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Assan cuatom CSS fle -->
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<!-- font 커스텀 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font.css" type="text/css" />
	
	<!--  summernote -->		
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/lib/summernote/summernote-bs4.css" type="text/css" />
	
	<!-- fullcalender -->
	<link href="<%=request.getContextPath() %>/resources/lib/fullcalendar/fullcalendar.min.css" rel="stylesheet">
	
	<!-- 별모양 -->
	<link href="<%=request.getContextPath() %>/resources/css/custom/bs-rating.css" rel="stylesheet">
	
	<!-- 롤링 -->	
	<link href="<%=request.getContextPath() %>/resources/css/rolling.css?v=3" rel="stylesheet">
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	
		body,* {
			font-family: 'SLEIGothicTTF', serif;
		}
		
		.table.table-hover thead{
			background-color: #ff007603;
		}
		.navbar.navbar-horizontal .navbar-nav > li > .nav-link {
			font-size: 1.1rem;
		}
		
	</style>
	
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<link rel="icon" href='<c:url value="/resources/images/favicon/book2.png" />' type="image/gif" sizes="24x24">
	<title>Spring Study</title>

</head>
<body>

	
	<div class="page-wrapper" id="page-wrapper">
            <div class="content">
                <!-- header -->
                <%@ include file="/WEB-INF/include/sc_member_menu.jsp" %>
								
                <div class="page-content d-flex flex pl-0 pr-0" >
                    <div class="container bg-white">
                         <div class="flex d-flex">
                            <div class="d-flex flex flex-column">
                                <div class="flex">

                                    <div class="p-3 pt-10 pb-10">
                                    	
                                        <div class="row">
                                        	
                                        	<div class="col-12">
												<tiles:insertAttribute name="section"/>
												 <%@ include file="/WEB-INF/include/message.jsp" %>
											</div><!-- #content end -->
                                        </div>
                                    </div>
                                </div><!-- content-->

                            </div>
                        </div>
                    </div>
                </div>
                <footer class="content-footer  d-flex p-3 align-items-center bg-light b-t">
                    <div class="d-flex container">
                        <div class="d-flex flex ml-auto">
                        </div>
                        <div class="d-flex flex mr-auto justify-content-end">
                        	<!-- 본사페이지 이동 아이콘 -->
							<a href="javascript:location.href='<%=request.getContextPath() %>/admin/main'" class="social-icon si-small si-borderless si-call" data-toggle="tooltip" data-placement="top" title="" data-original-title="본사페이지로">
								<i class="icon-line-command"></i>
							</a>
                        </div>
                    </div>
                </footer>
            </div><!-- page content end-->
        </div>
    
	<script type="text/javascript">
		<c:if test="${onNotice != null }">
			var renderData = ${onNotice};
		</c:if>
		
		<c:if test="${useInfo != null }">
			var seat_in = ${useInfo.seatIn.time };
		</c:if>
	
		window.addEventListener("load",function(){
			<c:if test="${onNotice != null }">
				for (var i = 0; i < renderData.length; i++) {
					rollingData.push("[공지] "+renderData[i].noticeTitle);
				}
				
				$('#rolling_box').children().eq(0).children().eq(0).text(rollingData[0]).css("cursor","pointer").attr("onclick","location_go('/notice/detail?noticeVO.noticeNo="+renderData[dataCnt].noticeNo+"')");
				setInterval(my_rolling,5000);
			</c:if>
			

			<c:if test="${useInfo != null }">
				
				$("#useTime").text(get_use_time(new Date() - seat_in));
				setInterval(use_store_time,1000);
			</c:if>
		});
	</script>

    <!-- Common plugins -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins/plugins.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/peity/jquery.peity.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/appUi-custom.js"></script> 
    
    <!-- date picker -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/fullcalendar/moment.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/dt-picker/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins-custom/pickers-custom.js"></script> 
    
    <!-- 별모양 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/components/star_rating.js"></script> 
    
    <!-- Sweetalerts2 js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.js"></script> 
    <script src="<%=request.getContextPath() %>/resources/js/plugins-custom/sweetalert2-custom.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/swal.js"></script> 
    
    
	<!-- common.js (OpenWindow있음) -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js?v=3"></script> 
    
	<!-- summernote -->
	<script src="<%=request.getContextPath() %>/resources/lib/summernote/summernote-bs4.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/summernote_custom.js?v=1"></script>
	
	<!-- fullcalrendar -->
	<script src="<%=request.getContextPath() %>/resources/lib/fullcalendar/fullcalendar.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/lib/fullcalendar/ko.js"></script>
	
    <!--page script-->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap-notify/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/custom_notify.js?v=1"></script> 
	
	
	<!-- 롤링 공지 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/rolling.js?v=3"></script> 
    <script>
		function location_go(url){
			var cp = '<%=request.getContextPath()%>';
			location.href= cp+'/'+url;	
		}
	</script>
    
</body>
</html>