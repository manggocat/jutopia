<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="Sms.*" %>
	
<!DOCTYPE html>
<html>

<head>
<title>sms - jsp</title>
<link href="../css/joochaInfoStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../JS/send_Sms/sms.js"></script>
</head>
<%
request.setCharacterEncoding("utf-8");
%>

<body onload="loadJSON()">
 <%-- <jsp:useBean id="sms" class="sms"/>
 <jsp:setProperty property="*" name="sms"/> --%>
 
	<form method="get" name="smsForm" action="smsPro.do?smsType=S">
	<ul>
		<li><a href="#">회사소개</a></li>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">로그인</a></li>
		<li><a href="#">마이페이지</a></li>
	</ul>
	
		<input type="hidden" name="action" value="go">
		
		<input type="hidden" name="msg" value="test">
		
		<br /> <br />
		
		<input type="hidden" name="rphone" value="01031934635">

		<input type="hidden" name="sphone1" value="010"> 
		<input type="hidden" name="sphone2" value="5055"> 
		<input type="hidden" name="sphone3" value="0240">
		
		<input type="submit"  value="전송" style="color:blue; background-color:black"> 
		
		<footer>
	<table align="center">

		<tr>
			<td><font>서울시 강남구 태해란로 103길 17정석빌딩 &nbsp;&nbsp; 대표이사 :
					서효진 &nbsp;&nbsp; 사업자등록번호 : 138-81-05876 &nbsp;&nbsp; 통신판매업 신고번호 :
					제2011-서울강남-02008호</td>
		</tr>
		<tr>
			<td>문의전화(평일 09:00~18:00) : 1566-7727 &nbsp;&nbsp; (유료)이메일 :
				meloninformation@iloen.com &nbsp;&nbsp;© 2016. LOEN Entertainment,
				Inc. ALL RIGHTS RESERVED.</td>
		</tr>

	</table>
	</footer>
	</form>
</body>

</html>

