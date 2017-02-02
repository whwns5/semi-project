<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ajax.js"></script>
<script>
function jsonParsing(responseText) {
	//var json = JSON.parse(responseText);
	//var qdto = json.QnaDTO;
	//var docStr = '';
	
	
	
	
	
	//dotStr +=  qdto[0].qna_idx;

	document.getElementById("message").innerHTML = responseText;//보여주기
}

function ajax_result(httpRequest) {
	return function() {
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				if(!httpRequest.responseText.match(null)){
					var responseText = httpRequest.responseText;
					jsonParsing(responseText);
				}
			}
		}
	}
}

function action_ajax(url) {
	var url = url;
	var param = "";
	sendRequest(url, param, ajax_result, 'GET');
	return false;
}
</script>
</head>
<body>
	<input type="button" value="ajax시작GET" onclick="action_ajax('ajaxDbResultTest3.jsp');">
	<div id="message"></div>
</body>
</html>