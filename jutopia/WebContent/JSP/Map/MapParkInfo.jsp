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
<link href = "../../CSS/Map/mapparkinfo.css" rel = "stylesheet" type = "text/css">


</head>
<body>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		if(address.length()==0){
			address=address2;	
			}
			
	%>
	<div class="tac">
		<div class="juchaname"><%=name%></div>
	</div>
	<br>
	<div class="col-sm-6">

		<div id="map" style="width: 500px; height: 400px;"></div>
	</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043faef8509eb178b42cbcafc976bea9&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			level : 3
		};
		var map = new daum.maps.Map(container, options);
		var geocoder = new daum.maps.services.Geocoder();
		
		geocoder.addressSearch('<%=address%>', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		       

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	</script>

	<div class="col-sm-6">
		<div class="address12">
			<div class="subtitle">주소</div>
			<div class="subcontent">
				<div class="col-xs-10 desc555-15"><%=address%></div>
			</div>
		</div>

		<hr>
		<div class="address">
			<div class="subtitle">요금 정보</div>
			<div class="subcontent">
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
		<div class="address">
			<div class="subtitle">시간 정보</div>
			<div class="subcontent">
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
		<br>
		<br>
		<br>
		
	<button>ㅁㅁㄴㅇㄻㄴㅇㄹ</button>
	</div>





	</div>





</body>
</html>