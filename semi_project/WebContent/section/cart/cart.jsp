<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.click-map{
font-size:10px;
}
.table  {
margin: auto;
margin-left:0px;
width:100%;
border-collapse:collapse;border-spacing:0;border-color:#ccc;
}
.table td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.table th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.table caption{
font-size:9px;
text-align:left;
}
.table tfoot td{
text-align:right;
}
.button-left{
float:left;
font-size:8px;
}
.button-right{
float:right;
}
.recomm-comment{
font-size:9px;
}
.recommend li{
list-style-type:none;
display:inline;
}
</style>
<body>
<p style="font-size:20px; font-weight:bold; color:lightgrey">&lt;header영역&gt;</p>
<section>
<article>
<div><h3>장바구니&nbsp;&nbsp;<span class="click-map">장바구니 &gt; 주문/결제 &gt; 주문완료</span></h3></div>
<table class="table">
<caption>담은상품</caption>
<thead>
<tr>
<th><input type="checkbox" class="" title="담은 상품 전체선택" name="" checked=""></th>
<th>상품정보</th>
<th>판매가</th>
<th>수량</th>
<th>결제예정가</th>
<th>선택</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<form name="form_check" method="post" action="">
<input type="checkbox" name="checkProduct" class="checkProduct" checked="">
</form>
</td>
<td>
<span style="float:left; padding:0; margin:0" class="image">
<a href="">(이미지)</a>
</span>
<span style="float:right; text-align:right" class="name">
<a href="">(제품명)</a>
<br>
(옵션)
</span>
</td>
<td>(판매가)</td>
<td>(수량)</td>
<td>(결제예정가)</td>
<td>(선택)</td>
</tr>
</tbody>
<tfoot>
<tr>
<td colspan="6">
<div class="result_box">
<span class="total">
<span class="txt">총판매가</span>
<strong class="number">~원</strong>
</span>
<img class="icon" src="" alt="plus">
<span class="total">
<span class="txt">배송비</span>
<strong class="number">0원</strong>
</span>
<img class="icon" src="" alt="equal">
<span class="total_payment">
<span class="txt">총 결제 금액</span>
<strong class="number">
<span>원</span>
</strong>
</span>
</div>
</td>
</tr>
</tfoot>
</table>
<div class="button">
<div class="button-left">
<a href=""><img class="" alt="" src="">(전체선택버튼)</a>
<a href=""><img class="" alt="" src="">(선택해제버튼)</a>
<a href=""><img class="" alt="" src="">(전체삭제버튼)</a>
</div>
<div class="button-right">
<input type="button" value="견적서출력">
<input type="button" value="쇼핑 계속하기">
<input type="button" value="선택상품 주문">
<input type="button" value="전체상품 주문">
</div>
</div>
</article>
<br>
<br>
<article>
<div>
<h4>추천! <span class="recomm-comment">다른 고객님들이 많이 구입하신 상품들</span></h4>
</div>
<hr>
<p style="font-size:8px">(추천상품페이지 구현)</p>
<div class="recommend">
<ul>
<li>(상품1)</li>
<li>(상품2)</li>
<li>(상품3)</li>
<li>(상품4)</li>
</ul>
</div>
</article>
</section>
<p style="font-size:20px; font-weight:bold; color:lightgrey">&lt;footer영역&gt;</p>
</body>
</html>