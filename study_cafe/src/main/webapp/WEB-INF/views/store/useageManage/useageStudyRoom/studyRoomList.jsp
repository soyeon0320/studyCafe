<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<body>
	<h1>좌석 배치도</h1>
	
	<span>총 좌석 현황 :</span>
	
	<div class="pt50 pb20" id="portfolio">
            <div class="container">
                <h3 class="text-center font700 text-uppercase h3 mb60">스터디룸 예약 현황</h3>
				
				<c:forEach items="${studyRoom }" var="str">
                <div class="row">
                    <div class="col-md-6 mb30">
                        <a onclick="OpenWindow('studyRoomDetail', '스터디룸 예약', 800, 600)" class="folio-card">
                            <img src="<%=request.getContextPath()%>${str.studyroomImage } alt="" class="img-fluid">
                        </a>
                        <div class="folio-overlay">
                                <div class="folio-content">
                                    <h4>${str.studyroomName }(${str.studyroomCapa }인)</h4>
                                    <p>~_~</p>
                                </div>
                        </div>
                    </div><!--/col-->
                </div>
                </c:forEach>
            </div>
        </div>
        
        <script>
			function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
				winleft = (screen.width - WinWidth) / 2;
				wintop = (screen.heigth - WinHeight) / 2;
				var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth 
						+ ",height=" + WinHeight + ", top=" + wintop + ", left=" + winleft +
						+ ", resizable=yes, status=yes"
						);
				win.focus();
			}
		</script>
</body>
</html>