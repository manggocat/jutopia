<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MypageForm/My_Modified.css" rel="stylesheet" type="text/css">
<title>주토피아 회원 탈퇴</title>

</head>
<body>

<div class="col-md-8 col-md-offset-3" style="margin-left: 20%;"> 
        <div class="well well-sm" >
          <form class="form-horizontal" action="MyModified.do" method="post">
          <fieldset>
            <legend class="text-center"><font size="6">회원 탈퇴</font></legend>
            
             <!-- ID-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="note_recipient"><font size="4">I D : </font></label>
              <div class="col-md-9">
                <input name="strUserId" type="hidden" class="form-control" value="${sessionScope.memID}">
                <font size="4"><c:out value="${sessionScope.memID}"/></font>
                </div>
            </div>
            
             <!-- 비밀번호 input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="note_sender"><font size="4">보내는 사람 : </font></label>
              <div class="col-md-5">
                <input name="strUserpwd" type="password" placeholder="비밀번호를 입력하시오." class="form-control" autofocus="autofocus">
              </div>
            </div>
            
             <!-- 비밀번호 input-->
            <div class="form-group">
              <label class="col-md-3 control-label" ><font size="4">탈퇴 사유 : </font></label>
              <div class="col-md-9">
               <select class="col-sm-6 control-label" name="Reason" style="font-size: 15px; font-family: inherit;">
               <option value="1">재 가입을 위해서</option>
					<option value="2">서비스가 불편하여</option>
					<option value="3">시스템 장애</option>
					<option value="4">이용서비스 부족</option>
				</select>
              </div>
            </div>
            
            <br><div class="form-group">
             <div class="span2" style="margin-left: 75%;"> 
            <button type="submit" class="btn btn-info btn-lg">삭제<span class="icon-cog icon-white"></span></button>
            </div>
            </div>

	</fieldset>
	</form>
	</div>
	</div>
	
</body>
</html>