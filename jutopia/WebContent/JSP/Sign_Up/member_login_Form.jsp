<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 로그인</title>

<style>
.navi ul li {
	list-style: none;
	display: inline;
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {
		// 이메일 카피
		$('#select_email').change(function() {
			var selectedValue = $('#select_email option:selected').text();
			if (selectedValue == "직접 입력") {
				$('#login_mail_2').val("");
			} else {
				$('#login_mail_2').val(selectedValue);
			}

			$('#login_mail_2').focus();

		});
	});
</script>

<script language="javascript">
	function showPopup() {
		window.open("../../JSP/Sign_Up/Sign_Up_Passwd_Find.jsp", "회원가입 완료",
				"width=700, height=500, left=100, top=50");
	}
</script>

</head>
<body>
	<form action="loginPro.do" method="get">
		<table>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" size="7" name="login_mail_1" autofocus>
					@ <select style="font-size: 12px; font-face: 돋움;" id="select_email">
						<option value="">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
				</select> <input type="text" name="login_mail_2" size="10" id="login_mail_2"></td>
			</tr>

			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" size="10" name="login_pwd">
			</tr>

		</table>
		<input type="submit" value="로그인">
		<nav class="navi">
			<ul>
				<li>
					<div id="passwd_find">
						<a href="" onclick="showPopup()"><font size="2" face="맑은 고딕">비밀번호
								찾기</font></a>
					</div>
					</a>
				</li>
			</ul>
		</nav>


	</form>
</body>
</html>