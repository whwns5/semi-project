<%@page import="semi.adminproduct.adminproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.adminproduct.*"%>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.m_title    { BACKGROUND-COLOR: #F7F7F7; PADDING-LEFT: 15px; PADDING-top: 5px; PADDING-BOTTOM: 5px; }
.m_padding  { PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; }
h1{
	margin-left: 100px
}
a.common-bt{
	display: block;
	color: #e8380d;
	width: 150px;
	height: 20px;
	border: 2px solid #e8380d;
	padding: 14px 15px;
	text-align: center;
	transition: all 0.3s;
	font-family: 'Lato', sans-serif;
}
a.bt_writereply{
	width: 50px;
    height: 18px;
	padding: 8px 11px;
	font-size: 12px;
	color: #e8380d;
	float: left;
}
section{
	text-align: -webkit-center;
}
</style>
<script>
function javascript:proCh(){
	update.submit();
}
</script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String product_idx = request.getParameter("product_idx");
	ArrayList<adminproductDTO> arr = pdao.productFind("product_idx", product_idx);
%>
<body>
<%@include file="/header/header.jsp" %>
<h1>상품수정</h1>
<hr>

<form name="update" action="productupdate_ok.jsp" method="post">
	<section>
	<article>
	
	<fieldset style="width:700px;">
	<table border="1" cellspacing="0" width="980" bordercolordark="#FFFFFF" align="center">
			<tbody>
						
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품번호:</td>
						<td class="m_padding"><input type="text" name="product_idx"
							value="<%=arr.get(0).getProduct_idx()%>" readonly></td>
					</tr>

					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">카테고리아이디:</td>
						<td class="m_padding"><input type="text" name="smallcategory_id"
							value="<%=arr.get(0).getSmallcategory_id()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품명:</td>
						<td class="m_padding"><input type="text" name="product_name"
							value="<%=arr.get(0).getProduct_name()%>"></td>
					</tr>

					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품코드:</td>
						<td class="m_padding"><input type="text" name="product_code"
							value="<%=arr.get(0).getProduct_code()%>"></td>
					</tr>

					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품색상:</td>
						<td class="m_padding"><input type="text" name="product_color"
							value="<%=arr.get(0).getProduct_color()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품사이즈:</td>
						<td class="m_padding"><input type="text" name=product_size
							value="<%=arr.get(0).getProduct_size()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품재고수량:</td>
						<td class="m_padding"><input type="text" name="product_num"
							value="<%=arr.get(0).getProduct_num()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품가격:</td>
						<td class="m_padding"><input type="text" name="product_price"
							value="<%=arr.get(0).getProduct_price()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품설명 내용:</td>
						<td class="m_padding"><input type="text" name="product_content"
							value="<%=arr.get(0).getProduct_content()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품이미지명:</td>
						<td class="m_padding"><input type="text" name="product_img"
							value="<%=arr.get(0).getProduct_img()%>"></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td width="160" class="m_title">상품이미지명:</td>
						<td class="m_padding"><input type="text" name="product_imgcount"
							value="<%=arr.get(0).getProduct_imgcount()%>"></td>
					</tr>
					<table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
					<tbody>
						<tr>
							<td height="15"></td>
						</tr>
					</tbody>
				</table>
				
			</tbody>
		</table>
		<div>
			<p align="center">
				<a class="common-bt bt_writereply bt_ch" href="javascript:proCh();">수정하기</a>&nbsp;&nbsp;&nbsp;
				<a class="common-bt bt_writereply" href="productFind.jsp">나가기</a>
			</p>
		</div>
	</fieldset>
</form>
</article>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>