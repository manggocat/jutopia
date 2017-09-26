<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정기권 안내</title>

<style>

.season_ticket_info {
	border-collapse:collapse;
	border:1px gray solid;
}

body {
	font-size: 12px;

}

</style>

</head>
<body>
<center>
<form action="Season_Ticket_MoneyInfo_Form_Action.do" method="get">
<table class="season_ticket_info" width="700" cellpadding="10" border="1" style="border-width:medium; 
border-top-color: gray; border-left-color: gray; border-right-color: gray; border-bottom-color: gray;">
	<tr>
		<td><font size="6" face="맑은 고딕">정기권 안내 페이지</font></td><br><br><br>
	</tr>
	<tr>
		<td><font color="#22741C" size="4"><b>⊙ 인터넷 정기권 신청 절차</b></font></td><p/>
	</tr>
	<tr>
		<td><font color="#22741C" size="1">&nbsp;&nbsp;<b>□</b></font> 서울시설공단<br>
		&nbsp;&nbsp;&nbsp;◈인터넷 정기권 발매공고<p/>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font>  이용자<br>
		&nbsp;&nbsp;&nbsp;◈본인 인증 및 로그인<br>
		&nbsp;&nbsp;&nbsp;◈정기권 신청<br>
		&nbsp;&nbsp;&nbsp;◈증명서 제출 (해당자에 한함: 감면 대상자 및 중대형 차량)<br>
		&nbsp;&nbsp;&nbsp;◈정기권 신청 완료<br><p/>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font> 
		월 정기권은 인터넷 선착순 판매가 기본이며, 매 전월 지정일 (주차장마다 상이)에 판매가 개시됩니다. (휴일 불변)</td><br><p/>	
	</tr>
	<tr>
		<td><font color="#22741C" size="4"><b>⊙ 신청 시 유의사항</b></font></td><p/>	
	</tr>
	<tr>
		<td>&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b>
		</font> 각종 감면 대상자 (장애인, 경차 등) 및 중,대형 차량은 해당 증빙서류를 
		인터넷으로 등록하셔야 최종 결제 단계까지 진행하실 수 있습니다.<br>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b>
		</font> 정기권 신청 및 결제는 기간 중 매일 09 시 ~ 23 시에 가능합니다. (휴일 불변)<br>
		&nbsp;&nbsp;&nbsp;<font color="#0100FF"> ※ 인터넷 정기권 시스템은 [先 신청 / 後 결제] 체계이므로, 
		우선 신청부터 하신 뒤 익일 23시까지 결제유예(단, 신청일이 말일인 경우에는 당일 23시까지) 미결제시 신청이 자동으로 취소됩니다.</font><br><p/>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font> 
		월 정기권의 유효기간은 매월 1 일 ~ 말일까지입니다.<br>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font>
		<font color="#0100FF"> ※ 유효기간 만료일 익일 00 시부터 (매월 1 일 00 시) 시간 주차 요금이 부과됩니다.</font><br><p/></td>
	</tr>
	<tr>
		<td><font color="#22741C" size="4"><b>⊙ 신청 자격</b></font><p/></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font> 
		공단에서 운영하고 있는 공영주차장의 월정기권은 일반 시민 누구나 (이용자의 주소지와 무관) 신청하실 수 있습니다. <br>
		&nbsp;&nbsp;(다만, 일부 거주자 우선 주차장으로 운영되고 있는 주차장 (평창동, 신설동) 및 
		여객 자동차 운수사업법 및 화목 자동차 운수법에 적용을 받는 타시도 소재의 영업용 전세버스와 화물자동차의 경우 예외)<br><p/></td>
	</tr>
	<tr>
		<td><font color="#22741C" size="4"><b>⊙정기권 발급 제한</b></font><p/></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font> 
		공영주차장의 주차요금 또는 도로교통시행령 제 88조에 따른 주차위반 과태료 3회 이상 체납 
		또는 할인 관련 서류 미제출 차량, 요일제 위반한 할인 차량은 정기권 발급이 제한됩니다.<br></td>
	</tr>
</table>
<p/>
<input type="submit" id="commutation_Sub" value="정기권 신청하기">
</center>
</form>
</body>
</html>