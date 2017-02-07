<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/default.css?ver=2">
<link rel="stylesheet" type="text/css" href="/semi_project/css/popup/popup.css?ver=3">
<script>
function popupClose() {
	var popupck = document.getElementById('popupck').checked;
	if(popupck == true){
		setCookie( "popup0521", "end" , 1);
	}

	window.self.close();
}
function setCookie(cname, value, expire) {
	var todayValue = new Date();

	todayValue.setDate(todayValue.getDate() + expire);
	document.cookie = cname + "=" + encodeURI(value) + "; expires=" + todayValue.toGMTString() + "; path=/;";
}

</script>
</head>
<body>
<section>
	<div class="pop_container">
		<div class="pop_img">
			<a href="/semi_project/section/member/event.jsp">
				<img src="/semi_project/img/popup/pop_img.jpg">
			</a>
		</div>
		<div class="pop_bt">
			<input type="checkbox" value="on" id="popupck"><span>오늘 하루 창 보이지 않기</span>
			<a href="javascript:popupClose();">
				<img src="/semi_project/img/btn/close_btn.png">
			</a>
		</div>
	</div>
</section>
</body>
</html>