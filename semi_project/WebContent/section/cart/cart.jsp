<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.cartTable{
border:2px solid black;
width:680px;
margin:0px auto;
}
h1{
text-align:center;
}
</style>
<body>
<section>
<h1>장바구니</h1>
</section>
<table class="cartTable" summary="장바구니 상품명, 제품가격, 선택한수량, 총결제비용 정보 및 결제 상품으로 선택, 해제 및 수량변경, 삭제 기능 제공표">
<thead>
<tr class="head">
<th><input type="checkbox" checked="checked" title="모든 상품을 결제상품으로 설정"></th>
<th>전체선택</th>
<th>상품정보</th>
<th>상품굼액</th>
<th>배송비</th>
</tr>
<tbody>
<tr>
<td><input type="checkbox" checked="checked" value=""></td>
<td><a href="#"><img src="" width="78" height="78" alt=""></a></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</thead>
</table>
</body>
</html>