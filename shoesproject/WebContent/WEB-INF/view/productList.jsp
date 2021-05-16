<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 리스트</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnAdd").click(function(){
			location.href="${pageContext.request.contextPath}/admin/insert";
		});
		
	});
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/admin/list";
		url += "?searchType=" + $('#searchType').val();
		url += "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});

	
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize, searchType, keyword) {
				var page = ((range - 2) * rangeSize) + 1;
				var range = range - 1;
				var url = "${pageContext.request.contextPath}/admin/list?page="+page+"&range="+range;
				url += "&searchType=" + searchType;
				url += "&keyword=" + keyword;
				location.href = url;
			}
		  //페이지 번호 클릭
			function fn_pagination(page, range, rangeSize, searchType, keyword) {
				var url = "${pageContext.request.contextPath}/admin/list?page="+page+"&range="+range;
				url += "&searchType=" + searchType;
				url += "&keyword=" + keyword;
				location.href = url;	
			}
			//다음 버튼 이벤트
			function fn_next(page, range, rangeSize, searchType, keyword) {
				var page = parseInt((range * rangeSize)) + 1;
				var range = parseInt(range) + 1;
				var url = "${pageContext.request.contextPath}/admin/list?page="+page+"&range="+range;
				url += "&searchType=" + searchType;
				url += "&keyword=" + keyword;
				location.href = url;
			}
	
	
</script> 
</head>
<body>
	<!-- search{s} -->
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="Name">상품이름</option>
					<option value="Category">카테고리</option>
					<option value="Price">가격</option>
				</select>
			</div>
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
		<!-- search{e} -->
	<h2>상품목록</h2>
	<button type = "button" id = "btnAdd">상품등록</button> 
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.prodNo}
			</td>
			<td>
				<%-- <a href="${pageContext.request.contextPath}/admin/detailadmin/detail?prodNo=${row.prodNo}"> --%>
				<a href="${pageContext.request.contextPath}/admin/detail/${row.prodName}">
					<img src="${pageContext.request.contextPath}/images/${row.pictureUrl}" width="120ox" height="110px">
											<!-- URL에 포함된 변수이므로 @PathVariable로 저장이 된다. -->
				</a>
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/admin/detail/${row.prodName}">${row.prodName}</a><br>
				<a href="${pageContext.request.contextPath}/admin/updateList/${row.prodName}">상품편집</a> 
			</td>
			<td>
				<fmt:formatNumber value="${row.prodPrice}" pattern="###,###,###"/>
			</td>
		</tr>
		</c:forEach>
		<tfoot>
			<tr>
				<td class="page-item" colspan="4">
					<c:if test="${pagination.prev}">
						<a class="page-link" href="#" onClick="fn_prev('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')">&lt;-&nbsp;</a>
					</c:if>
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<c:out value="${pagination.page == idx ? active : ''}"/><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')"> ${idx} </a>
					</c:forEach>
					<c:if test="${pagination.next}">
				<a class="page-link" href="#" onClick="fn_next('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')">&nbsp;-&gt;</a>
			</c:if>
				</td>
			</tr>
	</table>
	<!-- pagination{s} -->
	<%--  <div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">&lt;&nbsp;-</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
'${pagination.range}', '${pagination.rangeSize}')" >&nbsp;-&gt;</a></li>
			</c:if>
		</ul>
	</div>  --%>
	<!-- pagination{e} -->
</body>
</html>