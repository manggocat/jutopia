<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 로그인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script type="text/javascript">
function findpwd() {
	
}
</script>
<script type="text/javascript">
	$(function() {
		// 이메일 카피
		$('#select_email').change(function() {
			var selectedValue = $('#select_email option:selected').text();
			if (selectedValue == "직접 입력") {
				$('#text_mail_2').val("");
			} else {
				$('#text_mail_2').val(selectedValue);
			}

			$('#text_mail_2').focus();

		});
	});
</script>
<style type="text/css">
.line {
	border-bottom: 1px solid black;
}

.line0 {
	border-bottom: 1px solid black;
	border-top: 2px solid black;
}

.line1 {
	border-bottom: 2px solid black;
}

.sign_up_email1 {
	width: 20%;
	padding: 4px 7px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 15px;
}

.sign_up_email2 {
	width: 30%;
	padding: 4px 7px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 15px;
}

.inputtext {
	width: 45%;
	padding: 4px 7px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 15px;
}

#select_email {
	width: 27%;
	padding: 4px;
	border: 1px solid #c3c3c3;
	border-radius: 15px;
}

.typebtn {
	width: 25%;
	padding: 8px 10px;
	margin: 3px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 15px;
	text-align: center;
}

.typecheckbtn {
	width: 25%;
	padding: 8px 10px;
	margin: 3px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 15px;
	color: #fff;
	background-color: #E8D9FF;
	text-align: center;
}

.btncheck {
	width: 15%;
	padding: 5px 0px;
	margin: 3px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 15px;
	text-align: center;
}
</style>

</head>
<body>

	<form method="post" action="FindpwdProAction.do">
		<center>
			<table class="pass_table" border="0" cellpadding="3">
				<font style="font-size: 13px; font-face: 돋움;">
					<tr>
						<td class="line0" colspan="2" width="60"><font
							style="font-size: 14px; face: 맑은 고딕;"><b>이름 : </b></font>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" size="7" name="name" id="sign_up_name"
							class="inputtext"></td>
					</tr>

					<tr>
						<td class="line" colspan="2" width="60"><font
							style="font-size: 14px; face: 맑은 고딕;"><b>핸드폰 : </b></font>&nbsp;
							<input type="text" size="7" name="tel" id="sign_up_phone"
							class="inputtext"></td>
					</tr>



					<tr>
						<td class="line" colspan="2"><font
							style="font-size: 14px; face: 맑은 고딕;"><b>이메일 : </b></font> <input
							type="text" size="10" name="text_mail_1" id="text_mail_1"
							class="sign_up_email1"> @ <select
							style="font-size: 12px; font-face: 돋움;" id="select_email">
								<option value="">직접 입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
						</select> <input type="text" size="10" id="text_mail_2" name="text_mail_2"
							class="sign_up_email2"></td>
					</tr>
					<tr>
					
					
						<td class="line1" colspan="2">
						<button type="submit" id='search_button' class="btn btn-primary btn-sm" style="background-color: #581276; margin-left: 40%; margin-top: 3%; margin-bottom: 3%"  >비밀번호 찾기</button>
						
					</tr>
			</table>
			</font>
			${pwdcheck }
		</center>
	</form>
</body>
</html>
<c:if test="${pwdcheck == 0}">
<script type="text/javascript">


</script>
</c:if>
<c:if test="${pwdcheck == -1}">
<script type="text/javascript">
alert("정보와 일치하는 회원이 없습니다 ");

</script>
</c:if>
<c:if test="${pwdcheck==1}">

<script type="text/javascript">
alert("비밀번호가 변경되었습니다");
window.opener.location.href="mapmainForm.do"; // 부모창을 변경해라.
window.close();

</script>

</c:if>
<!-- <script type="text/javascript">
	function setMain() {
		var main =  window.open("Main_Te2t.do");
		main.document.write("<center><pre>주토피아 홈페이지에 접속하신 걸 환영합니다. <br><br> 즐거운 시간 보내시길 바랍니다.</pre></center>");
}

</script> -->