<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function ajaxSend() {
	var form = document.getElementById("upload_form");

    var formData = new FormData(form);

    var xhr = new XMLHttpRequest();
    xhr.open("POST" , "fileUpload_ok.jsp" , true);
    xhr.send(formData);
}
</script>
</head>
<body>
<form enctype="multipart/form-data" action="_URL" method="POST" id="upload_form">
      <input type="hidden" name="MAX_FILE_SIZE" value="300000" />
      <input type="file" id="upload_file" />
      <input type="button" value="파일 전송" onclick="ajaxSend();"/>
</form>
</body>
</html>