<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style type="text/css">

.result1{
width:1400px;
height:600px;
display:flex;
justify-content:center;
align-items:center;
flex-direction:column;
}
</style>
<script type="text/javascript">
function checkPW(){
	
	var xhr = new XMLHttpRequest();
	var data = {
			"userId" : document.getElementById("userId").value,
			"password" : document.getElementById("oldPassword").value
	}
	xhr.open("post","http://localhost:8090/mypage/checkPassword",true);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.send(JSON.stringify(data));
	xhr.onload = function(){
		var msg = xhr.responseText;
	
		if(msg == 1){// 비밀번호 일치되었을 때 컨트롤러는 1을 반환 그렇지 않을 경우 0을 반환
			alert("비밀번호가 확인되었습니다.");
			document.getElementById("newPW").children[1].type = "password";
			document.getElementById("newPW").children[2].type = "password";
			document.getElementById("newPW").children[3].type = "submit";
			
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
		
	}
	
}

</script>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="result1">
	<form action="" onsubmit="return false;">
		<input type="hidden" value="${userId}" id="userId">
		현재 비밀번호 : <input type="password" class="form-control" id="oldPassword" name="password"> <button class="btn btn-dark" onclick="checkPW()">비밀번호 확인</button>
		</form>
		<br>
		<form id="newPW" action="http://localhost:8090/mypage/changePW" method="POST">
		<input type="hidden" value="${userId}" name="userId" id="userId2">
		<input type="hidden" class="form-control" name="password" id="password" placeholder="새 비밀번호">
		<input type="hidden" class="form-control" name="passwordCheck" id="passwordCheck" placeholder="비밀번호 확인">
		<input class="btn btn-dark" type="hidden" value="변경">
	</form>
</div>
<script>
window.addEventListener("DOMContentLoaded",function(){
	
	var userId = document.getElementById("userId2").value;
	console.dir(userId);
document.getElementById("newPW").onsubmit = function(){
	var password = document.getElementById("password").value;
	var passwordCheck = document.getElementById("passwordCheck").value;
	//비밀번호 입력여부 체크
	if (password == "") {
		alert("비밀번호를 입력하지 않았습니다.")
		document.getElementById("password").focus();
		return false;
	}
	if (password == userId) {
		alert("아이디와 비밀번호가 같습니다.")
		document.getElementById("password").focus();
		return false;
	}
	//비밀번호 길이 체크(6~12자 까지 허용)
	if (password.length<6 || password.length>12) {
		alert("비밀번호를 6~12자까지 입력해주세요.")
		document.getElementById("password").focus();
		document.getElementById("password").select();
		return false;
	}
	//비밀번호와 비밀번호 확인 일치여부 체크
	if (password != passwordCheck) {
		alert("비밀번호가 일치하지 않습니다")
		document.getElementById("password").value = ""
		document.getElementById("password").focus();
		return false;
	}
}
});
</script>
</body>
</html>