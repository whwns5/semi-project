<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.all-container{
width:100%;
border:1px solid gray;
}
.left{
float:left;
max-width:160px;
margin:0;
padding:1em;
}
.left-menu li{
list-style-type:none;
padding:0;
}
.left-menu dd{
}
</style>
<body>
<div class="all-container">
<div class="left">
<div class="left-mypage">
<h2><a href="">My Page</a></h2>
</div>
<div class="left-menu">
<dl>
<dt>주문정보</dt>
<dd>
<ul>
<li><a>주문 조회</a></li>
<li><a>취소/교환/반품 내역</a></li>
<li><a>영수증/계산서 신청</a></li>
<li><a>위시리스트</a></li>
</ul>
</dd>
<dt>혜택정보</dt>
<dd>
<ul>
<li><a>쿠폰</a></li>
<li><a>적립금</a></li>
</ul>
</dd>
<dt>나의메모</dt>
<dd>
<ul>
<li><a>1:1문의</a></li>
<li><a>상품평</a></li>
<li><a>Q&A</a></li>
</ul>
</dd>
<dt>정보관리</dt>
<dd>
<ul>
<li><a>회원정보 수정</a></li>
<li><a>회원탈퇴 신청</a></li>
</ul>
</dd>
</dl>
</div>
</div>
<div class="right">
<h3>My Page<span class="click-map">홈&gt;마이페이지</span></h3>
<div class="">
<h3>최근주문정보<span class="total">(Total:<strong>(숫자)</strong>)</span></h3>
<table class="right-table">
<thead>
<tr>
<td>주문정보</td>
<td>상품정보</td>
<td>옵션</td>
<td>주문금액</td>
</tr>
</thead>
</table>
</div>
</div>
</div>
</body>
</html>