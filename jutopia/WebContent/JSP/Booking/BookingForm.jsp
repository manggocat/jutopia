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
<script type="text/javascript">
	$(document).ready(function(){
		$("#parking_place_list").click(function(){
			alert($('#date_book_day').val());
			$("#list_stage").load("ParkingplaceForm.do?date_book_day="+$('#date_book_day').val() + "&date_book_start_time=" + $('#date_book_start_time').val() + "&date_book_end_time=" + $('#date_book_end_time').val() +"&str_parking_location="+$('#str_parking_location').val());
		});
	});
</script>
	
</head>
<body>
<form action="BookingPro.do" method="get" id="BookingForm" name="BookingForm" onsubmit="return checkValue()" >
<table class="reservation_form" border="1" cellspacing="0" cellpadding="3" width="700" align="center">
   <tr>
   <td colspan="2" align="center">
   <b><font size="5">주차 예약</font></b></td>
   </tr>
   <tr>
   		<td width="200"><b>주차장 선택</b></td>
   		<td>
   		<select id = "str_parking_location" name = "str_parking_location">
   			<option id = "Zamsil">잠실주차장</option>
   			<option id = "Hangang">한강주차장</option>
   			<option id = "Suseo">수서주차장</option>
   			<option id = "Pangyo">판교주차장</option>
   			<option id = "Gwangyo">광교주차장</option>
   			<option id = "Yeongdeungpo">영등포주차장</option>
   		</select>
   		</td>
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
   	  <td>시작시간 : <input type = "time" name ="date_book_start_time" id ="date_book_start_time">
   	  종료시간 :<input type = "time" name ="date_book_end_time" id ="date_book_end_time">&nbsp;&nbsp;
   	  <input type="button" id="parking_place_list" value = "마 누르라"/>
   	 </td>
   </tr>
   <tr>
   
   </tr>
   </table>
   
   	<div id="list_stage">
   	
   	</div>
   	
   	
    <button type="submit" name = "n_reserve_discrimintae" value = "${1}" class="button"><font class="btn">예약하기</font></button>
</form>


</body>
</html>