<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import = "java.util.*" %>
	<%@ page import="semi.cart.*" %>
    <%@ page import="semi.product.*" %>
    <jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
    <jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- ------------------------------------------------장바구니 데이터 세팅 --------------------------------------------------------->
<%
String member_id=(String)session.getAttribute("session_member_id");
if(member_id==null || member_id.equals("")){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href="/semi_project/index.jsp";
	</script>
	<%
	return;
}
DecimalFormat df=new DecimalFormat("#,##0");
//결제창에서 가져올때 get param values
String product_num[]=request.getParameterValues("product_num");
String product_code[]=request.getParameterValues("product_code");
String product_color[]=request.getParameterValues("product_color");

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
</head>
<style>

</style>
<!-- 
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css"> 
-->
<link rel="stylesheet" type="text/css" href="/semi_project/css/cart/cartShowLayout.css">
<script>
function cartDelAll(){
	if(confirm('장바구니 삭제 하시겠습니까?')){
		location.href="cartDelAll.jsp";
	}
	return;
}
</script>
<body>
<%@ include file="/header/header.jsp"%>
<%@include file="/aside/aside.jsp"%>
	<div class="main_wrap">
		<div class="cart_wrap">
			<h3 class="title mt_20">
					장바구니
				</h3>
		
			<!-- 담은 상품 -->
			<table class="list_table"
				summary="담은 상품의 정보, 판매가, 수량, 할인금액, 결제 예정가, 적립금을 확인할 수 있습니다.">
				<caption>담은 상품<span class="CLS_basketTotalCount">(<%=arr.size() %>개)</span></caption>
				<colgroup>
					<col style="width: 65px">
					<col style="width: auto">
					<col style="width: 95px">
					<col style="width: 85px">
					<col style="width: 85px">
					<col style="width: 75px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" title="담은 상품 전체선택"
							class="allCheck" checked=""></th>
						<th scope="col">상품정보</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						<th scope="col">결제 예정가</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
				<%
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="6" align="center">장바구니가 없습니다.</td>
	</tr>
	<%
}else{
	int fcount=0; 
	int lgnum=0;
	String lgname="";
	String smname="";
	for(int i=0; i<arr.size(); i++){
		productidx[i]=arr.get(i).getProduct_idx();
		pd=pdao.productOne(productidx[i]);
		fcount++;
		smname=pdao.SmallcategoryName(pd.getSmallcategory_id());
		lgnum=pdao.LargecategoryId(pd.getSmallcategory_id(), smname);
		lgname=pdao.LargecategoryName(lgnum);
		///myweb/img/product/bags/backpack/O6FBBP38_BLACK_2_BLACK/O6FBBP38_BLACK_2_BLACK_1.jsp
	%>
					<tr>
						<td>
							<form name="form_0" method="post" action="../front/basket.php">
								<input name="checkProduct" class="checkProduct" value="286831"
									type="checkbox" checked="">
							</form>
						</td>
						<td class="info" width="500">
						<a href="#">
								<img src="/semi_project/img/product/<%=lgname%>/<%=smname%>/<%=pd.getProduct_code()%>_<%=pd.getProduct_color()%>/<%=pd.getProduct_img()%>.jpg" width="126">
						</a> 
						<span class="name"> 
						<a href="#">
									<%=pd.getProduct_name()%>&nbsp;<%=pd.getProduct_code()%>
									</a> <br>
									 <span class="option">색상 : <%=pd.getProduct_color() %></span>
						</span>
						</td>
						<td><strong><%=df.format(pd.getProduct_price())%>원</strong></td>
						<td>
							<form name="form<%=fcount%>">
								<div class="qty">
									<input type="text" name="payment_num<%=fcount %>" value="<%=arr.get(i).getCart_num()%>" size="1" readonly>
									 <a href="#" onclick="javascript:plus<%=fcount%>(1)">
									 <img src="/semi_project/img/btn/cart_qty_up.gif" alt="수량 1개 더하기"style="cursor: pointer">
									 </a> 
									<a href="#" onclick="javascript:minus<%=fcount%>(-1)">
									 <img src="/semi_project/img/btn/cart_qty_down.gif" alt="수량 1개 빼기" style="cursor: pointer">
									 </a>
								</div>
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
			document.cartOne<%=fcount%>.oneNum<%=fcount%>.value=y;
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
		var priceSumCom=document.getElementById("sumTotal").innerHTML;
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
		document.getElementById("sumTotal").innerHTML=priceTotal;
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
		var priceSumCom=document.getElementById("sumTotal").innerHTML;
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
		document.getElementById("sumTotal").innerHTML=priceTotal;
		//수량 result에 세팅하기
		var payNum=document.form<%=fcount%>.payment_num<%=fcount%>.value;
		document.result.cart_payment_num<%=fcount%>.value=payNum;
	}
	</script>
						</td>
						<td>
							<form name="priceForm<%=fcount%>">
	<input type="hidden" name="price<%=fcount%>" value="<%=pd.getProduct_price()%>">
	</form>
						<strong id="priceShow<%=fcount%>">
						<%=df.format(arr.get(i).getProduct_price()) %>원
						</strong></td>
						<td class="button" width="70">
							<script>
	function goCartPay<%=fcount%>(){
		var productPrice=document.cartOne<%=fcount%>.onePrice<%=fcount%>.value;
		var paymentNum=document.cartOne<%=fcount%>.oneNum<%=fcount%>.value;
		var cartidx=document.cartOne<%=fcount%>.oneCart<%=fcount%>.value;
		var count=document.cartOne<%=fcount%>.count.value;
		var productName=document.cartOne<%=fcount%>.product_name.value;
		var product_code=document.cartOne<%=fcount%>.product_code.value;
		var product_color=document.cartOne<%=fcount%>.product_color.value;
		document.cartOne<%=fcount%>.action="cartPay.jsp";
		document.cartOne<%=fcount%>.submit();
	}
	</script>
	<form name="cartOne<%=fcount%>">
	<input type="hidden" name="product_name" value="<%=pd.getProduct_name()%>">
	<input type="hidden" name="product_code" value="<%=pd.getProduct_code()%>">
	<input type="hidden" name="product_color" value="<%=pd.getProduct_color()%>">
	<input type="hidden" name="onePrice<%=fcount%>" value="<%=arr.get(i).getProduct_price()%>">
	<input type="hidden" name="oneNum<%=fcount%>" value="<%=arr.get(i).getCart_num()%>">
	<input type="hidden" name="oneCart<%=fcount%>" value="<%=arr.get(i).getCart_idx()%>">
	<input type="hidden" name="count" value="<%=fcount%>"><br>
	</form>
						<a href="javascript:goCartPay<%=fcount%>()" class="CLS_DirectBuyBtn" target="_self">
						<img src="/semi_project/img/btn/cart_buy_btn.gif" alt="바로구매">
						</a> 
						<a href="cartDel.jsp?cart_idx=<%=arr.get(i).getCart_idx()%>">
						<img src="/semi_project/img/btn/cart_remove_btn.gif" alt="삭제">
						</a>
						</td>
					</tr>
					<%
	}
}
%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" bgcolor="#fafafa">
							<div class="result_box">
								<%-- <span class="total"> <span class="txt">총 판매가</span> 
								<strong 	class="number"><span id="sum"><%=df.format(sum) %>원</span></strong>
								</span>
								<img class="icon" src="/semi_project/img/btn/cart_list_icon_plus.gif"  alt="+"> 
								<span class="total"> <span class="txt">총 배송비	</span> 
								<strong class="number">0 원</strong>
								</span> 
								<img class="icon" src="/semi_project/img/btn/cart_list_icon_equals.gif" alt="=">  --%>
								<span class="total_payment"> 
								<span class="txt">총 결제 금액</span> 
								<strong class="number"><span id="sumTotal" style="	margin-top: 5px;color: #E8380D;font-weight:bold;;font: 22px/1 "Tahoma""><%=df.format(sum) %></span><span>원</span></strong>
								</span>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="button_area">
				<div class="button_right">
					<a href="../front/login.php?buy=1&amp;chUrl=..%2Ffront%2Forder.php"></a>
					<a href="javascript:cartDelAll()" class="selectProduct btn_B wide">전체삭제</a>
					<a href="javascript:arrTrans()" class="allBuyProduct btn_A wide">전체상품 주문</a>
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
	
	document.payCheck.action="cartArrPay.jsp"
	document.payCheck.submit();
}
</script>
				</div>

