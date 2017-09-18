<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= "jutopia.Sign_Up.*" %>
<%@ include file="../../view/color.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<link href="/view/mystyle.css" rel="stylesheet" type="text/css">
<table width="270" border="0" cellpadding="5" cellspacing="0" align="center">
	<tr bgcolor="<%=title_c %>">
		<td height="39" align="center">
				<font size="2"><b> 회원 정보가 수정되었습니다.</b></font>
		</td>
	</tr>
	
	<tr>
		<td bgcolor="<%= value_c %>" align="center">
				<p>입력하신 내용이 수정 완료되었습니다. </p>
		</td>
	</tr>
	
		<tr>
		<td bgcolor="<%= value_c %>" align="center">
				<font>
					<input type="button" value="메인으로"  onclick="window.location='main.jsp' ">
				</font>
				5초 후에 메인으로 이동합니다...
				<meta http-equiv="Refresh" content="5; url=main.jsp">
		</td>
	</tr>
	
	
</table>