<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../view/color.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기는 메인이야아아2</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

</head>

<body bgcolor="${ allcolor }">
<center>
<img alt="" src="../../image/bono12.jpg" title="보노보노" width="400">
</center><p/>

<table width=400 cellpadding="5" align="center" border="1" >
	<tr>
		<td colspan="2" width="200" bgcolor="${ othercolor }" height="20">
		이메일 : ${sessionScope.SIGN_UP_ID_EMAIL } <br>
		이름 : <font color="${ allcolor }"><strong> 땡<%-- ${ session.getAttribute("SIGN_UP_NAME") } --%> </strong></font> 님 방문
	</td></tr>
	<form method="post" action="Sign_Up_Logout.do">  
	<tr>
		<td colspan="2" width="200" bgcolor="${ othercolor }" height="20">
		<input type="button" value="로그아웃" onclick="javascript:window.location='JSP/Sign_Up/Sign_Up_Logout_Form.jsp' ">
		<input type="button" value="회원정보변경" onclick="javascript:window.location='Sign_Up_Update_Form.do'"></td>
	</form>
	</tr>
</table>

</body>
</html>