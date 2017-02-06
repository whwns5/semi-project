<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkPopup() {
	var result = getCookie('popup0521');
	if (result == 'end') {
	   return false;
	}
	else {
		openPopup();
	}
}

function getCookie(name) { 
	   var cookieName = name + "=";
	   var x = 0;
	   while ( x <= document.cookie.length ) { 
	      var y = (x+cookieName.length); 
	      if ( document.cookie.substring( x, y ) == cookieName) { 
	         if ((lastChrCookie=document.cookie.indexOf(";", y)) == -1) 
	            lastChrCookie = document.cookie.length;
	         return decodeURI(document.cookie.substring(y, lastChrCookie));
	      }
	      x = document.cookie.indexOf(" ", x ) + 1; 
	      if ( x == 0 )
	         break; 
	      } 
	   return "";
	}

function openPopup(){ 
	window.open('/semi_project/section/member/join/popup.jsp','window','width=500,height=300');
}
</script>
</head>
<body onload='javascript:checkPopup();'>

<%@include file="/header/header.jsp" %>
<%@include file="/aside/aside.jsp" %>
	<h2>홈화면 입니다.</h2>
<%@include file="/footer/footer.jsp" %>

</body>
</html>



