<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	 <link href="./CSS/BookingForm/BookingForm.css" rel="stylesheet" type="text/css">
	 <link href='https://fonts.googleapis.com/css?family=Amatic SC' rel='stylesheet'>
	 <link rel="stylesheet" href="./CSS/BookingForm/icono.min.css">
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
<center>
<table class="reservation_form" border="1" cellspacing="0" cellpadding="3" width="700" align="center">
   <tr>
   <td colspan="2" align="center">
   <b><font size="5">주차 예약</font></b></td>
   </tr>
   <tr>
   		<td width="200"><i class ="icono-pin"></i><b>&nbsp;&nbsp;주&nbsp;차&nbsp;장 &nbsp;&nbsp;선&nbsp;택</b></td>
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
   	
      <td width="200"><i class="icono-mail"></i><b>&nbsp;&nbsp;I&nbsp;&nbsp;D&nbsp;&nbsp;(&nbsp;email&nbsp;) :</b></td>
      <td>${BookingVO.getStr_User_ID_Email() }
      </td>
   </tr>

   <tr>
      <td><i class ="icono-user"></i><b>&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 :</b></td>
      <td><input type="text" size="15" name="str_book_name" id="str_book_name" value="${BookingVO.getStr_User_Name() }" autofocus></td>
   </tr>
   
   <tr>
      <td><i class ="icono-iphone"></i><b>&nbsp;&nbsp;휴&nbsp;대&nbsp;폰&nbsp;&nbsp; 번&nbsp;호 :</b></td>
      <td><input type="text" size="15" name="str_book_tel" id="str_book_tel" value="${BookingVO.getStr_User_Tel() }"></td>
   </tr>
   
   <tr>
      <td><i class ="icono-creditCard"></i><b>&nbsp;&nbsp;차&nbsp;&nbsp;량 &nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;호 :</b></td>
      <td><input type="text" size="15" name="str_book_car_num" id="str_book_car_num" placeholder="차 번호 "></td>
   </tr>
   
   <tr>
      <td><i class ="icono-indent"></i><b>&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종 :</b></td>
      <td><input type="text" size="15" name="str_book_car_kinds" id="str_book_car_kinds" placeholder="전체 차종"></td>
   </tr>
   <tr>
   	  <td><i class ="icono-calendar"></i><b>&nbsp;&nbsp;날&nbsp;&nbsp;&nbsp;짜&nbsp;&nbsp;&nbsp;선&nbsp;&nbsp;&nbsp;택 :</b></td>
   	  <td><input type = "date" name ="date_book_day" id ="date_book_day"></td>
   	  
   </tr>
   <tr>
   	  <td><i class ="icono-clock"></i><b>&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;&nbsp;선&nbsp;&nbsp;&nbsp;택 :</b></td>
   	  <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type = "time" name ="date_book_start_time" id ="date_book_start_time">
   	  &nbsp;~&nbsp;&nbsp;<input type = "time" name ="date_book_end_time" id ="date_book_end_time">&nbsp;&nbsp;
   	  <br>
   	  <br>
   	  <input type="button" class = "button lookup" id="parking_place_list" value = "마 누르라"/>
   	 </td>
   </tr>
   <tr>
   
   </tr>
   </table>
   
   	<div id="list_stage" align = "center">
   	
   	</div>
   	
   	
    <button type="submit" name = "n_reserve_discrimintae" value = "${1}" class="button receipt"><font class="btn">예약하기</font></button>
</center>
</form>


</body>
</html>