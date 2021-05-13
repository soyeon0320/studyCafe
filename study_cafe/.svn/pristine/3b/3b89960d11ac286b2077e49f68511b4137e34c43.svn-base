<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	#chat-content {
	    background-image: url('<%=request.getContextPath()%>/resources/images/talk/talkBack2.png');
        background-size: cover;
        background-repeat : no-repeat;
        background-position: bottom;
	}

</style>

<section>
	<main class="content mt-10">
		<div class="page-content d-flex flex pl-0 pr-0">
			<div class="d-flex flex">
				<aside class="sidebar sidebar-sm" id="mail-sidebar"	style="width: 30%;">
					<div class="flex d-flex bg-white sidebar-body" id="chat-content" style="max-height: 800px;">
						<div class="d-flex flex flex-column">
							<div class="navbar bg-white">
								<h2 style="width: content-fit">알림톡발송</h2>

							</div>
							<div id="iframe" style=" width:250px; height:430px; margin-top: 120px; margin-left: 119px;">
<!-- 								<iframe width="250px"; height="430px;" src=""></iframe> -->
								<div class="mb-20">
									<h1 align="center" >SPRING STUDY</h1>
								</div>
								<div class="mb-20">
									<p align="center">
									공부하는 사람들이 먼저 찾는 공간, <br> 스프링 스터디 카페 </p>
								</div>
								<form id="registForm" action="regist">
									<div class="portlet-body no-padding">
	                             		<table class="table mb-0">
				                             <tbody>
					                             <tr>
					                                 <td><input type="text" placeholder="제목을 입력해주세요." id="notitalkTitle" name="notitalkTitle" class="form-control form-control-sm"></td>
					                             </tr>
				                             </tbody>
			                         	</table>
			                         </div>
						            <div class="pt-1 ml-2 mr-2">
										<textarea class="form-control " rows="10" cols="5" id="notitalkContent" name="notitalkContent" style="margin-top: 0px; margin-bottom: 0px; height: 130px;" placeholder="내용을 입력해주세요."></textarea>
									</div>
									<div class="float-right mt-3" style="margin-bottom: auto;">
										<a class="btn btn-info" href="javascript:regist();" style="margin-left: 5px;"><i class="icon-email2"></i> 전송</a>
									</div>
								</form>
								
							</div>
						</div>
					</div>
				</aside>
				<!--inobx sidebar-->
				<div class="flex d-flex bg-white b-l sidebar-body" id="chat-content" >
					<div class="d-flex flex flex-column" style="height: auto;">
						
						<div class="portlet-body"  id="detailDiv" style="">
							<div class="flex-column d-flex bg-white" style="height: auto;">
						<div class="navbar">
							<h2>보낸알림톡목록</h2>
						</div>
						<div class="slimScrollDiv b-t"
							style="position: relative; overflow: scroll; width: auto; height: auto; max-height: 750px; ">
							<div class="flex slim-scroll"
								style="overflow: hidden; width: auto; height: 100%;">
								<div class="slimScrollDiv">
									
									<div class="pb-30">
										<table class="table table-hover table-mails mb-0">
											<thead>
												<tr align="center">
													<th>번호</th>
													<th>제목</th>
													<th width="50%">내용</th>
													<th>발송날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${notitalkList}" var="notitalk">
													<tr style="cursor: pointer;" align="center">
														<td>${notitalk.notitalkNo}</td>
														<td>${notitalk.notitalkTitle}</td>
														<td align="left">${notitalk.notitalkContent}</td>
														<td><fmt:formatDate value="${notitalk.notitalkRegDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="container clearfix" style="width: fit-content;">
<!-- 									<ul class="pagination pagination-circle pagination-3d pagination-light"> -->
<%-- 										<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" /> --%>
<!-- 									</ul>   -->
								</div>
							</div>
						</div>
					</div>
						
						
						</div>
					</div>

				</div>
				<!--chat content-->
			</div>
		</div>
	</main>

