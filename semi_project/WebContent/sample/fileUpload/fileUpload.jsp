<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
function startAjax() {
	
	//var uploadFileName = document.getElementById('uploadFileName').value;
	var fileInput = document.getElementById('uploadFile');
	window.alert('fileInput.files.length : ' + fileInput.files.length);
	
	
	var file = fileInput.files[0];
	var formData = new FormData();
	//formData.append('uploadFile', file);
	formData.append("uploadFile", document.getElementById('uploadFile').files[0]);
	//formData.append('uploadFileName', uploadFileName);
	
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "fileUpload_ok.jsp", true);
	
	//xhr.setRequestHeader('processData', 'false');
	/* window.alert('processData : ' + xhr.getResponseHeader('processData'));
	window.alert('contentType : ' + xhr.getResponseHeader('contentType'));
	window.alert('Content-Type : ' + xhr.getResponseHeader('Content-Type'));
	xhr.setRequestHeader('Content-Type', 'multipart/form-data');
	window.alert('Content-Type2 : ' + xhr.getResponseHeader('Content-Type')); */
	//xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // POST 방식일 때 등록
	//xhr.setRequestHeader('Content-Type', 'multipart/form-data; boundary=----WebKitFormBoundaryGxkse0dqOPAjPdfw');
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			window.alert('업로드 성공!');
		}
	}
	/* xhr.onprogress = function(evt) {
		console.log('파일 업로드 % = ' + (evt.loaded / evt.total) + '%');
	} */
	
	xhr.send(FormData);
	//window.alert('client : ' + uploadFileName);
	//var params = 'uploadFileName='+uploadFileName;
	//xhr.send(params);
	
	//return false;
	
/* 	if(fileInput.files !== undefined){
		window.alert('fileInput.files.length : ' + fileInput.files.length);
		
		var file = fileInput.files[0];
		var formData = new FormData();

		formData.append("uploadFile", document.getElementById('uploadFile').files[0]);

		
		xhr = new XMLHttpRequest();
		xhr.open("POST", "fileUpload_ok.jsp", true);
		

		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				window.alert('업로드 성공!');
			}
		}
		xhr.onprogress = function(evt) {
			console.log('파일 업로드 % = ' + (evt.loaded / evt.total) + '%');
		}
		
		xhr.send(FormData);
		
	}else{
		document.getElementById('uploadForm').target = 'uploadIFrame';
	} */
}
/* window.onlaod = function () {
	documnet.getElementById('uploadForm').onsubmit = function() {
		
		var fileInput = document.getElementById('uploadFile');
		if(fileInput.files !== undefined){
			var file = fileInput.files[0];
			var formData = new FormData();
			formData.append('upload_file', file);
			
			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'fileUpload_ok.jsp', true);
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200){
					window.alert('업로드 성공!');
				}
			}
			xhr.onprogress = function(evt) {
				console.log('파일 업로드 % = ' + (evt.loaded / evt.total) + '%');
			}
			
			xhr.send(FormData);
			return false;
		}else{
			document.getElementById('uploadForm').target = 'uploadIFrame';
		}
	}
	document.getElementById('uploadIFrame').onload = function() {
		window.alert('업로드 성공!');
	}
} */
</script>
</head>
<body>
<form id="uploadForm" method="post" enctype="multipart/form-data" action="fileUpload_ok.jsp">
		<input name="uploadFile" id="uploadFile" type="file" />
		<!--<input type="text" id="uploadFileName">-->
		
		<input type="submit" value="Upload2"/>
		<!--<iframe id="uploadIFrame" name="uploadIFrame" style="display:none;visibility:hidden"></iframe>-->
	
	<input type="button" name="action" value="아작스업로드" onclick="startAjax();"/>  
</form>
</body>
</html>