<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
</tr>
<tr>
	<td align="center">
<style>
div.cart_wrap table.list_table td div.updatebtn{width:31px;display:inline-block;float:right;margin-left:-15px;}
</style>
<!-- start container -->
<div id="container">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tbody>
	<tr>
		<td>
			<!-- 메인 컨텐츠 -->
			<div class="main_wrap">
				<div class="cart_wrap">
					<h3 class="title mt_20">
						장바구니
						<p class="line_map"><a class="on">장바구니</a> &gt; <a>주문/결제</a> &gt; <a>주문완료</a></p>
					</h3>
					<div class="info_area hide">
						<span class="name"> 님은  회원입니다.</span>
						<span class="coupon">쿠폰 : <strong>0</strong>개</span>
						<span class="point">적립금 : <strong>0</strong>원</span>
					</div>
					<!-- 담은 상품 -->
					<table class="list_table" summary="담은 상품의 정보, 판매가, 수량, 할인금액, 결제 예정가, 적립금을 확인할 수 있습니다.">
						<caption>담은 상품<span class="CLS_basketTotalCount">(1개)</span></caption>
						<colgroup>
							<col style="width:65px">
							<col style="width:auto">
							<col style="width:95px">
							<col style="width:85px">
							<!--<col style="width:85px" />
							<col style="width:95px" />-->
							<col style="width:85px">
							<col style="width:75px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" title="담은 상품 전체선택" class="allCheck" checked=""></th>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
								<th scope="col">수량</th>
								<!--<th scope="col">행사할인</th>-->
								<!--<th scope="col">회원할인</th>-->
								<th scope="col">결제 예정가</th>
								<!--<th scope="col">적립금</th>-->
								<th scope="col">선택</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<form name="form_0" method="post" action="../front/basket.php">
										<input type="hidden" name="mode">
										<input type="hidden" name="code" value="">
										<input type="hidden" name="productcode" value="001001001000000168">
										<input type="hidden" name="orgquantity" value="1">
										<input type="hidden" name="orgoption1" value="1">
										<input type="hidden" name="orgoption2" value="0">
										<input type="hidden" name="option1" value="1">
										<input type="hidden" name="option2" value="0">
										<input type="hidden" name="opts" value="0">
										<input type="hidden" name="brandcode" value="">
										<input type="hidden" name="assemble_list" value="">
										<input type="hidden" name="assemble_idx" value="0">
										<input type="hidden" name="package_idx" value="0">
										<input type="hidden" name="quantity" value="1">		<!-- 기존 수량값을 보관하는 변수이므로 건들면 안됨 -->

										<input type="hidden" name="temp_quantity" value="179000">		
			
										<input type="hidden" name="temp_row_sellprice" value="179000">

										<input name="checkProduct" class="checkProduct" value="286200" type="checkbox" checked="">
									</form>
								</td>
								<td class="info" width="500">
									<a href="../front/productdetail.php?productcode=001001001000000168">
																																<img src="../data/shopimages/product/0010010010000001683.jpg" width="126">
																			</a>
									<span class="name">
									<a href="../front/productdetail.php?productcode=001001001000000168">
										틴턴 크로스백 O6FBCB90									</a>
									<br>
									<span class="option">옵션 : PEWTER</span><span class="option">(1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   개&nbsp;0원)</span>									</span>
								</td>
								<td><strong>179,000</strong></td>
								<td>
									<form name="form_v_0">
																		<div class="qty">
										<!--<input type="text" name="quantity_v" value="1" title="수량을 입력하세요." readonly/>-->
										<input type="text" name="quantity_v" value="1" title="수량을 입력하세요." readonly="">
										<a href="javascript:change_quantity('up',0)"><img src="../img/button/cart_qty_up.gif" alt="수량 1개 더하기" style="cursor:pointer"></a>
										<a href="javascript:change_quantity('dn',0)"><img src="../img/button/cart_qty_down.gif" alt="수량 1개 빼기" style="cursor:pointer"></a>
									</div>
									<div class="updatebtn">
										<a href="javascript:CheckForm('upd',0)"><img src="../image/cart/c_modify_btn.gif" type="image"></a>
									</div>
									</form>
								</td>
																<td><strong>179,000</strong></td>
								<!--<td class="point"  width="110"><img src="../img/icon/cart_point_icon.gif" alt="적립금" />0</td>-->
								<td class="button" width="70">
									<a href="javascript:;" class="CLS_DirectBuyBtn" target="_self"><img src="../img/button/cart_buy_btn.gif" alt="바로구매"></a>
									<a href="javascript:;" class="CLS_WishlistBtn" target="_self"><img src="../img/button/cart_wishlist_btn.gif" alt="위시리스트"></a>
									<a href="javascript:CheckForm('del_chk','286200')"><img src="../img/button/cart_remove_btn.gif" alt="삭제"></a>
								</td>
							</tr>
						</tbody>
												<tfoot>
							<tr>
								<td colspan="9" bgcolor="#fafafa">
									<div class="result_box">
										<span class="total">
											<span class="txt">총 판매가</span>
											<strong class="number">179,000 원</strong>
										</span>
										<!--<img class="icon" src="../img/icon/cart_list_icon_minus.gif" alt="-" />-->
										<!--<span class="total">
											<span class="txt">총 할인금액</span>
											<strong class="number">179,000 원</strong>
										</span>-->
										<img class="icon" src="../img/icon/cart_list_icon_plus.gif" alt="+">
										<span class="total">
											<span class="txt">총 배송비</span>
											<strong class="number">0 원</strong>
										</span>
										<img class="icon" src="../img/icon/cart_list_icon_equals.gif" alt="=">
										<span class="total_payment">
											<span class="txt">총 결제 금액</span>
											<strong class="number">179,000<span>원</span></strong>
										</span>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
					<!-- // 담은 상품 -->

					<div class="button_area">
						<div class="button_left">
							<a href="javascript:;" target="_self"><img src="../img/button/cart_select_all_btn.gif" alt="전체선택" class="allCheckButton"></a>
							<a href="javascript:;" target="_self"><img src="../img/button/cart_select_cancel_btn.gif" alt="선택해제" class="allUnCheckButton"></a>
							<a href="javascript:basket_clear();" target="_self"><img src="../img/button/cart_delete_all_btn.gif" alt="전체삭제" class=""></a>
						</div>
						<div class="button_right">
						
							<a href="javascript:;" class="estimate_sheet  btn_B wide">견적서 출력</a>
							<!-- 추가--> 

							<a href="../" target="_self" class="btn_B wide">쇼핑 계속하기</a>
							<a href="../front/login.php?buy=1&amp;chUrl=..%2Ffront%2Forder.php"></a>
							<a href="javascript:;" class="selectProduct btn_B wide">선택상품 주문</a>
							<a href="javascript:;" class="allBuyProduct btn_A wide">전체상품 주문</a>
						</div>
					</div>
										<!-- 추천 -->
				<div class="new_goods4ea">	
					<div class="recomm_area">
						<h3>추천!<span>다른 고객님들이 많이 구입하신 상품들</span></h3></div>
						<ul class="list" style="  margin-top: 20px; margin-bottom: 20px;">
														<li class="in_icon">
								<div>			
									<div class="goods_A">  
										<a href="#">						
										  
											<p class="img190"><img src="../data/shopimages/product/002001001000000015.jpg" "="" width="190" height="190" alt=""></p>
											<span class="subject">트리나 장지갑 O5SPLP07</span>
											<span class="price">
												<del>189,000원</del>&nbsp;
												69,000원											</span>
										</a>	
									</div>
																		<div class="layer_goods_icon" link_url="../front/productdetail.php?productcode=002001001000000015" style="display: none;">
										<p class="icon">
											<a href="javascript:;" link_url="../front/productdetail.php?productcode=002001001000000015" class="view" title="상세보기"></a>
											<a href="javascript:;" option_chk="3" cart_chk="002001001000000015" class="cart" title="장바구니"></a>
										</p>
									</div>
								</div>
							</li>
														<li class="in_icon">
								<div>			
									<div class="goods_A">  
										<a href="#">						
										  
											<p class="img190"><img src="../data/shopimages/product/001001006000000127.jpg" "="" width="190" height="190" alt=""></p>
											<span class="subject">[임직원]Queens O5FBCB61_CM</span>
											<span class="price">
												<del>298,000원</del>&nbsp;
												149,000원											</span>
										</a>	
									</div>
																		<div class="layer_goods_icon" link_url="../front/productdetail.php?productcode=001001006000000127" style="display: none;">
										<p class="icon">
											<a href="javascript:;" link_url="../front/productdetail.php?productcode=001001006000000127" class="view" title="상세보기"></a>
											<a href="javascript:;" option_chk="3" cart_chk="001001006000000127" class="cart" title="장바구니"></a>
										</p>
									</div>
								</div>
							</li>
														<li class="in_icon">
								<div>			
									<div class="goods_A">  
										<a href="#">						
										  
											<p class="img190"><img src="../data/shopimages/product/001001005000000012.jpg" "="" width="190" height="190" alt=""></p>
											<span class="subject">Reloy O4FBCL23_MB</span>
											<span class="price">
												<del>199,000원</del>&nbsp;
												199,000원											</span>
										</a>	
									</div>
																		<div class="layer_goods_icon" link_url="../front/productdetail.php?productcode=001001005000000012" style="display: none;">
										<p class="icon">
											<a href="javascript:;" link_url="../front/productdetail.php?productcode=001001005000000012" class="view" title="상세보기"></a>
											<a href="javascript:;" option_chk="3" cart_chk="001001005000000012" class="cart" title="장바구니"></a>
										</p>
									</div>
								</div>
							</li>
														<li class="in_icon">
								<div>			
									<div class="goods_A">  
										<a href="#">						
										  
											<p class="img190"><img src="../data/shopimages/product/001001004000000155.jpg" "="" width="190" height="190" alt=""></p>
											<span class="subject">[임직원]몰리백팩 O5FBBP29_NY</span>
											<span class="price">
												<del>259,000원</del>&nbsp;
												129,500원											</span>
										</a>	
									</div>
																		<div class="layer_goods_icon" link_url="../front/productdetail.php?productcode=001001004000000155" style="display: none;">
										<p class="icon">
											<a href="javascript:;" link_url="../front/productdetail.php?productcode=001001004000000155" class="view" title="상세보기"></a>
											<a href="javascript:;" option_chk="3" cart_chk="001001004000000155" class="cart" title="장바구니"></a>
										</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- // 추천 -->
				</div>
			</div>
			<!-- //메인 컨텐츠 -->
		</td>
	</tr>
	</tbody></table>
</div>
<!-- 장바구니로 이동 -->
<form name="form1" id="ID_goodsviewfrm" method="post" action="../front/basket.php">
	<input type="hidden" name="productcode"> 
</form>

<form name="productlist_basket" id="productlist_basket">
	<input type="hidden" name="productcode2" id="productcode2">
</form>

<!--견적서 출력-->
<form name="estimate_sheet_form" method="post">
	<input type="hidden" name="strBasket">
	<input type="hidden" name="rowid" value="">
</form>
<!---->
<!-- WIDERPLANET  SCRIPT START 2015.6.30 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",  	/*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
				 *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"22251",
		ty:"Cart",
		device:"web"
		,items:[{ i: "001001001000000168", t: "틴턴 크로스백 O6FBCB90" }]
	};
}));

</script>
<script type="text/javascript" async="" src="//astg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2015.6.30 -->
	</td>
</tr>
<form name="wishform" method="post" action="../front/confirm_wishlist_cart.php" target="confirmwishlist"></form>
<input type="hidden" name="basket_idx">
<form name="delform" method="post" action="/front/basket.php"></form>
<input type="hidden" name="mode">
<input type="hidden" name="code" value="">
<input type="hidden" name="productcode">

</tbody></table>
</body>
</html>