</section>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	
	var formData = "";
	var talk = "";
	
	function regist(){
		var no = 0;
		
		var notitalkTitle = $('#notitalkTitle').val();
		var notitalkContent = $('#notitalkContent').val();
		
		formData = $("#registForm").serialize();
		console.log(formData);
		
		$.ajax({
			url:"<c:url value='/admin/talk/regist' />",
			data:{notitalkTitle : notitalkTitle,
				notitalkContent:notitalkContent},
			type:"post",
			success:function(data){
				//location.reload();
				console.log(data.notitalk);
				
				talk = data.notitalk;
				//sendTo();
				getFriends();
			},
			error:function(xhr){
				console.log("실패 : "+xhr);
				//console.log('data : ' + data);
				
			}
		});
		
		
	}
	
	

	// 나에게 보내기
  function sendTo() {
    Kakao.Auth.login({
      scope: 'PROFILE,TALK_MESSAGE',
      success: function() {
        Kakao.API.request({
          url: '/v2/api/talk/memo/default/send',
          data: {
	       	  template_object: {
	                 object_type: 'feed',
	                 content: {
	                   title: talk.notitalkTitle ,
	                   description: 'http://${serverIp}<%=request.getContextPath()%>/admin/talk/msg?no='+talk.notitalkNo,
	                   image_url:
	                   	'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
	                   link: {
	                       mobile_web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
	                       web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
	                     },
	                 },
	                 buttons: [
	                   {
	                     title: '자세히 보기',
	                     link: {
	                       mobile_web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
	                       web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
	                     },
	                   },
	                 ],
	               },
          },
          success: function (res) {
	          alert('메시지 전송이 완료되었습니다. \n' + JSON.stringify(res));
	          location.reload();
	        },
	        fail: function (err) {
	          alert('메시지 전송에 실패했습니다. \n' + JSON.stringify(err))
	        },
        })
      },
      fail: function(err) {
        alert('failed to login: ' + JSON.stringify(err))
      },
    })
  }
  
	
  function sendMessage(id) {
	    if (confirm('메시지를 전송하겠습니까?')) {
	      Kakao.API.request({
	        url: '/v1/api/talk/friends/message/default/send',
	        data: {
	        	receiver_uuids: [id],
		       	  template_object: {
		                 object_type: 'feed',
		                 content: {
		                   title: talk.notitalkTitle ,
		                   description: 'http://${serverIp}<%=request.getContextPath()%>/admin/talk/msg?no='+talk.notitalkNo,
		                   image_url:
		                   	'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
		                   link: {
		                       mobile_web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
		                       web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
		                     },
		                 },
		                 buttons: [
		                   {
		                     title: '자세히 보기',
		                     link: {
		                       mobile_web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
		                       web_url: 'http://${serverIp}/admin/talk/msg?no='+talk.notitalkNo,
		                     },
		                   },
		                 ],
		               },
	          },
	        success: function (res) {
	          //alert('메시지 전송이 완료되었습니다. \n' + JSON.stringify(res))
	          
	        },
	        fail: function (err) {
	          //alert('메시지 전송에 실패했습니다. \n' + JSON.stringify(err))
	        },
	      })
	    }
	  }
  
	  function getFriends() {
		  
	    Kakao.Auth.login({
	      scope: 'friends,talk_message',
	      success: function (res) {
	        Kakao.API.request({
	          url: '/v1/api/talk/friends',
	          success: function (res) {
	            if (res.elements.length > 0) {
	              var id = [];
	              for (let i = 0, item; (item = res.elements[i]); i++) {
		              sendMessage(item.uuid);
// 						id[i] = '"' + item.uuid + '"';
	              }
	              //sendMessage(id);
	              location.reload();
	              
	            } else {
	              document.getElementById('friend-list').innerHTML =
	                '앱에 연결된 친구가 없습니다. 앱에 연결된 친구만 조회할 수 있습니다.'
	            }
	          },
	          fail: function (err) {
	            document.getElementById('friend-list').innerHTML = JSON.stringify(err)
	          },
	        })
	      },
	    })
	  }
	  
</script>


