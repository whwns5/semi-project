<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=3">
<script>
function goDel(){
	delfm.submit();
}
</script>
<style>
div.delete_container{
	width: 900px;
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
    width: 200px;
    height: auto;
    margin-left: 30px;
    margin-top: 110px;
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
div.div_member_submit {
	width: 105px;
	float: right;
	margin-left: 0px;
	margin-top: 120px;
	margin-right: 50px;
}
a.common-bt {
	display: block;
    color: #e8380d;
    width: 150px;
    border: 2px solid #e8380d;
    padding: 14px 15px;
    text-align: center;
    transition: all 0.3s;
    font-family: 'Lato', sans-serif;
}
div.delete_alert_wrap{
	margin-top: 40px;
    margin-left: 180px;
    width: 500px;
}
h3{
    font: lighter 24px/30px ngb;
    color: #333;
    margin-bottom: 50px;
    background: url(../img/icon/h3_ico.gif) no-repeat;
    text-indent: 42px;
}
</style>
<h3>회원 탈퇴</h3>
	<div class="delete_container">
		<div class="delete_container_content">
			<div class="div_delete_box">
				<div class="delete_input_wrap">
					<div class="div_member_delete">
						<form name="delfm" id="delfm" action="/semi_project/section/member/join/del_ok.jsp">
							<div class="div_member_delete_input_area">
								<table>
									<tbody>
										<tr>
										<td>ID</td>
										<td><input type="text" name="member_id" class="delete_input"></td>
										</tr>
										<tr>
										<td>PWD</td>
										<td><input type="password" name="member_pwd" class="delete_input"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="div_member_submit">
								<a class=common-bt style="text-decoration:none" href="javascript:goDel();">회원탈퇴</a>
							</div>
						</form>
					</div>
				</div>
				<div class="delete_alert_wrap">
						*회원님의 정보를 안전하게 보호하기 위해 패스워드를 확인해주세요.
				</div>
			</div>
		</div>
	</div>













