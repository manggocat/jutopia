<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 MyPage</title>
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script type = "text/javascript">
 	$(document).ready(function(){
 		$('#my_imformation').click(function(){
 			$('#Chang_Stage').load("My_Imformation.jsp");
 		});
 		$('#my_secession').click(function(){
 			$('#Chang_Stage').load("My_Modified.jsp");
 		});
 		$('#my_modified').click(function(){
 			$('#Chang_Stage').load("My_Secession.jsp");
 		});
 	});
 </script>
</head>
<body>
<br><br><br>
<table align = "center" cellpadding="20px" border = "1">
	<tr>
		<td rowspan = "3" width = "100px"></td><td> 이    름 </td><td width = "200px"> 정보</td> 
	</tr>
	<tr>
		<td> 전화번호  </td> <td width = "200px"> 정보</td> 
	</tr>
	<tr>
		<td> E-mail  </td> <td width = "200px"> 정보</td> 
	</tr>
</table>

<br>
<div>
	<center>
		<input type = "button" id = "my_imformation" value = "나의정보"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "button" id = "my_secession" value = "회원탈퇴"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "button" id = "my_modified" value = "회원수정"/>
	</center>
</div>

<div id = "Chang_Stage">

</div>

</body>
</html>