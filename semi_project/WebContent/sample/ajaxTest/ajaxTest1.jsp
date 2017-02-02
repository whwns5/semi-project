<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style></style>
<script>
var xmlHttp
window.onload = function(){
    xmlHttp = createXMLHttpObject();
    xmlHttp.onreadystatechange = on_ReadystateChange;
    xmlHttp.open("GET","menu.json",true);
    xmlHttp.send(null);
    alert('전송 시작!');
}
function createXMLHttpObject(){
    var xhr = null;
    if(window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }
    else {
        xhr = new ActiveObject("Microsoft.XMLHTTP");
    }
    return xhr;
}
function on_ReadystateChange(){
    if(xmlHttp.readyState == 4){
        if(xmlHttp.status == 200){
            // xmlHttp.responseText
            // xmlHttp.responseXML
            alert('서버에서 받은 원본 데이터'+xmlHttp.responseText);
            parseData(xmlHttp.responseText);
          
        }
        else {
            alert('처리중 에러가 발생')
        }
    }
}
function parseData(strText){
    var menuItems = eval("("+strText+")").menuItems;
    alert(menuItems.length);
}
</script>
</head>
<body>

</body>
</html>