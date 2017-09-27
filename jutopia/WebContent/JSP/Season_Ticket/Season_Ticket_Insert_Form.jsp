<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import = "jutopia.seasonticket.*"%>
<%@ page import = "jutopia.SignUp.*"%>

<html><head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="./resource/alertify.core.css" />
<link rel="stylesheet" href="./resource/alertify.default.css" id="toggleCSS" />
<script src="resource/alertify.min.js"></script>
<script>
$(document).ready(function(){
    
    $("alert").on( 'click', function () {
     alertify.alert("");
     return false;
    });
});
 
 
</script>
<link href="./CSS/BookingForm/BookingForm.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./CSS/BookingForm/icono.min.css">
<style type="text/css">
body {

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

select {
	color: black;
}
</style>

<!-- 실시간 나타내기 -->
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

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
 
<script type="text/javascript">

function check() { //사용자가 입력폼에 입력한 상황을 체크
	
	var check = document.Season_Ticket_Insert_Form;

	if (!check.str_season_ticket_car_kinds.value) {
		alertify.alert("차종을 입력하세요");
		check.str_season_ticket_car_kinds.focus();
		return false;
	}

	

}  

//차번호 유효성 검사 //(^\\d{2}[가-힣]{1}\\d{4}$)
$(function(){ 
      if ($('#str_season_ticket_car_num').attr('pattern', '^([0-9]){2}([가-힣])([0-9]){4}$')){
          $('#str_season_ticket_car_num').attr('title', '숫자로 시작하고 숫자+한글 조합 7자리로 입력해 주세요.')
      }	
});

 
		
		// 이메일 카피
		$('#select_email').change(function(){
			var selectedValue = $('#select_email option:selected').text();
			if(selectedValue=="직접 입력"){
				$('#season_ticket_email2').val("");
			}else{
				$('#season_ticket_email2').val(selectedValue);
			}
		
			$("#haedang_x").attr("disabled", "disabled");

			/* $('#haedang_x').attr('disabled', 'true'); */

		});

		// 스크립트의 끝
	
	$(document).ready(function(){
		$("#season_parking_list").click(function(){
			$("#season_parking_stage").load("Season_Tickiet_Parkinplace_Form.do?str_season_ticket_parking_lot="+$('#str_season_ticket_parking_lot').val() + "&n_season_ticket_start_date=" + $('#n_season_ticket_start_date').val());
		});
	});    //page 불러오기
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_lastjoin").click(function(){
			if($('#str_season_ticket_car_kinds').val()==""||$('#str_season_ticket_car_kinds').val()==null){
				alertify.alert("차종을 입력해 주세요");
				return false;
				
			}else if($('#str_season_ticket_car_num').val()==""||$('#str_season_ticket_car_num').val()==null){
				alertify.alert("차 번호를 입력해 주세요");
					return false;
					
				} else if($('#str_season_ticket_position').val()==""||$('#str_season_ticket_position').val()==null){
					alertify.alert("좌석을 선택해 주세요");
					return false;
					
				}
			 
		});
	});
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
	</c:if>


