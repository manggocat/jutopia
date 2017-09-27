<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <link href="./CSS/note/noteList.css" rel="stylesheet" type="text/css"> -->
<link href="./CSS/MainForm/MainForm2.css" rel="stylesheet" type="text/css">
<script>

    // 페이지 클릭시 호출
    function movePage(page_num) {
        var f = document.searchForm;
        f.page_num.value = page_num;
        f.submit();
    }

    // 삭제할때 호출
    function noteDelete(note_num) {
        if (!confirm("쪽지를 삭제할까요?")) return;

        // post 방식으로 삭제 호출 
        $.post('noteDelete.do', {note_num: note_num},
            function (check) {
                
                location.reload();
               
            }
        );
    }
</script>

<style type="text/css">


tr>th, td {
   text-align: center;
   vertical-align: middle;
}
</style>
</head>

<body>

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

                        <div style="position: relative;"><a href="mapmainForm.do">
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
 

<!-- 회원 리스트 함 -->
   <div class="container-fluid" style="margin-top: 2%;">
      <div class="row">
         <div class="col-lg-12">
            <form name="searchForm" id="searchForm">
               <input type="hidden" name="page_num" value="${page_num}" />
               <input type="hidden" name="note_num" id="note_num" value="${note_num}" />

               <div class="row" style="padding-bottom: 10px;">
                  <div class="col-md-8">
                     <!-- <a href="reservationForm.do" class="btn btn-primary">예약 페이지</a> -->
                     <a href="noteForm.do" class="btn btn-primary">쪽지보내기</a> <a
                        href="noteList.do" class="btn btn-primary">회원 페이지</a>

                  </div>
                  <div class="col-md-4 text-right">
                     <p style="padding: 10px;">
                             답변 쪽지수 : <span class="badge" style="background-color: #5cb85c;">${totalCount - unreadCount}</span> /
                                            미답변 쪽지수 : <span class="badge">${unreadCount}</span> /
                                            총 보낸쪽지수 : <span class="badge">${totalCount}</span>
                     </p>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <table class="table table-bordered table-responsive" style="table-layout:fixed">
                        <thead>
                           <tr>
                              <th>쪽지번호</th>
                              <th>보낸사람</th>
                              <th>받는사람</th>
                              <th width="32%">보낸내용</th>
                              <th>답변유무</th>
                              <th>보낸낸일시</th>
                              <th>답변일시</th>
                              <th>삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:choose>
                              <c:when test="${fn:length(noteList) > 0}">
                                 <c:forEach var="list" items="${noteList}" varStatus="status">
                                    <tr id="tr_${status.index}">
                                       <td>${list.note_num}</td>
                                       <td>${list.note_sender}</td>
                                       <td>${list.note_recipient}</td>
                                        <td class="text-left" style="text-overflow:ellipsis; overflow:hidden;">
                                        <a href="noteShowForm.do?note_num=${list.note_num}"> ${list.note_contents}</a></td>
                                       
                                       <td><c:choose>
                                             <c:when test="${fn:length(list.note_reply) > 0}">
                                                <span class="btn btn-success" data-toggle="collapse"
                                                   data-target="#collapse_${list.note_num}"
                                                   aria-expanded="false"
                                                   aria-controls="collapse_${list.note_num}">답변함</span>
                                             </c:when>
                                             <c:otherwise>
                                                <span class="btn btn-default">미답변</span>
                                             </c:otherwise>
                                          </c:choose>
                                       </td>
                                       <td>${list.note_send_time}</td>
                                       <td>${list.note_reply_time}</td>
                                       <td>
                                          <button type="button" onclick="noteDelete(${list.note_num})" class="btn btn-danger">삭제</button>
                                       </td>
                                    </tr>
                                    <c:if test="${fn:length(list.note_reply) > 0}">
                                       <tr id="tr_reply_${list.note_num}">
                                          <td colspan="8" style="padding: 0; word-break: break-all;"">
                                             <div class="collapse" id="collapse_${list.note_num}"
                                                style="margin: 10px;">
                                                <div class="well text-left"
                                                   style="margin: 0; display: flex; padding: 10px;">
                                                   ${list.note_reply}</div>
                                             </div>
                                          </td>
                                       </tr>
                                    </c:if>
                                 </c:forEach>
                              </c:when>
                              <c:otherwise>
                                 <tr>
                                    <td colspan="7">보낸 쪽지들이 없습니다.</td>
                                 </tr>
                              </c:otherwise>
                           </c:choose>
                        </tbody>
                     </table>
                  </div>
               </div>

            </form>
         </div>
      </div>
      <div class="row text-center">
         <div class="col-lg-12">${page}</div>
      </div>
   </div>

   <!-- 답변 Modal -->
   <div class="modal fade" id="modal_reply_detail" tabindex="-1"
      role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="myModalLabel">답변내용</h4>
            </div>
            <div class="modal-body">...</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>

</body>
</html>