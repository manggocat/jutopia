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

<script type="text/javascript">


</script>

<style type="text/css">
body {
padding-top:20px;
margin-top: 5%;
}
</style>
</head>

<body>
<div class="container">
	<div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
          <form class="form-horizontal" action="" method="post">
          <fieldset>
            <legend class="text-center">Messege</legend>
            <input type="hidden" name="note_num" id="note_num" value="${note_num}" />
            
            <!-- 받는 사람 input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="name">받는 사람 : </label>
              <div class="col-md-9">
                <input id="note_recipient" name="note_recipient" type="text"  class="form-control" value="${note.note_sender}">
              </div>
            </div>
    
            <!-- 보내는 사람 input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="email">보내는 사람 : </label>
              <div class="col-md-9">
                <input id="note_sender" name="note_sender" type="text" class="form-control" value="${note.note_recipient}">
              </div>
            </div>
    
            <!-- Message body -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="message">내용 : </label>
              <div class="col-md-9">
                <textarea class="form-control" id="note_contents" name="note_contents" rows="5"><c:out value="${note.note_contents}"/></textarea>
              </div>
            </div>
    
            <!-- Form actions -->
            <div class="modal-footer"> 
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:history.back()">닫기</button>
            </div>

            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
</div>


</body>
</html>