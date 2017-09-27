<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정기권 안내</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">

<style>
.season_ticket_info {
	border-collapse: collapse;
	border: 1px gray solid;
}

body {
	background: #8999A8;
	background: url('./images/MainForm/background.jpg') fixed;
	background-repeat: no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

tr {
	font-weight: bold;
	font-size: 15px;
}

select {
	padding: 9px;
	border: 1px solid #c3c3c3;
	border-radius: 7px;
}

.well-sm {
	margin-left: 15%; margin-top : 5%;
	padding: 10px;
	border-radius: 3px;
	width: 70%;
	margin-top: 5%;
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

								<div style="position: relative;"><a href="mapmainForm.do" >
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
	
	

	<!-- 정기권 안내 페이지 -->
	<form action="Season_Ticket_MoneyInfo_Form_Action.do" method="get">
		<div class="well well-sm"
			style="background: rgba(255, 255, 255, 0.8);" align="center">
			<table class="season_ticket_info" width="700" cellpadding="10"
				border="1"
				style="border-width: medium; border-top-color: gray; border-left-color: gray; border-right-color: gray; border-bottom-color: gray;">
				<tr align="center">
					<td><font size="6" face="맑은 고딕">정기권 안내 페이지</font></td>
					<br>
					<br>
					<br>
				</tr>
				<tr>
					<td><font color="#22741C" size="4"><b>⊙ 인터넷 정기권 신청
								절차</b></font></td>
					<p />
				</tr>
				<tr>
					<td><font color="#22741C" size="1">&nbsp;&nbsp;<b>□</b></font>
						서울시설공단<br> &nbsp;&nbsp;&nbsp;◈인터넷 정기권 발매공고
						<p /> &nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font>  이용자<br>
		&nbsp;&nbsp;&nbsp;◈본인 인증 및 로그인<br>
		&nbsp;&nbsp;&nbsp;◈정기권 신청<br>
		&nbsp;&nbsp;&nbsp;◈증명서 제출 (해당자에 한함: 감면 대상자 및 중대형 차량)<br>
		&nbsp;&nbsp;&nbsp;◈정기권 신청 완료<br><p/>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font> 
		월 정기권은 인터넷 선착순 판매가 기본이며, 매 전월 지정일 (주차장마다 상이)에 판매가 개시됩니다. (휴일 불변)</td>
					<br>
					<p />
				</tr>
				<tr>
					<td><font color="#22741C" size="4"><b>⊙ 신청 시 유의사항</b></font></td>
					<p />
				</tr>
				<tr>
					<td>&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b>
					</font> 각종 감면 대상자 (장애인, 경차 등) 및 중,대형 차량은 해당 증빙서류를 인터넷으로 등록하셔야 최종 결제 단계까지
						진행하실 수 있습니다.<br> &nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b>
					</font> 정기권 신청 및 결제는 기간 중 매일 09 시 ~ 23 시에 가능합니다.(휴일 불변)<br>
						&nbsp;&nbsp;&nbsp;<font color="#0100FF"> ※ 인터넷 정기권 시스템은 [先
							신청 / 後 결제] 체계이므로, 우선 신청부터 하신 뒤 익일 23시까지 결제유예(단, 신청일이 말일인 경우에는 당일
							23시까지) 미결제시 신청이 자동으로 취소됩니다.</font><br>
					<p /> &nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font> 
		월 정기권의 유효기간은 매월 1 일 ~ 말일까지입니다.<br>
		&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font>
		<font color="#0100FF"> ※ 유효기간 만료일 익일 00 시부터 (매월 1 일 00 시) 시간 주차 요금이 부과됩니다.</font><br><p/></td>
				</tr>
				<tr>
					<td><font color="#22741C" size="4"><b>⊙ 신청 자격</b></font>
					<p /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font>
						공단에서 운영하고 있는 공영주차장의 월정기권은 일반 시민 누구나 (이용자의 주소지와 무관) 신청하실 수 있습니다. <br>
						&nbsp;&nbsp;(다만, 일부 거주자 우선 주차장으로 운영되고 있는 주차장 (평창동, 신설동) 및 여객 자동차
						운수사업법 및 화목 자동차 운수법에 적용을 받는 타시도 소재의 영업용 전세버스와 화물자동차의 경우 예외)<br>
					<p /></td>
				</tr>
				<tr>
					<td><font color="#22741C" size="4"><b>⊙정기권 발급 제한</b></font>
					<p /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;<font color="#22741C" size="1"><b>□</b></font>
						공영주차장의 주차요금 또는 도로교통시행령 제 88조에 따른 주차위반 과태료 3회 이상 체납 또는 할인 관련 서류 미제출
						차량, 요일제 위반한 할인 차량은 정기권 발급이 제한됩니다.<br></td>
				</tr>
			</table>

			<p />
			<br>
			<button type="submit" class="btn btn-info" id="commutation_Sub">
				정기권 신청하기<span class="icon-cog icon-white"></span>
			</button>
		</div>

	</form>
	</c:if>
	
</body>
</html>