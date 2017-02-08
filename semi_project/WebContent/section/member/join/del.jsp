<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.delete_section {
    width: 1100px;
    margin: 0px auto;
    font-family: 'Lato', sans-serif;
}
div.delete_container div.delete_container_title h1 {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
}
div.delete_container_content div.div_delete_box {
    width: 800px;
    height: 400px;
    margin: 0px auto;
    border: 1px solid silver;
    margin-bottom: 50px;
}
div.delete_input_wrap {
    width: 700px;
    height: 200px;
    margin: 0px auto;
    margin-top: 50px;
}
div.delete_input_wrap div.div_member_delete {
    margin: 0px auto;
    width: 450px;
    height: 200px;
}
div.div_member_delete_input_area {
    width: 300px;
    height: auto;
    margin-left: 50px;
    margin-top: 80px;
    float: left;
    border:1px;
    border-collapse: collapse;
    float: left;
}
td, th {
    display: table-cell;
    vertical-align: inherit;
}
div.div_member_delete_input_area table {
    border-collapse: collapse;
}
div.div_member_delete_input_area table tr {
    border-bottom: 1px solid silver;
    height: 30px;
}
div.div_member_delete_input_area table td input.delete_input {
    border: 1px solid white;
}
div.div_member_submit{
	margin-top: 60px;
    margin-left: 40px;
}
input.member_submit {
    color: #e8380d;
    width: 150px;
    border: 2px solid #e8380d;
    padding: 12px 15px;
    text-align: center;
    transition: all 0.3s;
    font-family: 'Lato', sans-serif;
    margin-left: 300px;
}
form {
	width: 300px;
}
</style>
<body>
<section class="delete_section">
<article>
	<div class="delete_container">
		<div class="delete_container_title">
			<h1>회원 탈퇴</h1>
		</div>
		<div class="delete_container_content">
			<div class="div_delete_box">
				<div class="delete_input_wrap">
					<div class="div_member_delete">
						<form name="delfm" action="/semi_project/section/member/join/del_ok.jsp">
							<div class="div_member_delete_input_area">
								<table>
									<tbody>
										<tr>
										<td>ID</td>
										<td><input type="text" name="member_id" class="delete_input"></td>
										</tr>
										<tr>
										<td>PWD</td>
										<td><input type="text" name="member_pwd" class="delete_input"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="div_member_submit">
								<input type="submit" value="회원탈퇴" class="member_submit">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</article>
</section>
</body>
</html>













