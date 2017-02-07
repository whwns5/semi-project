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
    padding-top: 20px;
}
div.div_member_delete_input_area {
    width: 400px;
    height: auto;
    margin-left: 50px;
    margin-top: 80px;
    float: left;
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
								ID:<input type="text" name="member_id">
								PWD:<input type="text" name="member_pwd"><br>
								<input type="submit" value="회원탈퇴">
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