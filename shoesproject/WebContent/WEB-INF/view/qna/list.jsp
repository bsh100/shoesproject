<%@page import="com.tp.shop.common.Pager"%>
<%@page import="com.tp.shop.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<QnaDto> qnaList = (List) request.getAttribute("qnaList");
	Pager pager = (Pager) request.getAttribute("pager");
	String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 80%;
	border: 1px solid #ddd;
	margin-top: 20px;
	margin-left: 10%;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

#noWhere {
	height: 100px;
}

#fullDiv {
	text-align: center;
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
</style>
</head>
<body>

	<div id="header"><jsp:include page="../QNAHeader.jsp"></jsp:include></div>

	<div id="noWhere"></div>


	<div id="fullDiv">
		<h2>Q&A</h2>
		<%-- <h2><%=userId %></h2> --%>
		<table>
			<tr>
				<th width="5%">No</th>
				<th width="60%">제목</th>
				<th width="15%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			<%
				int curPos = pager.getCurPos();
			%>
			<%
				int num = pager.getNum();
			%>
			<%
				for (int i = 1; i < pager.getPageSize(); i++) {
			%>
			<%
				if (num < 1)
						break;
			%>
			<%
				QnaDto qna = (QnaDto) qnaList.get(curPos++);
			%>
			<tr>
				<td><%=num--%></td>
				<td>
					<%
						if (qna.getDepth() > 0) { //답변일때만
					%> re: <%
						}
					%> <a href="/qna/detail?qnaNo=<%=qna.getQnaNo()%>"><%=qna.getQnaTitle()%></a>
				</td>
				<td><%=qna.getQnaWriter()%></td>
				<td><%=qna.getRegDate().substring(0, 10)%></td>
			</tr>
			<%
				}
			%>
			<%
				if (session.getAttribute("userId") != null) {
			%>
			<tr>
				<td colspan="4" align="right">
					<button onclick="location.href='/qna/regist'">글 작성</button>
				</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="4" align="right">
					<button onclick="location.href='/login'">글 작성</button>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="6" style="text-align: center">
					<%
						for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) {
					%> <%
 	if (i > pager.getTotalPage())
 			break;
 %> <a href="/qna/list?currentPage=<%=i%>">[<%=i%>]
				</a> <%
 	}
 %>
				</td>
			</tr>
		</table>
	</div>
	<div id="footer"></div>
</body>
</html>