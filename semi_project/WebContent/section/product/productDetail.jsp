<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/button/button.css?ver=1">
<link rel="stylesheet" type="text/css" href="/semi_project/css/product/productDetail.css?ver=8">
<script>
function AddComma(data_value) {
	return Number(data_value).toLocaleString('en').split(".")[0] + "원";
}
</script>
</head>
<body>
<%@include file="/header/header.jsp"%>
<%@include file="/aside/aside.jsp"%>
<section>
	<div id="body_contents">
		<div class="linemap">
		
		</div>
		<div class="container_body">
			<div class="product_info">
				<div class="info_wrap">
					<div class="info_wrap_image">
						<div class="big_image">
							<img id="id_big_image" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_2.jpg">
						</div>
						<div class="small_image_container">
							<div class="small_image_panel">
								<script>
								 	var cursor = 0;
									
									function moveCursor(id_ul, direction) {
										var id_ul = document.getElementById(id_ul);
										var elcount = id_ul.childElementCount;
										
										if(direction == 'left'){
											if( cursor < 0 ){
												cursor = cursor + 100;
											} else {
												return;
											}
											
										} else if(direction == 'right') {
											if( cursor > -((elcount-3)*100)){
												cursor = cursor - 100;
											} else {
												return;
											}
										}

										id_ul.style.transform = 'translate(' + cursor + 'px, 0px)';
									}
									
									function changeBigImage(id_img) {
										var currentImg = id_img.getAttribute('src');
										document.getElementById('id_big_image').setAttribute('src', currentImg);	
									}
								</script>
								<a class="left" href="javascript:moveCursor('id_small_ul','left');"></a>
								<div class="small_image">
									<div>
										<ul id="id_small_ul">
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_2.jpg"></li>
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_3.jpg"></li>
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_4.jpg"></li>
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_5.jpg"></li>
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_6.jpg"></li>
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_6.jpg"></li>
											<li><img onclick="changeBigImage(this);" src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_6.jpg"></li>
										</ul>
									</div>
								</div>
								<a class="right" href="javascript:moveCursor('id_small_ul','right');"></a>
							</div>
						</div>
					</div>
					<div class="info_wrap_spec">
						<h3 class="name">테일러 클러치 O6FBCL23</h3>
						<script>
							function totalpriceSetting() {
								var eachtotalprices = document.getElementsByName('eachTotalPrice');
								var totalprice = 0;
								for(var i = 0 ; i < eachtotalprices.length ; i++){
									totalprice = totalprice + parseInt(eachtotalprices[i].value);
								}
								var elalltotal_price = document.getElementById('alltotal_price');
								elalltotal_price.value = totalprice;
								
								var elshow_alltotal_price = document.getElementById('show_alltotal_price');
								elshow_alltotal_price.innerHTML = AddComma(elalltotal_price.value);
								
							}
							function priceSetting(id) {
								var elshowPrice = document.getElementById(id + '_showPrice');
								var num = parseInt(document.getElementById(id + '_num').value);
								var price = parseInt(document.getElementById(id + '_price').value);
								var eltotalPrice = document.getElementById(id + '_totalprice');
								eltotalPrice.value = num * price;

								elshowPrice.innerHTML = Number(eltotalPrice.value).toLocaleString('en').split(".")[0] + '원';
								
								totalpriceSetting();
							}
							function plusNum(id) {
								var elInput = document.getElementById(id + '_num');
								elInput.value = parseInt(elInput.value) + 1;
								priceSetting(id);
							}
							function minusNum(id) {
								var elInput = document.getElementById(id + '_num');
								if(parseInt(elInput.value) > 1){
									elInput.value = parseInt(elInput.value) - 1;
								}
								priceSetting(id);
							}
							function removeLi(id) {
								var elopt_list = document.getElementById('id_ul_selectItemList');
								elopt_list.removeChild(document.getElementById(id));
								totalpriceSetting();
							}
							function createOptList(obj) {
								var itemName = document.getElementById('itemName').value;
								var itemCode = document.getElementById('itemCode').value;
								var itemColor = obj.value;
								if(itemColor == 'NONE'){
									return;
								}
								var itemPrice = parseInt(document.getElementById('itemPrice').value);
								var li_id = itemCode + '_' + itemColor;
								var elopt_list = document.getElementById('id_ul_selectItemList');
								var elopt_list_childs = elopt_list.getElementsByTagName('li');
								
								for(var i = 0 ; i < elopt_list_childs.length ; i++){
									if(elopt_list_childs[i].getAttribute('id') == li_id){
										window.alert('이미 추가 되어 있습니다.');
										return;
									}
								}

								var htmlText = '';
								htmlText += '<li id="' + li_id + '">';
								htmlText += 	'<div class="item_info_area">';
								htmlText += 		'<span class="opt_name">-' + itemName + ' ' + itemCode + ',' + itemColor + '</span>';
								htmlText += 		'<span class="price" id="' + li_id + '_showPrice">' + AddComma(itemPrice) + '</span>';
								htmlText += 	'</div>';
								htmlText += 	'<div class="item_editer_area">';
								htmlText += 		'<input type="text" id="' + li_id + '_num" value="1" size="2" readonly>'; // 선택 수량
								htmlText += 		'<input type="hidden" id="' + li_id + '_price" value="' + itemPrice + '">'; // 개당 가격
								htmlText += 		'<input type="hidden" id="' + li_id + '_totalprice" name="eachTotalPrice" value="' + itemPrice + '">'; // 각각의 합 가격
								htmlText += 		'<span onclick="plusNum(\'' + li_id + '\');"><img src="/semi_project/img/icon/c_plus_btn.jpg"></span>';
								htmlText += 		'<span onclick="minusNum(\'' + li_id + '\');"><img src="/semi_project/img/icon/c_minus_btn.jpg"></span>';
								htmlText += 		'<span onclick="removeLi(\'' + li_id + '\');"><img src="/semi_project/img/icon/c_x_btn.gif"></span>';
								htmlText += 	'</div>';
								htmlText += '</li>';
								
								elopt_list.innerHTML += htmlText;
								
								totalpriceSetting();
							
							}
						</script>
						<input type="hidden" id="itemName" value="테일러 미니"> <!-- 데이터베이스로 실데이터 입력 -->
						<input type="hidden" id="itemCode" value="O5NBCB08"> <!-- 데이터베이스로 실데이터 입력 -->
						<input type="hidden" id="itemNum" value="100"> <!-- 데이터베이스로 실데이터 입력 -->
						<input type="hidden" id="itemPrice" value="299000"> <!-- 데이터베이스로 실데이터 입력 -->
						<table class="info">
							<tbody>
								<tr>
									<th>소비자가격</th>
									<td>299,000원</td>
								</tr>
								<tr>
									<th>색상</th>
									<td><select class="color" onchange="createOptList(this);">
											<option value="NONE" selected="selected">옵션을 선택해주세요.</option>
											<option value="LEMON">LEMON</option> <!-- 데이터베이스로 해당 제품의 색상들 만큼 반복 수행하여 select를 설치 -->
											<option value="PEWTER">PEWTER</option>
											<option value="BLACK">BLACK</option>
											<option value="DARKNAVY">DARKNAVY</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<ul class="opt_list" id="id_ul_selectItemList">
											
										</ul>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>총 주문금액</th>
									<td><p id="result_total_price" class="price">
											<input type="hidden" value="0" id="alltotal_price">
											<span class="price_d"><strong id="show_alltotal_price">0 원</strong></span></p>
									</td>
								</tr>
							</tfoot>
						</table>
						<div class="btn_div">
							<ul class="btn_ul">
								<li><input class="submit-button" type="button" value="바로구매"></li>
								<li><input class="submit-button" type="button" value="장바구니"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="product_detail">
				<a name="tab01"></a>
				<div class="div_tab_detail01">
					<ul class="ul_tab">
						<li><a class="on" href="#tab01">상세정보</a></li>
						<li><a href="#tab02">상품리뷰</a></li>
						<li><a class="last" href="#tab03">Q&A</a></li>
					</ul>
					<div class="tab_detail_img">
						<img src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_1.jpg">
					</div>
				</div>
				<script>
				function showContent(cnt, content) {
					var contents = document.getElementsByClassName(content);
					for(var i = 0 ; i < contents.length ; i++){
						if(i == cnt){
							if(contents[cnt].style.display == ''){
								contents[cnt].style.display = 'block';
							} else if(contents[cnt].style.display == 'block'){
								contents[cnt].style.display = '';
							}
						} else {
							contents[i].style.display = '';
						}
					}		
				}
				</script>
				<a name="tab02"></a>
				<div class="div_tab_detail02">
					<ul class="ul_tab">
						<li><a href="#tab01">상세정보</a></li>
						<li><a class="on" href="#tab02">상품리뷰</a></li>
						<li><a class="last" href="#tab03">Q&A</a></li>
					</ul>
					<div class="tab_review_table">
						<table>
							<colgroup><col style="width:100px"><col style="width:auto"><col style="width:100px"></colgroup>
							<tbody>
								<tr>
									<td class="review_date">2016.11.02</td>
									<td class="review_subject">
										<a href="javascript:showContent(0,'review_content');">이뻐요</a>
										<span>(dkanrjte)</span>
										<img src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_4.jpg">
										<div class="review_content">
											레몬색 사고싶었는데, 사계절 무난하게 쓰려고 실버구입했어요!<br>
											보내주신 카드지갑고 가방이랑 같은 색이라 세트같고!! 더더 이쁘네요♡<br>
											흐물흐물한 가죽이 아니라 모양이 흐트러지지도 않고 체인도 너무 마음에 들어요<br>
											안쪽에 바깥쪽에 모두 수납공간이 있어서 크기는 작지만 생각보다 많이 들어가요ㅎㅎ<br>
											친구들도 가방 이쁘다고 난리!!!<br>
											색깔별로 구입하고 싶네요ㅋㅋ								
										</div>
									</td>
									<td class="rewview_grade">★★★★★</td>
								</tr>
								<tr>
									<td class="review_date">2016.11.02</td>
									<td class="review_subject">
										<a href="javascript:showContent(1,'review_content');">이뻐요</a>
										<span>(dkanrjte)</span>
										<img src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_4.jpg">
										<div class="review_content">
											레몬색 사고싶었는데, 사계절 무난하게 쓰려고 실버구입했어요!<br>
											보내주신 카드지갑고 가방이랑 같은 색이라 세트같고!! 더더 이쁘네요♡<br>
											흐물흐물한 가죽이 아니라 모양이 흐트러지지도 않고 체인도 너무 마음에 들어요<br>
											안쪽에 바깥쪽에 모두 수납공간이 있어서 크기는 작지만 생각보다 많이 들어가요ㅎㅎ<br>
											친구들도 가방 이쁘다고 난리!!!<br>
											색깔별로 구입하고 싶네요ㅋㅋ								
										</div>
									</td>
									<td class="rewview_grade">★★★★★</td>
								</tr>
								<tr>
									<td class="review_date">2016.11.02</td>
									<td class="review_subject">
										<a href="javascript:showContent(2,'review_content');">이뻐요</a>
										<span>(dkanrjte)</span>
										<img src="/semi_project/img/product/bags/backpack/O5FBBP59_WARM GREY/O5FBBP59_WARM GREY_4.jpg">
										<div class="review_content">
											레몬색 사고싶었는데, 사계절 무난하게 쓰려고 실버구입했어요!<br>
											보내주신 카드지갑고 가방이랑 같은 색이라 세트같고!! 더더 이쁘네요♡<br>
											흐물흐물한 가죽이 아니라 모양이 흐트러지지도 않고 체인도 너무 마음에 들어요<br>
											안쪽에 바깥쪽에 모두 수납공간이 있어서 크기는 작지만 생각보다 많이 들어가요ㅎㅎ<br>
											친구들도 가방 이쁘다고 난리!!!<br>
											색깔별로 구입하고 싶네요ㅋㅋ								
										</div>
									</td>
									<td class="rewview_grade">★★★★★</td>
								</tr>
							</tbody>
						</table>
						<div class="paging bottom">
							<a class="on" href="#"><font class="choiceprlist"><b>1</b></font></a>
							<a href="#"><font class="prlist">2</font></a>
							<input class="submit-button" type="button" value="리뷰작성">
						</div>
					</div>
				</div>
				<a name="tab03"></a>
				<div class="div_tab_detail03">
					<ul class="ul_tab">
						<li><a href="#tab01">상세정보</a></li>
						<li><a href="#tab02">상품리뷰</a></li>
						<li><a class="last on" href="#tab03">Q&A</a></li>
					</ul>
					<div class="tab_qna_table">
						<table>
							<colgroup><col style="width:100px"><col style="width:auto"><col style="width:100px"></colgroup>
							<tbody>
								<tr>
									<td class="qna_date">2016.11.02</td>
									<td class="qna_subject">
										<a href="javascript:showContent(0,'qna_content');">배송문의합니다.</a>
										<span>(조은솔)</span>
										<div class="qna_content">
											언제 출고되나요??	
										</div>
									</td>
									<td class="progress point_c">답변완료</td>
								</tr>
								<tr>
									<td class="qna_date">2016.10.06</td>
									<td class="qna_subject">
										<a href="javascript:showContent(1,'qna_content');">배송문의</a>
										<span>(이예진)</span>
										<div class="qna_content">
											이번주안으로 받고 싶은데 받을수 있을까요?
										</div>
									</td>
									<td class="progress point_c">답변완료</td>
								</tr>
								<tr>
									<td class="qna_date">2016.06.22</td>
									<td class="qna_subject">
										<a href="javascript:showContent(2,'qna_content');">주문했는데 핸드폰번호를 잘못남겼어요.</a>
										<span>(이동희)</span>
										<div class="qna_content">
											핸드폰번호 010-3582-1354로 수정바랍니다.회원정보는 수정했는데 주문조회로 보니 수정이 안되더라구요 ㅠㅠ 저 번호로 연락주세요.
										</div>
									</td>
									<td class="progress">접수중</td>
								</tr>
							</tbody>
						</table>
						<div class="paging bottom">
							<a class="on" href="#"><font class="choiceprlist"><b>1</b></font></a>
							<a href="#"><font class="prlist">2</font></a>
							<a href="#"><font class="prlist">3</font></a>
							<input class="submit-button" type="button" value="문의작성">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/footer/footer.jsp"%>
</body>
</html>