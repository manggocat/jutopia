<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<title>JSP Basic</title>
</head>
<body>
<table>
		 <tr>
  		 	<td colspan = "2"> <h3 align = "center">정기 주차공간을 선택해 주세요</h3> </td>
  		 </tr>
   
   		 <tr>
			<td colspan = "2"> 선택한 주차공간 : <input type="text"  placeholder = "위에서 좌석을 선택주세요" id ="str_season_ticket_position" name = "str_season_ticket_position"></td>
  		 </tr>
   
  		 <tr>
  		 	<td colspan = "2">
			<table class = "season_parkingplacetable" bord = "1" align = "center">
			<c:set var="count" value="0"/>
			<c:set var="place_count" value = "0" />
			<c:forEach var = "i" begin ="1" end = "9">
				<tr>
				<c:forEach var ="j" begin = "1" end = "9">
					<c:set var="season_position" value = "${i}-${j}" /> 
					<c:set var="button_select" value ="${season_seat_discriminate.get(count)}"/>
					<td>

						<c:if test="${season_seat_discriminate.get(count)}">
						<input id="${season_position}" class = "season_choiced" type ="button" value = "${season_position}" disabled>
						<c:set var="place_count" value="${place_count + 1}"/>
						
						</c:if>	
								
						<c:if test="${!season_seat_discriminate.get(count)}">
						<input id="${season_position}" class = "season_choice" type ="button" value = "${season_position}" >
						</c:if>						
					</td>
					<c:set var="count" value="${count+1}"/>
					 
					<script type ="text/javascript">
					$(function(){
						$('#${season_position}').click(function(){ 
							$('#str_season_ticket_position').val('${season_position}');
						});
					});
					</script>
				</c:forEach>
			</tr>
		</c:forEach>
	
		</table>
	</td>
   </tr>
   <tr>  <td><h3 align = "center">${81-place_count}(대기 접수 중)</h3></td>  </tr>
		
	</table>
	 <p class="btn" align="center">

</body>
</html>