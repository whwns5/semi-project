<%@page import="semi.path.Path"%>
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
<link rel="stylesheet" type="text/css" href="/semi_project/css/button/button.css?ver=6">
<link rel="stylesheet" type="text/css" href="/semi_project/css/layer/layer.css?ver=8">
<link rel="stylesheet" type="text/css" href="/semi_project/css/product/productDetail.css?ver=6">
<script type="text/javascript" src="/semi_project/js/ajax.js?ver=4"></script>
<script type="text/javascript" src="/semi_project/js/ajax_upload.js?ver=2"></script>
<script>
function AddComma(data_value) {
	return Number(data_value).toLocaleString('en').split(".")[0] + "원";
}
function result_process(responseText, ctype) {
	//var json = JSON.parse(responseText);
	//var qdto = json.QnaDTO;
	//var docStr = '';

	//dotStr +=  qdto[0].qna_idx;
	if(ctype == 'QNA_SELECT_ALL'){
		document.getElementById("ajax_qna_div").innerHTML = responseText;//보여주기
	} else if(ctype == 'QNA_INSERT'){
		if(responseText == 1){ 
			window.alert('등록완료');
			closeQnaLayer(); // 등록후 창 닫음
			var product_idx = document.getElementById('product_idx').value;
			settingQna(product_idx);
		} else {
			window.alert(responseText);
		}
	} else if(ctype == 'REVIEW_SELECT_ALL'){
		document.getElementById("ajax_review_div").innerHTML = responseText;//보여주기
	} else if(ctype == 'REVIEW_INSERT'){
		if(responseText == 1){ 
			window.alert('등록완료');
			closeReviewLayer(); // 등록후 창 닫음
			var product_idx = document.getElementById('product_idx').value;
			settingReview(product_idx);
		} else {
			window.alert(responseText);
		}
	} else if(ctype == 'REVIEW_REPLY_INSERT'){
		if(responseText == 1){ 
			window.alert('등록완료');
			closeReviewReplyLayer(); // 등록후 창 닫음
			var product_idx = document.getElementById('product_idx').value;
			settingReview(product_idx);
		} else {
			window.alert(responseText);
		}
	} else {
		window.alert('잘못된 경로');
	}
}

function ajax_result(httpRequest, ctype) {
	return function() {
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				if(!httpRequest.responseText.match(null)){
					var responseText = httpRequest.responseText;
					result_process(responseText, ctype);
				}
			}
		}
	}
}

function action_ajax(url, param, method, ctype) {
	sendRequest(url, param, ajax_result, method, ctype);
	return false;
}
function action_ajax_upload(url, fmid, method, ctype) {
	sendRequest_uplaod(url, fmid, ajax_result, method, ctype);
	return false;
}

function settingQna(product_idx) {
	action_ajax('/semi_project/section/product/ajaxGoQnaPage.jsp','product_idx=' + product_idx + '&qnaCp=1&qnaListSize=10', 'POST', 'QNA_SELECT_ALL'); // 해당 페이지로 ajax통신 시작
}
function settingReview(product_idx) {
	action_ajax('/semi_project/section/product/ajaxGoReviewPage.jsp','product_idx=' + product_idx + '&qnaCp=1&qnaListSize=10', 'POST', 'REVIEW_SELECT_ALL'); // 해당 페이지로 ajax통신 시작
}

function settingPage(product_idx) {
	settingQna(product_idx);
	settingReview(product_idx);
}
</script>
</head>
<%
	
	
	String product_idx_s = request.getParameter("product_idx");
	int product_idx = Integer.parseInt(product_idx_s);
	String product_code = request.getParameter("product_code");
	String lcid = request.getParameter("lcid");
	String scid = request.getParameter("scid");

	
	String product_path = "/semi_project/img/product/" + lcid + "/" + scid;
	String com_path = Path.COM_PROJECT_PATH + "/WebContent/img/product/" + lcid + "/" + scid;
	//String com_path = "C:/Users/user1/git/semi-project/semi_project/WebContent/img/product/" + lcid + "/" + scid;
	ArrayList<ProductDTO> arr_pdto = null;
	arr_pdto = pdao.productCodeList(product_code);
	ProductDTO mainpDTO = null;
	
	for(int i = 0 ; i < arr_pdto.size() ; i++){
		if(arr_pdto.get(i).getProduct_idx() == product_idx){
			mainpDTO = arr_pdto.get(i);
		}
	}
	
	DecimalFormat dcformat = new DecimalFormat("###,###,###,###");
	
