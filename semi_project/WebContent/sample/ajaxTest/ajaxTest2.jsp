<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var xmlhttp = null;
function getXMLHttpRequest() {// XMLHttpRequest 객체 얻기
    if (window.ActiveXObject) {
        try {
            return new ActiveXObject("Msxml2.XMLHTTP");//IE 상위 버젼
        } catch (e1) {
            try {
                return new ActiveXObject("Microsoft.XMLHTTP");//IE 하위 버젼
            } catch (e2) {
                return null;
            }
        }
    } else if (window.XMLHttpRequest) {
        return new XMLHttpRequest();//IE 이외의 브라우저(Firefox, Chrome, Opera, Safari 등)
    } else {
        return null;
    }
}
 
function requestName(smethod,url) {// 서버에 요청
    var f = document.frm;
    var tmp_send = "";
    var sparam = "user_id="+f.user_id.value+"&user_pw="+f.user_pw.value;
     
    if(smethod == "POST") {
        tmp_send = sparam; // send("user_id="+f.user_id.value+"&user_pw="+f.user_pw.value) 메개변수에 전송할 데이터를 입력
    } else { // GET
        tmp_send = null; //  send(null) GET일때는 주로 NULL 사용(send() 메서드의 매개변수는 필요하지 않다.)
        url = url + "?" + sparam; //입력받은 값을 넘기기 위해 셋팅
    }
 
    xmlhttp = getXMLHttpRequest();//XMLHttpRequest 객체 얻기
    xmlhttp.open(smethod, url, true);//연결 (POST 또는 GET)
    xmlhttp.onreadystatechange = responseName;//콜백 함수  등록
    xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
    xmlhttp.send(tmp_send);//전송
}
  
function responseName() { // 콜백함수
    if (xmlhttp.readyState == 4) {//완료
        if (xmlhttp.status == 200) {//오류없이 OK
            var str = xmlhttp.responseText;//서버에서 보낸 내용 받기
            document.getElementById("message").innerHTML = str;//보여주기    
        } else {
            alert("오류 : " + xmlhttp.status);
        }
    }
}// 응답
</script>
</head>
<body>
	<form name="frm" id="frm">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="user_id" id="user_id" tabindex="1"/></td>
                <td rowspan="2"><input type="button" value="로그인" style="height:50px" onclick="requestName('POST','/semi_project/sample/makeJson/jsonResultTest.jsp')"/></td>
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