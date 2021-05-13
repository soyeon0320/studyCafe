/**
 * 정규식, 데이터 일치 여부, 입력 데이터 존재 여부 등
 */
var error = document.querySelectorAll('.error_next_box');

var businessNumber = document.querySelector("#businessNumber");
businessNumber.addEventListener("focusout", checkBusinessNumber);
function checkBusinessNumber() {
	var businessNumberPattern = /(\d{3})[-](\d{2})[-](\d{5})/;
	if(businessNumber.value === "") {
        error[1].innerHTML = "사업자 번호를 입력해주세요."; 
        error[1].style.display = "block";
        error[1].style.color = "#B40431";
        return;
    } else if(!businessNumberPattern.test(businessNumber.value)) {
        error[1].innerHTML = "숫자 3자리-숫자 2자리-숫자 5자리로 입력해주세요. ";
        error[1].style.display = "block";
        error[1].style.color = "#B40431";
        return;
    } else {
        error[1].innerHTML = "사용 가능한 사업자 번호 입니다.";
        error[1].style.color = "#08A600";
        error[1].style.display = "block";
    }
}

var ownerName = document.querySelector("#ownerName");
ownerName.addEventListener("focusout", checkOwnerName);
function checkOwnerName() {
    if(ownerName.value === "") {
        error[2].innerHTML = "가맹점주명을 입력해주세요.";
        error[2].style.display = "block";
        error[2].style.color = "#B40431";
        return;
    } else {
        error[2].style.display = "none";
    }
}

var ownerId = document.querySelector("#ownerId");
ownerId.addEventListener("focusout", checkOwnerId);
function checkOwnerId() {
	var idPattern = /^[a-z]+[a-z0-9]{4,13}$/g;
    var adminPattern = /admin/;
    var data = {ownerId : ownerId.value};
    if(ownerId.value === "") {
    	error[3].innerHTML = "아이디를 입력해주세요.";
        error[3].style.display = "block";
        error[3].style.color = "#B40431";
        return;
    }else if(!idPattern.test(ownerId.value)) {
        error[3].innerHTML = "영문 소문자로 시작하며 5~14자의 영문 소문자,숫자만 사용 가능합니다.";
        error[3].style.display = "block";
        error[3].style.color = "#B40431";
        return;
    } else if (adminPattern.test(ownerId)) {
    	error[3].innerHTML = "아이디는 admin을 포함 할 수 없습니다.";
    	error[3].style.display = "block";
        error[3].style.color = "#B40431";
        return;
    }else {
    	$.ajax({
    		url:"/scm/store/idCheck",
    		type:"post",
    		data:data,
    		success:function(result) {
    			if (result == "notDuplicated") {
    		    	error[3].innerHTML = "사용 가능한 아이디 입니다.";
    		    	error[3].style.display = "block";
    		        error[3].style.color = "#08A600";
				}else if(result == "duplicated") {
    		    	error[3].innerHTML = "사용 불가능한 아이디 입니다.";
    		    	error[3].style.display = "block";
    		        error[3].style.color = "#B40431";
				}
    		}
    	})
    }
}

var ownerPass1 = document.querySelector("#ownerPass1");
ownerPass1.addEventListener("focusout", checkOwnerPass);
function checkOwnerPass() {
	var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{6,13}/;
    if(ownerPass1.value === "") {
        error[4].innerHTML = "비밀번호를 입력해주세요."; 
        error[4].style.display = "block";
        error[4].style.color = "#B40431";
        return;
    } else if(!pwPattern.test(ownerPass1.value)) {
        error[4].innerHTML = "6~13자 영문 대 소문자,숫자,특수문자를 사용하세요.";
        error[4].style.display = "block";
        error[4].style.color = "#B40431";
        return;
    } else {
        error[4].innerHTML = "사용 가능한 비밀번호 입니다.";
        error[4].style.color = "#08A600";
        error[4].style.display = "block";
    }
}

var ownerPass2 = document.querySelector("#ownerPass2");
ownerPass2.addEventListener("focusout", checkCompareOwnerPass);
function checkCompareOwnerPass() {
	if(ownerPass2.value === "") {
        error[5].innerHTML = "비밀번호 확인을 입력해주세요.";
        error[5].style.display = "block";
        error[5].style.color = "#B40431";
        return;
    }
	if(ownerPass2.value === ownerPass1.value && ownerPass2.value != "") {
        error[5].innerHTML = "비밀번호가 일치합니다."; 
        error[5].style.display = "block";
        error[5].style.color = "#08A600";
    } else if(ownerPass2.value !== ownerPass1.value) {
        error[5].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[5].style.display = "block";
        error[5].style.color = "#B40431";
        return;
    } 
}

var ownerTel = document.querySelector("#ownerTel");
ownerTel.addEventListener("focusout", checkOwnerTel);
function checkOwnerTel() {
	var isPhoneNum = /([01]{2})([01679]{1})-[0-9]{3,4}-([0-9]{4})/;
	var data = {ownerTel : ownerTel.value }
	if(ownerTel.value === "") {
		error[6].innerHTML = "연락처를 입력해주세요.";
        error[6].style.display = "block";
        error[6].style.color = "#B40431";
	}else if(!isPhoneNum.test(ownerTel.value)) {
		error[6].innerHTML = "형식에 맞지 않습니다.";
        error[6].style.display = "block";
        error[6].style.color = "#B40431";
	}else {
		$.ajax({
			url:"/scm/store/telCheck",
    		type:"post",
    		data:data,
    		success:function(result) {
    			if (result == "notDuplicated") {
    				error[6].innerHTML = "사용 가능한 연락처 입니다.";
			        error[6].style.color = "#08A600";
			        error[6].style.display = "block";
				}else if(result == "duplicated"){
    		    	error[6].innerHTML = "사용 불가능한 연락처 입니다.";
    		    	error[6].style.display = "block";
    		        error[6].style.color = "#B40431";
				}
    		}
		})
	}
}

var ownerEmail = document.querySelector("#ownerEmail");
ownerEmail.addEventListener("focusout", checkOwnerEmail);
function checkOwnerEmail() {
	var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
	var data = {ownerEmail : ownerEmail.value}
	if(ownerEmail.value === "") {
        error[7].innerHTML = "이메일을 입력해주세요.";
        error[7].style.display = "block";
        error[7].style.color = "#B40431";
        return;
    }else if(!emailPattern.test(ownerEmail.value)) {
        error[7].innerHTML = "형식에 맞지 않습니다.";
        error[7].style.display = "block";
        error[7].style.color = "#B40431";
    } else {
    	$.ajax({
			url:"/scm/store/emailCheck",
    		type:"post",
    		data:data,
    		success:function(result) {
    			if (result == "notDuplicated") {
    				error[7].innerHTML = "사용 가능한 이메일 입니다.";
			        error[7].style.color = "#08A600";
			        error[7].style.display = "block";
				}else if(result == "duplicated"){
    		    	error[7].innerHTML = "사용 불가능한 이메일 입니다.";
    		    	error[7].style.display = "block";
    		        error[7].style.color = "#B40431";
				}
    		}
		})
    }
}
