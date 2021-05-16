<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">

#selorder{
	display:flex;
	justify-content:center;
}
#tablediv{
	width:1280px;
	margin:auto;
	margin-top: 30px;
}
#divtr1{
	background-color:lightgray;
}

table{
	margin: auto;
	width: 1280px;
	text-align:center;
}


table, th, td {
	border-collapse:collapse;
	border-top:1px solid black;
	border-bottom:1px solid black;
}
tr{
	height:40px;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.delBtn {
	float: inherit;
	width: 300px;
	text-align: right;
}

.delBtn button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.checkBox {
	float: left;
	width: 30px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.addEventListener("DOMContentLoaded", function() {
		var deleteList = document.querySelectorAll("a[href^=delete]");
		deleteList.forEach(function(element) {
			element.onclick = function() {
				if (!confirm("정말 삭제 하시겠습니까 ?")) {
					return false;
				}

			}
		});
	})
</script>

</head>



<body>
<jsp:include page="Header.jsp"></jsp:include>
	<div id="tablediv">
		<table>
			<thead>
				<tr id="divtr1">
					<th>
						<div class="allCehck">
							<input style="zoom:2.0;" type="checkbox" name="allCheck" id="allCheck"><label
								for="allCheck"></label>
							<script>
								$("#allCheck").click(function() {
									var chk = $("#allCheck").prop("checked");
									if (chk) {
										$(".chBox").prop("checked", true);
									} else {
										$(".chBox").prop("checked", false);
									}
								});
							</script>
						</div>
					</th>
				 	<th> 이미지 </th>
					<th> 상품 이름 </th>
					<th> 색상 </th>
					<th> 사이즈 </th>
					<th> 수량 </th>
					<th> 판매가 </th>
					<th> 합계 </th>
					<th> 삭제 </th>
				</tr>
			</thead>
			<tbody>
					<form id="checkProd">
				<c:forEach var="cartList" items="${cartList}" varStatus="a">
					<tr class="prodInfo">
						<td><input style="zoom:2.0;" type="checkbox" name="chBox" class="chBox"
							data-cartNo="${cartList.cartNo }" /> <script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false);
								});
							</script></td>
						<td><img src="${pageContext.request.contextPath}/images/${cartList.pictureUrl}" 
						width="150px" height="150px"></td> 
						<td>${cartList.prodName }</td>
						<td>${cartList.prodColor }</td>
						<td>${cartList.prodSize }</td>
						<td class="cnt_td"><button class="down"><</button>
							<input type="number" value="${cartList.count}"
							readonly="readonly" style="width:30px;">
						<button class="up">></button></td>





						<td class="pp"><fmt:formatNumber pattern="###,###,###"
								value="${cartList.prodPrice }" />원</td>
						<td><fmt:formatNumber pattern="###,###,###원"
								value="${cartList.prodPrice * cartList.count}" /></td>
						
						<td ><a href="delete?cartNo=${cartList.cartNo }" style="color:black">삭제</a></td>

						<c:set var="sum" 
							value="${sum + (cartList.prodPrice * cartList.count) }" />
					</tr>
				
