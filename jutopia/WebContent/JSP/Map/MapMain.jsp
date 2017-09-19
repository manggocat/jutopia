<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>우편번호 검색</title>
<!--  <link href="../css/Popup.css" rel="stylesheet" type="text/css" >  -->
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="./JS/Address_Search/Address_Search.js" charset="UTF-8"></script>
<link href="./CSS/Map/mapstyle.css" rel="stylesheet" type="text/css">
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
function loginshowPopup() {     
	   window.open("SignUp_LoginForm.do", "로그인", 
	   "width=700, height=300, left=100, top=50");
	  }
</script>
</head>

<body>

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
								<a class="navbar-brand" href="#"
									style="background-image: url('./images/MainForm/Logo.png'); height: 65px; width: 109px; background-size: cover"></a>
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#" class="">Home</a></li>
									<li class=" dropdown"><a href="#" class="dropdown-toggle "
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">Departments <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li class=" dropdown"><a href="#"
												class="dropdown-toggle " data-toggle="dropdown"
												role="button" aria-haspopup="true" aria-expanded="false">View
													Departments</a></li>
											<li><a href="#">Add New</a></li>
										</ul></li>
									<li><a href="#">Add New</a></li>
									<li class=" dropdown"><a href="#" class="dropdown-toggle "
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">Managers <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="#">View Managers</a></li>
											<li><a href="#">Add New</a></li>
										</ul></li>
									<li class=" dropdown"><a href="#"
										class="dropdown-toggle active" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">Staff
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="#">View Staff</a></li>
											<li><a href="#">Add New</a></li>
											<li><a href="#">Bulk Upload</a></li>
										</ul></li>
									<li class=" down"><a href="#"
										class="dropdown-toggle active" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">HR
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="#">Change Time Entry</a></li>
											<li><a href="#">Report</a></li>
										</ul></li>
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
								<a class="navbar-brand" href="#"
									style="background-image: url('./images/MainForm/Logo.png'); height: 65px; width: 109px; background-size: cover"></a>
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#" class="">Home</a></li>
									<li class=" dropdown"><a href="#" class="dropdown-toggle "
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">Departments <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li class=" dropdown"><a href="#"
												class="dropdown-toggle " data-toggle="dropdown"
												role="button" aria-haspopup="true" aria-expanded="false">View
													Departments</a></li>
											<li><a href="#">Add New</a></li>
										</ul></li>
									<li><a href="#">Add New</a></li>
									<li class=" dropdown"><a href="#" class="dropdown-toggle "
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">Managers <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="#">View Managers</a></li>
											<li><a href="#">Add New</a></li>
										</ul></li>
									<li class=" dropdown"><a href="#"
										class="dropdown-toggle active" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">Staff
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="#">View Staff</a></li>
											<li><a href="#">Add New</a></li>
											<li><a href="#">Bulk Upload</a></li>
										</ul></li>
									<li class=" down"><a href="#"
										class="dropdown-toggle active" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">HR
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="#">Change Time Entry</a></li>
											<li><a href="#">Report</a></li>
										</ul></li>
								</ul>
								<ul class="nav navbar-nav pull-right">
									<li class=""><a href =""onclick="loginshowPopup()">Login</a></li>
									<li class=""><a href="SignUp_InsertForm.do">SignUp</a></li>
								</ul>

							</div>

						</div>

					</nav>
				</div>
			</div>
		</form>
	</c:if>
	<div align="center">
		<input type="button" name="road_address" value="도로명 주소"
			id="road_address" />&nbsp;&nbsp; <input type="button" name="address"
			value="지번 주소" id="address" />
		<!--  <p><input align = "center" type = 'text' size = '20'  id = "search_text" class='postcodify_address'> <button id='search_button' >검색</button></p> -->
	</div>

	<div align="center" id="Address_informaiton"></div>


	<script type="text/javascript">
		$(document).ready(function() {

			$("#road_address").click(function() {

				$("#Address_informaiton").load("JSP/Map/Street_Address.jsp");
			});

			$("#address").click(function() {
				$("#Address_informaiton").load("JSP/Map/Address.jsp");

			});

		});
	</script>
	<br>


	<div class="map_wrap">
		<div id="map"
			style="width: 50%; height: 70%; position: relative; overflow: hidden; margin-left: 40%;"></div>

		<div id="menu_wrap" class="bg_white"
			style="height: 65%; margin-left: 15%;">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;" name="frm">
						상세주소 : <input type='text' class='postcodify_address' id="keyword"
							size="15"> <br>
						<%--  키 워 드 : <input type="text" value="<%=a %> 주차장" id="keyword" size="15"> --%>
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043faef8509eb178b42cbcafc976bea9&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				/* alert('키워드를 입력해주세요!'); */
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === daum.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === daum.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					daum.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					daum.maps.event.addListener(marker, 'mouseout', function() {
						infowindow.close();
					});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info" onclick="location.href='
					+ "'mapparkinfo.do?name="
					+ places.place_name
					+ "&address="
					+ places.road_address_name
					+ "&address2="
					+ places.address_name
					+ "'"
					+ '">'
					+ ' <h5>'
					+ places.place_name + '</h5>';

			/* 
			<a href="MapParkInfo.jsp?name='
				+ places.place_name
				+ '&address='
				+ places.road_address_name
				+ '&address2='
				+ places.address_name
				+ '">'
				</a> */

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new daum.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>

	<table align="center">

		<tr>
			<td><font>서울시 강남구 태해란로 103길 17정석빌딩 &nbsp;&nbsp; 대표이사 :
					서효진 &nbsp;&nbsp; 사업자등록번호 : 138-81-05876 &nbsp;&nbsp; 통신판매업 신고번호 :
					제2011-서울강남-02008호</td>
		</tr>
		<tr>
			<td>문의전화(평일 09:00~18:00) : 1566-7727 &nbsp;&nbsp; (유료)이메일 :
				meloninformation@iloen.com &nbsp;&nbsp;© 2016. LOEN Entertainment,
				Inc. ALL RIGHTS RESERVED.</td>
		</tr>

	</table>




</body>
</html>