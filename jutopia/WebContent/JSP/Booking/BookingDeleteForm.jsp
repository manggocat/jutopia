<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
</head>
<body>
<center><b>글삭제</b> <br>
<form action="BookingDeletePro.do"  method="get" id = "BookingDeleteForm" name="BookingDeleteForm">
		 
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center"> 차량 번호 : 
			<input type="text"  name="str_book_car_num" size="8" maxlength="12">
			<input type="hidden"  name="num"  value="${ str_book_car_num }">
			</td>
		</tr>
		<tr height="30"> 
			<input type="submit"  value="예약 삭제">
			
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>