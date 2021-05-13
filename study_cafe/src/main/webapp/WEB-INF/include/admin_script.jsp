<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>


var contextPath = "<%=request.getContextPath()%>"; 
function summernote_start(content){
	content.summernote({
		placeholder:'여기에 내용을 적으세요.',
		height:500,
		disableResizeEditor: true,
		useProtocol:false,
		toolbar: [
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		  ],
	});
	
}

</script>
	
	<!-- 카카오로그인/알림톡 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a3534454a891289cd08358f9b98b5256');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
	<script>
	function loginWithKakao() {
	    Kakao.Auth.authorize({
	    	redirectUri: 'http://localhost/<%=request.getContextPath()%>/admin/talk'
	    });
	    Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(response) {
	            console.log('성공 : ' + response);
	        },
	        fail: function(error) {
	            console.log('실패 : ' + error);
	        }
	    });
	  }
	</script>
	
	<!-- Common plugins -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/plugins/plugins.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/appUi-custom.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/chartjs/dist/chart.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/peity/jquery.peity.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/lib/chartist/chartist.min.js"></script>
    <!-- jvectormap -->
    <script src="<%=request.getContextPath() %>/resources/lib/vector-map/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/lib/vector-map/jquery-jvectormap-world-mill-en.js"></script>
	
    <!-- ================================================================================================================ -->
	<!-- summernote -->
	<script src="<%=request.getContextPath() %>/resources/lib/summernote/summernote-bs4.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/summernote_custom.js?v=1"></script>

   
	<!-- common.js (OpenWindow있음) -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js?v=1"></script> 

	<!-- data-table -->
	<!-- Required datatable js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/data-tables/jquery.dataTables.min.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/data-tables/dataTables.bootstrap4.min.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/data-tables/dataTables.responsive.min.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/data-tables/responsive.bootstrap4.min.js"></script> 
	
	<!--page script-->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap-notify/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/custom_notify.js?v=1"></script> 
  
  	
    <!-- Sweetalerts2 js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/swal.js"></script> 

  
   	<!-- chart-moris -->
	<script src="<%=request.getContextPath() %>/resources/js/morris/raphael-min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/morris/morris.min.js"></script>

	<!-- notify -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap-notify/bootstrap-notify.min.js"></script>
  
<%-- 	<!-- Summernote -->
	<script src="<%= request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- studyroom card -->
	<script src="<%=request.getContextPath()%>/resources/js/studyroom/plugin.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/studyroom/personal.custom.js"></script> --%>
	
   <!-- 메뉴유지 -->
   <%@ include file="/WEB-INF/include/js/menu_connecting_js.jsp" %>
 
	