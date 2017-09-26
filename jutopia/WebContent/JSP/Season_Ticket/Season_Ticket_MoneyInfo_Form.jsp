<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정기권 신청하기</title>
<style>
 .jucha_info  {
 	font-size : 12px;
 	font-face: 돋움;
 }
 
 .money_info {
 	text-align: center;
  	font-size : 12px;
 	font-face: 돋움;
 }
 
 .jucha_info,  .money_info {
	border-collapse:collapse;
	border:1px gray solid;
}

td {
	border:1px gray solid;
}

</style>




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

</head>
<body onload="startTime()">
<form action="Season_Ticket_Insert_Form.do" method="post" autocomplete="off">
<center>
정기권 신청하기
<p/>
<hr>

<font color="#22741C" size="4"><b>⊙ 주차장 정보</b></font>
<table class="jucha_info" width="700" cellpadding="5" border="1">
<tr>	<td style="text-align:center; border:1px gray solid;" >주차장 명</td><td>무슨 역이야</td>	</tr>
<tr>	<td style="text-align:center;">신청 방식</td><td>선착순</td>	</tr>
<tr>	<td style="text-align:center;">운영 방식</td><td>자동화 정산 (주차권 불필요)</td></tr>
<tr>	<td style="text-align:center;">공고 매수</td><td>전일 : 285 매</td>	</tr>
<tr>	<td style="text-align:center;">시스템 시간</td><td><div id="season_ticket_clock"></div></td>	</tr>
</table>

<br><br>



<font color="#22741C" size="4"><b>⊙ 요금 안내</b></font>
<table class="money_info" width="700" cellpadding="5" border="1" >
<th>접수 구분</th><th>감면 비율</th><th>요금 안내</th>
<tr>	<td width="300">일반</td><td width="200">없음</td><td width="200">65,000원</td>	</tr>
<tr>	<td>환승</td><td>없음</td><td>40,000원</td>	</tr>
<tr>	<td>야간</td><td>없음</td><td>0원</td>	</tr>
<tr>	<td>요일제</td><td>일반 요금의 30%</td><td>45,500원</td>	</tr>
<tr>	<td>경차</td><td>일반 요금의 50%</td><td>32,500원</td>	</tr>
<tr>	<td>경차(저공해)환승</td><td>일반 요금의 80%</td><td>13,000원</td>	</tr>
<tr>	<td>저공해차량</td><td>일반 요금의 50%</td><td>32,500원</td>	</tr>
<tr>	<td>장애인, 국가유공자이자, 고엽제후유</td><td>일반 요금의 80%</td><td>13,000원</td>	</tr>
<tr>	<td>5.18</td><td>일반 요금의 50%</td><td>32,500원</td>	</tr>
<tr>	<td>다둥이행복카드소지자(2자녀)</td><td>일반 요금의 30%</td><td>45,500원</td>	</tr>
<tr>	<td>다둥이행복카드소지자(3자녀이상)</td><td>일반 요금의 50%</td><td>32,500원</td>	</tr>
</table>
<p/>
<input type="submit" id="btn_join" value="[잔여분] 정기권 신청하기">
</center>
</form>
</body>
</html>