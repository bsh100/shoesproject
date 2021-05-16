<%@page import="com.tp.shop.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    String userId = (String)session.getAttribute("userId");
	String userType = (String)session.getAttribute("userType");
    %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>mypage</title>
	<link rel="stylesheet" href="../css/mypage.css">
  </head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.addEventListener("DOMContentLoaded",function(){
	
	var xhr = new XMLHttpRequest();
	var data = JSON.stringify({
		"userId" : document.getElementById("userId").value
	});
	xhr.open("post","http://localhost:8080/user/getUserInfo",true);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.send(data);
	xhr.onload = function(){
		var x = xhr.responseText;
		var userInfo = JSON.parse(x);
		//로그인되어 있는 회원의 정보를 받아와서 회원정보input창에 넣어준다.
		document.getElementById("name").value = userInfo.name;
		document.getElementById("email").value = userInfo.email;
		document.getElementById("phone").value = userInfo.phone;
		document.getElementById("address").value = userInfo.address;
		
	}
	
	
});

function update_address(){

	var url = "updateAddress";
	var urlName = "update_Address";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url,urlName,option);

}



</script>
<style>
.a{color:black !important}
</style>
  <body>

    <jsp:include page="Header.jsp"></jsp:include>

<div class="middle">


<!-- aside 부분 시작 -->

<jsp:include page="mypageAside.jsp"></jsp:include>
<div class="a">
  <div class="b">
    MYPAGE
  </div>
  <div class="root">
    MYPAGE - 회원정보관리
  </div>
  <div class="user_info">
    <h1>회원 정보</h1>
    <div class="user_update_form">
      <form class="user_update_form" id="user_update_form" action="index.html" method="post" style="color:black">

      <label for="">아이디 : <input type="text" id="userId" name="userId" value="${userId}"></label><br>
      <label for="">이름 : <input type="text" id="name" name="name" value=""></label><br>
      <label for="">이메일 : <input type="text" id="email" name="email" value=""></label><br>
      <label for="">휴대폰 : <input type="tel" id="phone" name="phone" value=""></label>
      
      <br><br>
      <h2>등록 배송지</h2>
      <label for="">주소 : <input size="60" type="text" id="address" name="address" value="" readonly="readonly"></label>
		<!-- 로그인되어 있는 회원의 등록된 주소를 바꾸는 버튼. -->
    </form><br>
		<button onclick="update_address()">주소 변경</button>
    </div>
  </div>
</div>



</div>

  </body>
</html>
