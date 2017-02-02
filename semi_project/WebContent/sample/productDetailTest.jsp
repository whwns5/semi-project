<%@page import="semi.qna.QnaDTO"%>
<%@page import="java.io.File"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="semi.product.ProductDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/button/button.css?ver=1">
<link rel="stylesheet" type="text/css" href="/semi_project/css/layer/layer.css?ver=1">
<link rel="stylesheet" type="text/css" href="/semi_project/css/product/productDetail.css?ver=9">
<script>
function AddComma(data_value) {
	return Number(data_value).toLocaleString('en').split(".")[0] + "원";
}
</script>
</head>
<%
	
	
	//String idx_s = request.getParameter("idx_s");
	//int idx = Integer.parseInt(idx_s);
	//String product_code = request.getParameter("code");
	//String lcid = request.getParameter("lcid");
	//String scid = request.getParameter("scid");
	
	//String product_code = request.getParameter("code");
	int product_idx = 23;
	String product_code = "O5FBBP39";
	String lcid = "bags";
	String scid = "backpack";
	
	String product_path = "/semi_project/img/product/" + lcid + "/" + scid;
	//String com_path = "C:/Users/whwns/git/semi-project/semi_project/WebContent/img/product/" + lcid + "/" + scid;
	String com_path = "C:/Users/user1/git/semi-project/semi_project/WebContent/img/product/" + lcid + "/" + scid;
	ArrayList<ProductDTO> arr_pdto = null;
	arr_pdto = pdao.productCodeList(product_code);
	ProductDTO mainpDTO = null;
	
	for(int i = 0 ; i < arr_pdto.size() ; i++){
		if(arr_pdto.get(i).getProduct_idx() == product_idx){
			mainpDTO = arr_pdto.get(i);
		}
	}
	ArrayList<QnaDTO> arr_qdto = null;
	arr_qdto = qdao.qnaList();
	
	DecimalFormat dcformat = new DecimalFormat("###,###,###,###");
	
%>
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
							<img id="id_big_image" src="<%=product_path%>/<%=mainpDTO.getProduct_code()%>_<%=mainpDTO.getProduct_color()%>/<%=mainpDTO.getProduct_img()%>.jpg">
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
											<%
												File f = new File(com_path + "/" + mainpDTO.getProduct_code() + "_" + mainpDTO.getProduct_color());
												for(int i = 2 ; i <= f.listFiles().length ; i++){
											%>
													<li><img onclick="changeBigImage(this);" src="<%=product_path%>/<%=mainpDTO.getProduct_code()%>_<%=mainpDTO.getProduct_color()%>/<%=mainpDTO.getProduct_code()%>_<%=mainpDTO.getProduct_color()%>_<%=i%>.jpg"></li>
											<%		
												}	
											%>
										</ul>
									</div>
								</div>
								<a class="right" href="javascript:moveCursor('id_small_ul','right');"></a>
							</div>
						</div>
					</div>
					<div class="info_wrap_spec">
						<h3 class="name"><%=mainpDTO.getProduct_name()%> <%=mainpDTO.getProduct_code()%></h3>
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
						<input type="hidden" id="itemName" value="<%=mainpDTO.getProduct_name()%>"> <!-- 데이터베이스로 실데이터 입력 -->
						<input type="hidden" id="itemCode" value="<%=mainpDTO.getProduct_code()%>"> <!-- 데이터베이스로 실데이터 입력 -->
						<input type="hidden" id="itemNum" value="<%=mainpDTO.getProduct_num()%>"> <!-- 데이터베이스로 실데이터 입력 -->
						<input type="hidden" id="itemPrice" value="<%=mainpDTO.getProduct_price()%>"> <!-- 데이터베이스로 실데이터 입력 -->
						<table class="info">
							<tbody>
								<tr>
									<th>소비자가격</th>
									<td><%=dcformat.format((double) mainpDTO.getProduct_price()) %>원</td>
								</tr>
								<tr>
									<th>색상</th>
									<td><select class="color" onchange="createOptList(this);">
											<option value="NONE" selected="selected">옵션을 선택해주세요.</option>
											<%
												for(int i = 0 ; i < arr_pdto.size() ; i++ ){
											%>
													<option value="<%=arr_pdto.get(i).getProduct_color() %>"><%=arr_pdto.get(i).getProduct_color() %></option>
											<%
												}
											%>
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
						<img src="<%=product_path%>/<%=mainpDTO.getProduct_code()%>_<%=mainpDTO.getProduct_color()%>/<%=mainpDTO.getProduct_code()%>_<%=mainpDTO.getProduct_color()%>_1.jpg">
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
								<%
									if(arr_qdto.size() == 0){
								%>	
										<tr>
											<td colspan="3" class="nothing">등록된 질문이 없습니다.</td>
										</tr>
								<%	
									} else {
										for(int i = 0 ; i < arr_qdto.size() ; i++){			
								%>
										<tr>
											<td class="qna_date"><%=arr_qdto.get(i).getQna_regdate()%></td>
											<td class="qna_subject">
												<a href="javascript:showContent(<%=i%>,'qna_content');"><%=arr_qdto.get(i).getQna_subject()%></a>
												<span>(<%=arr_qdto.get(i).getMember_id() %>)</span>
												<div class="qna_content">
													<%=arr_qdto.get(i).getQna_content() %>
												</div>
											</td>
											<td class="progress">접수중</td> <!--  point_c 접수완료 -->
										</tr>				
								<%		
										}
									}
								%>
							</tbody>
						</table>
						<script>
						function openQnaLayer() {
							var qna_layer = document.getElementById('id_qna_layer');
							qna_layer.style.display = 'block';
						}
						function closeQnaLayer() {
							var qna_layer = document.getElementById('id_qna_layer');
							qna_layer.style.display = '';
						}
						</script>
						<div class="paging bottom">
							<a class="on" href="#"><font class="choiceprlist"><b>1</b></font></a>
							<a href="#"><font class="prlist">2</font></a>
							<a href="#"><font class="prlist">3</font></a>
							<input class="submit-button" type="button" value="문의작성" onclick="openQnaLayer();">
						</div>
					</div>
					<div class="qna_layer" id="id_qna_layer">
						<div class="qna_layer_bg" onclick="closeQnaLayer();"></div>
						<div class="qna_layer_pop">
							<div class="qna_layer_content">	
								<form class="layer-form-container" name="qnaWrite_ok" action="/semi_project/section/qna/qnaWrite_ok.jsp">
									<div class="layer-form-title"><h2>상품 Q&A</h2></div>
									<br />
									<div class="layer-form-title">이름<input class="layer-form-field layer-form-field-id" type="text" name="member_id" value="whwns5" readonly="readonly"/>			
									</div>
									<br />
									<div class="layer-form-title">제목<input class="layer-form-field layer-form-field-subject" type="text" name="qna_subject" required="required"/>	
									</div>
									<br />
									<div class="layer-form-title">문의 내용<textarea class="layer-form-field-content" rows="20" cols="68" name="qna_content" required="required"></textarea>
									</div>
									<div class="layer-submit-container">
										<input class="layer-submit-button" type="submit" value="작성하기">
										<input class="layer-submit-button" type="button" value="나가기" onclick="closeQnaLayer();">
									</div>
								</form>
							</div>
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