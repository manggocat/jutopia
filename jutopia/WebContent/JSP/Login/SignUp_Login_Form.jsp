<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 로그인</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

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
	
	// 비밀번호 찾기 팝업
	function passwdshowPopup() {	  
		window.open("../../JSP/Password/SignUp_PasswdFind_Form.jsp", "비밀번호 찾기", 
		"width=700, height=500, left=100, top=50");
	  }
  	
	function focusIt()	{      
	   document.inform.text_mail_1.focus();
	}

	function checkIt() {
		//var inputForm = eval("document.inputForm");
			inputForm=eval("document.inForm");
		if (!inputForm.text_mail_1.value) {
			alert("이메일 아이디를 입력해 주세요.");
			inputForm.text_mail_1.focus();
			return false;
		}
		
		if (!inputForm.text_mail_2.value) {
			alert("이메일 주소를 입력해 주세요.");
			inputForm.text_mail_2.focus();
			return false;
		}
		
		if (!inputForm.login_pwd.value) {
			alert("비밀번호를 입력해 주세요.");
			inputForm.login_pwd.focus();
			return false;
		}
		
		
		

		
}
  
</script>
<style>

.navi {
			
	background : #EAEAEA;
/* 	margin-top: 100px;
	margin-left: 100px; */
	width: 400px;
	height: 150px;
	font-face: 맑은 고딕;
	font-size: 12px;
		}
		
.login_form	{
	border-collapse:collapse;
	border:1px gray solid;
}

	.navi ul li {
		list-style: none;
		display: inline;

		}

</style>

</head>
<body>
<center>
<form name="inForm" method="post" action="SignUp_LoginPro.do"  onSubmit="return checkIt();">
<table width=500 cellpadding="5" align="center" border="1" >
	<tr>
		<td width="100" bgcolor="${ othercolor }" height="20">
		이메일 : </td>
		<td width="400" height="20">
		<input type="text" name="text_mail_1" id="text_mail_1" size="15" maxlength="20"> @ 
		<select style="font-size:12px; font-face:돋움;" id="select_email">
			<option value="">직접 입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="dreamwiz.com">dreamwiz.com</option>
			</select>
			<input type="text" name="text_mail_2" size="10" id="text_mail_2"></td>
	</tr>
	<tr>
		<td bgcolor="${ othercolor }"  width="100" align="center">패스워드</td>
		<td width="200" height="20">
		<input type="password" name="login_pwd" size="15" maxlength="10">
		<input type="submit" name="Submit" value="로그인" >
		</td>
	</tr>
</form>
</table>
<p/>
</nav>
</form>
</center>
</body>
</html>

<!-- <script type="text/javascript">
	function setMain() {
		var main =  window.open("Main_Te2t.do");
		main.document.write("<center><pre>주토피아 홈페이지에 접속하신 걸 환영합니다. <br><br> 즐거운 시간 보내시길 바랍니다.</pre></center>");
}

</script> -->