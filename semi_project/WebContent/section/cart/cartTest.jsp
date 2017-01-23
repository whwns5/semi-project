<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="contents-cart" class="contents-cart"
		style="visibility: visible;"> <section class="cart-title">
	<h1 class="sr-only">장바구니</h1>
	</section>
	<div class="tabs-wrap">
		<div class="tabs">
			<span class="normal-cart">일반구매 (1)</span> <a href=""
				class="subscribe-cart no-hand">정기배송 (<span class="subscribe-cnt">0</span>)
			</a>
		</div>
	</div>


	<div id="sharing-cart">
		<div class="wrap">
			<h5>다른 친구에게 공유하기</h5>
			<div class="sharingBtn">
				<button class="twitter">twitter</button>
				<button class="mail">mail</button>
				<button class="facebook">facebook</button>
				<button class="url">URL</button>
			</div>
			<div class="url-box">
				<h6>
					Ctrl+C 키를 누르면 복사하실 수 있습니다.<br>
				</h6>
				<input id="sharingUrl" type="text"> <span class="close">닫기</span>
			</div>
			<div class="info-box">
				<div class="text-content">
					내 장바구니에서 선택한 상품들을<br>다른 친구들에게 공유해보세요!
				</div>
				<div class="gray-text">(30개 까지만 공유가 가능합니다.)</div>
			</div>
		</div>
	</div>




	<table class="cartTable"
		summary="장바구니 상품명, 제품가격, 선택한수량, 총결제비용 정보 및 결제 상품으로 선택,해제 및 수량변경, 삭제 기능 제공표">
		<caption class="none">장바구니</caption>
		<colgroup>
			<col width="50">
			<col width="80">
			<col width="*">
			<col width="90">
			<col width="90">
		</colgroup>
		<thead>
			<tr class="head">
				<th scope="col" class="all-select-event"><input
					title="모든 상품을 결제상품으로 설정" type="checkbox" checked="checked"
					class="all-deal-select"><span>&nbsp;&nbsp;전체선택</span></th>
				<th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>
				<th scope="col" id="th-unit-total-price">상품금액</th>
				<th scope="col" id="th-delivery-fee">배송비</th>
			</tr>
		</thead>















		<tbody id="cartTable-other">
			<tr>
				<td colspan="5" class="cart-bundle-title"><h2
						class="title bundle">업체상품</h2></td>
			</tr>



			<tr class="cart-deal-item count0 cart-sc-items last-cart-sc-items"
				data-item-status="CHECKED" data-adult="false" data-index="0"
				data-count="1" data-bundle-id="899899578" data-bundle-type="PRODUCT"
				data-app="" data-group-type="partner">
				<td class="product-select-event"><input type="checkbox"
					title="베리벨로 프라임GS 26 접이식 자전거 상품을 결제상품으로 설정" checked="checked"
					value="899899578" class="dealSelectChk"></td>
				<td><a
					href="http://www.coupang.com/vp/products/7371127?vendorItemId=3048142279"
					class="moveProduct"> <img
						src="//img1a.coupangcdn.com/image/vendor_inventory/images/2016/09/13/13/8/350f9b92-b8e6-4d5c-9895-157a16e78004.jpg"
						width="78" height="78" class="product-img img"
						alt="베리벨로 프라임GS 26 접이식 자전거">
				</a></td>
				<td class="product-box">
					<div class="product-name-part">
						<a
							href="http://www.coupang.com/vp/products/7371127?vendorItemId=3048142279"
							class="product-name moveProduct modify-color">베리벨로 프라임GS 26
							접이식 자전거, 블랙</a>



					</div>

					<div id="3048142279" class="option-item modify-float"
						data-quantity="1" data-vi="3048142279" data-vip=""
						data-pid="7371127" data-itemid="32494956">
						<div class="option-item-info">
							<div class="option-name">
								<span class="option-item-name" style="display: none;">베리벨로
									프라임GS 26 접이식 자전거, 블랙</span>




							</div>


							<div class="delivery-date modify-padding"
								style="visibility: visible;">
								<strong class="arrive-date"><span
									class="arrive-date-txt"></span><span class="arrive-date-day">화요일
								</span><span class="arrive-date-date">1/31</span></strong> 도착 예정<span
									class="delivery-message"></span>
							</div>


						</div>
						<div class="option-price-part">


							<span class="unit-cost"><span class="sr-only">제품가격</span>75,000원</span>
							<span class="select-select"> <select
								class="quantity-select"
								data-url="/memberCartItem/quantity/899899578/" data-quantity="1"
								data-all="true" title="베리벨로 프라임GS 26 접이식 자전거, 블랙 수량변경">


									<option value="1" selected="selected">1</option>

									<option value="2">2</option>

									<option value="3">3</option>

									<option value="4">4</option>

									<option value="5">5</option>

									<option value="6">6</option>

									<option value="7">7</option>

									<option value="8">8</option>

									<option value="9">9</option>

									<option value="10">10+</option>

							</select>
							</span> <span class="select-text none"> <input type="text"
								class="quantity-text" title="베리벨로 프라임GS 26 접이식 자전거, 블랙 수량변경"
								maxlength="4" value="1"
								data-url="/memberCartItem/quantity/899899578/" data-all="true">
								<input type="button" class="quantity-chg none" value="수량변경">
							</span> <span class="unit-price-area"><span class="unit-price"><span
									class="sr-only">구매가격</span>75,000원</span></span> <a
								href="/memberCartItem/delete/899899578?isAllChecked=true"
								data-url="/memberCartItem/delete/899899578" data-all="true"
								class="delete-option"><span class="sr-only">베리벨로
									프라임GS 26 접이식 자전거, 블랙 상품삭제</span></a>



						</div>
					</div>









				</td>
				<td class="unit-total-price" headers="th-unit-total-price">



					<div>75,000원</div>



				</td>

				<td class="delivery-fee" rowspan="1" headers="th-delivery-fee">





					9,000원<br>





					<p>
						<a
							href="http://www.coupang.com/vp/vendors/A00079119/products?vendorName=&amp;productId=7371127&amp;outboundShippingPlaceId=21722&amp;freeShipOverAmount=0"
							class="add-product-link sc-link"
							data-coulog="{&quot;logCategory&quot;:&quot;event&quot;, &quot;logType&quot;:&quot;click&quot;, &quot;logLabel&quot;:&quot;open_scp_cart&quot;}">묶음배송추가
							&gt;</a>
					</p>
				</td>

			</tr>


			<tr class="bundle-price-total">
				<td colspan="5">
					<h3 class="sr-only">업체상품 주문금액 정보</h3> 상품가격 <span
					class="total-product-price number">75,000</span>원<span
					class="coupon-area"> <span class="symbol symbol-plus"><span
							class="sr-only">더하기</span></span> 배송비 <span
						class="delivery-charge number">9,000</span>원 <span
						class="symbol symbol-equal"><span class="sr-only">결과는</span></span>
						주문금액 <span class="total-order-price number">84,000</span>원
				</span>
				</td>
			</tr>

		</tbody>




	</table>

	<div class="order-table-foot">

		<span class="all-select-product"> <label> <input
				title="모든 상품을 결제상품으로 설정" type="checkbox" checked="checked"
				class="all-select-event"> 전체선택 <span
				class="cart-count-bottom">( <em>1</em> / 1 )
			</span>
		</label> <a href="javascript:void(0);" data-login="true"
			class="selected-delete">전체삭제</a> <a href="javascript:void(0);"
			data-login="true" class="selected-soldout-delete">품절/판매종료상품 전체삭제</a>
		</span>

		<div class="payment-benefit" style="z-index: 1;">
			<div class="credit-benefit">
				<h3 class="benefit-button" tabindex="0">무이자 할부 혜택</h3>
				<div class="installment-creditLayer" style="display: none;">

					<table class="benefit-table"
						summary="무자이할부 가능 카드사, 적용금액, 할부개월, 기간 정보 제공표">
						<caption>무이자 할부 혜택</caption>
						<thead>
							<tr>
								<th scope="col">카드사</th>
								<th scope="col" class="ApplicableAmount">적용금액</th>
								<th scope="col" class="monthInstallments">할부개월</th>
								<th scope="col" class="benefitEtc">기간</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/SHINHAN-PC-cc02d7c6-3324-4479-960b-ccd38862281c.png"
									width="72" height="26" alt="신한카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5,6 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/BC-PC-161f8fdf-b9f6-40e9-aaac-967983855523.png"
									width="72" height="26" alt="BC(비씨)카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/KB-PC-a0def1d8-e070-4bf3-b8bd-4c9dee9ccf0c.png"
									width="72" height="26" alt="KB국민카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5,6 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20151111/HYUNDAI-PC-ed449784-4c88-4eef-b2e1-c6033eb5539d.png"
									width="72" height="26" alt="현대카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/SAMSUNG-PC-f2e8b2a0-8dd8-4ab4-9d85-fda4ba0c4094.png"
									width="72" height="26" alt="삼성카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/LOTTE-PC-798747ba-5b0c-42d2-a48a-d7d2c8c38a2e.png"
									width="72" height="26" alt="롯데카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/KEB-PC-18dd8e1f-4f3b-42f0-8656-fe555d0221dd.png"
									width="72" height="26" alt="외환카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/NH-PC-d48f0720-142b-4404-a0be-1098c1618e5f.png"
									width="72" height="26" alt="NH농협(채움)카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/HANA_SK-PC-b0812773-8f15-4d99-8ef0-a59e807b5b33.png"
									width="72" height="26" alt="하나카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20140818/CITY-PC-17299bc7-8aec-43b3-a7f2-aa745ff17e01.png"
									width="72" height="26" alt="씨티카드"></td>
								<td>5만원 이상</td>
								<td>2,3 개월</td>
								<td><span class="benefitDate">2017.01.11 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 21 일)</p></td>
							</tr>

							<tr>
								<td><img class="logoImg"
									src="http://img1a.coupangcdn.com/image/static/common/cardbenefit/20160708/JEONBUK-PC-89b3e94f-e27e-4575-9294-a5a21279c692.png"
									width="72" height="26" alt="전북은행카드"></td>
								<td>5만원 이상</td>
								<td>2,3,4,5 개월</td>
								<td><span class="benefitDate">2017.01.01 ~
										2017.01.31</span>
									<p class="benefitPeriod">(총 31 일)</p></td>
							</tr>

						</tbody>
					</table>



					<div class="benefit-notice">

						<p>-법인,개인사업자,체크,기프트,선불,하이브리드카드 제외</p>

						<p>-신한BC/국민BC/씨티BC카드는 BC카드 행사로 적용됨</p>

						<p>-해외항공권 구매 시 혜택 적용 불가(하나프리 결제 건)</p>

					</div>



					<table class="benefit-table"
						summary="부분무이자 가능 카드사, 적용금액, 할부개월, 기타 정보 제공표">
						<caption>부분 무이자 할부 혜택</caption>
						<thead>
							<tr>
								<th scope="col">카드사</th>
								<th scope="col">적용금액</th>
								<th scope="col">할부개월</th>
								<th scope="col">기타</th>
							</tr>
						</thead>
						<tbody>

							<tr>

								<td rowspan="3" class="creditCardCompany"><img
									class="logoImg"
									src="http://img2.coupangcdn.com/image/static/common/cardbenefit/20140818/SAMSUNG-PC-f2e8b2a0-8dd8-4ab4-9d85-fda4ba0c4094.png"
									width="72" height="26" alt="삼성카드"></td>


								<td>5만원 이상</td>
								<td>6 개월</td>
								<td>1 회차 수수료 고객 부담</td>
							</tr>

							<tr>


								<td>5만원 이상</td>
								<td>10 개월</td>
								<td>1,2 회차 수수료 고객 부담</td>
							</tr>

							<tr>


								<td>5만원 이상</td>
								<td>12 개월</td>
								<td>1,2,3 회차 수수료 고객 부담</td>
							</tr>

							<tr>

								<td rowspan="2" class="creditCardCompany"><img
									class="logoImg"
									src="http://img2.coupangcdn.com/image/static/common/cardbenefit/20140818/LOTTE-PC-798747ba-5b0c-42d2-a48a-d7d2c8c38a2e.png"
									width="72" height="26" alt="롯데카드"></td>


								<td>5만원 이상</td>
								<td>6 개월</td>
								<td>1 회차 수수료 고객 부담</td>
							</tr>

							<tr>


								<td>5만원 이상</td>
								<td>10 개월</td>
								<td>1,2 회차 수수료 고객 부담</td>
							</tr>

							<tr>

								<td rowspan="2" class="creditCardCompany"><img
									class="logoImg"
									src="http://img2.coupangcdn.com/image/static/common/cardbenefit/20140818/KEB-PC-18dd8e1f-4f3b-42f0-8656-fe555d0221dd.png"
									width="72" height="26" alt="외환카드"></td>


								<td>5만원 이상</td>
								<td>10 개월</td>
								<td>1,2 회차 수수료 고객 부담</td>
							</tr>

							<tr>


								<td>5만원 이상</td>
								<td>15 개월</td>
								<td>1,2,3 회차 수수료 고객 부담</td>
							</tr>

							<tr>

								<td rowspan="2" class="creditCardCompany"><img
									class="logoImg"
									src="http://img2.coupangcdn.com/image/static/common/cardbenefit/20140818/HANA_SK-PC-b0812773-8f15-4d99-8ef0-a59e807b5b33.png"
									width="72" height="26" alt="하나카드"></td>


								<td>5만원 이상</td>
								<td>10 개월</td>
								<td>1,2 회차 수수료 고객 부담</td>
							</tr>

							<tr>


								<td>5만원 이상</td>
								<td>15 개월</td>
								<td>1,2,3 회차 수수료 고객 부담</td>
							</tr>

						</tbody>
					</table>



					<div class="benefit-notice">

						<p>-법인,개인사업자,체크,BC,기프트,선불,하이브리드카드 제외</p>

						<p>-해외항공권 구매 시 혜택 적용 불가(하나프리 결제 건)</p>

					</div>

				</div>
			</div>
		</div>
	</div>







	<div class="cart-total-price">
		<div class="price-area">
			<h2 class="sr-only" id="cart-total-price">장바구니 총 주문금액 정보</h2>
			총 상품가격 <em class="final-product-price">75,000</em>원 <span
				class="symbol-plus1"><span class="sr-only">더하기</span></span> 총 배송비 <em
				class="final-delivery-charge">9,000</em>원 <span
				class="symbol-equal1"><span class="sr-only">결과는</span></span> 총 주문금액
			<em class="final-order-price">84,000</em>원
		</div>



	</div>




	<div class="faraway-notice">
		<strong>도서산간 배송안내 </strong> : 도서산간 추가배송비 발생 시 함께 결제할 수 있습니다. <span
			class="faraway-address"></span><br> 로켓배송은 추가배송비도 무료
	</div>





	<div class="order-buttons">
		<a class="goShopping" href="http://www.coupang.com">계속 쇼핑하기</a> <a
			href="javascript:void(0);" class="goPayment" id="btnPay"
			data-pay-url="/cart/orderV3?isAllChecked=true">구매하기</a>


	</div>



	<iframe id="ab_iframe" class="ab_test" src="" width="0" height="0"
		frameborder="0" vspace="0"></iframe> </section>
</body>
</html>