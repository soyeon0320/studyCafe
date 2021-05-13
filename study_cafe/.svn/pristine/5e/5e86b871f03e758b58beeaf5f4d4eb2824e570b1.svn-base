<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<h1>비밀번호 변경</h1>
	
	<form action="<%=request.getContextPath()%>/store/changePass" name="passChangeFm" method="post">
		<input type="hidden" id="ownerId" name="ownerId" value="${loginOwner.ownerId}"/>
		변경할 비밀번호 <input type="password" id="ownerPass1" name="tempOwnerPass" class="form-control col-md-4"/>
		변경할 비밀번호 확인 <input type="password" id="ownerPass2" name="ownerPass" class="form-control col-md-4"/>
		<br/>
		<div id="passCheckView"></div>
		
		<input type="submit" id="changePassBt" value="비밀번호 변경" disabled="disabled" class="btn btn-primary"/>&emsp;
		<input type="button" value="닫기" onclick="javascript:window.close()" class="btn btn-secondary"/>
	</form>
	
	<script>
		window.onload = function() {
			$("#ownerPass1").keyup(function() {
				$("#passCheckView").html("");
			});
			
			$("#ownerPass2").keyup(function() {
				var ownerPass1 = $("#ownerPass1").val();
				var ownerPass2 = $("#ownerPass2").val();
				
				if(ownerPass1 != ownerPass2) {
					$("#passCheckView").html("<div class='alert alert-danger'>비밀번호가 일치하지 않습니다.</div>");
					$("input[type='submit']").show();
					$("#changePassBt").attr("disabled", "disabled");
				}else {
					$("#passCheckView").html("<div class='alert alert-success'>비밀번호가 일치합니다.</div>");
					$("#changePassBt").removeAttr("disabled");
				}
			});
		};
	</script>
	
</section>			