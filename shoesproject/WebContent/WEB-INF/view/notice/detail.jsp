<%@page import="com.tp.shop.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	NoticeDto notice = (NoticeDto)request.getAttribute("notice");
    String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>

<style>
input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

.registBox {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 80%;
	margin-top: 10px;
	margin-left: 10%;
}

#noWhere {
	height: 100px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace("detail");
	});


</script>
</head>
<body>

	<div id="header"><jsp:include page="../QNAHeader.jsp"></jsp:include></div>

	<div id="noWhere"></div>

	<div class="registBox">
		<form>
			<label>제목</label> 
			<input type="hidden" name="noticeId" value="<%=notice.getNoticeId()%>">
			<input type="hidden" name="team" value="<%=notice.getTeam()%>">
         	<input type="hidden" name="ranking" value="<%=notice.getRanking()%>">
         	<input type="hidden" name="depth" value="<%=notice.getDepth()%>">
			<input type="text" id="noticeTitle" name="noticeTitle" value="<%=notice.getNoticeTitle()%>" readonly="readonly" >
			<label>작성자</label> 
			<input type="text" id="noticeWriter" name="noticeWriter" value="<%=notice.getNoticeWriter()%>" readonly="readonly">
			<label>내용</label>
			<input type="hidden" id="noticeContent" name="noticeContent">
			<textarea id="detail" style="height: 200px" readonly="readonly"><%=notice.getNoticeContent()%> </textarea>
			<button type="button" onclick="location.href='/notice/list';">목록으로</button>
		</form>
	</div>

	<div id="noWhere"></div>



	<div id="footer"></div>


</body>
</html>