<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과 페이지</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">

.result1{
width:1400px;
height:600px;
display:flex;
justify-content:center;
align-items:center;
}
</style>
	
</head>
<body>
	<div class="result1">
	
		<form>
		${userId}님!  결제가 완료되었습니다. <Br><br>
		
		<button type="button" class="btn btn-dark" onclick="location.href='http://localhost:8090'" >메인으로 돌아가기</button>
		</form>
	</div>
</body>
</html>