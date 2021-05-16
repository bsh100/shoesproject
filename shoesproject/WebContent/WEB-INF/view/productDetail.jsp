<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String uid = (String)session.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세 페이지</title>
<link rel="stylesheet" href="/css/productDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
      var currentcolorsize = []; // 이미 추가되어 있는 옵션들 ex) [ "blue260", "red250" ]
   
function deleteRow(a){
   var tr = a.parentElement.parentNode;
   console.dir(document.getElementById('cs').innerText);
   var cs = document.getElementById('cs').innerText.replace(" / ","");
   console.dir(cs);
   currentcolorsize.indexOf(cs)
   currentcolorsize.splice(cs,1);
   tr.parentElement.removeChild(tr);
   console.dir(document.getElementById('totalPrice'));
   
}

   $(function() {
      var newcolorsize = ""; //  새로 추가할려는 옵션 ex) blue260
      var cartColor = [];
      var cartSize = [];
      var cartName = document.getElementById("prodName1").innerText;
      var cartNo = [];
      var cartCount = [];
      
      
       
      $("#order").on("click",function(){
         
         if("<%=uid%>" == "null"){
               alert("로그인이 필요한 서비스 입니다.");
               location.href="http://localhost:8090/login";
              return false; 
         }
         
            cartCount = [];
            for(i=0; i < $(".count").length; i++){
               
               cartCount.push($(".count").eq(i).val());
            } 
            
            var abc = JSON.stringify({
                  "prodNo" : cartNo,
                  "count" : cartCount
            });
            console.dir(abc);
            var xhr = new XMLHttpRequest();
            xhr.open("post","http://localhost:8090/order/atProdDetail",true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(abc);
            xhr.onload = function(){
               console.dir(xhr.responseText);
               if(xhr.responseText == ""){
                  location.href="http://localhost:8090/order";
                  }else{
                     alert(xhr.responseText);        
                  }       
            }
            
         });
       
      
      
      
      /* Pcolor가 셀렉트 됐을시 동작 */
      $("#Psize").change(function() {
         
         
         var Pcolor = $("#Pcolor option:selected").text();
         var Psize = $("#Psize option:selected").text();
            newcolorsize = Pcolor + Psize;
            
         console.dir($("#Pcolor option:selected").text());   
            
            /* console.dir(newcolorsize);
            console.dir(currentcolorsize); */
         if(Pcolor != "-옵션을 선택해주세요-" && Psize != "-옵션을 선택해주세요-" && Psize !=null){
            /* console.dir(currentcolorsize.includes(newcolorsize)); */
            if(!currentcolorsize.includes(newcolorsize)){
            
            var t = $("#cartList");
            var addtext= "";
            addtext += "<tr>";
            addtext += "<input type='hidden' name='prodName' value='${dto.prodName}'>"
            addtext += "<input type='hidden' name='prodColor' value='"+ Pcolor +"'>"
            addtext += "<input type='hidden' name='prodSize' value='"+ Psize +"'>"
            addtext += "<td id='cs' class='tdcolorsize'>"+ Pcolor +    " / " + Psize + "</td>";
            // input type text disable value = Pc , Ps 각각
            addtext += "<td><input id='c' class='count' type='number' name='count' value='1' min='1' ></td>";
            addtext += "<td class='p' id='p' >${dto.prodPrice }</td>";
            addtext += "<td><button type='button' onclick = 'deleteRow(this)'>X</button></td>"
            addtext += "</tr>";
                  
            t.append(addtext);
            //console.dir($("#c"+num+""));
            //console.dir(t.children().last().children().last().children().last());
            
            currentcolorsize.push(newcolorsize);
            /* cartColor.push(Pcolor);
            cartSize.push(Psize); */
            var vCount = $(".count");
            var totalV = 0;
            for(var i=0; i<vCount.length; i++){
               totalV += ($(".count").eq(i).val())*1;
            }
               var PP = document.getElementById("prodPrice").innerText;
               $("#totalPrice").text("Total: "+totalV*PP+"원");
            
            var form = {
                  "prodColor" : Pcolor,
                  "prodSize" : Psize,
                  "prodName" : cartName
            }
            jQuery.ajaxSettings.traditional = true;

            $.ajax({ 
               url :'/admin/getNo',
               type : 'get',
               dataType : 'json',
               data : form,
               success: function(data){ 
                  console.log(data);
                  cartNo.push(data);
                  console.dir(cartNo);
                  } 
               });

         }else{
            alert("해당 옵션의 상품이 존재합니다.");
         }
            
            
            $(".count").on('keyup mouseup', function(a){
               var y = a.currentTarget.value;
               console.dir(a.currentTarget.value);
               var x = $("#prodPrice").text();
               console.dir(x);
               console.dir(a.currentTarget.parentNode.nextElementSibling.innerText); 
               /* a.currentTarget.parentNode.parentNode.lastChild.innerText += (x*1)*(y*1); */
                
               a.currentTarget.parentNode.nextElementSibling.innerText = (x*1)*(y*1);
               
               var vCount = $(".count");
               var totalV = 0;
               for(var i=0; i<vCount.length; i++){
                  totalV += ($(".count").eq(i).val())*1;
               }
                  var PP = document.getElementById("prodPrice").innerText;
                  $("#totalPrice").text("Total: "+totalV*PP+"원");
            });
         }
      });
      //장바구니 전송
      $("#cartForm").on("submit",function(){
         if(confirm("장바구니에 추가하시겠습니까?")){
            
            if("<%=uid%>" == "null"){
                  alert("로그인이 필요한 서비스 입니다.");
                  location.href="http://localhost:8090/login";
               }
         
         cartCount = [];
         for(i=0; i < $(".count").length; i++){
            
            cartCount.push($(".count").eq(i).val());
         } 
         console.dir($(".count"));
         console.dir($(".count").length);
         console.dir($("#c").eq(0).val());
         console.dir(cartCount);
         console.dir(cartNo);
         
          var formData  = $("#cartForm").serialize(); 
         var cartdata = {
               "prodNo" : cartNo,
               "count" : cartCount
         }
         
         var jsondata = JSON.stringify(cartdata);
         $.ajax({
            url:"/cart/addCart",
            type:"post",
            data:jsondata,
            contentType: 'application/json',
            dataType : 'json',
            success:function(resp){
               console.log(resp);
               
            },
            error:function(e){
               console.log(e);
            }
            
         });
      }
         return false;
      });
   });
            
</script>

</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="detailMain">
      <div class="imgdiv">
          <img src="${pageContext.request.contextPath}/images/${dto.pictureUrl}" alt="파일이없음" width="620px"
          height="620px">
      </div>

      <div class="detaildiv">
        <div class="haedname">
          <h3 id="prodName1">${dto.prodName}</h3>
        </div>

        <div class="tableDiv">
          <table id="descTable">
            <tr>
                <th class="descTh">판매가</th>
                <td id="prodPrice" class="descTd">${dto.prodPrice }</td>
            </tr>

            <tr>
                <th class="descTh">적립금</th>
                <td class="descTd">${dto.prodPrice }/100</td>
            </tr>

            <tr>
                <th class="descTh">설명</th>
                <td class="descTd">${dto.prodDescription }</td>
            </tr>

            <tr>
              <th class="descTh">배송방법</th>
              <td class="descTd">택배</td>
            </tr>

            <tr>
              <th class="descTh">배송비</th>
              <td class="descTd">2,500원 (50,000원 이상 구매 시 무료)</td>
            </tr>
          </table>
        </div>

        <div class="tableDiv2">
          <table class="selectTable">
            <tr>
               <th class="descTh">색상</th>
               <td>
            <script type="text/javascript">
                   window.addEventListener("DOMContentLoaded",function(){
                      document.getElementById("Pcolor").onchange = function(){
                         
                         
                         console.dir(document.getElementById("Pcolor").value);
                         var selectedColor = document.getElementById("Pcolor").value;
                         var url = "http://localhost:8090/admin/getSize?color="+selectedColor+"&prodName="+document.getElementById("prodName1").innerText;
                         var xhr = new XMLHttpRequest();
                         xhr.onload = function(){
                            var sizes = JSON.parse(xhr.responseText);
                            var text = "";
                           console.dir(sizes);
                           text += "<option selected >-옵션을 선택해주세요-</option>";
                           for(var i=0;i<sizes.length;i++){
                              
                              text += "<option>"+sizes[i]+"</option>";
                              
                           }
                            document.getElementById("Psize").innerHTML = text;
                           
                         }
                         xhr.open("get",url,true);
                         xhr.send();
                      }
                   });
                   </script>
                  <select id="Pcolor" class="CandSSelect">
                  <option>-옵션을 선택해주세요-</option>
                  <c:forEach var="color" items="${colorsize}">
                  <option value="${color.prodColor}">${color.prodColor}</option>
                  </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
               <th class="descTh">사이즈</th>
               <td>
                  <select id="Psize" class="CandSSelect">


                  </select>
               </td>
            </tr>
          </table>
        </div>

        <div class="guideArea">
          <p class="info">최소주문수량 1개 이상</p>
        </div>
        
        <div class="totalProducts">
           <form id="cartForm">
               <table class="productsTable" id="cartList">
                  <tr>
                     <th>color&size</th>
                     <th>상품수</th>
                     <th>가격</th>
                     <th></th>
                  </tr>

                     
               </table>
               <p id="totalPrice" class="totalPrice"></p>
        </div>
        <div>
               
                     <input class="finallbtn" type="submit" value="장바구니에 담기">
                    </form> 
                    <button class="finallbtn"><a href="${pageContext.request.contextPath}/list">상품목록</a></button>
                    <button class="finallbtn" type="button" id="order">주문</button>
        </div>
      </div>
    </div>
</body>
</html>