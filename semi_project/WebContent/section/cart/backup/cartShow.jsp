<%@page import="java.text.DecimalFormat"%>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="seung.cart.*" %>
    <%@ page import="seung.product.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="cdao" class="seung.cart.CartDAO" scope="session"/>
    <jsp:useBean id="pdao" class="seung.product.ProductDAO" scope="session"/>
<!-- ------------------------------------------------장바구니 데이터 세팅 --------------------------------------------------------->
<%
String member_id=(String)session.getAttribute("user_id");
DecimalFormat df=new DecimalFormat("#,##0");

/**장바구니 개수 구현: 개수 구하고 header.jsp에 붙힘 */
ArrayList<CartDTO> arr=cdao.cartList(member_id);
int sum=cdao.cartSum(member_id);
int cartNumi=arr.size();
String cartNum=String.valueOf(cartNumi);
session.setAttribute("cart", cartNum);

/**장바구니 개수와 유형에 따른 product info 부르기*/
int productidx[]=new int[arr.size()];
ProductDTO pd=null;
int cartNumber=1;
%>    
<!-- ----------------------------------------------END(장바구니 데이터 세팅) --------------------------------------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<style>
table{
width:680px;
margin:0 auto;
border:1px solid black;
}
table tr, th, td{
text-align:center;
border:1px solid black;
}
</style>
<!-- ----------------------------------------------장바구니 전체 삭제 확인 창 --------------------------------------------------->
<script>
function cartDelAll(){
	if(confirm('장바구니 삭제 하시겠습니까?')){
		location.href="cartDelAll.jsp";
	}
	return;
}
</script>
<!-- ----------------------------------------------END(장바구니 전체 삭제 확인 창) --------------------------------------------------->
<body>
<%@ include file="/header.jsp"%>
<section>
<article>
<!-- ------------------------------------------------장바구니 테이블 --------------------------------------------------------->
<table>
<thead>
<tr>
<th>상품번호</th>
<th>상품사진</th>
<th>상품정보</th>
<th>판매가</th>
<th>수량</th>
<th>결제예정가</th>
<th>선택</th>
</tr>
</thead>

