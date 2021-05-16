<%@page import="com.tp.shop.dto.QnaDto"%>
<%@page import="com.tp.shop.common.Pager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<QnaDto> qnaList = (List)request.getAttribute("qnaList");
	Pager pager=(Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>고객센터</title>
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

	<div id="header"><jsp:include page="./Header.jsp"></jsp:include></div>

	<div id="noWhere"></div>


	<div id="fullDiv">
		<h2>관리자 Q&A관리 페이지</h2>

		<table>
			<tr>
				<th width="5%">No</th>
				<th width="60%">제목</th>
				<th width="15%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			<%int curPos=pager.getCurPos(); %>	
 			<%int num=pager.getNum(); %>	
			<%for(int i=1;i<pager.getPageSize();i++){%>
			<%if(num<1)break;%>
			<%QnaDto qna = (QnaDto)qnaList.get(curPos++); %>
			<tr>
				<td><%=num-- %></td>
				<td>
				<%if(qna.getDepth()>0){ //답변일때만%>
           		re:
            	<%} %>
				<a href="/admin/qna/detail?qnaNo=<%=qna.getQnaNo()%>"><%=qna.getQnaTitle()%></a>
				</td>
				<td><%=qna.getQnaWriter()%></td>
				<td><%=qna.getRegDate().substring(0,10) %></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="4" align="right">
					<button onclick="location.href='/admin/qna/regist'">글 작성</button>
				</td>
			</tr>
			<tr>
		  	<td colspan="6" style="text-align:center">
		  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
		  		<%if(i>pager.getTotalPage())break; %>
				<a href="/qna/list?currentPage=<%=i%>">[<%=i%>]</a>  		
				<%}%>
		  	</td>
		  	</tr>
			
		</table>
	</div>

	<div id="noWhere"></div>
	<div id="noWhere"></div>
	<div id="noWhere"></div>

	<div id="footer">
	</div>

</body>
</html>

