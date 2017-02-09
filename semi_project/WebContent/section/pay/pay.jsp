<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@page import="java.text.DecimalFormat"%>
    <%@ page import="semi.member.*" %>
    <%@ page import="semi.product.*" %>
    <jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
    <jsp:useBean id="mdao" class="semi.member.MemberDAO" scope="session"/>
    <jsp:useBean id="mt" class="semi.member.MemberDTO" scope="session"/>
    <jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
<%
request.setCharacterEncoding("utf-8");
String member_id=(String)session.getAttribute("session_member_id");
System.out.println("pay.jsp BEFORE id="+member_id);
if(member_id==null|| member_id.equals("")){
%>
<script>
window.alert('로그인 후 이용바랍니다.');
location.href="/semi_project/index.jsp";
</script>
<%
return;
}
MemberDTO mdto=mdao.memberGet(member_id);
DecimalFormat df=new DecimalFormat("#,##0");
String product_nums[]=request.getParameterValues("product_num");
String product_code[]=request.getParameterValues("product_code");
String product_color[]=request.getParameterValues("product_color");
int product_num[]=new int[product_nums.length];
ProductDTO pdto=null;
for(int i=0; i<product_nums.length; i++){
product_num[i]=Integer.parseInt(product_nums[i]);
pdto=pdao.getIdx(product_code[i], product_color[i]);
}
int cartSum=0;
int cartSunNum=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<link rel="stylesheet" type="text/css" href="/semi_project/css/cart/cartShowLayout.css">
<body>
<%@ include file="/header/header.jsp"%>
	<div class="main_wrap">
		<div class="cart_wrap">
				<h3 class="title mt_20">
					주문/결제
				</h3>
				<form name="pay" action="" method="post">
			<div class="cart_order_wrap">

				<!-- 주문 상품 -->
				<table class="list_table"
					summary="담은 상품의 정보, 판매가, 수량, 할인금액, 결제 예정가, 적립금을 확인할 수 있습니다.">
					<caption>01. 주문 상품</caption>
					<colgroup>
						<col style="width: auto">
						<col style="width: 95px">
						<col style="width: 85px">
						<col style="width: 95px">
						<col style="width: 85px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상품정보</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">결제 예정가</th>
						</tr>
					</thead>
					<tbody>
					<%
