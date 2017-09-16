<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
</head>
<body>
<form action="BookingForm.do" method="post" id="BookingForm" name="BookingForm" onsubmit="return checkValue()" >

      <p class="btn" align="center">
      <button type="submit" class="button button1"><font class="btn">예약하기</font></button>
</form>

</body>
</html>