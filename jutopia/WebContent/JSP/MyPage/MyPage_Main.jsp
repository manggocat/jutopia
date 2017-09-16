<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 MyPage</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#my_imformation').click(function() {
			$('#myPage_Menu').load("JSP/MyPage/My_Imformation.jsp");
		});
		$('#my_secession').click(function() {
			$('#myPage_Menu').load("JSP/MyPage/My_Modified.jsp");
		});
		$('#my_modified').click(function() {
			$('#myPage_Menu').load("JSP/MyPage/My_Secession.jsp");
		});

	});
</script>
</head>
<body>
<c:if test="${nCheck==1 }">
<script type="text/javascript">
alert("삭제 완료");
window.location.href="mapmainForm.do";
</script>
</c:if>
<c:if test="${nCheck==-1}">
<script type="text/javascript">
alert("비밀번호가 다릅니다");
</script>
</c:if>
	<br>
	<br>
	<br>
	<table align="center" cellpadding="20px" border="1">
		<tr>
			<td rowspan="3" width="100px"></td>
			<td>이 름</td>
			<td width="200px">정보</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td width="200px">정보</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td width="200px">정보</td>
		</tr>
	</table>

	<br>
	<div>
		<center>
			<input type="button" id="my_imformation" value="나의정보" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="my_secession" value="회원탈퇴" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="my_modified" value="회원수정" />
		</center>
	</div>

	<div id="myPage_Menu"></div>

</body>
</html>