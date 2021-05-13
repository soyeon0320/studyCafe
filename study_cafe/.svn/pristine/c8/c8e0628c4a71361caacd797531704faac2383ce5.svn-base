<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<style>
li {
	padding-right: 5px;

}
</style>
<section>
<main class="content">
	<div class="page-content pl-0 pr-0" style="max-height: 750px;">
	    <div class="d-flex">
	         <aside class="sidebar sidebar-sm" id="mail-sidebar" style="max-height: 750px; width: 25%;">
	        <div class="flex-column d-flex bg-white">
	            <div class="b-b navbar">
	                <form>     
	                    <input class="form-control d-inline border0 shadow0" type="text" name="keyword" placeholder="가맹점명을 입력하세요." >
	                    <button class="no-padding bg-trans border0 text-muted" type="button" onclick="getAddr();"><i class="fa fa-search"></i></button>
					</form>
	            </div>
					<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
						<div class="flex slim-scroll" style="overflow: scroll; width: auto; height: 100%;">
							<table class="table table-hover">
								<thead>
								<tr class="table-active">
									<th><input type="checkbox" name="check_mail_all" id="check_mail_all" onclick="all_check(this);"></th>
									<th>매장명</th>
									<th></th>
								</tr>
								</thead>
								<tbody id="addrList">
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
	</aside><!--inobx sidebar-->

	
	<div class=" bg-white b-l sidebar-body" id="chat-content" style="width: 100%;">
		<div class="p-4">
			<h3>안내사항 메일 발송</h3>
			<form id="sendForm" name="sendForm" action="sendMail"
				method="post">
				<div class="portlet-body no-padding">
					<table class="table mb-0">
						<tbody>
							<tr>
								<th width="10%">보내는 사람</th>
								<td width="50%"><input type="text"
									class="form-control form-control-sm"
									value="관리자(${loginAdmin.adminEmail})" readonly="readonly">
									<input type="hidden" id="adminId" name="adminId"
									value="${loginAdmin.adminId}"> <input type="hidden"
									id="adminEmail" name="adminEmail"
									value="${loginAdmin.adminEmail}"></td>
							</tr>
							<tr>
								<th scope="row">받는사람</th>
								<td>
									<div id="reciver">
										<ul class="nav" id="reciverList">
											<!-- 			                                 		<li><div><span>대흥동지점 : </span><span>dmswl4388@naver.com </span><i class="icon-line2-close" onclick="remove_mail(this);"></i></div></li> -->
										</ul>
									</div>

								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td><input type="text" placeholder="제목을 입력해주세요."
									id="mailTitle" name="mailTitle"
									class="form-control form-control-sm"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="pt-1 b-t">
					<textarea class="form-control summernote-init" rows="30"
						cols="5" id="content" name="mailContent"
						style="margin-top: 0px; margin-bottom: 0px; height: 160px;"></textarea>
				</div>
				<div class="py-3 b-b">
					<div class=" text-right">
						<button type="button"
							class="btn btn-gradient-primary btn-icon btn-icon-right"
							onclick="send_go();">
							<i class="fa fa-arrow-right"></i>보내기
						</button>
					</div>
				</div>
			</form>
		</div>
			</div>
	</div><!--chat content-->
</div>
</div>
</main>


