<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#addBtn").on("click",function(){
			var productCategory = $("#prodCategory").val();
			var productName = $("#prodName").val();
			var productPrice = $("#prodPrice").val();
			var productSize = $("#prodSize").val();
			var productStock = $("#prodStock").val();
			var productDesc = $("#prodDescription").val();
			var fileimg = $("#fileimg").val();
			
			if(productCategory == "종류선택") {
				alert("카테고리를 선택해주세요");
				$("#prodCategory").focus();
				return false;
			} else if (productName == "") {
				alert("상품명을 입력해주세요");
				$("#prodName").focus();
				return false;
			} else if (productPrice == "") {
				alert("상품 가격을 입력해주세요");
				$("#prodPrice").focus();
				return false;
			} else if (productSize == "") {
				alert("상품 사이즈를 입력해주세요");
				$("#prodSize").focus();
				return false;
			} else if (productStock == "") {
				alert("상품 수량을 입력해주세요");
				$("#prodStock").focus();
				return false;
			} else if (productDesc == "") {
				alert("상품 설명을 입력해주세요");
				$("#prodDescription").focus();
				return false;
			} else if (fileimg == "") {
				alert("상품 사진을 추가해주세요");
				$("#fileimg").focus();
				return false;
			}
			$("#form1").attr("action","${pageContext.request.contextPath}/admin/insert")
			$("#form1").submit();
		});
	$("#fileimg").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
				 $(".select_img img").attr("src", data.target.result).width(200).height(200);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
		
	});
		
</script>
</head>
<body>
	<h2>상품 등록</h2>
	<form action="" id="form1" enctype="multipart/form-data" method="post">
		<table border="1">
			<tr>
    			<td>상품 카테고리 </td>
   				 <td>
     				 <select name="prodCategory" id="prodCategory">
        			 <option selected value="종류선택">종류선택</option>
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
				<td><input type="text" name="prodName" id="prodName"></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><input type="text" name="prodPrice" id="prodPrice"></td>
			</tr>
			<tr>
				<td>상품 사이즈</td>
				<td><input type="text" name="prodSize" id="prodSize"></td>
			</tr>
			<tr>
				<td>상품 색상</td>
				<td><input type="text" name="prodColor" id="prodColor"></td>
			</tr>
			<tr>
				<td>상품 재고</td>
				<td><input type="text" name="prodStock" id="prodStock"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="prodDescription" id="prodDescription"></textarea></td>
			</tr>
			<tr>
				<td>메인 이미지 추가</td>
				<td><input type="file" name="file" id="fileimg"></td>
			</tr>
			<tr>
				<td>이미지 미리보기</td>
				<td colspan="2">
         			<div class="select_img"><img src="" width="200" height="200"/></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록" id="addBtn">
					<input type="button" value="목록" onclick="location.href='${path}/admin/list';">
				</td>
			</tr>
		</table>
	</form>
</body>
</html> 