<!-- 정기권 예약 -->
<div class="row">
    <div class="col-md-7 col-md-offset-3" style="margin-top: 4%;">
    
      <form class="form-horizontal" role="form" method="get" id = " Season_Ticket_Insert_Pro" name="Season_Ticket_Insert_Pro" action="Season_Ticket_Insert_Pro.do" onsubmit="return check()">
	
	  
	  
        <fieldset >

           <!-- Form Name -->
          <legend><h2><font color="white">정기권 신청 접수</text></h2></legend>

           <!-- 이름 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">이름</label>
            <div class="col-sm-6">
              <input type="text" placeholder="이름을 입력하세요." class="form-control" name="str_season_ticket_name" id="str_season_ticket_name" value="${BookingVO.getStr_User_Name()}"autofocus>
            </div>
          </div>
          
           <!-- 전화번호 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">전화 번호</label>
            <div class="col-sm-6">
              <input type="text" placeholder="'-'없이 입력해 주세요." class="form-control" name="str_season_ticket_tel" id="str_season_ticket_tel" value="${BookingVO.getStr_User_Tel()}">
            </div>
          </div>

           <!-- E-mail input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">E-mail</label>
            <div class="col-sm-6">
              <input type="text" placeholder="E-mail를 입력하세요." class="form-control" id="str_season_ticket_email" name = "str_season_ticket_id_email" value="${BookingVO.getStr_User_ID_Email()}">
            </div>
          </div>
          
          
          <!-- <td><input type="text" size="10" id="str_season_ticket_email" name = "str_season_ticket_id_email"> @
			<select style="font-size:12px; font-face:돋움;" id="select_email">
			<option value="">직접 입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="yahoo.co.kr">yahoo.co.kr</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="dreamwiz.com">dreamwiz.com</option>
			</select>
			<input type="text" size="10" name="str_season_ticket_email2" id="season_ticket_email2"></td> -->
         
           <!-- 차 종 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">차 종</label>
            <div class="col-sm-6">
              <input type="text" placeholder="차종을 입력해주세요." class="form-control" name = "str_season_ticket_car_kinds" id="str_season_ticket_car_kinds">
            </div>
          </div>
     
           <!-- 차량 번호 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput" >차량 번호</label>
            <div class="col-sm-6">
              <input type="text" class="form-control" title="숫자로 시작하고 숫자+한글 조합 7자리로 입력해 주세요." pattern="^([0-9]){2}([가-힣])([0-9]){4}$" placeholder="공백없이 입력해주세요."  name = "str_season_ticket_car_num" id="str_season_ticket_car_num">
            </div>
          </div> <!--  name="book_car_num" id="book_car_num" -->
          
          <!-- 시스템 시간-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">시스템 시간</label>
            <div class="col-sm-4">
              <div id="season_ticket_clock" style="font-weight: bold; font-size: 22px;"></div>
            </div>
          </div>
          
       <!--    <td style="text-align:center;">시스템 시간</td>
		<td><div style="font-color:#FF0000;" id="season_ticket_clock" ></div></td>
           -->
           <!-- 주차장 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">주차장</label>
            <div class="col-sm-4">
              <select id = "str_season_ticket_parking_lot" name = "str_season_ticket_parking_lot">
                    
		   			<option id = "Zamsil">잠실주차장</option>
		   			<option id = "Hangang">한강주차장</option>
		   			<option id = "Suseo">수서주차장</option>
		   			<option id = "Pangyo">판교주차장</option>
		   			<option id = "Gwangyo">광교주차장</option>
		   			<option id = "Yeongdeungpo">영등포주차장</option>
		   		</select>
            </div>
          </div>
          
           <!-- 주간/야간 구분 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">주간/야간 구분</label>
            <div class="col-sm-6">
              <input type="radio" id="ju_ya" name="ju_ya"> &nbsp;<font size="3" style="font-weight: bold;">전일 정기권 (24시간)</font> 
            </div>
          </div>
          
           <!-- 소형/중형/대형 구분 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">소형/중형/대형 구분</label>
            <div class="col-sm-6">
              <input type="radio" id="so_jung_dae" name="so_jung_dae" > &nbsp;<font size="3" style="font-weight: bold;">소형 (화물 2.5t미만, 승합 15인승 이하)</font> 
            </div>
          </div>
           
           <!-- 감면 정책 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput" style="width:70;">감면 정책</label>
            <div class="col-sm-6">
              <select class="col-sm-7.5 control-label"  id="book_reduction" name="book_reduction" style="font-size: 15px; font-family: inherit;">
						<option value="해당없음" selected>해당없음</option>
						<option value="요일제">요일제</option>
						<option value="경차">경차</option>
						<option value="경차(저공해)환승">경차(저공해)환승</option>
						<option value="장애인.국가유공자이자,고엽제후유">장애인.국가유공자이자,고엽제후유</option>
						<option value="5.18">5.18</option>
						<option value="다둥이행복카드소지자(2자녀)">다둥이행복카드소지자(2자녀)</option>
						<option value="다둥이행복카드소지자(3자녀이상)">다둥이행복카드소지자(3자녀이상)</option>
						<option value="환승할인">환승할인</option>
				</select>
				<br><br> <font color="red" size="4"><strong>※ 경차(저공해)환승 차량은 감면자격에서 '경차(저공해)환승'할인을 선택해 주세요.</strong></font>
            </div>
          </div>
          
          <!-- 신청 월 선택 input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">신청 월 선택</label>
            <div class="col-sm-4">
              <select id ="n_season_ticket_start_date" name = "n_season_ticket_start_date">
				<option id = "01">01</option>
				<option id = "02">02</option>
				<option id = "03">03</option>
				<option id = "04">04</option>
				<option id = "05">05</option>
				<option id = "06">06</option>
				<option id = "07">07</option>
				<option id = "08">08</option>
				<option id = "09">09</option>
				<option id = "10">10</option>
				<option id = "11">11</option>
				<option id = "12">12</option>
		    </select> &nbsp;<font size="3" style="font-weight: bold;">월 정기권 선택</font>	    
            </div>
            
            <button type="button"class="btn btn-primary" id="season_parking_list" style="margin-right: 100px">좌석보기</button>
            
          </div>
          
          <div id="season_parking_stage" style="margin-left: 15%;"></div>
  
          <!-- 버튼 부분 -->
          <div class="form-group">
            <div class="col-md-8 text-right">
              
                <button type = "submit" class="btn btn-info btn-lg" id="btn_lastjoin" name="n_season_ticket_discriminate" value="${2}">예약하기<span class="icon-cog icon-white"></span></button> 
                   
            </div>
          </div>

        </fieldset>
      </form>
    </div>
  </div>

</body>
</html>