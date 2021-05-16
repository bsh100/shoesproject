<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	$("#updateBtn").click(function(){
		var productCategory = $("#prodCategory").val();
		var productName = $("#prodName").val();
		var productPrice = $("#prodPrice").val();
		var productSize = $("#prodSize").val();
		var productStock = $("#prodStock").val();
		var productDesc = $("#prodDescription").val();
		var photo = $("#photo").val();
		
		if(productCategory == "종류선택") {
			alert("카테고리를 선택해주세요");
			productName.foucs();
			return false;
		} else if (productName == "") {
			alert("상품명을 입력해주세요");
			productPrice.focus();
			return false;
		} else if (productPrice == "") {
			alert("상품 가격을 입력해주세요");
			productPrice.focus();
			return false;
		} else if (productSize == "") {
			alert("상품 사이즈를 입력해주세요");
			productPrice.focus();
			return false;
		} else if (productStock == "") {
			alert("상품 수량을 입력해주세요");
			productPrice.focus();
			return false;
		} else if (productDesc == "") {
			alert("상품 설명을 입력해주세요");
			productDesc.focus();
			return false;
		} else if (photo == "") {
			alert("상품 사진을 추가해주세요");
			return false;
		}
		
		$("#form1").attr("action","${pageContext.request.contextPath}/admin/update")
		$("#form1").submit();
	});
	$("#deleteBtn").click(function(){
		if(confirm("상품을 삭제하시겠습니까?")){
			$("#form1").attr("action","${pageContext.request.contextPath}/admin/delete")
			$("#form1").submit();
		}
	});
	$("#listBtn").click(function(){
		location.href = "${pageContext.request.contextPath}/admin/list";	
	});
});
</script>
</head>	
<body>
<h2>상품 정보/삭제</h2>
	<form action="" id="form1" enctype="multipart/form-data" method="post">
		<table border="">
			<tr>
				<td>상품 이미지</td>
				<td>
					<img src="${pageContext.request.contextPath}/images/${dto.pictureUrl}" height="300px" width="310px">
					<br>
					<input type="file" id="file" name="file">
				</td>
			</tr>
			<tr>
    			<td>상품 카테고리 </td>
   				 <td>
     				 <select name="prodCategory" id="prodCategory">
        			 <option value="종류선택">종류선택</option>
  				     <option value="구두">구두</option>
     				 <option value="로퍼">로퍼</option>
      				 <option value="스니커즈">스니커즈</option>
       				 <option value="슬립온">슬립온</option>
       				 <option value="샌들">샌들</option>
       				 <option value="슬리퍼">슬리퍼</option>
       			     <option value="워커">워커</option>
       				 <option value="부츠">부츠</option>
      				</select>
   				 </td>
   			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" id="prodName" name="prodName" value="${dto.prodName}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" id="prodPrice" name="prodPrice" value="${dto.prodPrice}"></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td><input type="number" id="prodSize" name="prodSize" value="${dto.prodSize}"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td><input type="text" id="prodColor" name="prodColor" value="${dto.prodColor}"></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="text" id="prodStock" name="prodStock" value="${dto.prodStock}"></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><textarea id="prodDescription" name="prodDescription" rows="5" cols="60">${dto.prodDescription}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="prodNo" value="${dto.prodNo}">
					<input type="button" id="updateBtn" value="수정">
					<input type="button" id="deleteBtn"value="삭제">
					<input type="button" id="listBtn" value="상품목록">	
				</td>	
			</tr>
		</table>
	</form>
</body>
</html> 
</body>
</html>