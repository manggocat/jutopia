<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar" %>

<%@ page import = "jutopia.seasonticket.*"%>
<%@ page import = "jutopia.SignUp.*"%>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정기권 신청</title>

<!-- 실시간 나타내기 -->
<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('season_ticket_clock').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}
</script>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
 
<script type="text/javascript">

	$(function() {
		/* var re_tel = /^01([0-9]{1})-([0-9]{3,4})-([0-9]{4})$/; // 휴대전화 검사식 */

		$('#btn_lastjoin').click(function() {
			if ($('#season_ticket_tel').val().length == 0) {
				alert("핸드폰 번호(10~11자리)를 입력해 주세요");
				$('#season_ticket_tel').focus();
				return false;

			} else if ($('#season_ticket_email1').val().length == 0) {
				alert("이메일 아이디를 입력해 주세요");
				$('#season_ticket_email1').focus();
				return false;
				
			} else if ($('#season_ticket_email2').val().length == 0) {
				alert("이메일 주소를 확인해 주세요");
				$('#season_ticket_email2').focus();
				return false;

			} else if ($('#season_ticket_car_kinds').val().length == 0) {
				alert("차종을 입력해 주세요");
				$('#season_ticket_car_kinds').focus();
				return false;
				
			/* } else if (re_num.test(car_number.val()) != true) {
				alert("차량 번호를 입력해 주세요");
				$('#car_number').focus();
				return false; */

			} else if ($('#season_ticket_car_num').val().length == 0) {
				alert("차량 번호를 입력해 주세요");
				$('#season_ticket_car_num').focus();
				return false;
				
			} else if ($(':radio[name="ju_ya"]:checked').length < 1){
			    alert('주간/야간 구분을 체크해 주세요');                        
			    return false;
			    
			} else if ($(':radio[name="so_jung_dae"]:checked').length < 1){
				alert("소형/중형/대형을 구분해 주세요");
				return false;
				
			} else {
				window.open("../../JSP/Sign_Up/Sign_Up_Insert_Popup.jsp", "정기권 신청 완료", 
				  "width=400, height=300, left=100, top=50");
		    }
				
			
		});		
	
		
		// 이메일 카피
		$('#select_email').change(function(){
			var selectedValue = $('#select_email option:selected').text();
			if(selectedValue=="직접 입력"){
				$('#season_ticket_email2').val("");
			}else{
				$('#season_ticket_email2').val(selectedValue);
			}
		
			$("#haedang_x").attr("disabled", "disabled");

			/* $('#haedang_x').attr('disabled', 'true'); */

		});

	});			// 스크립트의 끝
	
	$(document).ready(function(){
		$("#season_parking_list").click(function(){
			alert($('#date_book_day').val());
			$("#season_parking_stage").load("Season_Tickiet_Parkinplace_Form.do?str_season_ticket_parking_lot="+$('#str_season_ticket_parking_lot').val() + "&n_season_ticket_start_date=" + $('#n_season_ticket_start_date').val());
		});
	});    //page 불러오기
</script>
</head>
<body onload="startTime()">

<form method="get" action="Season_Ticket_Insert_Pro.do" id = " Season_Ticket_Insert_Pro" name="Season_Ticket_Insert_Pro" >

<center>
<p/>
<br><br>

