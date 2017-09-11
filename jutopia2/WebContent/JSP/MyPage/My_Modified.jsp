<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 회원 탈퇴</title>
</head>
<body>
	<h1 align = "center">회원 탈퇴</h1>
	<br><br>
	
	<table align = "center" border = "1">
		<tr>
			<td>I D : </td><td>우리 데이터 베이스에서 받아옴</td>
		</tr>
		<tr>
			<td> 비밀번호 : </td> <td><input type = "text" placeholder = "비밀번호확인"></td>
		</tr>
		<tr>
		<td colspan="2"> <select name = "Reason" size = "1">
						 <option value = "1">재 가입을 위해서</option>
						 <option value = "2">서비스가 불편하여</option>
						 <option value = "3">시스템 장애</option>
						 <option value = "4">이용서비스 부족</option>
						 </select>
		</tr>
	</table>
</body>
</html>