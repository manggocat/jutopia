<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../view/color.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기는 메인이야아아</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script type="text/javascript">
// 로그인 팝업
function loginshowPopup() {	  
	window.open("Sign_Up_Login_Form.do", "로그인", 
	"width=700, height=300, left=100, top=50");
  }

// 비밀번호 찾기 팝업
function passwdshowPopup() {	  
	window.open("Sign_Up_PasswdFind_Form.do", "비밀번호 찾기", 
	"width=550, height=250, left=100, top=50");
  }

</script>

</head>

<body bgcolor="${ allcolor }">

<center>
<img alt="" src="./image/bono12.jpg" title="보노보노" width="400">
</center><p/>

<form name="inForm" method="post" action="Sign_Up_Login_Pro.do"  onSubmit="return checkIt();">
<table width=500 cellpadding="5" align="center" border="1" >
	<tr>
		<td width="100" bgcolor="${ othercolor }" height="20" align="center">
		얼른 </td>
		<td width="400" height="20">
		로그인할래</td>
	</tr>
	<tr>
		<td bgcolor="${ othercolor }"  width="100" align="center">값을</td>
		<td width="200" height="20">
		입력하자</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="${ othercolor }">
		<a href="Sign_Up_Info.do">
		<font size="2" face="맑은 고딕" style="margin-left: 80px">회원가입</font></a>&nbsp;
		<a href="Season_Ticket_Info.do">
		<font size="2" face="맑은 고딕">정기권 신청</font></a>&nbsp;
		<a href="" onclick="passwdshowPopup()">
		<font size="2" face="맑은 고딕">비밀번호 찾기</font></a>
		<input type="button" onclick="loginshowPopup()" name="button" value="로그인" style="margin-left: 100px">
		</td>
	</tr>
</form>
</table>

</body>
</html>