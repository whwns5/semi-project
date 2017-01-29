<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style>
#jb-container {
	width: 940px;
	margin: 1px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#jb-header {
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #bcbcbc;
}

#jb-content {
	width: 620px;
	height: 345px;
	padding: 20px;
	margin-bottom: 20px;
	margin-left:10px;
	float: right;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
	width: 220px;
	height: 345px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-footer {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
ul{
list-style-type:none;
margin:0;
padding:0;
}
dt{
text-indent:40px;
background-color:#bfbfbf;
}
li a{
dispay:block;
color:#000;
padding:8px; 16px;
text-decoration:none;
}
.right-table{
width:100%;
}
.right-table, tr, td{
border:1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<h1>header</h1>
		</div>
		<div id="jb-content">
			<h3>
				My Page<span class="click-map" style="float:right; font-size:10px">홈&gt;마이페이지</span>
			</h3>
			<h3>
				최근주문정보<span class="total">(Total:<strong>(숫자)</strong>)
				</span>
			</h3>
			<table class="right-table">
				<thead>
					<tr>
						<td>주문정보</td>
						<td>상품정보</td>
						<td>옵션</td>
						<td>주문금액t</td>
					</tr>
				</thead>
				<tbody>
				<tr>
				<td>(content)</td>
				<td>(content)</td>
				<td>(content)</td>
				<td>(content)</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div id="jb-sidebar">
				<dl>
				<dt>주문정보</dt>
				<dd>
					<ul>
						<li><a href="">주문 조회</a></li>
						<li><a href="#">취소/교환/반품 내역</a></li>
					</ul>
				</dd>
				<dt>혜택정보</dt>
				<dd>
					<ul>
						<li><a href="#">쿠폰</a></li>
						<li><a href="#">적립금</a></li>
					</ul>
				</dd>
				<dt>나의메모</dt>
				<dd>
					<ul>
						<li><a href="#">상품평</a></li>
						<li><a href="#">Q&amp;A</a></li>
					</ul>
				</dd>
				<dt>정보관리</dt>
				<dd>
					<ul>
						<li><a href="#">회원정보 수정</a></li>
						<li><a href="#">회원탈퇴 신청</a></li>
					</ul>
				</dd>
			</dl>
		</div>
		<div id="jb-footer">
			<h2>footer &copy;Copyright</h2>
		</div>
	</div>
</body>
</html>