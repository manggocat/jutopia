<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Daum 지도 시작하기</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3de7ecb8dd0593be114d513b5c0a775d"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3de7ecb8dd0593be114d513b5c0a775d"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.403275, 127.107392),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
</body>
</html>