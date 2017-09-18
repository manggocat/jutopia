<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
</head>
<body>
<center>
로그아웃되었습니다.<br><p/>
<% session.invalidate(); %>

<input type="button" onclick="javascript:window.location='Main_Test.do'" value="확인">

</center>
</body>
</html>

<!-- <script>
function logout() {
	window.location("Main_Test.do");
}
</script> -->