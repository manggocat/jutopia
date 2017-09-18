<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../view/color.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="util.TempKey" %>

<%
// 인증코드를 생성한다.
String key = new TempKey().getKey(6, false); 
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 회원가입</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>


<script type="text/javascript">

   function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
	 
        var userinfo = eval("document.userinfo");
   
   		
		// 패스워드
      	//var passwd_filter = /^((?=.*[0-9]).{1,}(?=.*[~!@#$%^&*()-_]).{1,}(?=.*[a-zA-Z]).{1,}).{3,20}$/;
        var passwd_filter= /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?])*.{8,}$/;
		//var passwd_filter =/^(?=.*[a-zA-Z])(?=.*[!@#$%^~*&+=-])(?=.*[0.9]).{3,20}$/;
		//var passwd_filter = /^.*(?=.{8,17})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
        //var passwd_filter = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		//var passwd_filter =  /^[0-9]$/;
		// 휴대 전화
		var phone_fileter = /^01([0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		//var phone_fileter = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{10,11})$/;
        
        if(!userinfo.sign_up_name.value) { //이름
            alert("사용자 이름을 입력하세요");
            userinfo.sign_up_name.focus();
            return false;
        }

        if(!userinfo.text_mail_1.value) { //이메일 아이디
            alert("이메일 아이디를 입력하세요");
            userinfo.text_mail_1.focus();
            return false; //사용자가 서비스를 요청한 시점으로 돌아감
        }
        
        if(!userinfo.text_mail_2.value) { //이메일 주소
            alert("이메일 주소를 입력하세요");
            userinfo.text_mail_2.focus();
            return false; //사용자가 서비스를 요청한 시점으로 돌아감
        }
        
		if($('#emailYn').val() == 'N') { // 인증번호
            userinfo.user_number.focus();
             return false;
         }
        
        if(!userinfo.user_number.value) { // 인증번호
            alert("인증번호를 확인하세요");
            return false;
        }
   
        if(!userinfo.sign_up_pwd.value) { //비밀번호1
            alert("비밀번호 입력하세요");
            userinfo.sign_up_pwd.focus();
            return false;
        }
 		
		if (!userinfo.sign_up_pwd2.value ) { //비밀번호2
            alert("비밀번호 확인을 입력하세요");
            userinfo.sign_up_pwd2.focus();
            return false;
        }
        
		if (userinfo.sign_up_pwd.value != userinfo.sign_up_pwd2.value)
        {  //비밀번호와 비밀번호 확인이 같지 않으면 수행
            alert("암호를 동일하게 입력하세요");
            return false;
        }
		
		if (!passwd_filter.test(sign_up_pwd.value) ) {
        	alert("비밀번호 양식을 지켜서 입력해 주세요");
        	return false;
        }
        
	 	if (!userinfo.sign_up_tel.value) { //핸드폰
            alert("핸드폰 번호를 입력하세요");
            userinfo.sign_up_tel.focus();
            return false;
        }
        
		if (!phone_fileter.test(sign_up_tel.value) ) {
	    	alert("양식을 지켜서 입력해 주세요.");
	    	return false;
    	} 
         
		window.open("JSP/SignUp/Sign_Up_Insert_Popup.jsp?", "회원가입 완료", 
			"width=400, height=300, left=100, top=50");
		
   }

	 // 아이디 중복 여부 판단 함수
    function openConfirmid(userinfo) {
			
		var text_mail_1 = $("#text_mail_1").val();
		var text_mail_2 = $("#text_mail_2").val();
		
		var text_mail_3 = text_mail_1 + "@" + text_mail_2;
		
		var email_filter = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
		
		
		if (!userinfo.text_mail_1.value || !userinfo.text_mail_2.value) { 
        	//아이디를 입력했는지 검사
            alert("이메일 아이디와 주소를 입력하세요");
            return;
            
        } else if ( !email_filter.test(text_mail_3) ) {
    		alert("이메일 형식이 아닙니다. 다시 입력하세요.");
    		
    		return;
    	} 
		
		
        //url과 사용자 입력 이메일을 조회합니다.
        /* url = "Sign_Up_confirmId.jsp?email1=" + userinfo.text_mail_1.value+"@"+userinfo.text_mail_2.value ; */
        url = "JSP/SignUp/SignUp_confirmId.jsp?email1=" + userinfo.text_mail_1.value + "&email2=" + userinfo.text_mail_2.value ;
        //onclick="javascript:window.location='main.jsp'"
        //새로운 윈도우를 연다.
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");

}
</script>
    
<script type="text/javascript">
    
 // 이메일 카피
   $(function() {
    $('#select_email').change(function(){
		var selectedValue = $('#select_email option:selected').text();
		if(selectedValue=="직접 입력"){
			$('#text_mail_2').val("");
		} else {
			$('#text_mail_2').val(selectedValue);
		}
    });
});
 
//이메일 인증
   var code = "<%= key %>";
   
// 이메일인증보내기 버튼
   function sendEmailAuth(){
      
       var email = $('#text_mail_1').val() +"@"+ $('#text_mail_2').val();
       
      
       $.get(
            'JSP/Email/emailAuth.jsp?email='+email+'&code='+code,
            function(data){
               
               data.result;
               
               alert("이메일 인증을 보냈습니다");
         
            });
      
       
       alert("이메일 인증을 보냈습니다");
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
   }   

</script>


<style>
.navi {
			
			background : #EAEAEA;
/* 			margin-top: 100px;
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
<form method="get" action="SignUp_InsertPro.do" name="userinfo" onSubmit="return checkIt()" >
<table class="insert_form" border="1" cellspacing="0" cellpadding="3" width="700">
	<tr>
	<td colspan="2" align="center">
	<b><font size="5">회원가입</font></b></td>
	</tr>
	
	<tr>
		<td><b>이름</b> : </td>
		<td><input type="text" size="10" name="sign_up_name" id="sign_up_name" autofocus></td>
	</tr>

	<tr>
		<div name="SIGN_UP_ID_EMAIL">
		<td width="40"><b>이메일</b> : </td>
		
		<input type="hidden" name="emailYn" id="emailYn" value="N">
		
		<td width="240"><input type="text" size="10" name="text_mail_1" id="text_mail_1"> @ 
				<select id="select_email" style="font-size:12px; font-face:돋움;">
				<option value="">직접 입력</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="dreamwiz.com">dreamwiz.com</option>
				</select>
				<input type="text" name="text_mail_2" size="10" id="text_mail_2" >
		</div>		
	<input type="button" value="이메일 확인" name="email_check" OnClick="openConfirmid(this.form)"
	style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
	<input type="button" name="sign_up_num_check1" value="인증번호 전송" onclick="sendEmailAuth()"
	text-align="center" style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" /></td>
	</tr>

	<tr>
		<td><b>인증번호 확인</b> : </td>
		<td>
		<input type="text" size="10" name="user_number" id="user_number">
		<input type="button" name="sign_up_num_check2" value="인증번호 확인" onclick="confirmEmailAuth()"
		 style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
		</td>
	</tr>
	
	<tr>
		<td><b>비밀번호</b> : </td>
		<td><input type="password" size="8" name="sign_up_pwd" id="sign_up_pwd" maxlength="20" ><font style="font-size:10px; font-face:맑은 고딕;"> 영어, 숫자, 특수문자 최소 한 개 이상 입력해 주세요.</font></td>
	</tr>
	<tr>
		<td><b>비밀번호 확인</b> : </td>
		<td><input type="password" size="8" name="sign_up_pwd2" id="sign_up_pwd2" maxlength="20"></td>
	</tr>
	<tr>
		<td><b>휴대폰 번호</b> : </td>
		<td>
		<input type="text" size="11" name="sign_up_tel" id="sign_up_tel" maxlength="11" placeholder="'-' 없이 입력하세요">
		</td>
	</tr>
	<tr>
		<td><b>감면 자격</b> : </td>
		<td>
			<select id="sign_up_Reduction" name="sign_up_Reduction"  style="font-size:12px; font-face:돋움;">
			<option value="해당없음">해당없음</option>
			<option value="요일제" >요일제</option>
			<option value="경차" >경차</option>
			<option value="경차(저공해)환승" >경차(저공해)환승</option>
			<option value="장애인.국가유공자이자,고엽제후유" >장애인.국가유공자이자,고엽제후유</option>
			<option value="5.18">5.18</option>
			<option value="다둥이행복카드소지자(2자녀)">다둥이행복카드소지자(2자녀)</option>
			<option value="다둥이행복카드소지자(3자녀이상)">다둥이행복카드소지자(3자녀이상)</option>
			<option value="환승할인">환승할인</option>
			</select><p/>
			<font color="red">※ 경차(저공해)환승 차량은 감면자격에서 '경차(저공해)환승' 할인을 선택해 주세요.</font>
		</td>
	</tr>

</table>

<p/><br>
<input type="submit" id="join_go" name="join_go" value="가입하기" 
style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" />
<a href="Main_Test.do">
<input type="button" value="메인으로" 
style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" /></a>

</nav>
</center>
</form>
</body>
</html>