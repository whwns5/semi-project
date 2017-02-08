<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function cancle(){
	location.href='adminproductList.jsp';
}
</script>
<%
Calendar now=Calendar.getInstance();
int year=now.get(Calendar.YEAR);
int month=now.get(Calendar.MONDAY)+1;
String month_a="";
if(month<10){
	month_a="0"+month;
}
int date=now.get(Calendar.DATE);
String date_a="";
if(date<10){
	date_a="0"+date;
}
String date1=year+"-"+month_a+"-"+date_a;
System.out.println(date);
%>
</head>
<body>
<section>
<article>

<h3>아이템등록</h3>

<form name="productForm" action="adminproductWrite_ok.jsp" method="post" enctype="multipart/form-data">
<fieldset style="width:700px;">
<table>
<tr>
<td>번호:
<input type="text" placeholder="번호" name="product_idx"></td>
</tr>
<tr>
<td>카테고리:
<input type="text" placeholder="카테고리" name="smallcategory_name"></td>
</tr>
<tr>
<td>상품명:
<input type="text" placeholder="상품명" name="prouct_name"></td>
</tr>
<tr>
<td>상품가격:
<input type="text" placeholder="가격" name="product_price"></td>
</tr>
<tr>
<td>상품 재고 수량:
<input type="text" placeholder="수량" name="product_num"></td>
</tr>
<tr>
<td>상품등록일:<input type="date" name="product_regdate" value="<%=date1 %>"></td>
</tr>
<tr>
<td colspan="2">이미지등록:<input type="file" name="img" size="25"></td>
</tr>
<tr>
<td><input type="submit" value="등록하기"></td>
<td><input type="button" value="취소" onclick="cancle()"></td>
</tr>



</table>

</fieldset>
</form>
</article>
</section>
</body>
</html>