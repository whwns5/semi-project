<%@page import="java.awt.Window"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
<jsp:useBean id="ppdto" class="semi.product.ProductPageDTO" scope="session"/>
<jsp:setProperty property="*" name="ppdto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/product/productByItemList.css?ver=6">
</head>
<%
	int totalCnt = 1;// 총 게시글 수
	String sortName = ppdto.getSortName();
	int listSize = ppdto.getListSize(); // 보여줄 리스트 수
	int pageSize = 5; // 보여줄 페이지 수
	String searchStr = request.getParameter("searchStr");
	String lcid_s = request.getParameter("lcid");
	String scid_s = request.getParameter("scid");
	if(searchStr != null){
		totalCnt = pdao.getSearchTotalCnt(searchStr);
		
	} else {
		if( scid_s == null ){ // 대분류로만 필터링 일경우
			totalCnt = pdao.getTotalCnt(lcid_s, "lcid");
		} else {
			totalCnt = pdao.getTotalCnt(scid_s, "scid");
		}
	}

	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")){
		cp_s = "1";	
	}
	int cp = Integer.parseInt(cp_s); // 현재 위치
	
	int totalPage = totalCnt/listSize + 1; // 총 페이지 수
	if(totalCnt % listSize == 0)totalPage--;
	
	int userGroup = cp / pageSize; // 해당 페이지의 페이지 그룹
	if(cp % pageSize == 0)userGroup--;  

	ArrayList<ProductDTO> arr_pdto = null;
	
	if(searchStr != null){
		arr_pdto = pdao.productSearchList(searchStr, cp, listSize, ppdto.getSortColumn(), ppdto.getSortOrderByType());
		
	} else {
		if( scid_s == null ){ // 대분류로만 필터링 일경우
			arr_pdto = pdao.productCategoryList(lcid_s, "lcid", cp, listSize, ppdto.getSortColumn(), ppdto.getSortOrderByType());
		} else {
			arr_pdto = pdao.productCategoryList(scid_s, "scid", cp, listSize, ppdto.getSortColumn(), ppdto.getSortOrderByType());
		}
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
			<ul class="main_middle_banner">
				<li><img src="/semi_project/img/header/nav_depth_menu_totebag.jpg"></li>
			</ul>
			<div class="product_list_wrap">
				<div class="item_sort">
					<div class="sort">
						<script>
							function changeSort(sortName) {						
								location.href = '/semi_project/section/product/productByItemList.jsp?cp=1&lcid=<%=lcid_s%><%=scid_s == null ? "" : "&scid=" + scid_s%>&sortName=' + sortName;
							}
							function changeSort2(sortName) {						
								location.href = '/semi_project/section/product/productByItemList.jsp?cp=1&searchStr=<%=searchStr%>&sortName=' + sortName;
							}
						</script>
						<ul class="type">
						<li><a href="<%=searchStr == null ? "javascript:changeSort('new');" : "javascript:changeSort2('new');" %>" <%=sortName.equals("new") ? "class='on'":"" %>>신규등록순</a></li>
						<!--  <li><a href="javascript:ChangeSort('best');" >인기판매순</a></li> -->
						<li><a href="<%=searchStr == null ? "javascript:changeSort('highprice');" : "javascript:changeSort2('highprice');" %>" <%=sortName.equals("highprice") ? "class='on'":"" %>>높은가격순</a></li>
						<li><a href="<%=searchStr == null ? "javascript:changeSort('lowprice');" : "javascript:changeSort2('lowprice');" %>" <%=sortName.equals("lowprice") ? "class='on'":"" %>>낮은가격순</a></li>
						<li>
							<script>
								function changeListSize(listSize) {
									location.href = '/semi_project/section/product/productByItemList.jsp?cp=1&lcid=<%=lcid_s%><%=scid_s == null ? "" : "&scid=" + scid_s%>&listSize=' + listSize;
								}
								function changeListSize2(listSize) {
									location.href = '/semi_project/section/product/productByItemList.jsp?cp=1&searchStr=<%=searchStr%>&listSize=' + listSize;
								}
							</script>
							<select onchange="<%=searchStr == null ? "changeListSize(this.value)" : "changeListSize2(this.value)" %>">
								<option value="8" <%=listSize == 8 ? "selected":"" %>>8개</option>
								<option value="12" <%=listSize == 12 ? "selected":"" %>>12개</option>
								<option value="16" <%=listSize == 16 ? "selected":"" %>>16개</option>
								<option value="20" <%=listSize == 20 ? "selected":"" %>>20개</option>
							</select>
						</li>
					</ul>
					</div>
					<p class="total">(총 <span><%=totalCnt %>개</span> 상품)</p>
				</div>
				<br>
				<br>
				<div class="item_show">
				<script>
					//var divTimeOut	= 50;
					//var divCloseSetTimer = 0;
					//var dddiv_id	= 0;
					
					function openDivMenu(div_id) {
						div_id.style.opacity = '1';
						/* mcancelclosetime();
						
						if(dddiv_id){
							dddiv_id.style.visibility = 'hidden';
						}
						
						dddiv_id = document.getElementById(div_id);
						dddiv_id.style.visibility = 'visible'; */
					}
					
					function closeDivMenu(div_id) {
						/* if(dddiv_id) dddiv_id.style.visibility = 'hidden'; */
						div_id.style.opacity = '0';
					}
					
					/* function closeTimeDivMenu(){
						divCloseSetTimer = window.setTimeout(closeDivMenu, divTimeOut);
					}
					
					function cancleCloseTimeDivMenu(){
						if(divCloseSetTimer)
						{
							window.clearTimeout(divCloseSetTimer);
							divCloseSetTimer = null;
						}
					}		 */
				</script>
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
<%
									if( searchStr != null ){
%>
										<img src="/semi_project/img/product/<%=arr_pdto.get(i).getLargecategory_name()%>/<%=arr_pdto.get(i).getSmallcategory_name()%>/<%=arr_pdto.get(i).getProduct_code()%>_<%=arr_pdto.get(i).getProduct_color()%>/<%=arr_pdto.get(i).getProduct_img() %>.jpg">
<%										
									} else {
%>
										<img src="/semi_project/img/product/<%=lcid_s%>/<%=arr_pdto.get(i).getSmallcategory_name()%>/<%=arr_pdto.get(i).getProduct_code()%>_<%=arr_pdto.get(i).getProduct_color()%>/<%=arr_pdto.get(i).getProduct_img() %>.jpg">
<%										
									}
%>
									
									<span><%=arr_pdto.get(i).getProduct_name()%>&nbsp;<%=arr_pdto.get(i).getProduct_code() %></span>
									</p>
									<span class="span_price"><%=dcformat.format((double) arr_pdto.get(i).getProduct_price()) %>원</span>
								</a>
							</div>
							<div class="div_menu" id="div_menu_<%=i%>" onmouseover="openDivMenu(this);" onmouseout="closeDivMenu(this);">
								<p class="p_menuicon">
									<a href="/semi_project/section/product/productDetail.jsp?product_idx=<%=arr_pdto.get(i).getProduct_idx() %>&product_code=<%=arr_pdto.get(i).getProduct_code()%>&lcid=<%=searchStr == null ? lcid_s : arr_pdto.get(i).getLargecategory_name()%>&scid=<%= arr_pdto.get(i).getSmallcategory_name()%>" class="a_detail"></a>
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
				<div class="item_page"> <!-- 페이징 -->
<%
					if(userGroup != 0){ // 현재 그룹이 첫 페이지 그룹이 아닌 경우
%>
						<a href="/semi_project/section/product/productByItemList.jsp?cp=<%= (userGroup-1)*pageSize + pageSize %>&lcid=<%=lcid_s%><%=scid_s == null ? "" : "&scid=" + scid_s %>">이전</a>
<%
					} else {
%>
						<a href="#">이전</a>
<%
					}
						
					for(int i = (userGroup * pageSize) + 1 ; i <= (userGroup * pageSize) + pageSize ; i++){
%>
						<a class="num <%= i==cp ? "on" : "" %>" href="/semi_project/section/product/productByItemList.jsp?cp=<%=i%>&lcid=<%=lcid_s%><%=scid_s == null ? "" : "&scid=" + scid_s %><%=searchStr == null ? "" : "&searchStr=" + searchStr %>"><%=i%></a>
<%
						if(i == totalPage)break;
					}
						
					if(userGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)){ // 현재 그룹이 마지막 페이지가 해당하는 그룹에 해당되지 않는 경우
%>
						<a href="/semi_project/section/product/productByItemList.jsp?cp=<%= ((userGroup+1)*pageSize) + 1 %>&lcid=<%=lcid_s%><%=scid_s == null ? "" : "&scid=" + scid_s %>">다음</a>
<%
					} else {
%>
						<a href="#">다음</a>
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