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
<style type="text/css">
body {
margin-top: 5%;
}

div.contents {
margin-left: 40%;
}
</style>
</head>
<body>
<div align="center">
<h1>정기권 예약이 완료 되었습니다.</h1> <br>
</div>
<div class="contents">
<h3>이름 : ${str_season_ticket_name}</h3>
<h3>전화번호 : ${str_season_ticket_tel}</h3>
<h3>차량번호 : <c:out value="${str_season_ticket_car_num}" /></h3>
<h3>차 종 : <c:out value="${str_season_ticket_car_kinds}" /></h3>
<h3>예약 주차장 : <c:out value="${str_season_ticket_parking_lot}" /></h3>
<h3>예약 좌석 : <c:out value="${str_season_ticket_position}" /></h3>
<h3>예약 월 : <c:out value="${n_season_ticket_start_date}" /></h3>
<h3>감면자격 : <c:out value="${str_season_ticket_reduction}" /></h3>
</div>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Order_CardModal">결제창띄우기</button>
   
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
                                 <button class="btn btn-default" type="button" id="btn_cancel" data-dismiss="modal">결제취소</button>
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