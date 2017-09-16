<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="util.*" %>

<%
// 인증코드를 생성한다.
String key = new TempKey().getKey(5, false); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
</head>
<body>

<form name="form" method="post" action="/signUp.jsp">
<input type="hidden" name="emailYn" id="emailYn" value="N">

<input type="text" name="email" id="email">
<input type="button" name="bt_send" id="bt_send" value="이메일인증보내기" onclick="sendEmailAuth()"><br/>

<input type="text" name="confirmCode" id="confirmCode">
<input type="button" name="bt_email_confirm" id="bt_email_confirm" value="인증확인" onclick="confirmEmailAuth()"><br/>

<input type="button" name="bt_join_confirm" id="bt_join_confirm" value="가입하기" onclick="confirmSignUp()">

</form>

<script type="text/javascript">

	var code = "<%= key%>";
	
	
	// 이메일인증보내기 버튼
	function sendEmailAuth(){
		
		var email = $('#email').val();
		
/* 		
		$.post(
				'/emailAuth.do', 
				{code: code, email: email}, 
				function(data){
					
					data.result;
			
				});
		 */
		$.get(
				'/jootophia/emailAuth.jsp?email='+email+'&code='+code,
				function(data){
					
					data.result;
			
				});
		
	}
	
	// 인증확인버튼
	function confirmEmailAuth(){
		
		var confirmCode =  $('#confirmCode').val();
		
		if (code != confirmCode) {
			alert("이메일 인증이 잘못되었습니다.");
		} else {
			$('#emailYn').val('Y');
			alert("이메일 인증 되었습니다.");
		}
		
	}
	
	// 가입버튼
	function confirmSignUp(){
		
		var emailYn = $('#emailYn').val();
		
		if (emailYn == 'N') {
			alert("이메일 인증이 잘못되었습니다. 인증받으세요.");
			return;
		} 
		
		alert("가입되었습니다.");
		
		//document.form.submit();
	}
	
</script>
</body>


</html>