<tbody>
<%
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="7" align="center">장바구니가 없습니다.</td>
	</tr>
	<%
}else{
	int fcount=0; 
	for(int i=0; i<arr.size(); i++){
		productidx[i]=arr.get(i).getProduct_idx();
		pd=pdao.productOne(productidx[i]);
		fcount++;
		System.out.println("!!!"+pd.getProduct_price());
	%>
	<tr>
	<td><%=pd.getProduct_idx()%></td>
	<td><img width="" src="/myweb/img/product/<%=pd.getProduct_img() %>.jpg"></td>
	<td><%=pd.getProduct_name() %> / <%=pd.getProduct_color() %> /<%=pd.getProduct_code() %></td>
	<td><%=df.format(pd.getProduct_price()) %></td>
	<td>
	<form name="form<%=fcount %>">
	<input type="text" name="payment_num<%=fcount %>" value="<%=arr.get(i).getCart_num()%>" size="1" readonly>
	<a href="#" onclick="javascript:plus<%=fcount%>(1)">up</a><br>
	<a href="#" onclick="javascript:minus<%=fcount%>(-1)">down</a>
	</form>
	<script>
	function plus<%=fcount%>(num){
		var x = document.form<%=fcount%>.payment_num<%=fcount%>.value;
		var y = Number(x)+num;
		var z=0;
		if(y>9){
			y=9;
		}else{
			document.form<%=fcount%>.payment_num<%=fcount%>.value=y;
			priceChangePlus<%=fcount%>(y);
			document.cartOne<%=fcount%>.oneNum<%=fcount%>.value=y;
		}
	}
	
	function minus<%=fcount%>(num){
		var x = document.form<%=fcount%>.payment_num<%=fcount%>.value;
		var y = Number(x)+num;
		var z=0;
		if(y<1){
			y=1;
		}else{
			document.form<%=fcount%>.payment_num<%=fcount%>.value=y;
			priceChangeMinus<%=fcount%>(y);
			document.cartOne<%=fcount%>.oneNum<%=fcount%>.value;
		}
	}
	
	function priceChangePlus<%=fcount%>(y){
		//가격 result에 세팅하기
		var x = document.priceForm<%=fcount%>.price<%=fcount%>.value;
		var priceSet = Number(x)*y;
		var priceShow="priceShow<%=fcount%>";
		document.getElementById(priceShow).innerHTML=priceSet;
		//1개 장바구니 주문시 가격추가
		document.cartOne<%=fcount%>.onePrice<%=fcount%>.value=priceSet;
		document.result.cart_product_price<%=fcount%>.value=priceSet;
		//가격 콤마 추가
		var y = document.getElementById(priceShow).innerHTML;
		var priceSetCom = y.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		document.getElementById(priceShow).innerHTML=priceSetCom;
		//총합 올리기-현재 총액 불러오기
		var PriceSetting = Number(x);
		var priceSumCom=document.getElementById("sum").innerHTML;
		//현재 총액 콤마지우기
		var str1=String(priceSumCom);
		var priceSumStr = str1.replace(/[^\d]+/g, '');
		var priceSum = Number(priceSumStr);
		//변경사항에 따른 총액 변환
		priceSum+=PriceSetting;
		//콤마채워서 표시하기
		var sumStr=String(priceSum);
		var priceTotal = sumStr.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		document.getElementById("sum").innerHTML=priceTotal;
		//수량 result에 세팅하기
		var payNum=document.form<%=fcount%>.payment_num<%=fcount%>.value;
		document.result.cart_payment_num<%=fcount%>.value=payNum;
	}
	
	function priceChangeMinus<%=fcount%>(y){
		//가격 result에 세팅하기
		var x = document.priceForm<%=fcount%>.price<%=fcount%>.value;
		var priceSet = Number(x)*y;
		var priceShow="priceShow<%=fcount%>";
		document.getElementById(priceShow).innerHTML=priceSet;
		//1개 장바구니 주문시 가격추가
		document.cartOne<%=fcount%>.onePrice<%=fcount%>.value=priceSet;
		document.result.cart_product_price<%=fcount%>.value=priceSet;
		//가격 콤마 추가
		var y = document.getElementById(priceShow).innerHTML;
		var priceSetCom = y.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		document.getElementById(priceShow).innerHTML=priceSetCom;
		//총합 올리기
		//총합 올리기-현재 총액 불러오기
		var PriceSetting = Number(x);
		var priceSumCom=document.getElementById("sum").innerHTML;
		//현재 총액 콤마지우기
		var str1=String(priceSumCom);
		var priceSumStr = str1.replace(/[^\d]+/g, '');
		var priceSum = Number(priceSumStr);
		//변경사항에 따른 총액 변환
		priceSum-=PriceSetting;
		//콤마채워서 표시하기
		var sumStr=String(priceSum);
		var priceTotal = sumStr.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		document.getElementById("sum").innerHTML=priceTotal;
		//수량 result에 세팅하기
		var payNum=document.form<%=fcount%>.payment_num<%=fcount%>.value;
		document.result.cart_payment_num<%=fcount%>.value=payNum;
	}
	</script>
	</td>
	<td>
	<form name="priceForm<%=fcount%>">
	<input type="text" name="price<%=fcount%>" value="<%=pd.getProduct_price()%>">
	</form>
	<div id="priceShow<%=fcount%>">
	<%=df.format(arr.get(i).getProduct_price())%>
	</div>
	</td>
	<td>
	<!-- --------------------------------------------------- 한개 장바구니 주문 ------------------------------------------------------ -->
	<script>
	function goCartPay<%=fcount%>(){
		var productPrice=document.cartOne<%=fcount%>.onePrice<%=fcount%>.value;
		var paymentNum=document.cartOne<%=fcount%>.oneNum<%=fcount%>.value;
		var cartidx=document.cartOne<%=fcount%>.oneCart<%=fcount%>.value;
		var count=document.cartOne<%=fcount%>.count.value;
		document.cartOne<%=fcount%>.action="cartPay.jsp";
		document.cartOne<%=fcount%>.submit();
	}
	</script>
	<form name="cartOne<%=fcount%>">
	<input type="hidden" name="onePrice<%=fcount%>" value="<%=arr.get(i).getProduct_price()%>">
	<input type="hidden" name="oneNum<%=fcount%>" value="<%=arr.get(i).getCart_num()%>">
	<input type="hidden" name="oneCart<%=fcount%>" value="<%=arr.get(i).getCart_idx()%>">
	<input type="hidden" name="count" value="<%=fcount%>"><br>
	</form>
	<input type="button" name="del_<%=fcount%>" value="삭제" onclick="location='cartDel.jsp?cart_idx=<%=arr.get(i).getCart_idx()%>'">
	<input type="button" name="order_<%=fcount%>" value="주문" onclick="javascript:goCartPay<%=fcount%>()">
	<!-- --------------------------------------------------- END(한개 장바구니 주문) ------------------------------------------------------ -->
	</td>
	</tr>
	<%
	}
}
%>
</tbody>
<tr>
<td colspan="7">
<script>