if(pdto.getProduct_name()==null || pdto.getProduct_name().equals("")){
	%>
	<tr>
	<td colspan="4" align="center">선택한 상품이 없습니다.</td>
	</tr>
	<%
	return;
}else{
	int lgnum=0;
	String lgname="";
	String smname="";
	for(int i=0; i<product_num.length; i++){
		pdto=pdao.getIdx(product_code[i], product_color[i]);
	smname=pdao.SmallcategoryName(pdto.getSmallcategory_id());
	lgnum=pdao.LargecategoryId(pdto.getSmallcategory_id(), smname);
	lgname=pdao.LargecategoryName(lgnum);
	cartSum+=product_num[i]*pdto.getProduct_price();
	cartSunNum+=product_num[i];
%>
						<tr>
							<td class="info"><a
								href="#">
									<img src="/semi_project/img/product/<%=lgname%>/<%=smname%>/<%=pdto.getProduct_code()%>_<%=pdto.getProduct_color()%>/<%=pdto.getProduct_img()%>.jpg"
									width="126" height="126">
							</a> <span class="name"> <a
									href="#" style="color:#585858">
									<%=pdto.getProduct_name() %>&nbsp;<%=pdto.getProduct_code() %></a> <br> <span class="option">옵션 : <%=pdto.getProduct_color() %>
									</span><span class="option">(<%=pdto.getProduct_num() %>개&nbsp;0원)</span>
							</span></td>
							<td><strong><%=df.format(pdto.getProduct_price()) %></strong></td>
							<td><%=product_num[i]%></td>
							<td><%=df.format(pdto.getProduct_price()*product_num[i]) %></td>
						</tr>
						<%
}
}
%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" bgcolor="#fafafa">
								<div class="result_box">
									<span class="total"> <span class="txt">총 판매가</span> <strong
										class="number"><%=df.format(cartSum) %>원</strong>
									</span>
									<img class="icon" src="/semi_project/img/btn/cart_list_icon_plus.gif"
										alt="+"> <span class="total"> <span class="txt">총
											배송비</span> <strong class="number" id="delivery_price2">0 원</strong>
									</span> <img class="icon" src="/semi_project/img/btn/cart_list_icon_equals.gif"
										alt="="> <span class="total_payment"> <span
										class="txt">총 결제 금액</span> <strong class="number"
										id="price_sum2"><%=df.format(cartSum) %><span>원</span></strong>
									</span>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				<!-- // 주문 상품 -->

				<div class="button_area">
					<a href="../front/basket.php" target="_self"><img
						src="/semi_project/img/btn/cart_order_move_btn.gif" alt="장바구니로 이동"></a>
				</div>
				<div class="order_area" style="margin-bottom:30px;">
					<!-- 고객정보 -->
					<div class="orderer_area">
						<table class="info_table"
							summary="주문자명, 주소, 휴대폰 번호, 이메일을 작성할 수 있습니다.">
							<caption>01. 고객정보</caption>
							<colgroup>
								<col style="width: 121px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">주문자명 분</th>
									<td class="name"><input type="text" name="member_name_temp"
										value="<%=mdto.getMember_name() %>" readonly="" style="font-weight: bold" required=""
										msgr="주문하시는분의 이름을 적어주세요"></td>
								</tr>
								<tr>
									<th scope="row">휴대폰번호</th>
									<td class="phone"><input type="text" name="member_tel_temp"
										value="<%=mdto.getMember_tel()%>" size="20" maxlength="20" required=""
										onkeyup="strnumkeyup(this)" msgr="휴대폰 번호를 입력하세요."></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td class="email"><input type="hidden" name="member_email"
										class="CLS_email_addr" value="<%=mdto.getMember_email() %>" required="">
										<input type="text" class="CLS_email_head" value=""
										required="" title="이메일 아이디를 입력하세요.">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- // 고객정보 -->

					<!-- 배송지정보 -->
					<div class="address_area">
						<table class="info_table"
							summary="수령자명, 주소, 전화번호, 휴대폰번호, 이메일, 배송 메시지를 작성할 수 있습니다.">
							<colgroup>
								<col style="width: 121px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">수령자명</th>
									<td class="name"><input type="text" name="member_name"
										required="" msgr="주문하시는 분 이름을 입력하세요."> 
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td class="address">
										 <input class="margin_input" name="raddr1" id="payment_addr"
										type="text" required="" value="<%=mdto.getMember_addr()%>" msgr="상세주소를 입력하세요.">
									</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td class="phone"><input type="text" name="payment_tel"
										maxlength="20" onkeyup="strnumkeyup(this)" required=""
										msgr="전화번호 앞 자리를 입력하세요."></td>
								</tr>
								<tr>
									<th scope="row">휴대폰번호</th>
									<td class="phone"><input type="text" name="member_tel"
										maxlength="20" onkeyup="strnumkeyup(this)" required=""
										msgr="휴대폰 번호 앞 자리를 입력하세요." value="<%=mdto.getMember_tel()%>"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 결제하기 -->
					<div class="payment_area">
						<h3>03. 결제하기</h3>
						<div class="content">
							<input type="hidden" name="total_sum" value="692600">
							<ul>
								<li><span class="txt"><strong>총 상품가격</strong></span> <span
									class="price"> <strong id="paper_goodsprice"><%=df.format(cartSum) %>원</strong>
								</span></li>
								<li><span class="txt">쿠폰</span> <span
									class="price CLS_saleCoupon">0원</span></li>
								<li><span class="txt">마일리지</span> <span
									class="price CLS_saleMil">0원</span></li>
								<li><span class="txt">즉시적립</span> <span
									class="price CLS_beforehand_reserve">0원</span></li>
								<li><span class="txt">배송비</span> <span
									class="price order_price_style02"> <font
										id="delivery_price">0</font>원
								</span></li>
							</ul>
							<p class="sum">
								<span class="txt">최종 결제금액</span> <span class="price"> <strong
									id="price_sum"><%=df.format(cartSum) %></strong>원
								</span>
							</p>
						</div>
						<div class="button_box">
							<div id="paybuttonlayer" name="paybuttonlayer"
								style="display: block;">
								<script>
								function submit(){
									document.pay.action="pay_complete.jsp"
									document.pay.submit();
								}
								function cancel(){
									window.alert('취소하였습니다.');
									location.href="/semi_project/index.jsp";
								}
								</script>
								<a href="javascript:submit()"
									onmouseover="window.status='결제';return true;" target="_self"
									class="btn_A" style="width: 130px">결제하기</a> <a
									href="javascript:cancel()"
									onmouseover="window.status='취소';return true;" target="_self"
									class="btn_B" style="width: 130px">취소하기</a>
							</div>
							<div id="payinglayer" name="payinglayer" style="display: none;">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tbody>
										<tr>
											<td align="center"><img
												src="../images/common/paying_wait.gif" border="0"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- // 결제하기 -->
<input type="hidden" name="member_id" value="<%=member_id%>">
<input type="hidden" name="product_idx" value="<%=pdto.getProduct_idx()%>">
<input type="hidden" name="payment_num" value="<%=cartSunNum%>">
<input type="hidden" name="product_name" value="<%=pdto.getProduct_name()%>">
<input type="hidden" name="product_color" value="<%=pdto.getProduct_color()%>">
<input type="hidden" name="product_code" value="<%=pdto.getProduct_code()%>">
<input type="hidden" name="payment_totalprice" value="<%=cartSum%>">
</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>