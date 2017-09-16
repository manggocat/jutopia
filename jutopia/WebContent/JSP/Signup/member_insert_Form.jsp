<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jutopia.email.TempKey" %>

<%
// 인증코드를 생성한다.
String key = new TempKey().getKey(6, false); 
%>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 회원가입</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script language="JavaScript">

   function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
        var userinfo = eval("document.userinfo");
        if(!userinfo.user_name.value) { //이름
            alert("사용자 이름을 입력하세요");
            userinfo.user_name.focus();
            return false;
        }
        
        else if(!userinfo.text_mail_1.value ) { //이메일 아이디
            alert("이메일 아이디를 입력하세요");
            userinfo.text_mail_1.focus();
            return false; //사용자가 서비스를 요청한 시점으로 돌아감
        }
        
        else if(!userinfo.text_mail_2.value ) { //이메일 주소
            alert("이메일 주소를 입력하세요");
            userinfo.text_mail_2.focus();
            return false; //사용자가 서비스를 요청한 시점으로 돌아감
        }
        
        else if($('#emailYn').val() == 'N') { // 인증번호
           userinfo.user_number.focus();
            return false;
        }
   
       else if(!userinfo.user_pwd.value ) { //비밀번호1
            alert("비밀번호 입력하세요");
            userinfo.user_pwd.focus();
            return false;
        }
        
        else if(!userinfo.user_pwd2.value ) { //비밀번호2
            alert("비밀번호 확인을 입력하세요");
            userinfo.user_pwd2.focus();
            return false;
        }
        
        else if(userinfo.user_pwd.value != userinfo.user_pwd2.value)
        {  //비밀번호와 비밀번호 확인이 같지 않으면 수행
            alert("암호를 동일하게 입력하세요");
            return false;
        }
        
        else if(!userinfo.user_hp1.value) { //핸드폰1
            alert("핸드폰 번호를 입력하세요");
            userinfo.user_name.focus();
            return false;
        }
        
        else if(!userinfo.user_hp2.value) { //핸드폰2
            alert("핸드폰 번호를 입력하세요");
            userinfo.user_name.focus();
            return false;
        }
        
        else if(!userinfo.user_hp3.value) { //핸드폰3
            alert("핸드폰 번호를 입력하세요");
            userinfo.user_name.focus();
            return false;
        }

      else {
         window.open("../jsp/member_joinPopup.jsp", "회원가입 완료",
               "width=400, height=300, left=100, top=50");
         

      }
   }

   // 아이디 중복 여부 판단 함수
   /* function open#######Confirmid(userinfo) {
       if (!userinfo.id.value) {  //아이디를 입력했는지 검사
           alert("아이디 넣으세요");
           return;
       }
       //url과 사용자 입력 id를 조회합니다.
       url = "confirmId.jsp?id=" + userinfo.id.value ;
       
       //새로운 윈도우를 연다.
       open(url, "confirm", 
       "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   } */
//-->
</script>

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
   
  //이메일 인증
   var code = "<%= key%>";
   
   
   // 이메일인증보내기 버튼
   function sendEmailAuth(){
      
       var email = $('#text_mail_1').val() +"@"+ $('#text_mail_2').val();
       
      
       $.get(
            '/jutopia/JSP/Signup/emailAuth.jsp?email='+email+'&code='+code,
            function(data){
               
               data.result;
               
               alert("이메일 인증을 보냈습니다");
         
            });
      
       
      /*  alert("이메일 인증을 보냈습니다"); */
   }
   
   // 인증확인버튼
   function confirmEmailAuth(){
      
      var confirmCode =  $('#user_number').val();
      
      if (code != confirmCode) {
         alert("이메일 인증이 잘못되었습니다.");
         return false;
      } else {
         $('#emailYn').val('Y');
         alert("이메일 인증 되었습니다.");
         return false;
      }
      
   }
   
   
   
    function confirmSignUp(){
      
      var emailYn = $('#emailYn').val();
      
      if (emailYn == 'N') {
         alert("이메일 인증이 잘못되었습니다. 인증받으세요.");
         return;
      } 
      
      alert("가입되었습니다.");
      document.userinfo.submit();
   }   
   
</script>

<style>
.navi {
         
         background : #EAEAEA;
/*          margin-top: 100px;
         margin-left: 100px; */
         width: 720px;
         height: 350px;
         font-face: 맑은 고딕;
         font-size: 12px;
      }

.insert_form {
   border-collapse:collapse;
   border:1px gray solid;
}

</style>
</head>
<body>
<center>
<nav class="navi">
<br>
<form method="post" action="signupPro.do" name="userinfo" id="userinfo" onsubmit="checkIt();return false;">
<table class="insert_form" border="1" cellspacing="0" cellpadding="3" width="700">
   <tr>
   <td colspan="2" align="center">
   <b><font size="5">회원가입</font></b></td>
   </tr>
   
   <tr>
      <td><b>이름</b> : </td>
      <td><input type="text" size="10" name="user_name" autofocus></td>
   </tr>

   <tr>
      <td width="40"><b>이메일</b> : </td>
      
      <input type="hidden" name="emailYn" id="emailYn" value="N">
      
      <td width="240"><input type="text" size="10" name="text_mail_1" id="text_mail_1"> @ 
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
            <input type="text" name="text_mail_2" size="10" id="text_mail_2" >
   
   <input type="button" size value="중복 확인" name="email_check"   
   style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
   
   <input type="button" name="user_num_check1" id="user_num_check1" value="인증번호 전송" onclick="sendEmailAuth()"
   text-align="center" style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
   </tr>
   
   <tr>
      <td><b>인증번호 확인</b> : </td>
      <td>
      <input type="text" size="10" name="user_number" id="user_number">
      <input type="button" name="user_num_check2" value="인증번호 확인" onclick="confirmEmailAuth()"
       style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
      </td>
   </tr>
   
   <tr>
      <td><b>비밀번호</b> : </td>
      <td><input type="password" size="10" name="user_pwd" maxlength="12"></td>
   </tr>
   <tr>
      <td><b>비밀번호 확인</b> : </td>
      <td><input type="password" size="10" name="user_pwd2" maxlength="12"></td>
   </tr>
   <tr>
      <td><b>휴대폰 번호</b> : </td>
      <td>
      <input type="text" size="4" name="user_hp1" maxlength="3"> - 
      <input type="text" size="5" name="user_hp2" maxlength="4"> - 
      <input type="text" size="5" name="user_hp3" maxlength="11">
      </td>
   </tr>

</table>

<p/>
<input type="submit" id="join_go" name="join_go" value="가입하기" onclick="confirmSignUp()"
style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
<input type="button" value="메인으로" 
style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" /></a>

</nav>
</center>
</form>
</body>
</html>