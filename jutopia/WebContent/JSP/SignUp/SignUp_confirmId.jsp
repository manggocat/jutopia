<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../view/color.jsp"%>
<%@ page import="jutopia.SignUp.*" %>

<title>이메일 중복 확인</title>
<link href="../view/mystyle.css" rel="stylesheet" type="text/css">
<% request.setCharacterEncoding("utf-8"); %>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script type="text/javascript">
    
 // 이메일 카피
   $(function() {
    $('#select_email').change(function(){
		var selectedValue = $('#select_email option:selected').text();
		if(selectedValue=="직접 입력"){
			$('#email2').val("");
		} else {
			$('#email2').val(selectedValue);
		}
    });
});
</script>

<%
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String total_mail = request.getParameter("email1") + "@" + request.getParameter("email2");

	Sign_up_DAO dao = Sign_up_DAO.getInstance();
	int check = dao.confirmID(total_mail);
%>

</head>
<body>
<% if(check == 1) { %>
<table width="270" border="0" cellpadding="5" cellspacing="0">
	<tr bgcolor="<%=title_c %>">
	   <td height="39">입력하신 <%=total_mail %>는(은) 이미 사용중인 이메일입니다.</td>
	</tr>
</table>

<form action="SignUp_confirmId.jsp" method="post" name="checkForm">
<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td bgcolor="<%=value_c %>" align="center">
		<hr>
		다른 이메일을 선택하세요<p>
		<input type="text" size="10" maxlength="14" name="email1"> @ 
		<select id="select_email" style="font-size:12px; font-face:돋움;">
				<option value="">직접 입력</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="yahoo.co.kr">yahoo.co.kr</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="dreamwiz.com">dreamwiz.com</option>
				</select>
				<input type="text" name="email2" size="10" id="email2" >
		<input type="submit" name="email_check" value="이메일 중복 확인" >
		</td>
	</tr>
</table>
</form>
<%  }else { %>


<table width="270" border="0" cellspacing="0" cellpadding="5">
 	<tr bgcolor="<%=title_c %>">
 		<td align="center">
 			<p> 입력하신 <%=total_mail %> 는(은) 사용하실 수 있는 이메일입니다 </p>
 			<input type="button" value="닫기" onclick="setemail()" >
 		</td>
 	</tr> 	
</table>

<% } %>


</body>
</html>

<script language="javascript">
<!--
	function setemail(){
	opener.document.userinfo.text_mail_1.value="<%=email1%>";
 	opener.document.userinfo.text_mail_2.value="<%=email2%>";
	self.close();
	}
//--> 
</script>