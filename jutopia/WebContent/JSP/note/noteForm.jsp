<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./CSS/note/noteForm.css">

</head>

<body>
<div class="container">
	<div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
          <form class="form-horizontal" action="notePro.do" method="post">
          <fieldset>
            <legend class="text-center">Messege</legend>
    
            <!-- Name input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="note_recipient">관리자 :</label>
              <div class="col-md-9">
                <input id="note_recipient" name="note_recipient" type="text" placeholder="Your name" class="form-control" value="jutopia@gmail.com" readonly>
              </div>
            </div>
    
            <!-- Email input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="note_sender">보내는 사람 :</label>
              <div class="col-md-9">
               <c:if test="${note.note_sender!=null}"> 
                <input id="note_sender" name="note_sender" type="text" placeholder="Your email" class="form-control" value="${note.note_sender}">
                 </c:if> 
                 <c:if test="${note.note_sender==null}">
                <input id="note_sender" name="note_sender" type="text" placeholder="Your email" class="form-control" value="${sessionScope.memID}">
                </c:if> 
                
                <c:if test=""></c:if>
              </div>
            </div>
    
            <!-- Message body -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="note_contents">내용 :</label>
              <div class="col-md-9">
                <textarea class="form-control" id="note_contents" name="note_contents" placeholder="Please enter your message here..." rows="5">${note.note_contents}</textarea>
              </div>
            </div>
    
            <!-- Form actions -->
            <div class="form-group">
              <div class="col-md-12 text-right">
                <button type="submit" class="btn btn-primary btn-lg">보내기</button>
              </div>
            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      
     
     <!--  <a href="noteList.do" class="btn btn-primary" >회원 페이지</a>
      <a href="noteListAdmin.do" class="btn btn-primary" >관리자 페이지</a> -->
    </div>
  </div>
</div>
</body>
</html>