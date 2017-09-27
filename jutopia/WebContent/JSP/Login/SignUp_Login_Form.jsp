<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 로그인</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
   integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
   crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
   $(function() {
      // 이메일 카피
      $('#select_email').change(function() {
         var selectedValue = $('#select_email option:selected').text();
         if (selectedValue == "직접 입력") {
            $('#text_mail_2').val("");
         } else {
            $('#text_mail_2').val(selectedValue);
         }

         $('#text_mail_2').focus();

      });
   });

   // 비밀번호 찾기 팝업
   function passwdshowPopup() {
      window.open("../../JSP/Password/SignUp_PasswdFind_Form.jsp", "비밀번호 찾기",
            "width=700, height=500, left=100, top=50");
   }

   function focusIt() {
      document.inform.text_mail_1.focus();
   }

   function setclose() {
	   self.close()
	
}
   function checkIt() {
      //var inputForm = eval("document.inputForm");
      inputForm = eval("document.inForm");
      if (!inputForm.text_mail_1.value) {
         alert("이메일 아이디를 입력해 주세요.");
         inputForm.text_mail_1.focus();
         return false;
      }

      if (!inputForm.text_mail_2.value) {
         alert("이메일 주소를 입력해 주세요.");
         inputForm.text_mail_2.focus();
         return false;
      }

      if (!inputForm.login_pwd.value) {
         alert("비밀번호를 입력해 주세요.");
         inputForm.login_pwd.focus();
         return false;
      }

   }
</script>
<link href="./CSS/Login/login.css" rel="stylesheet" type="text/css">
<style>
.navi {
   background: #EAEAEA;
   /*    margin-top: 100px;
   margin-left: 100px; */
   width: 400px;
   height: 150px;
   font-face: 맑은 고딕;
   font-size: 12px;
}

.login_form {
   border-collapse: collapse;
   border: 1px gray solid;
}

.navi ul li {
   list-style: none;
   display: inline;
}

.form-control {
   width: 80%;
   height: 40px;
}
</style>
</head>

<body>
   <c:if test="${ check == 1 }">
      <script>
         window.opener.location.href = "mapmainForm.do"; // 부모창을 변경해라.
         window.close();
      </script>
   </c:if>
   <c:if test="${ check == 0 }">
      <script type="text/javascript">
         alert("비밀번호가 틀렸습니다");
      </script>
   </c:if>
   <c:if test="${ check == -1 }">
      <script type="text/javascript">
         alert("아이디가 없습니다");
      </script>
   </c:if>



   <form name="inForm" method="post" action="SignUp_LoginPro.do"
      onSubmit="return checkIt();">

      <div id="logindiv">

         <!-- <form class="modal-content animate" action="/action_page.php"> -->
         <div class="container">

            <left> &nbsp;&nbsp;<label style="position: absolute;"><font
               size="3" face="맑은 고딕"><b>이메일 (Email) :</b></font></label> <a
               href="FindpwdFormAction.do" style="margin-left: 200px;"> <font
               size="2" face="맑은 고딕">비밀번호 찾기</font></a>

            <div class="form-group">
               <div class="col-sm-3">
                  <br> <input type="text" placeholder="Enter Email"
                     class="form-control" name="email" required autofocus>
               </div>
            </div>


            &nbsp;&nbsp;<label style="margin-right: 200px;"><font
               size="3" face="맑은 고딕"><b>비밀번호 (Password) :</b></font></label> <!-- <input type="password" class="pass" placeholder="Enter Password" name="login_pwd" required> -->

            <div class="form-group">
               <div class="col-sm-3">
                  <input type="password" placeholder="Enter Password"
                     class="form-control" name="login_pwd" required>
               </div>
            </div>

            <!-- 버튼 부분 -->
            <div class="form-group">
               <div class="col-md-8 text-right">
                  
                  <button type="submit" class="btn btn-primary btn-lg"
                      style="width: 20%;">Login</button> &nbsp;
                      <button type="button" class="btn btn-default btn-lg"
                      onclick="setclose()"
                     style="width: 20%;">Cancel</button>
                     
                  &nbsp;


               </div>
            </div>
         </div>

      </div>
   </form>




</body>
</html>

<!-- <script type="text/javascript">
   function setMain() {
      var main =  window.open("Main_Te2t.do");
      main.document.write("<center><pre>주토피아 홈페이지에 접속하신 걸 환영합니다. <br><br> 즐거운 시간 보내시길 바랍니다.</pre></center>");
}

</script> -->