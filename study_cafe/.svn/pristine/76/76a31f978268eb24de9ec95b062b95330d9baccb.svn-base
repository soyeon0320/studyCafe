<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="KR">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SpringStudy</title>    
        <!-- Bootstrap-->
        <link href="<%=request.getContextPath()%>/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!--Common Plugins CSS -->
        <link href="<%=request.getContextPath()%>/resources/css/plugins/plugins.css" rel="stylesheet">
        <!--fonts-->
        <link href="<%=request.getContextPath()%>/resources/lib/line-icons/line-icons.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
    
    	<link href="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/sweet-alert-custom.css" rel="stylesheet">
    
    </head>
    <body class='bg-dark'>

        <div class="page-wrapper" id="page-wrapper">

            <main class="content">

                <div class="container-fluid flex d-flex">
                    <div class='row d-flex flex align-items-center'>
                        <div class='col-6  full-height d-flex flex h-lg-down bg-pattern bg-fHeight' style='background-image: url(<%=request.getContextPath()%>/resources/images/scm.PNG)'>

                        </div>
                        <div class='col-lg-3 col-md-4 col-sm-6 ml-auto mr-auto d-flex flex align-items-center full-height pt-20 pb-20 align-items-center'>
                            <div class="w100 d-block">
                                 <span class="avatar avatar100 ml-auto mr-auto text-white bg-primary rounded-circle">  
                                     <i class="icon-Key-2"></i></span>
                                <div class="title-sep text-center sep-dark mt-20 mb-30">
                                    <span class='font600 fs16'>비밀번호 확인</span>
                                	<input type="hidden" id="memId" value="${loginUser.memId}" style="color: inherit;">
                                  <input type="hidden" id="memName" value="${loginUser.memName}">
                                </div>
                                    <form role="form">
                                       <div class="input-icon-group input-icon-lg input-icon-dark">
                                            <div class='input-icon-append'>
                                                <i class="icon-Key-2"></i>
                                                <input id="memPass" placeholder="비밀번호를 입력하세요." type="password" class="form-control form-control-light" name="memPass">
                                           		<span class="error_next_box"></span>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-gradient-danger btn-lg d-flex ml-auto mr-auto btn-icon" onclick="myPassCheck();">
                                            <i class="icon-Key-2"></i>
                                            	비밀번호 확인</button>
                                        <div class="pt-20 fs12 text-muted text-center">
                                           	사용자의 비밀번호를 다시 한번 입력해주세요.
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div><!-- main end-->

            </main><!-- page content end-->
        </div><!-- app's main wrapper end -->
        <!-- Common plugins -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/plugins/plugins.js"></script> 
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/appUi-custom.js"></script> 
    	
    	<!-- Sweetalerts2 js -->
	    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/sweet-alerts2/sweetalert2.min.js"></script> 
	    <script src="<%=request.getContextPath() %>/resources/js/plugins-custom/sweetalert2-custom.js"></script>
    	
    	<script>
    		var pw1 = document.querySelector('#memPass');
    		var memId = document.querySelector('#memId');
    		
    		function myPassCheck(){
    			
    			var data = {memPass : pw1.value,
    						memId : memId.value		
    						};
    			$.ajax({
    	    		url:"/scm/user/check_pw"
    	    		,data: data
    	    		,type:'post'
    	    		,success:function(result){
    	    			console.log(result);
    	    			if (result == "duplicated") {
    	    				swal({
    	    			        title: '비밀번호가 확인되었습니다.',
    	    			        type: 'success',
    	    			        showCancelButton: true,
    	    			        confirmButtonText: '확인',
    	    			        cancelButtonText: '닫기',
    	    			        confirmButtonClass: 'btn btn-success mt-2',
    	    			        cancelButtonClass: 'btn btn-danger ml-2 mt-2',
    	    			        buttonsStyling: false
    	    			    }).then(function () {
    	    			    	location.href='<c:url value='/myPage/myInfoPass'/>';
    	    			    }, function (dismiss) {
    	    			        if (dismiss === 'cancel') {
    	    						location.reload();
    	    			        }
    	    			    });
    					}else {
    						swal({
    	    			        title: '비밀번호 불일치',
    	    			        text: '비밀번호를 다시 확인해주세요.',
    	    			        type: 'warning',
    	    			        showCancelButton: true,
    	    			        confirmButtonText: '확인',
    	    			        cancelButtonText: '닫기',
    	    			        confirmButtonClass: 'btn btn-success mt-2',
    	    			        cancelButtonClass: 'btn btn-danger ml-2 mt-2',
    	    			        buttonsStyling: false
    	    			    }).then(function () {
    	    			    	
    	    			    }, function (dismiss) {
    	    			        if (dismiss === 'cancel') {
    	    						location.reload();
    	    			        }
    	    			    });
    	    		       
    					}
    	    		}
    	    		,error:function(error){
    	    			alert('시스템 장애로 가입이 불가합니다.');
    	    		}
    	    	});
    		}
    	</script>
    </body>
</html>