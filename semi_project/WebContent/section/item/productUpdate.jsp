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
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String product_idx = request.getParameter("product_idx");
	ArrayList<adminproductDTO> arr = pdao.productFind("product_idx", product_idx);
%>
<body>
<h1>수정하기</h1>
<form name="update" action="productupdate_ok.jsp" method="post">
	<fieldset style="width:700px;">
		상품번호:<input type="text" name="product_idx" value="<%=arr.get(0).getProduct_idx()%>" readonly><br>
		카테고리아이디:<input type="text" name="smallcategory_id" value="<%=arr.get(0).getSmallcategory_id()%>"><br>
		상품명:<input type="text" name="product_name" value="<%=arr.get(0).getProduct_name()%>"><br>
		상품코드:<input type="text" name="product_code" value="<%=arr.get(0).getProduct_code()%>"><br>
		상품색상:<input type="text" name="product_color" value="<%=arr.get(0).getProduct_color()%>"><br>
		상품사이즈:<input type="text" name=product_size value="<%=arr.get(0).getProduct_size()%>"><br>
		상품재고수량:<input type="text" name="product_num" value="<%=arr.get(0).getProduct_num()%>"><br>
		상품가격:<input type="text" name="product_price" value="<%=arr.get(0).getProduct_price()%>"><br>
		상품설명 내용:<input type="text" name="product_content" value="<%=arr.get(0).getProduct_content()%>"><br>
		상품이미지명:<input type="text" name="product_img" value="<%=arr.get(0).getProduct_img()%>"><br>
		상품이미지명:<input type="text" name="product_imgcount" value="<%=arr.get(0).getProduct_imgcount()%>"><br>
		<input type="submit" value="수정하기">
		<input type="button" value="나가기" onclick="location.href='productFind.jsp';">
	</fieldset>
</form>
</body>
</html>