<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
</head>
<body>
	<table>
		 <tr>
  		 	<td colspan = "2"> <h3 align = "center">주차공간을 선택해 주세요</h3> </td>
  		 </tr>
   
   		 <tr>
			<td colspan = "2"> 선택한 주차공간 : <input type="text"  placeholder = "위에서 좌석을 선택주세요" id ="str_parking_place" name = "str_parking_place"></td>
  		 </tr>
   
  		 <tr>
  		 	<td colspan = "2">
			<table class = "parkingplacetable" bord = "1" align = "center">
			<c:set var="count" value="0"/>
			<c:forEach var = "i" begin ="1" end = "9">
				<tr>
				<c:forEach var ="j" begin = "1" end = "9">
					<c:set var="booking_position" value = "${i}-${j}" /> 
					<c:set var="button_select" value ="${true_false_choice.get(count)}"/>
					<td>

						<c:if test="${true_false_choice.get(count)}">
						<input id="${booking_position}" class = "choiced" type ="button" value = "${booking_position}" disabled>
						</c:if>			
						<c:if test="${!true_false_choice.get(count)}">
						<input id="${booking_position}" class = "choice" type ="button" value = "${booking_position}" >
						</c:if>						
					</td>
					<c:set var="count" value="${count+1}"/>
					 
					<script type ="text/javascript">
					$(function(){
						$('#${booking_position}').click(function(){ 
							$('#str_parking_place').val('${booking_position}');
						});
					});
					</script>
				</c:forEach>
			</tr>
		</c:forEach>
		
		</table>
	</td>
   </tr>
		
	</table>
	 <p class="btn" align="center">

</body>
</html>