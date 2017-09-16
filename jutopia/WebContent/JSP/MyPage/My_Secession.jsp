<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 회원 정보 수정</title>
</head>
<body>
	<h1 align="center">회원 정보 수정</h1>
	<br>
	<br>

	<table align="center" border="1">
		<tr>
			<td>I D :</td>
			<td>${sessionScope.memID}</td>
		</tr><c:set var="asdf" value="${sessionScope.memID}"></c:set>
				
		<tr>
			<td>비밀번호 :</td>
			<td><input type="text" placeholder="비밀번호확인"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="확인" /></td>
		</tr>
	</table>
</body>
</html>