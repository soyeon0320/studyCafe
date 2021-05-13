<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<h2>QR 코드 테스트</h2>
	
	<div>
		<input id="content" type="text" name="content"/>
		<input type="button" id="execute" value="QR코드 생성"/>
		<img id="img"  style="display: none;" onload="this.style.display = 'block'"/>
	</div>
	
	<script>
	window.onload=function(){
		
		$('#execute').click(function(){
			alert('s');
		
			url="<%=request.getContextPath()%>/orderProduct/qr";
			
			var content = $("#content").val();
			$("#img").attr("src", url + "?content="+content);
		});

	}	
	</script>
	
</section>