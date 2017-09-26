<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="./CSS/Map/mapparkinfo.css" rel="stylesheet" type="text/css">
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../JS/send_Sms/sms.js"></script>

</head>

<body onload="loadJSON()">
	<c:if test="${sessionScope.memID != null}">
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
								
						<div style="position: relative;">
									<img src="./images/MainForm/Logo.png" style="width: 160px; height: 90px; position: absolute;"/></div>
						
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active" style="padding-right: 20px; padding-left: 20px;"><a href="mapmainForm.do" class="">Home</a></li> 
									
									<li class=" dropdown" style="padding-right: 30px; padding-left: 20px;">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">예약 하기<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="Season_Ticket_Info_Action.do"><font
													color="white">주차 정기권</font></a></li>
													<li><a href="BookingForm.do"><font color="white">주차 예약권</font></a></li>
										</ul></li>
									 <c:if test="${sessionScope.memID!='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a href="noteList.do">
												쪽지함 </a></li>
									</c:if>
									<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a
											href="noteListAdmin.do"> 쪽지함 </a></li>
									</c:if>									<li style="padding-right: 20px;"><a href="list.do">공지사항</a></li>
									
									<li><a href="#">회사 소개</a></li>
								
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
	<c:if test="${sessionScope.memID == null}">
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
								
								<div style="position: relative;">
									<img src="./images/MainForm/Logo.png" style="width: 160px; height: 90px; position: absolute;"/></div>
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active" style="padding-right: 20px; padding-left: 20px;"><a href="mapmainForm.do" class="">Home</a></li> 
									
									<li style="padding-right: 20px;"><a href="list.do">공지사항</a></li>
									
									<li><a href="#">회사 소개</a></li>
								
								</ul>
								<ul class="nav navbar-nav pull-right">
									<li class="" style="padding-right: 20px;"><a href="" onclick="loginshowPopup();">Login</a></li>
									<li class=""><a href="SignUp_InsertForm.do">SignUp</a></li>
								</ul>

							</div>

						</div>

					</nav>
				</div>
			</div>
		</form>
	</c:if>
	<br>

<!-- 주차 정보 보여주는 부분 -->
	<c:if test="${ smsCheck == 1}">
		<script type="text/javascript">
			alert("문자가 전송되었습니다");
		</script>
	</c:if>
	<br>
	<br>
		<div class="container center">
			<div class="well" style="width: 100%; height: 600px;">
				<form action="smsPro.do">
					<input type="hidden" name="smsType" value="L"> <input
						type="hidden" name="name" value="${name }"> <input
						type="hidden" name="address" value="${address}">
					<div class="placeinfo-title">
						<Strong><font size="6">${name }</font></Strong>
					</div>
					<br> <br>
					<div class="col-sm-6" style="padding-left: 10%">

						<div id="map"></div>
					</div>
					<script type="text/javascript"
						src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=043faef8509eb178b42cbcafc976bea9&libraries=services"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center : new daum.maps.LatLng(33.450701, 126.570667),
							level : 3
						};
						var map = new daum.maps.Map(container, options);
						var geocoder = new daum.maps.services.Geocoder();

						geocoder.addressSearch('${address}', function(result,
								status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === daum.maps.services.Status.OK) {

								var coords = new daum.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new daum.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
					</script>

					<div class="col-sm-6" style="padding-left: 10%">
						<div class="placeinfo-address">
							<div class="placeinfo-subtitle">주소</div>
							<div class="placeinfo-content-wrap">
								<div class="col-xs-10">${address }</div>
							</div>
						</div>

						<hr style="border-top: 2px solid #ffffff;">
						<div class="placeinfo-address">
							<div class="placeinfo-subtitle">요금 정보</div>
							<div class="placeinfo-content-wrap">
								<div class="col-xs-3">
									<span class="label label-default">기본요금</span>
								</div>
								<div class="col-xs-9 desc555-15">최초 5분 400원</div>
								<br>
								<div class="col-xs-3">
									<span class="label label-default">일 주차</span>
								</div>
								<div class="col-xs-9 desc555-15"></div>
								<br>
								<div class="col-xs-3">
									<span class="label label-default">월 주차</span>
								</div>
								<div class="col-xs-9 desc555-15">180,000</div>
							</div>

						</div>

						<hr style="border-top: 2px solid #ffffff;">
						<div class="placeinfo-address">
							<div class="placeinfo-subtitle">시간 정보</div>
							<div class="placeinfo-content-wrap">
								<div class="col-xs-3">
									<span class="label label-default">주 중</span>
								</div>
								<div class="col-xs-9 desc555-15">00시 ~ 24시</div>
								<br>
								<div class="col-xs-3">
									<span class="label label-default">토요일</span>
								</div>
								<div class="col-xs-9 desc555-15">00시 ~ 24시</div>
								<br>
								<div class="col-xs-3">
									<span class="label label-default">일요일</span>
								</div>
								<div class="col-xs-9 desc555-15">00시 ~ 24시</div>
							</div>
							<br>
							<div class="col-xs-3">
								<span class="label label-default">공휴일</span>
							</div>
							<div class="col-xs-9 desc555-15">00시 ~ 24시</div>
						</div>
						<br> <br> <br> <input type="hidden" name="action"
							value="go"> <input type="hidden" name="msg"
							value="${name}
				${address}">

						<!-- <input type="hidden" name="rphone" value="01031934635"> -->
						<input type="hidden" name="sphone1" value="010"> <input
							type="hidden" name="sphone2" value="5055"> <input
							type="hidden" name="sphone3" value="0240">

						<c:if test="${sessionScope.memID!=null}">
							
							<button type = "submit" class="btn btn-info" style="margin-left: 5%;" >주차장 정보 문자로 전송<span class="icon-cog icon-white"></span></button>
						</c:if>
					</div>
			</div>

		</div>
	
	</form>
	</div>
</body>
</html>