</form>
			</div>
		</div>
	</div>
	<hr>
					<form name="result">
<%
int rcount=0;
for(int i=0; i<arr.size(); i++){
	rcount++;
	%>
	<input type="hidden" name="cart_product_price<%=rcount%>" value="<%=arr.get(i).getProduct_price()%>">
	<input type="hidden" name="cart_payment_num<%=rcount%>" value="<%=arr.get(i).getCart_num()%>">
	<input type="hidden" name="cart_cart_idx<%=rcount%>" value="<%=arr.get(i).getCart_idx()%>">
	<input type="hidden" name="cart_product_idx<%=rcount%>" value="<%=arr.get(i).getProduct_idx()%>"><br>
	<%
}
%>
</form>
	<form name="payCheck">
<%
int pcount=0;
for(int i=0; i<arr.size(); i++){
	pcount++;
	pd=pdao.productOne(productidx[i]);
	%>
	<input type="hidden" name="product_name" value="<%=pd.getProduct_name()%>">
	<input type="hidden" name="product_code" value="<%=pd.getProduct_code()%>">
	<input type="hidden" name="product_color" value="<%=pd.getProduct_color()%>">
	<input type="hidden" name="product_price<%=pcount%>" value="<%=arr.get(i).getProduct_price()%>">
	<input type="hidden" name="payment_num<%=pcount%>" value="<%=arr.get(i).getCart_num()%>">
	<input type="hidden" name="cart_idx<%=pcount%>" value="<%=arr.get(i).getCart_idx() %>">
	<input type="hidden" name="product_idx<%=pcount%>" value="<%=arr.get(i).getProduct_idx()%>"><br>
	<%
}
%>
<input type="hidden" name="member_id" value="<%=member_id%>">
</form>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>