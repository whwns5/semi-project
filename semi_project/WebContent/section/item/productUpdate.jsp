<%@page import="semi.adminproduct.adminproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.adminproduct.*"%>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO"/>

<%
	request.setCharacterEncoding("utf-8");
	ArrayList<adminproductDTO> arr = pdao.productFind("Smallcategory_id", pdto.getProduct_name());
	System.out.println(arr);


%>




<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정하기</h1>
<form name="update" action="productupdate_ok.jsp" method="post">
<fieldset style="width:700px;">
상품번호:<input type="text" name=product_idx value="<%=arr.get(0).getProduct_idx()%>" readonly><br>
카테고리아이디:<input type="text" name="smallcategory_id" value="<%=arr.get(0).getSmallcategory_id()%>"><br>
상품명:<input type="text" placeholder="상품명" name="product_name" value="<%=arr.get(0).getProduct_name()%>"><br>
상품코드:<input type="text" placeholder="상품코드" name="product_code"><br>
상품색상:<input type="text" placeholder="상품색상" name="product_color"><br>
상품사이즈:<input type="text" placeholder="상품사이즈" name=product_size><br>
상품재고수량:<input type="text" placeholder="상품재고수량" name="product_num"><br>
상품가격:<input type="text" placeholder="상품가격" name="product_price"><br>
상품설명 내용:<input type="text" placeholder="상품설명내용" name="product_content"><br>
상품이미지명:<input type="text" placeholder="상품이미지명" name="product_img"><br>
상품이미지명:<input type="text" placeholder="상품이미지수" name="product_imgcount"><br>
<input type="submit" value="수정하기">
<input type="reset" value="다시작성">
</fieldset>
</form>
</body>
</html>