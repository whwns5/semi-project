<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=3">
</head>
<style>
div.id_ckbody{
	width:200px;
	margin:0px auto;
	margin-top:30px
}
a.common-bt{
	display: block;
	color: #e8380d;
	width: 150px;
	height: 20px;
	border: 2px solid #e8380d;
	padding: 14px 15px;
	text-align: center;
	transition: all 0.3s;
	font-family: 'Lato', sans-serif;
}
a.bt_writereply_small{
	width: 20px;
    height: 11px;
    padding: 8px 11px;
    font-size: 10px;
    color: #e8380d;
    text-decoration:none
}
</style>
<body>
<div class="id_ckbody">
	<script>
	function go_idCheck(){
		idCheck.submit();
		}
	</script>
		<form name="idCheck" action="idCheck_ok.jsp">
			<table>
				<tbody>
					<tr>
						<td>ID Check</td>
					</tr>
					<tr>
						<th><input type="text" name="userid"></th>
						<td><a class="common-bt bt_writereply_small" href="javascript:go_idCheck();">체크</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>