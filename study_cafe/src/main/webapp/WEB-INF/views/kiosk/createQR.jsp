<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	
	<p>test</p>
	<div id="test"></div>
	<hr>






</div>

<script>
	jQuery('#test').qrcode({
		text:"좌석/25" /* 이용타입/예약번호 -> 이용타입으로 이용중인 회원정보를 가져온다. */
			
	});	
// 	jQuery('#qrcodeCanvas').qrcode({
// 		text	: "http://jetienne.com"
// 	});	
</script>