</script>
총합계금액: <span id="sum"><%=df.format(sum)%>원</span>
<input type="button" value="CalArr" onclick="javascript:arrTrans()">
<input type="button" value="Del All" onclick="javascript:cartDelAll()">
</td>
</tr>
</table>
</article>
<form name="result">
<%
int rcount=0;
for(int i=0; i<arr.size(); i++){
	rcount++;
	%>
	<input type="text" name="cart_product_price<%=rcount%>" value="<%=arr.get(i).getProduct_price()%>">
	<input type="text" name="cart_payment_num<%=rcount%>" value="<%=arr.get(i).getCart_num()%>">
	<input type="text" name="cart_cart_idx<%=rcount%>" value="<%=arr.get(i).getCart_idx()%>">
	<input type="text" name="cart_product_idx<%=rcount%>" value="<%=arr.get(i).getProduct_idx()%>"><br>
	<%
}
%>
</form>
<!--  ----------------------------------------------//END(장바구니 테이블)  ---------------------------------------------- -->
<!-- ----------------------------------------------------------cartArrPay.jsp 값 넘기기 --------------------------------------------------------->
<hr>
<script>

function arrTrans(){
	//장바구니 수
	var length=document.result.elements.length;
	var plength=length/4;
	//배열생성
	var cartPrice = new Array(plength);
	var cartNum = new Array(plength);
	var cidx= new Array(plength);
	var pidx=new Array(plength);
	
	//input name 가져오기
	var PriceStr="";
	var NumStr="";
	var CidxStr="";
	var PidxStr="";
	
	//input name에 값 배열에 집어넣기
	for(var i = 0 ; i<plength; i++){
		PriceStr="cart_product_price"+(i+1);
		NumStr="cart_payment_num"+(i+1);
		CidxStr="cart_cart_idx"+(i+1);
		PidxStr="cart_product_idx"+(i+1);
		cartPrice[i]=document.result.elements.namedItem(PriceStr).value;
		cartNum[i]=document.result.elements.namedItem(NumStr).value;
		cidx[i]=document.result.elements.namedItem(CidxStr).value;
		pidx[i]=document.result.elements.namedItem(PidxStr).value;
	}
	
	//배열에 넣은 값을 보낼 form 안 name 변경
	var priceS ="";
	var PayS ="";
	var cIdx="";
	var pIdx="";
	//배열에 넣은 값을 보낼 form 안에 대입
	for(var i = 0; i<plength; i++){
		priceS = "product_price"+(i+1);
		payS= "payment_num"+(i+1);
		cIdx="cart_idx"+(i+1);
		pIdx="product_idx"+(i+1);
		document.payCheck.elements.namedItem(priceS).value=cartPrice[i];
		document.payCheck.elements.namedItem(payS).value=cartNum[i];
		document.payCheck.elements.namedItem(cIdx).value=cidx[i];
		document.payCheck.elements.namedItem(pIdx).value=pidx[i];
	}
	
	document.payCheck.action="/myweb/cart/cartArrToDB.jsp"
	document.payCheck.submit();
}
</script>
<form name="payCheck">
<%
int pcount=0;
for(int i=0; i<arr.size(); i++){
	pcount++;
	%>
	<input type="text" name="product_price<%=pcount%>" value="<%=arr.get(i).getProduct_price()%>">
	<input type="text" name="payment_num<%=pcount%>" value="<%=arr.get(i).getCart_num()%>">
	<input type="text" name="cart_idx<%=pcount%>" value="<%=arr.get(i).getCart_idx() %>">
	<input type="text" name="product_idx<%=pcount%>" value="<%=arr.get(i).getProduct_idx()%>"><br>
	<%
}
%>
<input type="hidden" name="member_id" value="<%=member_id%>">
</form>
<!--  ----------------------------------------------//END(값 넘기기)  ---------------------------------------------- -->
<%@ include file="/footer.jsp"%>
</body>
</html>