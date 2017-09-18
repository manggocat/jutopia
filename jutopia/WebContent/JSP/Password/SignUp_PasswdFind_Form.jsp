<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSN+gt4="
  crossorigin="anonymous">
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



<script language="javascript">

function exit(){
    self.close();   //자기자신창을 닫습니다.
}


</script>

<style>
.pass_table {
	margin-top: 100px;
}
</style>

</head>
<body>
<center><font style="font-size:13px; font-face:돋움;">
<table class="pass_table" border="1" >
	<tr>
		<td> 이름 : </td>
		<td><input type="text" size="7" name="user_name"></td>
	</tr>
	
	<tr>
		<td> 이메일 : </td>
		<td><input type="text" size="10" name="text_mail_1"> @ 
		<select style="font-size:12px; font-face:돋움;" id="select_email">
		<option value="">직접 입력</option>
		<option value="gmail.com">gmail.com</option>
		<option value="naver.com">naver.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="nate.com">nate.com</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="dreamwiz.com">dreamwiz.com</option>
		</select>
		<input type="text" name="name" size="10" id="text_mail_2" >
	</tr>
	
	<tr>
		<td colspan="2"><input type="button" value="인증번호 보내기"  
		style="color:#000;font:12px/15px 굴림, Gulim, sans-serif; margin-left: 280px" /></td>
	</tr>
	
	<tr>
		<td>인증번호 확인 :</td>
		<td><input type="text" size="10" name="sign_up_number">
		<input type="button" name="sign_up_num_check2" value="인증번호 확인"
		 style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" /></td>
	</tr>
	
	<tr>
		<td colspan="2" rowspan="2">
		<input type="submit" value="확인" 
		<input type="button" value="닫기" onclick="exit()" 
		style="color:#000;font:12px/15px 굴림, Gulim, sans-serif; margin-left: 380px; margin-top: 5px; margin-bottom: 5px;" /></td>
		
	</tr>
	
</table>
</font>
</center>
</body>
</html>