<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토파이 회원 정보</title>

</head>
<body>

<div class="row">
   <div class="col-md-8 col-md-offset-3" style="margin-left: 20%;"> 
        <div class="well well-sm" style="background: rgba(255,255,255,0.6);" >
    
      <form class="form-horizontal" role="form" method="get" id="reservationForm" name="reservationForm" action="reservationPro.do" onsubmit="return check()" style="">
	  <input type="hidden" name="reduction" id="reduction">
        <fieldset style="padding: 45px;">

           <!-- Form Name -->
          <legend class="text-center"><h1>Reservation confirm</h1></legend>

           <!-- 예약 횟수-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">예약 횟수 : </label>
            <div class="col-sm-6">
              <input type="text" placeholder="횟수 기입" class="form-control" value="${nLastReservationSize}">
            </div>
          </div>

           <!-- 예약 현황-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">예약 현황 : </label>
            <div class="col-sm-6">
              <input type="text" value="${strLastReservationPlace} &nbsp;시작 시간-${strLastReservationStartTime}~종료시간- ${strLastReservationEndTime}" class="form-control" >
            </div>
          </div>

           <!-- 정기권 기간-->
          

           <!-- 혜택 안내-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">혜택 안내  : </label>
            <div class="col-sm-6">
              <input type="text" value="${mypageVO.getStr_User_REDUCTION()}" class="form-control" >
            </div>
         
          </div>

        </fieldset>
      </form>
    </div>
  </div>
</div>
</body>
</html>