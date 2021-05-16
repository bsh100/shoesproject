<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집 리스트 조회</title>
</head>
<body>
	<h2>상품</h2>
	<!-- <button type = "button" id = "btnAdd">상품등록</button> -->
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
			<th>사이즈</th>
			<th>색상</th>
			<th>수량</th>
			<th>수정하기</th>
		</tr>
		<c:forEach var="row" items="${updateList}">
		<tr>
			<td>${row.prodNo}</td>
			<td>${row.prodCategory }</td>
			<td>
				<img src="${pageContext.request.contextPath}/images/${row.pictureUrl}" width="120ox" height="110px">
			</td>
			<td>${row.prodName}</td>
			<td><fmt:formatNumber value="${row.prodPrice}" pattern="###,###,###"/></td>
			<td>${row.prodSize}</td>
			<td>${row.prodColor}</td>
			<td>${row.prodStock}</td>
			<td>
				<a href="${pageContext.request.contextPath}/admin/update/${row.prodNo}">상품편집</a>
			</td>
		</tr>
		</c:forEach>
	</table>
				 
</body>
</html>

