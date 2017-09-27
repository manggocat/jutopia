<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약 확인 페이지</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script src="./JS/reservation/bootstrap.min.js"></script>
<link rel="stylesheet" href="./CSS/reservation/bootstrap.min.css" type="text/css">
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">
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


div.contents {
margin-left: 20%;
}

h3 {
font-weight: bold;
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

.well-sm {
    margin-left: 25%;
    margin-top: 5%;
    padding: 13px;
    border-radius: 3px;
    width: 50%;
}
</style>
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

								<div style="position: relative;"><a href="mapmainForm.do" >
									<img src="./images/MainForm/Logo.png"
										style="width: 160px; height: 90px; position: absolute;" /></a>
								</div>

							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active"
										style="padding-right: 20px; padding-left: 20px;"><a href="mapmainForm.do" class="">Home</a>

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
<div class="well well-sm" style="background: rgba(255,255,255,0.7);" >
<div align="center">
<h1>정기권 예약이 완료 되었습니다.</h1> <br>
</div>
<div class="contents">
<h3>전화 번호 : <c:out value="${str_book_tel}" /></h3>
<h3>차량 번호 : <c:out value="${str_book_car_num}" /></h3>
<h3>차 종 : <c:out value="${str_book_car_kinds}" /></h3>
<h3>예약 위치 : <c:out value="${str_parking_location}" /></h3>
<h3>예약 좌석 : <c:out value="${str_parking_place}" /></h3>
<h3>예약 날짜 : <c:out value="${date_book_day}" /></h3>
<h3>예약 시간 : <c:out value="${date_book_start_time}" /></h3>
<br>

<div style="margin-left: 22%;">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Order_CardModal">결제창띄우기</button>
<button type="submit" class="btn btn-default" style="width: 25%;"><a href="mapmainForm.do">취소</a></button>
</div>   
</div>
</div>

<!--결제창 띄우기 -->

   <div class="modal fade" id="Order_CardModal" tabindex="-1" role="dialog" aria-hidden="false"  aria-labelledby="myModalLabel">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <div class="modal-content" style="margin-top:20%">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <h4 class="modal-title" align="center">주문서 작성</h4>
               </div>
            <div class="modal-body">
                  <form method="post" id="order_CardInfo">
                     <table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd;">
                        <thead>
                           <tr>
                              <th colspan="3" bgcolor="#006DCC"><h4 align="center">
                              <font color="white">결제하기</font></h4></th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td style="width:150px; font-size: 0.7em;">카드사 선택</td>
                              <td>
                                 <select class = "form-control" id="card_company" style="width:100px; font-size: 0.7em;">
                                    <option>농협</option>
                                    <option>신한</option>
                                    <option>국민</option>
                                    <option>우리</option>
                                    <option>하나</option>
                                 </select>
                              </td>
                           </tr>
                           <tr>
                              <td style="width:150px; font-size: 0.7em;">카드번호</td>
                              <td>
                              <input class="form-control" id="card1" type="text" size="4" maxlength="4" style="width:58px;"> &nbsp;-&nbsp;
                              <input class="form-control" id="card2" type="text" size="4" maxlength="4" style="width:58px;"> &nbsp;-&nbsp; 
                              <input class="form-control" id="card3" type="text" size="4" maxlength="4" style="width:58px;"> &nbsp;-&nbsp; 
                              <input class="form-control" id="card4" type="text" size="4" maxlength="4" style="width:58px;">
                              </td>
                           </tr>
                           <tr>
                              <td style="width:150px; font-size: 0.7em;">CVC 번호</td>
                              <td><input class="form-control" id="cvcNum" type="text" size="4" maxlength="3" style="width:55px;"></td>
                           </tr>
                           <tr>
                              <td style="width:200px; font-size: 0.7em;">유효기간</td>
                              <td style="font-size: 0.7em;">
                              <input class="form-control" id="Year" type="text" size="4" maxlength="4" style="width:55px;" placeholder="년">&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
                              <input class="form-control" id="Month" type="text" size="4" maxlength="2" style="width:55px;" placeholder="월"></td>
                           </tr>
                           <tr>
                              <td colspan="2">
                                 <input class="btn btn-primary" type="button" id="btn_cardClear" value="결제하기">
                                 <button class="btn btn-default" type="button" onclick="window.location.href='mapmainForm.do'" id="btn_cancel" data-dismiss="modal">결제취소</button>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>

</body>
</html>