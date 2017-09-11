<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
</head>
<body>
<form action="BookingPro.do" method="get" id="BookingForm" name="BookingForm" onsubmit="return checkValue()" >
<table class="reservation_form" border="1" cellspacing="0" cellpadding="3" width="700" align="center">
   <tr>
   <td colspan="2" align="center">
   <b><font size="5">주차 예약</font></b></td>
   </tr>
   
   <tr>
      <td width="200"><b>ID(email) :</b></td>
      <td><input type="text" size="15" name="str_book_id_email" id="str_book_id_email" autofocus></td>
   </tr>

   <tr>
      <td><b>이름 :</b></td>
      <td><input type="text" size="15" name="str_book_name" id="str_book_name" autofocus></td>
   </tr>
   
   <tr>
      <td><b>휴대폰 번호 :</b></td>
      <td><input type="text" size="15" name="str_book_tel" id="str_book_tel"></td>
   </tr>
   
   <tr>
      <td><b>차량 번호 :</b></td>
      <td><input type="text" size="15" name="str_book_car_num" id="str_book_car_num" placeholder="차 번호 "></td>
   </tr>
   
   <tr>
      <td><b>차종 :</b></td>
      <td><input type="text" size="15" name="str_book_car_kinds" id="str_book_car_kinds" placeholder="전체 차종"></td>
   </tr>
   <tr>
   	  <td><b>날짜 선택</b></td>
   	  <td><input type = "date" name ="date_book_day" id ="date_book_day"></td>
   	  
   </tr>
   <tr>
   	  <td><b>날짜 선택</b></td>
   	  <td>이용 시작 시간 : <input type = "time" name ="date_book_start_time" id ="date_book_start_time">
   	  이용 종료 시간 :<input type = "time" name ="date_book_end_time" id ="date_book_end_time"></td>
   	  
   </tr>
   
   <tr>
   	<td colspan = "2"> <h3 align = "center">주차공간을 선택해 주세요</h3> </td>
   </tr>
   
   <tr>
   	<td colspan = "2">
		<table bord = "1" align = "center">
		<c:forEach var = "i" begin ="1" end = "9">
			<tr>
				<c:forEach var ="j" begin = "1" end = "9">
					<c:set var = "booking" value = "${'0'}"/>
					<c:if test="${booking == '0'}">
						<td><input  id = "ok" type ="button" value = "${j}-${i}"></td>
						<!-- 예약내용 1로 바꿔야함 -->
					</c:if>
					<c:if  test = "${booking == '1' }">
						<td><input type = "button" name = "receipt" value = "${j}-${i}" size = "3" disabled ="	true"></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td> 선택한 주차공간 : 
			</tr>
		</c:forEach>
		</table>
	</td>
   </tr>
   
</table>

      <p class="btn" align="center">
      <button type="submit" class="button button1"><font class="btn">예약하기</font></button>
</form>
</body>
</html>