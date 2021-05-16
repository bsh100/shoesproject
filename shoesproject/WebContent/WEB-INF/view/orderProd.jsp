<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/orderProd</title>
<link rel="stylesheet" href="../css/mypage.css">
</head>
<style>
#list{
width:613px;
margin:auto;
}
</style>
<body>

<jsp:include page="Header.jsp"></jsp:include>
<div class="middle">
<jsp:include page="mypageAside.jsp"></jsp:include>
<div id="list">
<table style="background-color: white; color:black; border: 1px solid lightgray;">
<tr>
<th>상품정보</th><th>주문일자</th><th>주문번호</th><th>주문금액(수량)</th><th>주문상태</th>
</tr>
<c:forEach var="orderProd" items="${orderProdList}" varStatus="x">
<tr>
<th><div style="display:flex"><img style="width:100px;height:100px; line-height:100px; overflow: hidden;" src='${pageContext.request.contextPath}/images/${orderProd.pictureUrl}' alt="x">
<span style="height:100px; padding-top:30px;color:black;">${orderProd.prodName}<br>${orderProd.prodColor} / ${orderProd.prodSize}</span></div>
</th>
<th style="color:black;">${orderProd.regDate}</th>
<th style="color:black;">${orderProd.orderNo}</th>
<th style="color:black;">
<fmt:formatNumber pattern="###,###,###,###원" value="${orderProd.prodPrice*orderProd.count}"></fmt:formatNumber>
(${orderProd.count})</th>
<th style="color:black;">${orderProd.orderStatus}</th>
</tr>
</c:forEach>
</table>
</div>
</div>

</body>
</html>