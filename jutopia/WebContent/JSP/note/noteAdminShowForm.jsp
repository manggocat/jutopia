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

function modalReply(note_num) {
    // 답변하기 할때 해당 쪽지를 가져가기 위해
    $('#note_num').val(note_num);

    // 답변하기 위한 모달팝업창을 오픈한다.
    $('#modal_reply_post').modal();

}


function noteReplyPost(note_num) {
    $.post('noteReplyPro.do',
        {
            note_num: $('#note_num').val(),
            note_reply: $('#note_reply_contents').val(),
        },
        function (check) {
            // body 값으로 리턴값을 서버에서 보내올때 유용함.
            location.href="noteListAdmin.do";
        }
    );
    
}
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
          
                <button type="button" class="btn btn-primary" onclick="modalReply(${note_num})">답변하기</button> 
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:history.back()">닫기</button>
            </div>

            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
</div>

<!-- 답변 modal -->
<div class="modal fade" id="modal_reply_post" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="mymodalLabel">답변하기</h4>
            </div>
            <div class="modal-body">
                <textarea id="note_reply_contents" style="width:100%;" rows="10" autofocus></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="noteReplyPost()">답변하기</button>
               
            </div>
        </div>
    </div>
</div>

</body>
</html>