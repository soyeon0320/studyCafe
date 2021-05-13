	/*변수 선언*/
		
	var id = document.querySelector('#memId');

	var pw1 = document.querySelector('#memPass');

	var pw2 = document.querySelector('#memPass2');

	var userName = document.querySelector('#memName');

	var date = document.querySelector('#date_timepicker_start');
	
	
//	var mm = document.querySelector('#mm');
//	var dd = document.querySelector('#dd');

	var gender = document.querySelector('input[name="memGen"]');

	var email = document.querySelector('#memEmail');

	var mobile = document.querySelector('#memTel');

	var error = document.querySelectorAll('.error_next_box');



	/*이벤트 핸들러 연결*/


	id.addEventListener("focusout", checkId);
	pw1.addEventListener("focusout", checkPw);
	pw2.addEventListener("focusout", comparePw);
	userName.addEventListener("focusout", checkName);
	date.addEventListener("focusout", checkAge);
//	mm.addEventListener("focusout", isBirthCompleted);
//	dd.addEventListener("focusout", isBirthCompleted);
	gender.addEventListener("focusout",checkGen)
	email.addEventListener("focusout", isEmailCorrect);
	mobile.addEventListener("focusout", checkPhoneNum);





	/*콜백 함수*/


	function checkId() {
	    var idPattern = /^[a-z][a-z0-9]{4,13}/;
	    var adminPattern = /admin/;
	    var data = {memId : id.value};
	    if(id.value == "") {
	        error[0].innerHTML = "필수 정보입니다.";
	        error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    } else if(!idPattern.test(id.value)) {
	        error[0].innerHTML = "영문 소문자로 시작하며 5~13자의 영문 소문자,숫자만 사용 가능합니다.";
	        error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    } else if (adminPattern.test(id.value)) {
	    	error[0].innerHTML = "admin은 관리자 전용입니다.";
	    	error[0].style.display = "block";
	        error[0].style.color = "#B40431";
	        return;
	    }else {
	    	$.ajax({
	    		url:"/scm/user/id_check"
	    		,data: data
	    		,type:'post'
	    		,success:function(result){
	    			console.log(result);
	    			if (result == "duplicated") {
	    		    	error[0].innerHTML = "중복된 아이디 입니다.";
	    		    	error[0].style.display = "block";
	    		        error[0].style.color = "#B40431";
					}else {
						error[0].style.display = "none";
	    		    	error[0].innerHTML = "정상";
	    		    	error[0].style.display = "block";
	    		        error[0].style.color = "#08A600";
					}
	    		}
	    		,error:function(error){
	    			alert('시스템 장애로 가입이 불가합니다.');
	    		}
	    	});
	    }
	}

	function checkPw() {
	    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{6,13}/;
	    if(pw1.value === "") {
	        error[1].innerHTML = "필수 정보입니다."; 
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	        return;
	    } else if(!pwPattern.test(pw1.value)) {
	        error[1].innerHTML = "6~13자 영문 대 소문자,숫자,특수문자를 사용하세요.";
	        error[1].style.display = "block";
	        error[1].style.color = "#B40431";
	        return;
	    } else {
	        error[1].innerHTML = "안전";
	        error[1].style.color = "#08A600";
	        error[1].style.display = "block";
	    }
	} 

	function comparePw() {
	    if(pw2.value === pw1.value && pw2.value != "") {
	        error[2].innerHTML = "일치"; 
	        error[2].style.display = "block";
	        error[2].style.color = "#08A600";
	    } else if(pw2.value !== pw1.value) {
	        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	        return;
	    } 

	    if(pw2.value === "") {
	        error[2].innerHTML = "필수 정보입니다.";
	        error[2].style.display = "block";
	        error[2].style.color = "#B40431";
	        return;
	    }
	}

	function checkName() {
	    var namePattern = /[a-zA-Z가-힣]/;
	    if(userName.value === "") {
	        error[3].innerHTML = "필수 정보입니다.";
	        error[3].style.display = "block";
	        error[3].style.color = "#B40431";
	        return;
	    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
	        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요.";
	        error[3].style.display = "block";
	        error[3].style.color = "#B40431";
	        return;
	    } else {
	        error[3].style.display = "none";
	    }
	}


