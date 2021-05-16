<%@page import="com.tp.shop.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String userId = (String)session.getAttribute("userId");
	String userType = (String)session.getAttribute("userType");
    %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 640px;
    height: 320px;
    margin: auto;
  }
  
  </style>
<title>main</title>
</head>

<body>
	<jsp:include page="Header.jsp"></jsp:include>


	<!-- 헤더 부분 끝 -->
	<!-- 이슈 부분 시작 -->

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="../images/gudu1.jpg" width="640px" height="320px">
        <div class="carousel-caption">
          
        </div>
      </div>

      <div class="item">
   <img src="../images/gudu2.jpg" width="640px" height="320px">
        <div class="carousel-caption">
          
        </div>
      </div>
    
      <div class="item"><a href="http://localhost:8080/admin/detail/2">
        <img src="../images/gudu3.jpg" width="640px" height="320px">
        </a><div class="carousel-caption">
         
        </div>
      </div>

      <div class="item">
       <img src="../images/gudu4.jpg" width="640px" height="320px">
        <div class="carousel-caption">
          
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	

	<!-- 이슈 부분 끝 -->
	<!-- best5 리스트 부분 시작 -->
	
	
	
	<div class="best">
		<ul>
			<c:forEach var="bestProd" items="${bestProdList}">
			
			<li class="best5">
				<div class="img_best"><a href="${pageContext.request.contextPath}/admin/detail/${bestProd.prodName}">
					<img style="width:236px;height:210px;" src="${pageContext.request.contextPath}/images/${bestProd.pictureUrl}" alt="경로에 사진이 없습니다.">
				</a>
				</div>
				<div class="product_name">
					<span><a href="${pageContext.request.contextPath}/admin/detail/${bestProd.prodName}">${bestProd.prodName}</a></span>
				</div>
	
				<div class="product_info">
					<div class="price"><fmt:formatNumber pattern="###,###,###원">${bestProd.prodPrice}</fmt:formatNumber></div>
				</div>

			</li>
			</c:forEach>

		</ul>
	</div>


</body>
</html>
