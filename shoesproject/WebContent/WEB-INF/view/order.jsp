<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
<style type="text/css">

#orderInfo{
	width: 600px;
	margin: auto;
	margin-left:60px;
	margin-top: 30px;
    margin-bottom: 60px;
	
}
#tablediv{
	width:1280px;
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
.middle{
width:1280px;
margin:auto;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
		function listNullCheck(){
			
			console.dir(document.getElementsByClassName("chBox"));
			if(document.getElementsByClassName("chBox").length==0){
				alert("목록에 결제할 상품이 없습니다.");
				location.href="http://localhost:8090/cart/cartView";
			}
		}
	window.addEventListener("DOMContentLoaded", function() {
		
		
		
		
		
	})
</script>
<script>

function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
		            
		            // 도로명 주소의 노출 규칙에 따라 주소를 조합
		            // 내려오는 변수가 값이 없는 경우엔 공백('') 값을 가짐. 이를 참고하여 분기
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
		            
		            // 법정 동 명이 있을 경우 추가 (법정 리 는 제외)
		            // 법정 동 의 경우 마지막 문자가 "동/로/가"로 끝난다.
		            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
		            //건물 명이 있고 , 공동 주택일 경우 추가한다.
		            if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
					}
		            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		            if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		            
		            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		            if (roadAddr !== '') {
		            	console.log(roadAddr);
		            	console.log(extraRoadAddr);
						document.getElementById("sample4_detailAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_detailAddress").value = '';
					}
				}
			}).open();
	return false;
	}
	
	
	
		</script>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
	<div class="middle">
	<div id="tablediv">
		<table>
			<thead>
				<tr id="divtr1">
					<th>
						<div class="allCehck">
							<input style="zoom:2.0;"type="checkbox" name="allCheck" id="allCheck"><label
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
				<c:forEach var="prodList" items="${prodList}" varStatus="a">
					
					<tr id="${a.index}">
						<td><input style="zoom:2.0;" type="checkbox" name="chBox" class="chBox"
							data-prodNo="${prodList.prodNo }" /> <script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false);
								});
							</script></td>
						<td><img src="${pageContext.request.contextPath}/images/${prodList.pictureUrl}" 
						width="150px" height="150px"></td>
						<td>${prodList.prodName }</td>
						<td>${prodList.prodColor }</td>
						<td>${prodList.prodSize }</td>
						<td class="payProdCount">${cartCountList[a.index]}</td>



						<td><fmt:formatNumber pattern="###,###,###원"
								value="${prodList.prodPrice}" /></td>
						<td><fmt:formatNumber pattern="###,###,###원"
								value="${prodList.prodPrice * cartCountList[a.index]}" /></td>
						<td><a href="javascript:deleteOneRow(${a.index})">삭제</a></td>

						<c:set var="sum"
							value="${sum + (prodList.prodPrice * cartCountList[a.index]) }" />
						
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr id="divtr1">
					<td colspan="9" align="Right">
						<div class="sum">
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
			<script>
			function deleteOneRow(num){
				var x = confirm("정말 삭제하시겠습니까?");
				if(x){
				document.getElementById(num).parentNode.removeChild(document.getElementById(num));
				}
				listNullCheck();
			}
			</script>
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
						checkArr.push($(this)); // 배열에 데이터 삽입
					});
					for(var i=0;i<checkArr.length;i++){
						var tr = checkArr[i][0].parentNode.parentNode;
							tr.parentNode.removeChild(tr);
						
					}

					listNullCheck();
				}
			});
			
			
			
			function payment(){
				
				var x = confirm("주문하시겠습니까?");
				if(x){
					
				var chBox = document.getElementsByClassName("chBox");
				var payProds = [];
				var payProdCounts = [];
				//address데이터를 만드는 코드
				var address = "";
				address = document.getElementById('sample4_postcode').value +" ";
				address += document.getElementById("sample4_jibunAddress").value + " ";
				address += document.getElementById("sample4_detailAddress").value + " ";
				address += document.getElementById("refAddress").value;
				// 결제될 상품의 번호들 가져오기
				for(let i=0;i<chBox.length;i++){
					payProds.push(chBox[i].dataset.prodno.toString());
					payProdCounts.push(document.getElementsByClassName("payProdCount")[i].innerText);
				}
				
				//가져와야 하는 값들  : 유저아이디, 결제상품넘버들, 수령인이름, 수령주소, 수령인연락처, 배송메세지
				console.dir("결제하려는 userID : "+document.getElementById("userId").value);
				console.dir("결제하려는 상품 NO : "+payProds);
				console.dir("주문자 : " + document.getElementById("name").value);
				console.dir("수령인 : "+document.getElementById("respName").value);
				console.dir("배송주소 : "+address);
				console.dir("수령인 연락처 : "+document.getElementById("respPhone").value);
				console.dir("배송메세지 : "+document.getElementById("respMSG").value);
				
				var data = JSON.stringify({
						"userId" : document.getElementById("userId").value,
						"payProdNoArr" : payProds,
						"payProdCount" : payProdCounts,
						"userName" : document.getElementById("name").value,
						"respName" : document.getElementById("respName").value,
						"respAddress" : address,
						"respPhone" : document.getElementById("respPhone").value,
						"respMsg" : document.getElementById("respMSG").value,
						"totalPrice" : document.getElementById("totalPrice").value
				});
				
				var xhr = new XMLHttpRequest();
				xhr.open("POST","http://localhost:8090/addOrder",true);
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.send(data);
				xhr.onload = function(){
					var x = xhr.responseText;
					console.dir(x);
					if(x==1){
						
					alert("주문이 완료되었습니다.");
					location.href="http://localhost:8090/orderResult";
					}
				}
				}
				
				return false;
			}		
			
			
		</script>
	</div>
	<hr>


	<form action="/addOrder" method="post" onsubmit="return false;">
		<div id="orderInfo">
		주문자 : <input type="text" class="form-control" name="name" id="name"><br>
				<input type="hidden" name="user_id" id="userId" value="${userId}">
		수령인 : <input type="text" class="form-control" id="respName" placeholder="수령하는 사람의 이름을 적어주세요"><br>
		수령 주소 : <input name="address1" class="form-control" type="text" id="sample4_postcode" placeholder="우편번호" size="1" readonly="readonly">
				<input type="button" class="btn btn-dark" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
				<input name="address2" class="form-control" type="text"	id="sample4_roadAddress" placeholder="도로명주소" size="50"><br> 
				<input name="address3" class="form-control" type="text" id="sample4_jibunAddress" placeholder="지번주소" size="50"> <br>
				<input name="address4" class="form-control" type="text" id="sample4_detailAddress" placeholder="상세주소" size="50"><br> 
				<input name="address5" class="form-control" type="text" id="refAddress" placeholder="참고주소" size="50"><br>
		수령인 휴대전화번호 : <input type="text" class="form-control" name="respPhone" id="respPhone"><br>
		배송 메세지 : <input type="text" class="form-control" id="respMSG" value="문앞에 놔주세요"><br>
		
		<button onclick="payment()" class="btn btn-dark">결제하기</button><br>
		</div>
	</form>
		
<div>
</div>
	</div>
</body>
</html>