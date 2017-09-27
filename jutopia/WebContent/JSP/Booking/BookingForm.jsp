<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	 <link href="./CSS/BookingForm/BookingForm.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="./resource/alertify.core.css" />
<link rel="stylesheet" href="./resource/alertify.default.css" id="toggleCSS" />
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">
<script src="resource/alertify.min.js"></script>
<script>
$(document).ready(function(){
    
    $("alert").on( 'click', function () {
     alertify.alert("");
     return false;
    });
});
 
 
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm2.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(document).ready(function(){
		$("#parking_place_list").click(function(){
			 if($('#str_book_car_num').val()==""||$('#str_book_car_num').val()==null){
				 alertify.alert("차 번호를 입력해 주세요");
					return false;
					
				}else if($('#str_book_car_kinds').val()==""||$('#str_book_car_kinds').val()==null){
					alertify.alert("차종을 입력해 주세요");
					return false;
					
				}else if($('#date_book_day').val()==""){
					alertify.alert("날짜를 선택해 주세요");
			}else if($('#date_book_start_time').val()==""||$('#date_book_start_time').val()==null){
				alertify.alert("시작 시간을 선택해 주세요");
			}else if($('#date_book_end_time').val()==""||$('#date_book_end_time').val()==null){
				alertify.alert("종료 시간을 선택해 주세요");
			}
			$("#list_stage").load("ParkingplaceForm.do?date_book_day="+$('#date_book_day').val() + "&date_book_start_time=" + $('#date_book_start_time').val() + "&date_book_end_time=" + $('#date_book_end_time').val() +"&str_parking_location="+$('#str_parking_location').val());
		});
		
		
		$("#n_reserve_discrimintae").click(function(){
			 if($('#str_book_car_num').val()==""||$('#str_book_car_num').val()==null){
				 alertify.alert("차 번호를 입력해 주세요");
					return false;
					
				}else if($('#str_book_car_kinds').val()==""||$('#str_book_car_kinds').val()==null){
					alertify.alert("차종을 입력해 주세요");
					return false;
					
				}else if($('#date_book_day').val()==""||('#date_book_day').val()==null){
					alertify.alert("날짜를 선택해 주세요");
					return false;
			}else if($('#date_book_start_time').val()==""||$('#date_book_start_time').val()==null){
				alertify.alert("시작 시간을 선택해 주세요");
				return false;
			}else if($('#date_book_end_time').val()==""||$('#date_book_end_time').val()==null){
				alertify.alert("종료 시간을 선택해 주세요");
				return false;
			}
			$("#list_stage").load("ParkingplaceForm.do?date_book_day="+$('#date_book_day').val() + "&date_book_start_time=" + $('#date_book_start_time').val() + "&date_book_end_time=" + $('#date_book_end_time').val() +"&str_parking_location="+$('#str_parking_location').val());
		});
	});
</script>

<style type="text/css">
div.contents {
margin-left: 20%;
}

tr{
font-weight: bold;
font-size: 15px;
}

select{
  padding: 9px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

.well-sm {
    margin-left: 25%;
    margin-top: 5%;
    padding: 13px;
    border-radius: 3px;
    width: 80%;
}
</style>
</head>
<body>
<c:if test="${sessionScope.memID==null}">
<script type="text/javascript">
alert("로그인후 이용해 주세요!");

history.go(-1);
</script>
</c:if>

<c:if test="${sessionScope.memID!=null}">
		<form class="background">
			<div class="navbar-wrapper">
				<div class="container-fluid">
					<nav id="aaa" class="navbar navbar-fixed-top"
						style="position: relative;">
						<div class="container">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse" data-target="#navbar"
									aria-expanded="false" aria-controls="navbar">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>

								<div style="position: relative;"><a href="mapmainForm.do">
									<img src="./images/MainForm/Logo.png"
										style="width: 160px; height: 90px; position: absolute;" /></a>
								</div>

							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active"
										style="padding-right: 20px; padding-left: 20px;"><a
										href="mapmainForm.do" class="">Home</a></li>

									<li class=" dropdown"
										style="padding-right: 30px; padding-left: 20px;"><a
										href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">예약
											하기<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="Season_Ticket_Info_Action.do"><font
													color="white">주차 정기권</font></a></li>
											<li><a href="BookingForm.do"><font color="white">주차
														예약권</font></a></li>
										</ul></li>
									<c:if test="${sessionScope.memID!='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a href="noteList.do">
												쪽지함 </a></li>
									</c:if>
									<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a
											href="noteListAdmin.do"> 쪽지함 </a></li>
									</c:if>

									<li style="padding-right: 20px;"><a href="list.do">공지사항</a></li>

									<li><a href="CompanyinfoAction.do">회사 소개</a></li>
									<li><a href="QnAFormAction.do">QnA</a></li>
								</ul>
								<ul class="nav navbar-nav pull-right">
									<li class=""><a href="MyPageMainForm.do">MyPage</a></li>
									<li class=""><a href="SignUp_Logout.do">LogOut</a></li>
								</ul>

							</div>

						</div>

					</nav>
				</div>
			</div>
		</form>
	
<!-- 주차 예약 -->
<form action="BookingPro.do" method="get" id="BookingForm" name="BookingForm" onsubmit="return checkValue()" >
<center>
<div class="well well-sm" style="background: rgba(255,255,255,0.7); margin-left: 2%;"  >
<table class="reservation_form" border="1" cellspacing="0" cellpadding="3" width="700" align="center" style="margin-top: 5%;">
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
      <td><input type="hidden" name="str_book_id_email" value="${BookingVO.getStr_User_ID_Email()}">${BookingVO.getStr_User_ID_Email()}
      </td>
   </tr>

   <tr>
      <td><i class ="icono-user"></i><b>&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 :</b></td>
      <td><input type="text" size="15" name="str_book_name" id="str_book_name" value="${BookingVO.getStr_User_Name()}" autofocus></td>
   </tr>
   
   <tr>
      <td><i class ="icono-iphone"></i><b>&nbsp;&nbsp;휴&nbsp;대&nbsp;폰&nbsp;&nbsp; 번&nbsp;호 :</b></td>
      <td><input type="text" size="15" name="str_book_tel" id="str_book_tel" value="${BookingVO.getStr_User_Tel()}"></td>
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
   	  <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type = "time"  style="width: 40%;" name ="date_book_start_time" id ="date_book_start_time">
   	  &nbsp;~&nbsp;<input type = "time" style="width: 40%;" name ="date_book_end_time" id ="date_book_end_time">&nbsp;&nbsp;
   	  <br>
   	  <br>
   	  <input type="button" class = "button lookup" id="parking_place_list" value = "좌석 선택"/>
   	 </td>
   </tr>
   <tr>
   
   </tr>
   </table>
   
   	<div id="list_stage" align = "center">
   	
   	</div>
   	
   	
    <button type="submit" name = "n_reserve_discrimintae" id="n_reserve_discrimintae" value = "${1}" class="button receipt"><font class="btn">예약하기</font></button>
</div>
</center>
</form>

</c:if>
</body>
</html>