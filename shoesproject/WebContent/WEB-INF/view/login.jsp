<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>로그인 폼</title>
    <style media="screen">

    @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

       html {
          height: 100%;
       }

       body {
           width:100%;
           height:100%;
           margin: 0;
            padding-top: 80px;
            padding-bottom: 40px;
            font-family: "Nanum Gothic", arial, helvetica, sans-serif;
            background-repeat: no-repeat;
            background:linear-gradient(to bottom right, lightgray, gray);
       }

        .card {
            margin: 0 auto; /* Added */
            float: none; /* Added */
            margin-bottom: 10px; /* Added */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
       }

       .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
                box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
            
       }
      </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

   <div class="card align-middle" style="width:20rem; border-radius:20px;">
      <div class="card-title" style="margin-top:30px;">
         <h2 class="card-title text-center" style="color:#113366;">Login</h2>
      </div>
      <div class="card-body">
      <form class="form-signin" id="login" method="POST" onSubmit="logincall();return false">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">Your ID</label>

        <input type="text" id="uid" class="form-control" placeholder="Your ID" required autofocus>
          <span id="error_id" style="color:red;"></span><br>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="upw" class="form-control" placeholder="Password" required>
        <span id="error_pw" style="color:red;"></span><br>

        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" onclick="goSignup()">회원가입</button>   <!-- id값 바꿔주기 -->
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
      </form>
		
      </div>
   </div>

   <div class="modal">
   </div>
   <script>
   function goSignup(){
	   location.href="http://localhost:8080/signup";
   }
   
   	window.addEventListener("DOMContentLoaded", function() {
   		var password;
   		var userId;

   		// 아이디입력창이 포커스를 잃었을 때
   		document.getElementById("uid").onblur = function() {
   			// 입력값 초기화
   			userId = document.getElementById("uid").value;
   			// 아이디입력창에 아무것도 입력되지 않았다면.
   			if (userId == "") {
   				document.getElementById("error_id").innerHTML = " 아이디비었음.";
   			}
   			//입력값이 존재한다면
   			if (userId != "") {
   				document.getElementById("error_id").innerHTML = "";
   			}

   		}

   		// 비번입력창이 포커스를 얻었다가 잃었을 때
   		document.getElementById("upw").onblur = function() {
   			//입력값 초기화
   			password = document.getElementById("upw").value;
   			//비번입력창에 아무것도 입력되지 않았다면
   			if (password == "") {
   				document.getElementById("error_pw").innerHTML = " 비번비었음.";
   			}
   			// 입력값이 존재한다면
   			if (password != "") {
   				document.getElementById("error_pw").innerHTML = "";
   			}
   		}


   			//submit ( 로그인 버튼 클릭 시)
   		document.getElementById("login").onsubmit = function() {

   			var data = JSON.stringify({
   				"userId" : document.getElementById("uid").value,
   				"password" : document.getElementById("upw").value
   			});
   			console.dir(data);
   			var xhr = new XMLHttpRequest();
   			xhr.open("post", "http://localhost:8080/user/logincheck", true);
   			xhr.setRequestHeader('Content-Type', 'application/json');
   			xhr.send(data);
   			xhr.onload = function() {
   				var messege = xhr.responseText;
   				messeg = JSON.parse(messege);

   				if(messeg.messege == "존재하지 않는 아이디입니다."){
   				document.getElementById("error_id").innerHTML = messeg.messege;
   				}

   				if(messeg.messege == "비밀번호가 일치하지 않습니다."){
   					document.getElementById("error_pw").innerHTML = messeg.messege;
   				}
   				if(messeg.messege == document.getElementById("uid").value + "님, 로그인 성공하셨습니다."){
   					alert(messeg.messege);
   					location.href = "index.jsp";
   				}


   			}

   			return false;
   		}

   	});
   </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
