<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="./CSS/Map/mapparkinfo.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="../../JS/send_Sms/sms.js"></script>

</head>
<body onload="loadJSON()">
	<form action="smsPro.do">
		<input type="hidden" name="smsType" value="L">
<input type="hidden" name="name" value="${name }">
<input type="hidden" name="address" value="${address}">
		<div class="placeinfo-title">${name }</div>

		<br>
		<div class="col-sm-6">

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

			geocoder.addressSearch('${address}',
					function(result, status) {

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

		<div class="col-sm-6">
			<div class="placeinfo-address">
				<div class="placeinfo-subtitle">주소</div>
				<div class="placeinfo-content-wrap">
					<div class="col-xs-10">${address }</div>
				</div>
			</div>

			<hr>
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

			<hr>
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
				value="go"> <input type="hidden" name="msg" value="${name}
				${address}
				${url}">

			<input type="hidden" name="rphone" value="01044461939"> <input
				type="hidden" name="sphone1" value="010"> <input
				type="hidden" name="sphone2" value="5055"> <input
				type="hidden" name="sphone3" value="0240">

			<button type="submit">주차장 정보 문자로 전송</button>

		</div>





		</div>



	</form>

</body>
</html>