<%@page import="com.tp.shop.dto.NoticeDto"%>
<%@page import="com.tp.shop.common.Pager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<NoticeDto> noticeList = (List) request.getAttribute("noticeList");
	Pager pager = (Pager) request.getAttribute("pager");
	String userId = (String)session.getAttribute("userId");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
		<h2>공지사항</h2>

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
			NoticeDto notice = (NoticeDto) noticeList.get(curPos++);
			%>
			<tr>
				<td><%=num--%></td>
				<td>
					<%
						if (notice.getDepth() > 0) { //답변일때만
					%> re: <%
						}
					%> <a
					href="/notice/detail?noticeId=<%=notice.getNoticeId()%>"><%=notice.getNoticeTitle()%></a>
				</td>
				<td><%=notice.getNoticeWriter()%></td>
				<td><%=notice.getRegDate().substring(0, 10)%></td>
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
 %>
					<a href="/notice/list?currentPage=<%=i%>">[<%=i%>]
				</a> <%}%>
				</td>
			</tr>
		</table>
	</div>
	<div id="footer"></div>
</body>
</html>