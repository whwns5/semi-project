<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/product/productByItemList.css?ver=2">
</head>
<%
	ArrayList<ProductDTO> arr_pdto = null;

	String lcid_s = request.getParameter("lcid");
	String scid_s = request.getParameter("scid");
	if( scid_s == null ){ // 대분류로만 필터링 일경우
		arr_pdto = pdao.productCategoryList(lcid_s, "lcid");
	} else {
		arr_pdto = pdao.productCategoryList(scid_s, "scid");
	}
	
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
			<ul class="main_middle_banner"></ul>
			<div class="product_list_wrap">
				<div class="item_sort">
					<div class="sort">
						<ul class="type">
						<li><a href="javascript:ChangeSort('opendate')"  class='on'>신규등록순</a></li>
						<li><a href="javascript:ChangeSort('best')" >인기판매순</a></li>
						<li><a href="javascript:ChangeSort('price_desc')" >높은가격순</a></li>
						<li><a href="javascript:ChangeSort('price')" >낮은가격순</a></li>
						<li>
							<select name="" id="" value="" onchange="ChangeSort('opendate',this.value)">
								<option  value="20">20개</option>
								<option  value="40">40개</option>
								<option  value="60">60개</option>
							</select>
						</li>
					</ul>
					</div>
					<p class="total">(총 <span>27개</span> 상품)</p>
				</div>
				<br>
				<br>
				<div class="item_show">
<%
				if(arr_pdto != null){
%>				
					<ul class="ul_productlist">
<%
					for(int i = 0 ; i < arr_pdto.size() ; i++){
%>
						<li>
							<div class="div_product">
								<a href="#">
									<p class="p_title">
									<img src="/semi_project/img/product/<%=lcid_s%>/<%=arr_pdto.get(i).getSmallcategory_name()%>/<%=arr_pdto.get(i).getProduct_code()%>_<%=arr_pdto.get(i).getProduct_color()%>/<%=arr_pdto.get(i).getProduct_img() %>.jpg">
									<span><%=arr_pdto.get(i).getProduct_name()%>&nbsp;<%=arr_pdto.get(i).getProduct_code() %></span>
									</p>
									<span class="span_price"><%=dcformat.format((double) arr_pdto.get(i).getProduct_price()) %></span>
								</a>
							</div>
							<div class="div_menu">
								<p class="p_menuicon">
									<a href="#" class="a_detail"></a>
									<a href="#" class="a_cart"></a>
								</p>
							</div>
						</li>
<%
					}
%>	
					</ul>
<%
				}
%>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/footer/footer.jsp"%>
</body>
</html>