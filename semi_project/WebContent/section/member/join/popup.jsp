<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function popupClose() {
	setCookie( "popup0521", "end" , 1);
	window.close();
}
    
function setCookie(cname, value, expire) {
	   var todayValue = new Date();

	   todayValue.setDate(todayValue.getDate() + expire);
	   document.cookie = cname + "=" + encodeURI(value) + "; expires=" + todayValue.toGMTString() + "; path=/;";
	}

</script>
</head>
<body>
팝업창입니다
<input type="button" onclick = "popupClose()" value="오늘하루 행복하길">
</body>
</html>