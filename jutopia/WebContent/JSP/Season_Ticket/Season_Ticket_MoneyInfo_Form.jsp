<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
    
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정기권 신청하기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">
<style>
body {
	font-size: 12px;
	
    
   background: #8999A8;
   background: url('./images/MainForm/background.jpg') fixed; 
   background-repeat: no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;

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


fieldset {
 
    min-width: 0;
    padding: 45px;
    margin: 0;
    border: 0;
}

.well-sm {
    margin-left: 15%;
    margin-top: 5%;
    padding: 10px;
    border-radius: 3px;
    width: 70%;
}
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
	</c:if>

<!-- 정기권 신청하기 -->
<form action="Season_Ticket_Insert_Form.do" method="post" autocomplete="off">
<div class="well well-sm" style="background: rgba(255,255,255,0.8);" align="center">

 <legend><h1>정기권 신청하기</h1></legend>


<font color="#22741C" size="4"><b>⊙ 주차장 정보</b></font> 
<br><br>
<table class="jucha_info" width="700" cellpadding="5" border="1" style=" border-width:medium; border-top-color: gray; border-left-color: gray; border-right-color: gray; border-bottom-color: gray;">
<tr>	<td style="text-align:center; border:1px gray solid;" >주차장 명</td><td>무슨 역이야</td>	</tr>
<tr>	<td style="text-align:center;">신청 방식</td><td>선착순</td>	</tr>
<tr>	<td style="text-align:center;">운영 방식</td><td>자동화 정산 (주차권 불필요)</td></tr>
<tr>	<td style="text-align:center;">공고 매수</td><td>전일 : 285 매</td>	</tr>
<tr>	<td style="text-align:center;">시스템 시간</td><td><div id="season_ticket_clock"></div></td>	</tr>
</table>

<br><br>



<font color="#22741C" size="4"><b>⊙ 요금 안내</b></font> 
<br><br>
<table class="money_info" width="700" cellpadding="5" border="1" style=" border-width:medium; border-top-color: gray; border-left-color: gray; border-right-color: gray; border-bottom-color: gray;">
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
<br><br>
<button type = "submit" class="btn btn-info" id="btn_join">[잔여분] 정기권 신청하기<span class="icon-cog icon-white"></span></button> 


</div>
</form>
</body>
</html>