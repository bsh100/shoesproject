<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#signup{
	width:940px;
	margin:auto;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	function sendIt() {
		console.dir(document.getElementById("signupForm"));
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

		var values = document.getElementById("signupForm");
		var name = values[0].value;
		var userId = values[1].value;
		var password = values[3].value;
		var passwordCk = values[4].value;
		var phone = values[5].value;
		var email1 = values[6].value;
		var email2 = values[7].value;
		
		var address1 = values[8].value;// 우편번호
		var address2 = values[10].value;// 도로명주소
		var address3 = values[11].value;// 지번주소
		var address4 = values[12].value;// 상세주소
		var address5 = values[13].value;// 참고항목

		//아이디 입력여부 검사
		if (userId == "") {
			alert("아이디를 입력하지 않았습니다.");
			values[1].focus();
			return false;
		}

		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		for (var i = 0; i < userId.length; i++) {
			ch = userId.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
					&& !(ch >= 'A' && ch <= 'Z')) {
				alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.");
				values[1].focus();
				values[1].select();
				return false;
			}
		}
		//아이디에 공백 사용하지 않기
		if (userId.indexOf(" ") >= 0) {
			alert("아이디에 공백을 사용할 수 없습니다.")
			values[1].focus();
			values[1].select()
			return false;
		}
		//아이디 길이 체크 (4~12자)
		if (userId.length<4 || userId.length>12) {
			alert("아이디를 4~12자까지 입력해주세요.")
			values[1].focus();
			values[1].select();
			return false;
		}

		//비밀번호 입력여부 체크
		if (password == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			values[3].focus();
			return false;
		}
		if (password == userId) {
			alert("아이디와 비밀번호가 같습니다.")
			values[3].focus();
			return false;
		}
		//비밀번호 길이 체크(6~12자 까지 허용)
		if (password.length<6 || password.length>12) {
			alert("비밀번호를 6~12자까지 입력해주세요.")
			values[3].focus();
			values[3].select();
			return false;
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (password != passwordCk) {
			alert("비밀번호가 일치하지 않습니다")
			values[3].value = ""
			values[3].focus();
			return false;
		}

		if (email1 == "") {
			alert("이메일을 입력하지 않았습니다.")
			values[6].focus();
			return false;
		}
		if (regex.test(email1 + "@" + email2) === false) {
			alert("잘못된 이메일 형식입니다.");
			values[6].value = ""
			values[6].focus();
			return false;
		}

		for (var i = 0; i < email1.length; i++) {
			chm = email1.charAt(i)
			if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')
					&& !(chm >= 'A' && chm <= 'Z')) {
				alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
				values[6].focus();
				values[6].select();
				return false;
			}
		}

		if (name == "") {
			alert("이름을 입력하지 않았습니다.")
			values[0].focus();
			return false;
		}

		if (name.length < 2) {
			alert("이름을 2자 이상 입력해주십시오.")
			values[0].focus();
			return false;
		}

		
		// ajax start
		
		var data = JSON.stringify({
				"name" : name,
				"userId" : userId,
				"password" : password,
				"phone" : phone,
				"email" : email1+"@"+email2,
				"address" : address1+" "+address3+" "+address4+address5
			});
			console.dir(data);
			var xhr = new XMLHttpRequest();
			xhr.open("post", "http://localhost:8090/signup", true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(data);
			xhr.onload = function() {
				alert("회원가입에 성공하셨습니다.");
				location.href="index.jsp";
			}
		
		
		return false;

	}
	
	function duplicateCheck(){
		
		var checkId = document.getElementById("signupForm")[1].value;
		console.dir(checkId);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "http://localhost:8090/signup/duplicateCheck?checkId="+checkId, true);
		xhr.send();
		xhr.onload = function() {
			//아이디 중복체크에 대한 메세지
			var duplckmsg = xhr.responseText;
			alert(duplckmsg);
			if(duplckmsg == "이미 존재하는 아이디입니다."){
				document.getElementById("submit").disabled = true;
			}else if(duplckmsg == "사용 가능한 아이디입니다."){
				document.getElementById("submit").disabled = false;
			}
		}
		
		
	}
	
	window.addEventListener("DOMContentLoaded",function(){
		
		document.getElementById("submit").disabled = true;
		
		
	});
	
</script>
<body>
<jsp:include page="Header.jsp"></jsp:include>



<div id="signup">
	<form id="signupForm" method="post" onsubmit="return sendIt();">
		<table width="940" style="padding: 5px 0 5px 0;">
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId">
					<button onclick="duplicateCheck()" type="button">중복 검사</button></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"> 영문/숫자포함 6자
					이상</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="password_ck"></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" name="phone"> '-'를 제외한 번호를
					입력하세요. ex)01012345678</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="email1" size="10">
					@ <input type="text" id="email" name="email2" size="10"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="address1" type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br> <input name="address2" type="text"
					id="sample4_roadAddress" placeholder="도로명주소"> <input name="address3" 
					type="text" id="sample4_jibunAddress" placeholder="지번주소"> <span
					id="guide" style="color: #999; display: none"></span> <input name="address4" 
					type="text" id="sample4_detailAddress" placeholder="상세주소"> 
					<input name="address5" type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입" id="submit"> <input type="reset" value="다시 입력"></td>
			</tr>
		</table>
	</form>
	
	<a href="index.jsp">메인으로 </a>
</div>
	
</body>
</html>