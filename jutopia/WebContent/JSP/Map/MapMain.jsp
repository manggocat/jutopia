<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>

<!-- <style>   
ul{max-width:100%;height:60px;background:black;opacity:0.5;list-style:none;padding-top:25px;}
li{ float:right; margin-right:50px }
a{font-size:20px;color:white;font-weight:bold;text-decoration:none}
</style> -->

<title>우편번호 검색</title>
<!--  <link href="../css/Popup.css" rel="stylesheet" type="text/css" >  -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="../../JS/Address_Search/Pop.js" charset="UTF-8"></script>
<link href = "../../CSS/Map/mapstyle.css" rel = "stylesheet" type = "text/css">
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->


</head>

<body>
   <ul>
      <li><a href = "#">회사소개</a></li>
      <li><a href = "#">공지사항</a></li>
      <li><a href = "#">로그인</a></li>
      <li><a href = "#">마이페이지</a></li>
   </ul>
<div align = "center">
   <input  type="button" name="juso" value = "도로명 주소"  id = "doro"/>&nbsp;&nbsp; 
   <input  type="button" name="juso" value = "지번 주소"    id = "zibun"/>
   <p><input align = "center" type = 'text' size = '20' placeholder = '검색 버튼을 눌러주세요'> <button id='search_button' >검색</button></p> 
</div>
<div align = "center" id = "stage1">
   
</div>

<script type = "text/javascript">
    $(document).ready(function(){
      
      $("#doro").click(function(){
         $("#stage1").html
            ("<label>도로명주소&nbsp;&nbsp;</label><input type='text' class='postcodify_address' id = 'address'/><label>우편번호&nbsp;&nbsp;</label><input type='text' size='4' class='postcodify_postcode6_1' />&nbsp;&nbsp;<label>-</label>&nbsp;&nbsp;<input type='text' size='4' class='postcodify_postcode6_2' />&nbsp;&nbsp;<label>참고항목&nbsp;&nbsp;</label><input type='text' class='postcodify_extra_info' />");
      });
      
      $("#zibun").click(function(){
         $("#stage1").html
            ("<label>지번주소&nbsp;&nbsp;</label><input type='text' class='postcodify_jibeon_address' id = 'jibeon_address'/><label>우편번호&nbsp;&nbsp;</label><input type='text' size='4' class='postcodify_postcode6_1' />&nbsp;&nbsp;<label>-</label>&nbsp;&nbsp;<input type='text' size='4' class='postcodify_postcode6_2' />&nbsp;&nbsp;<label>참고항목&nbsp;&nbsp;</label><input type='text' class='postcodify_extra_info' name='etc'/>");
      
      });
      
      $("#search_button").click(function(){
         $("#search_button").postcodifyPopUp();
      });
      

    });
    
</script>
<br>
 
<%String a = "판교"; %>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;" name="frm">
                    상세주소 : <input type='text' class='postcodify_address' id="keyword" size="15"> <br>
                    <%-- 키 워 드 : <input type="text" value="<%=a %> 주차장" id="keyword" size="15"> --%>
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3de7ecb8dd0593be114d513b5c0a775d&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

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
    ps.keywordSearch( keyword, placesSearchCB); 
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

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
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

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
    '<div class="info">'
	+ '   <h5><a href="MapParkInfo.jsp?name='
	+ places.place_name
	+ '&address='
	+ places.road_address_name
	+ '&address2='
	+ places.address_name
	+ '">' 
	+ places.place_name
	+ '</a></h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
    
}
function moveMapParkInfo(place){
	location.href="MapParkInfo.jsp?name="+places.place_name+"&address="+places.road_address_name+"&address2="+places.address_name+"";	
}
</script>

   
   <table align = "center">
   
      <tr>
         <td><font>서울시 강남구 태해란로 103길 17정석빌딩 &nbsp;&nbsp; 대표이사 : 서효진 &nbsp;&nbsp; 사업자등록번호 : 138-81-05876 &nbsp;&nbsp; 통신판매업 신고번호 : 제2011-서울강남-02008호</td>
      </tr>
      <tr>
         <td>문의전화(평일 09:00~18:00) : 1566-7727 &nbsp;&nbsp; (유료)이메일 : meloninformation@iloen.com &nbsp;&nbsp;© 2016. LOEN Entertainment, Inc. ALL RIGHTS RESERVED.</td>
      </tr>
   
   </table>
   

   

</body>
</html>