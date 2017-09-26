<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../view/color.jsp"%>
<%@ page import="jutopia.SignUp.*" %>
<title>이메일 중복 확인</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<link href="../view/mystyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
#email1 {
   width: 20%;
    padding: 5px 8px;
    margin: 5px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
   border-radius: 15px;
}

#email2 {
   width: 30%;
    padding: 5px 8px;
    margin: 5px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
   border-radius: 15px;
}

#select_email  {
  width: 130px;
  padding: 5px;
  border: 1px solid #c3c3c3;
  border-radius: 15px;

}
</style>
<script type="text/javascript">
    
 // 이메일 카피
   $(function() {
    $('#select_email').change(function(){
      var selectedValue = $('#select_email option:selected').text();
      if(selectedValue=="직접 입력"){
         $('#email2').val("");
      } else {
         $('#email2').val(selectedValue);
      }
    });
});
</script>
<script type="text/javascript">
function onsend() {
	
	document.getElementById('checkForm').submit();
}

</script>
</head>
<body>

<c:if test="${ check == 1 }">

<form action="SignUpconfirmIdAction.do" method="post" name="checkForm" id="checkForm">

<div module="member_checkId">
    <!--@css(/css/module/member/checkid.css)-->
    <!-- <h3>아이디 중복확인</h3> -->
    <div class="content">
        <fieldset>
            <legend>아이디 중복확인</legend>
            <p><font style="font-size:13px;">입력하신 <font color="red" size="4"><strong> ${ total_mail }</strong></font> 는(은) 이미 사용 중인 이메일입니다.</font></p>
            <hr>
            <p><font style="font-size:13px;">아이디는 영문과 숫자로만 입력해 주세요.</font></p>
            <input type="text" size="10" maxlength="14" name="email1" id="email1"> @ 
      <select id="select_email" style="font-size:12px; font-face:돋움;">
            <option value="">직접 입력</option>
            <option value="gmail.com">gmail.com</option>
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="dreamwiz.com">dreamwiz.com</option>
            </select>
            <input type="text" name="email2" size="10" id="email2" ><p/>
            
       <font style="font-size:13px; font-color:gray;"> // 공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</font>
            <p/>
            
            <a href="#none" onclick="onsend()"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_check2.gif" alt="중복확인" /></a>
        	
        </fieldset>
    </div>

    <div class="close"><a href="#none" onclick="{$close_layer}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기" /></a></div>
</div>


</form>

<br>
</c:if>
<c:if test="${ check != 1 }">

<div module="member_checkId2">
    <!--@css(/css/module/member/checkid.css)-->
    <!-- <h3>아이디 중복확인</h3> -->
    <div class="content">
        <fieldset>
            <legend>아이디 중복확인</legend>
            <p><font style="font-size:13px;">입력하신 아이디${total_mail}는 사용 가능합니다.</font></p>
            <a href="#none" onclick="setemail()"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_use2.gif" alt="사용하기" /></a>
        
        
        </fieldset>
    </div>
  

</div>

</c:if>
</body>
</html>

<script language="javascript">

   function setemail(){
   opener.document.userinfo.text_mail_1.value="${email1}";
    opener.document.userinfo.text_mail_2.value="${email2}";
    opener.document.userinfo.select_email.value="${email2}";
   self.close();
   }
 
</script>