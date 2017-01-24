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
<tbody><tr>
	<td align="center">
<script type="text/javascript">
	$(function(){
		$('a.pop_benefit').click(function(){
			$('div.pop_member_benefit').css('display','block');
		});
		$('a.close').click(function(){
			$('div.pop_member_benefit').css('display','none');
		});
	});
</script>


		<div class="containerBody sub_skin">
		<!-- LNB -->
		<div class="left_lnb">
					<!-- LNB -->
		<div class="lnb_mypage">
			<h2><a href="#">MY PAGE</a></h2>
			<dl class="menu">
				<dt><a>주문정보</a></dt>
				<dd>
					<ul>
						<li><a href="../front/mypage_orderlist.php">· 주문/배송 조회</a></li>
						<li><a href="../front/mypage_cancellist.php">· 취소/교환/반품</a></li>
						<li><a href="../front/mypage_receipt.php">· 영수증/계산서 신청</a></li>
						<li><a href="../front/wishlist.php">· 위시리스트</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="menu">
				<dt><a>혜택정보</a></dt>
				<dd>
					<ul>
						<li><a href="../front/mypage_coupon.php">· 쿠폰</a></li>
						<li><a href="../front/mypage_reserve.php">· 적립금</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="menu">
				<dt><a>나의메모</a></dt>
				<dd>
					<ul>
						<li><a href="../front/mypage_personal.php">· 1:1문의</a></li>
						<li><a href="../front/mypage_review.php">· 상품평</a></li>
						<li><a href="../front/mypage_qna.php">· Q&amp;A</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="menu last">
				<dt><a>정보관리</a></dt>
				<dd>
					<ul>
						<li><a href="../front/mypage_usermodify.php">· 회원정보 수정/관리</a></li>
						<li><a href="../front/mypage_memberout.php">· 회원탈퇴 신청</a></li>
					</ul>
				</dd>
			</dl>
			<!--
			<dl class="menu donation last">
				<dt><a>기부</a></dt>
				<dd>
					<ul>
						<li><a  href="../front/mypage_donation.php">.기부</a></li>
					</ul>
				</dd>
			</dl>
			-->
		</div><!-- //LNB -->

			
		</div><!-- //LNB -->
		
		<!-- 내용 -->
		<div class="right_section mb_80">
			
			<h3 class="title mb_20">
				MY PAGE
				<p class="line_map"><a>홈</a> &gt; <a class="on">마이페이지</a></p>
			</h3>


			<!-- 최근주문정보 -->
			<div class="table_wrap">
				<h3>최근주문정보 <span class="total">( Total : <strong>0</strong> )</span></h3>
				<p class="table_info"><a href="../front/mypage_orderlist.php">&gt; 더보기</a></p>
				<table class="th_top">
					<colgroup>
						<col width="170"><col width="85"><col width="*px"><col width="145"><col width="100">
					</colgroup>
					<tbody><tr>
						<th>주문정보</th>
						<th colspan="2">상품정보</th>
						<th>옵션</th>
						<th>주문금액</th>
						<!--th>진행상태</th-->
					</tr>
											<tr>
							<td colspan="5" style="text-align:center;">주문이 없습니다.</td>
						</tr>	
									</tbody></table>
			</div><!-- //최근주문정보 -->

			<!-- 최근&관심상품 -->
			<div class="mypage_main_today hide">
				<div class="today">
					
					<div class="table_wrap">
						<h3>최근 본 상품 <span class="total">( Total : <strong>30</strong> )</span></h3>
						<!--p class="table_info"><a href="#">> 더보기</a></p-->
						<div class="today_wish">
													<ul class="my_main_today">
								<li class="goods_img">
									<a href="../front/productdetail.php?productcode=001001006000000213">
										<img src="../data/shopimages/product/001001006000000213.jpg" alt="">
									</a>
								</li>
								<li class="goods_info">
									<span class="name">
										<a href="../front/productdetail.php?productcode=001001006000000213">
											테일러 미니 O5NBCB08										</a>
									</span>
									<br>
									<span class="price">
																				<span>239,000 원</span>
																				239,000 원
									</span><br>
									<!--a href="#" class="btn_mypage_vs">구매하기</a-->
								</li>
							</ul>
													<ul class="my_main_today">
								<li class="goods_img">
									<a href="../front/productdetail.php?productcode=001001006000000193">
										<img src="../data/shopimages/product/001001006000000193.jpg" alt="">
									</a>
								</li>
								<li class="goods_info">
									<span class="name">
										<a href="../front/productdetail.php?productcode=001001006000000193">
											레이니 O6FBCB35										</a>
									</span>
									<br>
									<span class="price">
																				<span>359,000 원</span>
																				199,000 원
									</span><br>
									<!--a href="#" class="btn_mypage_vs">구매하기</a-->
								</li>
							</ul>
												</div>
					</div>

				</div>
				<div class="wish">
					
					<div class="table_wrap">
						<h3>관심상품 <span class="total">( Total : <strong>0</strong> )</span></h3>
						<!--p class="table_info"><a href="../front/wishlist.php">> 더보기</a></p-->
						<div class="today_wish">
													<ul class="my_main_wish">
								<li>관심상품이 없습니다.</li>
							</ul>
												</div>
					</div>

				</div>
			</div><!-- //최근&관심상품 -->


		</div><!-- 내용 -->

	</div>
	</td>
</tr>

<form name="form2" method="post" action="../front/orderdetailpop.php" target="orderpop"></form>
<input type="hidden" name="ordercode">

<form name="form3" method="post" action="../front/deliverypop.php" target="delipop"></form>
<input type="hidden" name="ordercode">

<form name="form4" action="../front/mypage_personalview.php" method="post" target="mypersonalview"></form>
<input type="hidden" name="idx">

<form name="detailform" method="post" action="../front/mypage_orderlist_view.php"></form>
<input type="hidden" name="ordercode">

</tbody></table>
</body>
</html>