//	function isBirthCompleted() {
//	    var yearPattern = /[0-9]{4}/;
//	    if(!yearPattern.test(yy.value)) {
//	        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
//	        error[4].style.display = "block";
//	        error[4].style.color = "#B40431";
//	    } else {
//	        isMonthSelected();
//	    }


//	    function isMonthSelected() {
//	        if(mm.value === "월") {
//	            error[4].innerHTML = "태어난 월을 선택하세요.";
//	            error[4].style.color = "#B40431";
//	        } else {
//	            isDateCompleted();
//	        }
//	    }

//	    function isDateCompleted() {
//	        if(dd.value === "") {
//	            error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
//	            error[4].style.color = "#B40431";
//	        } else {
//	            isBirthRight();
//	        }
//	    }
//	}



//	function isBirthRight() {
//	    var datePattern = /\d{1,2}/;
//	    if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
//	        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
//	        error[4].style.color = "#B40431";
//	    } else {
//	        checkAge();
//	    }
//	}

	function checkAge() {
		
		var yy = date.value.substring(0,4);
		console.log("yy : " + yy);
	    if(Number(yy) < 1920) {
	        error[4].innerHTML = "날짜를 다시 확인해주세요.";
	        error[4].style.display = "block";
	        error[4].style.color = "#B40431";
	    } else if(Number(yy) > 2020) {
	        error[4].innerHTML = "미래에서 오셨군요. ^^";
	        error[4].style.display = "block";
	        error[4].style.color = "#B40431";
	    } else if(Number(yy) > 2005) {
	        error[4].innerHTML = "만 14세 미만의 어린이는 보호자 동의가 필요합니다.";
	        error[4].style.display = "block";
	        error[4].style.color = "#B40431";
	    } else {
	        error[4].style.display = "none";
	    }
	}



	function checkPhoneNum() {
	    var isPhoneNum = /([01]{2})([01679]{1})-[0-9]{3,4}-([0-9]{4})/;
	    var data = {"memTel" : mobile.value};
	    console.log("mobile.value : " + mobile.value);
	    if(mobile.value === "") {
	        error[5].innerHTML = "필수 정보입니다.";
	        error[5].style.display = "block";
	        error[5].style.color = "#B40431";
	    } else if(!isPhoneNum.test(mobile.value)) {
	        error[5].innerHTML = "형식에 맞지 않는 번호입니다.";
	        error[5].style.display = "block";
	        error[5].style.color = "#B40431";
	    } else {
	    	$.ajax({
	    		url:"/scm/user/tel_check"
	    		,data: data
	    		,type:'post'
	    		,success:function(result){
	    			console.log(result);
	    			if (result == "duplicated") {
	    		    	error[5].innerHTML = "중복된 전화번호 입니다.";
	    		    	error[5].style.display = "block";
	    		        error[5].style.color = "#B40431";
					}else {
				        error[5].style.display = "none";
					}
	    		}
	    		,error:function(error){
	    			alert('시스템 장애로 가입이 불가합니다.');
	    		}
	    	});
	    }
	}
	
	function isEmailCorrect() {
	    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
	    var data = {memEmail : email.value};

	    if(email.value === ""){ 
	        error[6].innerHTML = "필수 정보입니다.";
	        error[6].style.display = "block";
	        error[6].style.color = "#B40431";
	    } else if(!emailPattern.test(email.value)) {
	        error[6].innerHTML = "형식에 맞게 입력해주세요.";
	        error[6].style.display = "block";
	        error[6].style.color = "#B40431";
	    } else {
	    	$.ajax({
	    		url:"/scm/user/email_check"
	    		,data: data
	    		,type:'post'
	    		,success:function(result){
	    			console.log(result);
	    			if (result == "duplicated") {
	    		    	error[6].innerHTML = "중복된 이메일 입니다.";
	    		    	error[6].style.display = "block";
	    		        error[6].style.color = "#B40431";
					}else {
				        error[6].style.display = "none";
					}
	    		}
	    		,error:function(error){
	    			alert('시스템 장애로 가입이 불가합니다.');
	    		}
	    	});
	    	
	    }

	}
	
	function checkGen() {
		if ($('#memGenF').is(':checked') == false&&$('#memGenM').is(':checked') == false) {
			alert('성별을 선택해주세요');
			return;
		}
	}