<script type="text/javascript">
	function send_go() {
		var form = $("#sendForm");
		if (!$("#adminEmail").val()) {
			alert("로그인이 필요합니다.");
			return;
		}
		if (!$("#reciverList").children().html()) {
			alert("메일 주소 선택은 필수값입니다.");
			return;
		}
		if (!$("#mailTitle").val()) {
			alert("제목입력은 필수입니다.");
			return;
		}
		if (!$("#content").val()) {
			alert("내용 입력은 필수입니다.");
			return;
		}

		form.submit();
	}

	function getAddr() {
		var data = {
			"keyword" : $("input[name='keyword']").val()
		}

		$.ajax({
			url : "search",
			method : "post",
			data : data,
			dataType : "json",
			success : function(data) {
				setAddrList(data);
			},
			error : function(xhr) {
				console.log("xhr : " + xhr);
			}
		});
	}

	function setAddrList(data) {
		var res = "";
		for (var i = 0; i < data.result.length; i++) {
			var addr = data.result[i];
			var chk = "checked";

			res += "<tr>"
					+ "<td><input type='checkbox' id='check_mail' name='check_mail' onclick='add_mail(this);'></td>"
					+ "<td>"
					+ addr.storeName
					+ "<input type='hidden' name='storeName' value='"+addr.storeName+"'></td>"
					+ "<td><input type='hidden' name='ownerEmail' value='"+addr.ownerEmail+"'><input type='hidden' name='ownerId' value='"+addr.ownerId+"'></td>"
					+ "</tr>"
		}

		if (res == "") {
			res = "<tr><td colspan='3' align='center'>---가맹점 검색을 해주세요.---</td></tr>"
		}
		$("#addrList").html(res);
	}

	function all_check(obj) {
		// 		if ($("#check_mail_all").is(":checked")) {
		// 			$("input[name='check_mail']").prop("checked",true);
		// 		}else {
		// 			$("input[name='check_mail']").prop("checked",false);
		// 		}

		var flag = $(obj).prop("checked");
		if (flag) {
			var addList = $("input[name='check_mail']").prop("checked", true);

			for (var i = 0; i < addList.length; i++) {
				var addr = addList.eq(i);
				var owner_email = addr.closest("tr").find(
						"input[name='ownerEmail']").val();
				if (!find_addr("reciverList", owner_email)) {
					add_mail(addr);
				}
			}
		} else {
			var distractList = $("input[name='check_mail']").prop("checked",
					false);
			for (var i = 0; i < distractList.length; i++) {
				var addr = distractList.eq(i);
				var owner_email = addr.closest("tr").find(
						"input[name='ownerEmail']").val();
				if (find_addr("reciverList", owner_email)) {
					add_mail(addr);
				}
			}
		}

		//////////////////////////////////////////////////////////////////////////////
	}

	/*  전체선택 풀면 다 풀리게
	window.onload=function(){
	    // 전체선택 클릭시
		   $("#check_mail_all").click(function() {
		      if ($(this).prop("checked")) {
		         $(":checkbox").not(":checked").each(function() {
		            $(this).prop("checked", true);
		         }); 
		      } else {
		         $(":checkbox[name=check_mail]").prop("checked",false);
		      }
		   });
		   var arrChecked = $(":checkbox[name=check_mail]").length;
		   //console.log(arrChecked);
		   $(":checkbox[name=check_mail]").click(function() {
		      //console.log($(this).prop("checked"));
		      if($(this).prop("checked")){
		         //체크박스 모두 선택됐을때 전체선택 체크 
		         var num = 0;
		         $(":checkbox[name=check_mail]").not(":checked").each(function() {
		            num++;
		         }); 
		         if (num == 0) {
		            $("#check_mail_all").prop("checked",true);
		         }
		      } else {
		         $("#check_mail_all").prop("checked",false);
		      }
		   });
	}
	 */

	function add_mail(obj) {
		var owner_email = $(obj).closest("tr").find("input[name=ownerEmail]")
				.val();
		var owner_id = $(obj).closest("tr").find("input[name=ownerId]").val();
		var store_name = $(obj).closest("tr").find("input[name=storeName]")
				.val();

		if ($(obj).prop("checked")) {
			$("#reciverList")
					.append(
							"<li><div><span>"
									+ store_name
									+ " : </span><span>"
									+ owner_email
									+ "</span><input type='hidden' name='ownerEmail' value="+owner_email+"><input type='hidden' name='ownerId' value="+owner_id+"><i class='icon-line2-close' onclick='remove_mail(this);'></i></div></li>")
		} else {
			$("input[name=ownerEmail][value='" + owner_email + "']").closest(
					"li").remove();
		}

	}

	function find_addr(target_id, owner_email) {
		if ($("#" + target_id).find(
				"input[name=ownerEmail][value='" + owner_email + "']").length) {
			return true;
		}
		return false;
	}

	function remove_mail(obj) {
		$(obj).closest("li").remove();
	}
</script>
	
	
		
		
</section>