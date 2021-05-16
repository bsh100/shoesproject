<%@page import="com.tp.shop.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    QnaDto qna = (QnaDto)request.getAttribute("qna");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>1:1문의</title>

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

	function update() {
		
		$("form input[name='qnaContent']").val(CKEDITOR.instances["detail"].getData());
		if ($("#qnaTitle").val() == "" || $("#qnaContent").val() == "") {
			alert("제목과 내용을 입력해 주세요");
		} else {
			$("form").attr({
				"action" : "/admin/qna/update",
				"enctype" : "text/json",
				"method" : "post"
			});
			$("form").submit();
		}
	}
	
	function reply(){
		$("form").attr({
			"action" : "/qna/reply",
			"enctype" : "text/json",
			"method" : "post"
		});
		$("form").submit();
	}
</script>
</head>
<body>

	<div id="header"><jsp:include page="./Header.jsp"></jsp:include></div>

	<div id="noWhere"></div>

	<div class="registBox">
		<form>
			<label>제목</label> 
			<input type="hidden" name="qnaNo" value="<%=qna.getQnaNo()%>">
			<input type="hidden" name="team" value="<%=qna.getTeam()%>">
         	<input type="hidden" name="ranking" value="<%=qna.getRanking()%>">
         	<input type="hidden" name="depth" value="<%=qna.getDepth()%>">
			<input type="text" id="qnaTitle" name="qnaTitle" value="<%=qna.getQnaTitle()%>" >
			<label>작성자</label> 
			<input type="text" id="qnaWriter" name="qnaWriter" placeholder="<%=qna.getQnaWriter() %>" readonly="readonly">
			<label>내용</label>
			<input type="hidden" id="qnaContent" name="qnaContent">
			<textarea id="detail" style="height: 200px" ><%=qna.getQnaContent()%></textarea>
			<button type="button" onclick="location.href='/admin/qna/list';">목록으로</button>			
			<button type="button" onclick="update()">수정</button>
			<button type="button" onclick="location.href='/admin/qna/del?qnaNo=<%=qna.getQnaNo()%>';">삭제</button>
			<button type="button" onclick="reply()">답변달기</button>
			
			
		</form>
	</div>

	<div id="noWhere"></div>



	<div id="footer">
	</div>
	
</body>
</html>