<script>


		window.addEventListener("DOMContentLoaded",function(){
			// 장바구니 상품 수량 up
			// ${a.count} = foreach문이 몇 번째 돌고 있는지 알려줌. 고로, 장바구니에서 첫번째로 보여지게 되는 상품의 정보들은 getElementsByTagName[${a.count}] 로 찾아낼 수 있음.
		document.getElementsByClassName("up")[${a.count}-1].onclick = function() {
			document.getElementsByClassName("cnt_td")[${a.count}-1].children[1].value = 1*1 + document.getElementsByClassName("cnt_td")[${a.count}-1].children[1].value*1;
			var xhr = new XMLHttpRequest();
			var name = document.getElementsByClassName("prodInfo")[${a.count}-1].children[2].innerText; 
			var color = document.getElementsByClassName("prodInfo")[${a.count}-1].children[3].innerText;
			var size = document.getElementsByClassName("prodInfo")[${a.count}-1].children[4].innerText;
			var data = JSON.stringify({
				"prodName" : name,
				"prodColor" : color,	
				"prodSize" : size	
					});
			xhr.open("post","http://localhost:8090/cart/upCartCount",true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(data);
			xhr.onload=function(){
				document.location.reload(true);
			}
			
			return false;
		}
		// 장바구니 상품 수량 down
		document.getElementsByClassName("down")[${a.count}-1].onclick = function() {
			if(document.getElementsByClassName("cnt_td")[${a.count}-1].children[1].value > 1){
			document.getElementsByClassName("cnt_td")[${a.count}-1].children[1].value = document.getElementsByClassName("cnt_td")[${a.count}-1].children[1].value*1 - 1*1;
			
			var xhr = new XMLHttpRequest();
			var name = document.getElementsByClassName("prodInfo")[${a.count}-1].children[2].innerText; 
			var color = document.getElementsByClassName("prodInfo")[${a.count}-1].children[3].innerText;
			var size = document.getElementsByClassName("prodInfo")[${a.count}-1].children[4].innerText;
			var data = {
				"prodName" : name,
				"prodColor" : color,	
				"prodSize" : size,	
					};
			xhr.open("post","http://localhost:8090/cart/downCartCount",true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify(data));
			xhr.onload=function(){
				document.location.reload(true);			
				}
			}
			
			
			return false;
		}
		
		

		});
</script>
</c:forEach>
			</tbody>
			<tfoot>
				<tr id="divtr1">
					<td colspan="9" align="Right">
						<div class="sum" >
							상품 총 금액 + 배송비 2500 (50,000 원 이상 구매시 배송비 무료 ) = 총 구매 금액 :
							<c:choose>
								<c:when test="${sum < 50000 }">
								<input id="totalPrice" type="hidden" value="${sum+2500}">
								<fmt:formatNumber pattern="###,###,###원" value="${sum+2500}" />
								</c:when>
								<c:otherwise>
								<input id="totalPrice" type="hidden" value="${sum}">
								<fmt:formatNumber pattern="###,###,###원" value="${sum}" />
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

	<div class="delBtn">
		<button type="button" class="selectDelete_btn">선택 삭제</button>
		<script>
			$(".selectDelete_btn").click(function() {
				var confirm_val = confirm("정말 삭제하시겠습니까?");

				if (confirm_val) {
					var checkArr = new Array();

					// 체크된 체크박스의 갯수만큼 반복
					$("input[class='chBox']:checked").each(function() {
						checkArr.push($(this).attr("data-cartNo")); // 배열에 데이터 삽입
					});
					console.dir(checkArr);

					$.ajax({
						url : "/cart/deleteList",
						type : "POST",
						data : {
							chBox : checkArr
						},
						success : function(data) {
							console.dir(data);
							if (data == 1) {
								location.href = "/cart/cartView";
							} else {
								alert("삭제 실패");
							}
						}
					});
				}
			});
		</script>
	</div>
	
	<div id="selorder" >
		<button type="button" class="btn btn-dark" onclick="a()">선택한 상품 주문하기</button>
	</div>
					</form>
<script>
function a(){
	var chBox = document.getElementsByClassName("chBox");
	var cartNoList = [];
	var cartCount = [];
	for(let i=0;i<chBox.length;i++){
		
		if(chBox[i].checked){
			
			console.dir("주문 선택된 상품의 cartNo : "+chBox[i].dataset.cartno);
			console.dir("주문 선택된 상품의 개수 : " + chBox[i].offsetParent.parentElement.children[5].children[1].value);
			
			cartNoList.push(chBox[i].dataset.cartno);
			cartCount.push(chBox[i].offsetParent.parentElement.children[5].children[1].value);
		}
	}
		
		if(cartNoList.length != 0){
			
			$.ajax({
				url : "http://localhost:8090/order/atCartView",
				type : "GET",
				data : {
					cartNoArr : cartNoList,
					cartCountArr : cartCount
				},
				success : function(msg) {
					console.dir(msg);
					if(msg == ""){
					location.href="http://localhost:8090/order";
					}else{
						alert(msg);
					}
				}
			});
			
		}
	
		//alert("선택된 상품이 없습니다.");
	
	return false;
}
</script>

</body>
</html>