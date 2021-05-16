 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" href="/css/QNA.css">
<%
    String userId = (String)session.getAttribute("userId");
	String userType = (String)session.getAttribute("userType");
    %>
<div class="header" id="color_white" >

		<div class="logo">
         <a href="http://localhost:8080/main"><img style="width:189px;height:150px;" src="/images/logo.PNG" alt="LOGO"></a>
      </div>

		<div class="nav">
			<ul>
				<% 
      try{
    	  //로그인이 된 상태일 때.
      if(userId != null){
    	  out.print(userId);
      %>
				<li><a href="http://localhost:8080/logout">로그아웃</a></li>
				<%
				//로그인한 계정의 타입이 admin일 경우 관리자 페이지로 이동할 수 있는 앵커태그를 띄워준다.
		if(userType.equals("admin")){
			%> <li><a href="admin/list">관리자 페이지</a></li><% 
		}
				
				// 로그인이 안되어 있는 상태일 때.
      }else{ %>
				<li><a href="http://localhost:8080/login">로그인</a></li>
				<li><a href="http://localhost:8080/signup">회원가입</a></li>
				<% } 
      }catch(NullPointerException e){
      }
      	%>
				<li><a href="http://localhost:8080/qna/list">QnA</a></li>
				<li><a href="http://localhost:8080/notice/list">공지사항</a></li>
			</ul>
		</div>

		<div class="icon_bt">

			
			<div class="icon_left">

				<div class="cart">
					<a href="http://localhost:8080/cart/cartView"><i>CART</i></a>
				</div>
				<div class="mypage">
					<a href="http://localhost:8080/mypage"><i>MYPAGE</i></a>
				</div>
				
			</div>

		</div>

		<div class="category">
		
			<div class="all"><a href="http://localhost:8080/list?searchType=&keyword=">ALL</a></div>
			<c:forEach var="keyword" items="${cate}">
			<div class="men"><a href="/list?searchType=Category&keyword=${keyword}">${keyword}</a></div>
			</c:forEach>


		</div>

	</div>    