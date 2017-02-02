<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
function ajax_result(httpRequest) {
	return function() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) { // 아랫부분은 응용하면 된다.
				if(!httpRequest.responseText.match(null)) {
					 var str = httpRequest.responseText;//서버에서 보낸 내용 받기
			         document.getElementById("message").innerHTML = str;//보여주기    
					/* try {
						var resultData = httpRequest.responseXML.getElementsByTagName('resultData')[0];
						var resultText = resultData.firstChild!=null ? resultData.firstChild.nodeValue : null;
						if(resultData.getAttribute('result')=='success') {
							var arr = JSON.parse(resultText);
							if(arr.ret=='success') {
								alert(arr.msg);
							}
							else {
								alert(arr.msg);
							}
						}
						else {
							alert(resultText);
						}
					} catch(e) {
						alert(e.message + httpRequest.responseText);
					} */
				}
			} else {
				alert("Failed : "+httpRequest.status);
			}
		}
	}
}
function action_ajax() {
	var url = "ajaxResultTest.jsp";
	var f = document.frm;
	var param = "user_id="+f.user_id.value+"&user_pw="+f.user_pw.value;
	sendRequest(url, param, ajax_result, 'POST');
	return false;
}
</script>
</head>
<body>
	<form name="frm" id="frm">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="user_id" id="user_id" tabindex="1"/></td>
                <td rowspan="2"><input type="button" value="로그인" style="height:50px" onclick="action_ajax();"/></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="user_pw" id="user_pw" tabindex="2"/></td>
            </tr>
        </table>
    </form>
    <div id="message"></div>
</body>
</html>