<font color="#22741C" size="4"><b>⊙ 정기권 신청 접수</b></font><br>
<table class="ticket_application1" cellpadding="5" width="700" border="1">
	<tr>
		<td style="text-align:center;">이름</td>
		<td><input type="text" size="14" id="str_season_ticket_name" name="str_season_ticket_name"></td>
	</tr>
	<tr>
		<td style="text-align:center;">휴대폰 <font color="#FF0000">*</font></td>
		<td><input type="text" size="14" name="str_season_ticket_tel" id="str_season_ticket_tel" placeholder="'-' 없이 입력">
		<input type="checkbox" style="margin-left: 369px" 
		onclick="alert('선택하지 않을 경우 자세한 예약 정보를 확인하기 어렵습니다.');">SMS 수신</td>
	</tr>
	<tr>
		<td style="text-align:center;">E-mail <font color="#FF0000">*</font></td>
		<td><input type="text" size="10" id="str_season_ticket_email" name = "str_season_ticket_id_email"> @
			<select style="font-size:12px; font-face:돋움;" id="select_email">
			<option value="">직접 입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="yahoo.co.kr">yahoo.co.kr</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="dreamwiz.com">dreamwiz.com</option>
			</select>
			<input type="text" size="10" name="str_season_ticket_email2" id="season_ticket_email2">
			<input type="checkbox" style="margin-left: 167px" 
			onclick="alert('선택하지 않을 경우 자세한 예약 정보를 확인하기 어렵습니다.');">E-MAIL 수신 여부</td><br>
	</tr>
	<tr>
		<td style="text-align:center;">차종 <font color="#FF0000">*</font></td>
		<td><input type="text" size="10" name = "str_season_ticket_car_kinds" id="str_season_ticket_car_kinds"></td>
	</tr>
	<tr>
		<td style="text-align:center;">차량번호 <font color="#FF0000">*</font></td>
		<td><input type="text" size="10" name = "str_season_ticket_car_num" id="str_season_ticket_car_num" placeholder="공백 없이 입력"></td>
	</tr>
</table>

<br>
<table class="ticket_application2" cellpadding="5" width="700" border="1">
	<tr>
		<td style="text-align:center;">시스템 시간</td>
		<td><div style="font-color:#FF0000;" id="season_ticket_clock" ></div></td>
	</tr>
	<tr>
		<td style="text-align:center;">주차장</td>
		<td>
			<select id = "str_season_ticket_parking_lot" name = "str_season_ticket_parking_lot">
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
		<td style="text-align:center;">주간/야간 구분<font color="#FF0000">*</font></td>
		<td><input type="radio" id="ju_ya" name="ju_ya">전일정기권 (24시간)</td>
	</tr>
	<tr>
		<td style="text-align:center;">소형/중형/대형 구분<font color="#FF0000">*</font></td>
		<td><input type="radio" id="so_jung_dae" name="so_jung_dae">소형 (화물 2.5t미만, 승합 15인승 이하)</td>
	</tr>
	<tr>
		<td style="text-align:center;">감면 자격<font color="#FF0000">*</font></td>
		<td><select id="str_season_ticket_reduction" name="str_season_ticket_reduction"  style="font-size:12px; font-face:돋움;">
			<option id="1">해당없음</option>
			<option id="2">요일제</option>
			<option id="3">경차</option>
			<option id="4">경차(저공해)환승</option>
			<option id="5">장애인.국가유공자이자,고엽제후유</option>
			<option id="6">5.18</option>
			<option id="7">다둥이행복카드소지자(2자녀)</option>
			<option id="8">다둥이행복카드소지자(3자녀이상)</option>
			<option id="9">환승할인</option>
			</select><p/>
			<font color="red">※ 경차(저공해)환승 차량은 감면자격에서 '경차(저공해)환승' 할인을 선택해 주세요.</font></td>
	</tr>
	<tr>
		<td style="text-align:center;">신청 월 선택<font color="#FF0000">*</font></td>
		<td>
		<select id ="n_season_ticket_start_date" name = "n_season_ticket_start_date">
			<option id = "01">01</option>
			<option id = "02">02</option>
			<option id = "03">03</option>
			<option id = "04">04</option>
			<option id = "05">05</option>
			<option id = "06">06</option>
			<option id = "07">07</option>
			<option id = "08">08</option>
			<option id = "09">09</option>
			<option id = "10">10</option>
			<option id = "11">11</option>
			<option id = "12">12</option>
		</select>월 정기권 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="season_parking_list" value = "좌석보기"/>
		</td>
		
	</tr>

</table>

<div id="season_parking_stage">

</div>
<p/><button type="submit" id="btn_lastjoin" name="n_season_ticket_discriminate" value= "${2}">예약하기</button>

</center>
</form>
</body>
</html>