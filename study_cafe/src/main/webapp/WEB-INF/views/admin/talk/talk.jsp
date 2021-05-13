<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<section>
	<h1>알림톡</h1>
	
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
	  <img
	    src="<%=request.getContextPath()%>/resources/images/kakao_login_medium_narrow.png"
	    width="222"
	  />
	</a>
	<p id="token-result"></p>
	
	<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
	
	<hr>
	
	<input type="file" id="file" onchange="uploadImage();">
	<input type="text" id="uploadUrl" class="form-control">
	
	
	<script>
	function uploadImage(){
		
		var files = document.getElementById('file').files;
		console.log(files);
		Kakao.Link.uploadImage({
		  file: files
		}).then(function(res){
		  document.getElementById('uploadUrl').value = res.infos.original.url;
		});
	}
	
	</script>
	
	
	<script type="text/javascript">
	  function loginWithKakao() {
	    Kakao.Auth.authorize({
	    	redirectUri: 'http://localhost/scm/admin/talk/login'
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

// 		function loginWithKakao() {
// 		    Kakao.Auth.authorize({
// 		      redirectUri: 'http://localhost/scm/admin/talk/login',
// 		      prompts: 'login'
// 		    })
// 		  }
	</script>

	<script type="text/javascript">
	  function kakaoLogout() {
	    if (!Kakao.Auth.getAccessToken()) {
	      alert('Not logged in.');
	      return
	    }
	    Kakao.Auth.logout(function() {
	      alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
	    })
	  }
	</script>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a3534454a891289cd08358f9b98b5256');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>

</section>