%>
<body onload="settingPage(<%=product_idx%>);">
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
												for(int i = 2 ; i <= mainpDTO.getProduct_imgcount() ; i++){
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
								htmlText += 		'<input type="text" id="' + li_id + '_num" value="1" name="product_num" size="2" readonly>'; // 선택 수량
								htmlText += 		'<input type="hidden" name="product_code" value="' + itemCode + '">'; // 상품코드
								htmlText += 		'<input type="hidden" name="product_color" value="' + itemColor + '">'; // 상품컬러
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
							function goCart() {
								var f = document.cart_fm;
								f.setAttribute('action', '/semi_project/section/cart/cartShow.jsp');
								f.submit();
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
										<form name="cart_fm">
										<ul class="opt_list" id="id_ul_selectItemList">
											
										</ul>
										</form>
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
								<li><input class="submit-button" type="button" value="장바구니" onclick="goCart();"></li>
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
					<script>
						function openReviewLayer() {
							var review_layer = document.getElementById('id_review_layer');

							document.getElementById('fileSelected_info').innerHTML = '<span>파일명:</span>한글,영문,숫자 l <span>파일용량:</span> 10MB이하 l <span>첨부가능 파일형식:</span>GIF,JPG(JPEG)';				
							review_layer.style.display = 'block';
						}
						function closeReviewLayer() {
							var review_layer = document.getElementById('id_review_layer');
							document.getElementById('review_subject').value = '';
							document.getElementById('review_content').value = '';
							document.getElementById('review_img_file').value = '';
							review_layer.style.display = '';
						}
						function submitReviewLayer() {
							action_ajax_upload('/semi_project/section/review/reviewWrite_ok.jsp', 'id_reviewWrite_ok', 'POST', 'REVIEW_INSERT');	
						}
					</script>
					<div class="tab_review_table" id="ajax_review_div">
						<!-- ajax로 리뷰를 가져오는 영역 -->
					</div>
					<div class="review_layer" id="id_review_layer">
						<div class="review_layer_bg" onclick="closeReviewLayer();"></div>
						<div class="review_layer_pop">
							<div class="review_layer_content">	
								<form class="layer-form-container" name="reviewWrite_ok" id="id_reviewWrite_ok" action="/semi_project/section/review/reviewWrite_ok.jsp">
									<div class="layer-form-title"><h2>상품 리뷰</h2></div>
									<br />																					<!--  차후 session 값으로 교체 -->
									<div class="layer-form-title">아이디<input class="layer-form-field layer-form-field-id" type="text" name="member_id" id="member_id" value="whwns5" readonly="readonly"/>
																	평점<select class="layer-form-field layer-form-field-grade" id="review_grade" name="review_grade">
																		<option value="5">♥♥♥♥♥</option>
																		<option value="4">♥♥♥♥</option>
																		<option value="3">♥♥♥</option>
																		<option value="2">♥♥</option>
																		<option value="1">♥</option>
																	</select>	
																  <input type="hidden" name="product_idx" id="product_idx" value="<%=product_idx%>">
									</div>
									<br />
									<div class="layer-form-title">제목<input class="layer-form-field layer-form-field-subject" type="text" name="review_subject" id="review_subject" required="required"/>	
									</div>
									<br />
									<div class="layer-form-title">리뷰 내용<textarea class="layer-form-field-content" rows="20" cols="68" name="review_content" id="review_content" required="required"></textarea>
									</div>
									<div class="layer-form-title">이미지<input class="image_input" type="file" name="review_img_file" id="review_img_file" size="40" onchange="fileSelected();"> 
																		<p class="image_info" id="fileSelected_info">
																			
																		</p>	
									</div>
									<div class="layer-submit-container">
										<input class="layer-submit-button" type="button" value="작성하기" 
											onclick="submitReviewLayer();">
										<input class="layer-submit-button" type="button" value="나가기" onclick="closeReviewLayer();">
									</div>					
								</form>
							</div>
						</div>
					</div>
					<script>
						function openReviewReplyLayer(ref, lef, sunbun) {
							var review_reply_layer = document.getElementById('id_review_reply_layer');
							document.getElementById('review_reply_ref').value = ref;
							document.getElementById('review_reply_lev').value = lef;
							document.getElementById('review_reply_sunbun').value = sunbun;
									
							review_reply_layer.style.display = 'block';
						}
						function closeReviewReplyLayer() {
							var review_reply_layer = document.getElementById('id_review_reply_layer');
							document.getElementById('review_reply_subject').value = '';
							document.getElementById('review_reply_content').value = '';
							
							document.getElementById('review_reply_ref').value = '';
							document.getElementById('review_reply_lev').value = '';
							document.getElementById('review_reply_sunbun').value = '';
							review_reply_layer.style.display = '';
						}
						function submitReviewReplyLayer() {
							var product_idx = document.getElementById('review_reply_product_idx').value;
							var member_id = document.getElementById('review_reply_member_id').value;
							var review_subject = document.getElementById('review_reply_subject').value;
							var review_content = document.getElementById('review_reply_content').value;
							
							var review_ref = document.getElementById('review_reply_ref').value;
							var review_lev = document.getElementById('review_reply_lev').value;
							var review_sunbun = document.getElementById('review_reply_sunbun').value;
							
							var param = 'product_idx=' + product_idx + '&member_id=' + member_id + 
							'&review_subject=' + review_subject + '&review_content=' + review_content + 
							'&review_ref=' + review_ref + '&review_lev=' + review_lev + '&review_sunbun=' + review_sunbun;
							action_ajax('/semi_project/section/review/reviewReplyWrite_ok.jsp',param , 'GET', 'REVIEW_REPLY_INSERT'); // 해당 페이지로 ajax통신 시작
						}
					</script>
					<div class="review_layer" id="id_review_reply_layer">
						<div class="review_layer_bg" onclick="closeReviewReplyLayer();"></div>
						<div class="review_layer_pop">
							<div class="review_layer_content">	
								<form class="layer-form-container" name="reviewWrite_ok" id="id_reviewReplyWrite_ok" action="/semi_project/section/review/reviewReplyWrite_ok.jsp">
									<div class="layer-form-title"><h2>댓글 달기</h2></div>
									<br />																															<!--  차후 session 값으로 교체 -->
									<div class="layer-form-title">아이디<input class="layer-form-field layer-form-field-id" type="text" name="review_reply_member_id" id="review_reply_member_id" value="whwns5" readonly="readonly"/>								
																  <input type="hidden" name="review_reply_product_idx" id="review_reply_product_idx" value="<%=product_idx%>">
																  <input type="hidden" name="review_reply_ref" id="review_reply_ref">
																  <input type="hidden" name="review_reply_lev" id="review_reply_lev">
																  <input type="hidden" name="review_reply_sunbun" id="review_reply_sunbun">
									</div>
									<br />
									<div class="layer-form-title">제목<input class="layer-form-field layer-form-field-subject" type="text" name="review_reply_subject" id="review_reply_subject" required="required"/>	
									</div>
									<br />
									<div class="layer-form-title">댓글 내용<textarea class="layer-form-field-content" rows="20" cols="68" name="review_reply_content" id="review_reply_content" required="required"></textarea>
									</div>
									<div class="layer-submit-container">
										<input class="layer-submit-button" type="button" value="작성하기" 
											onclick="submitReviewReplyLayer();">
										<input class="layer-submit-button" type="button" value="나가기" onclick="closeReviewReplyLayer();">
									</div>					
								</form>
							</div>
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
					<script>
						function openQnaLayer() {
							var qna_layer = document.getElementById('id_qna_layer');
							
							qna_layer.style.display = 'block';
						}
						function closeQnaLayer() {
							var qna_layer = document.getElementById('id_qna_layer');
							document.getElementById('qna_subject').value = '';
							document.getElementById('qna_content').value = '';
							qna_layer.style.display = '';
						}
						function submitQnaLayer() {
							var product_idx = document.getElementById('qna_product_idx').value;
							var member_id = document.getElementById('qna_member_id').value;
							var qna_subject = document.getElementById('qna_subject').value;
							var qna_content = document.getElementById('qna_content').value;
							
							var param = 'product_idx=' + product_idx + '&member_id=' + member_id + '&qna_subject=' + qna_subject + '&qna_content=' + qna_content;
							action_ajax('/semi_project/section/qna/qnaWrite_ok.jsp',param , 'GET', 'QNA_INSERT'); // 해당 페이지로 ajax통신 시작
							//var f = document.getElementById('id_qnaWrite_ok');
							//f.submit();
						}
					</script>
					<div class="tab_qna_table" id="ajax_qna_div"> 
						<!-- ajax로 Q&A를 가져오는 영역 -->
					</div>
					<div class="qna_layer" id="id_qna_layer">
						<div class="qna_layer_bg" onclick="closeQnaLayer();"></div>
						<div class="qna_layer_pop">
							<div class="qna_layer_content">	
								<form class="layer-form-container" name="qnaWrite_ok" id="id_qnaWrite_ok" action="/semi_project/section/qna/qnaWrite_ok.jsp">
									<div class="layer-form-title"><h2>상품 Q&A</h2></div>
									<br />																								<!--  차후 session 값으로 교체 -->
									<div class="layer-form-title">아이디<input class="layer-form-field layer-form-field-id" type="text" name="qna_member_id" id="qna_member_id" value="whwns5" readonly="readonly"/>			
																  <input type="hidden" name="qna_product_idx" id="qna_product_idx" value="<%=product_idx%>">
									</div>
									<br />
									<div class="layer-form-title">제목<input class="layer-form-field layer-form-field-subject" type="text" name="qna_subject" id="qna_subject" required="required"/>	
									</div>
									<br />
									<div class="layer-form-title">문의 내용<textarea class="layer-form-field-content" rows="20" cols="68" name="qna_content" id="qna_content" required="required"></textarea>
									</div>
									<div class="layer-submit-container">
										<input class="layer-submit-button" type="button" value="작성하기" 
											onclick="submitQnaLayer();">
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