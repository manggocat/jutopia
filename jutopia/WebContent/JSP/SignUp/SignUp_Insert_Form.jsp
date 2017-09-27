<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../view/color.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="util.TempKey" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주토피아 회원가입</title>
<link href="./CSS/SignUp/insert.css" rel="stylesheet" type="text/css">

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<link href="./CSS/Login/insert.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="./resource/alertify.core.css" />
<link rel="stylesheet" href="./resource/alertify.default.css" id="toggleCSS" />
<script src="resource/alertify.min.js"></script>
<script>
$(document).ready(function(){
    
    $("alert").on( 'click', function () {
     alertify.alert("");
     return false;
    });
});
 
 
</script>
<script type="text/javascript">

   function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
	 
        var userinfo = eval("document.userinfo");
   
   		
		// 패스워드
           var passwd_filter = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;

	
		// 휴대 전화
		var phone_fileter = /^01([0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		
        
        if(!userinfo.sign_up_name.value) { //이름
        	alertify.alert("사용자 이름을 입력하세요");
            userinfo.sign_up_name.focus();
            return false;
        }

        if(!userinfo.text_mail_1.value) { //이메일 아이디
        	alertify.alert("이메일 아이디를 입력하세요");
            userinfo.text_mail_1.focus();
            return false; //사용자가 서비스를 요청한 시점으로 돌아감
        }
        
        if(!userinfo.text_mail_2.value) { //이메일 주소
        	alertify.alert("이메일 주소를 입력하세요");
            userinfo.text_mail_2.focus();
            return false; //사용자가 서비스를 요청한 시점으로 돌아감
        }
        
		if($('#emailYn').val() == 'N') { // 인증번호
			alertify.alert("이메일 인증을 해주세요");
            userinfo.user_number.focus();
		
             return false;
         }
        
        if(!userinfo.user_number.value) { // 인증번호
        	alertify.alert("인증번호를 확인하세요");
            return false;
        }
   
        if(!userinfo.sign_up_pwd.value) { //비밀번호1
        	alertify.alert("비밀번호 입력하세요");
            userinfo.sign_up_pwd.focus();
            return false;
        }
 		
		if (!userinfo.sign_up_pwd2.value ) { //비밀번호2
			alertify.alert("비밀번호 확인을 입력하세요");
            userinfo.sign_up_pwd2.focus();
            return false;
        }
        
		if (userinfo.sign_up_pwd.value != userinfo.sign_up_pwd2.value)
        {  //비밀번호와 비밀번호 확인이 같지 않으면 수행
			alertify.alert("암호를 동일하게 입력하세요");
            return false;
        }
		
		if (!passwd_filter.test(sign_up_pwd.value) ) {
			alertify.alert("비밀번호 양식을 지켜서 입력해 주세요");
        	return false;
        }
        
	 	if (!userinfo.sign_up_tel.value) { //핸드폰
	 		alertify.alert("핸드폰 번호를 입력하세요");
            userinfo.sign_up_tel.focus();
            return false;
        }
        
		if (!phone_fileter.test(sign_up_tel.value) ) {
			alertify.alert("양식을 지켜서 입력해 주세요.");
	    	return false;
    	} 
         
		window.open("JSP/SignUp/SignUp_Insert_Popup.jsp?", "회원가입 완료", 
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
            alertify.alert("이메일 아이디와 주소를 입력하세요");
            return;
            
        } else if ( !email_filter.test(text_mail_3) ) {
        	alertify.alert("이메일 형식이 아닙니다. 다시 입력하세요.");
    		
    		return;
    	} 
		
		
        //url과 사용자 입력 이메일을 조회합니다.
        /* url = "Sign_Up_confirmId.jsp?email1=" + userinfo.text_mail_1.value+"@"+userinfo.text_mail_2.value ; */
        url = "SignUpconfirmIdAction.do?email1=" + userinfo.text_mail_1.value + "&email2=" + userinfo.text_mail_2.value ;
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
 
   var code = "${key}";
// 이메일인증보내기 버튼
   function sendEmailAuth(){
      
       var email = $('#text_mail_1').val() +"@"+ $('#text_mail_2').val();
       
      
       $.get(
            'EmailAuthAction.do?email='+email+'&code='+code,
            function(data){
               
               data.result;
               
               
         
            });
      
       alertify.alert("이메일 인증을 보냈습니다");
      
   }
   
   // 인증확인버튼
   function confirmEmailAuth(){
      
      var confirmCode =  $('#user_number').val();
      
      if (code != confirmCode) {
    	  alertify.alert("이메일 인증이 잘못되었습니다.");
         return false;
      } else {
         $('#emailYn').val('Y');
         alertify.alert("이메일 인증 되었습니다.");
         return false;
      }
      
   }
   
   
   
    function confirmSignUp(){
      
      var emailYn = $('#emailYn').val();
      
      if (emailYn == 'N') {
    	  alertify.alert("이메일 인증이 잘못되었습니다. 인증받으세요.");
         return;
      } 
      
      alertify.alert("가입되었습니다.");
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
<body background="./images/Sign_up/jutopiabackimage.jpg">



<form method="post" action="SignUp_InsertPro.do" name="userinfo" onSubmit="return checkIt()" >
<div id="insertinfo">
		<font size="6" color="white"><b>회원가입</b></font>
	</div>
	<hr>
	<center>
		<!-- <div class="navi"> -->
		<br>
		<form method="post" action="Sign_Up_Insert_Pro.do" name="userinfo"
			onSubmit="return checkIt()">

			<table class="insert_form" frame="hsides" border="1" cellspacing="2"
				cellpadding="10" width="650px">
				<!-- <tr>
		<td colspan="2" align="center"><b><font size="5">회원가입</font></b></td>
	</tr> -->

				<tr>
					<td width="80"><font color="white"><b>이름</b> : </font></td>
					<td><input class="textname" type="text"
						placeholder="이름을  입력해 주세요" size="18" name="sign_up_name"
						id="sign_up_name" autofocus></td>
				<tr>
				<tr>
					<div name="SIGN_UP_ID_EMAIL">
						<td width="120"><font color="white"><b>이메일</b> : </font></td> <input
							type="hidden" name="emailYn" id="emailYn" value="N">

						<td><input type="text" size="10" name="text_mail_1"
							id="text_mail_1" placeholder="이메일 아이디"><font
							color="white"> @ </font> <select
							style="font-size: 12px; font-face: 돋움;" id="select_email">
								<option value="">직접 입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
						</select> <input type="text" name="text_mail_2" size="10" id="text_mail_2"
							placeholder="이메일 주소">
						<p />

							<button type="submit" class="btn btn-primary" style="width: 25%;"
								name="email_check" OnClick="openConfirmid(this.form)">이메일
								확인</button> &nbsp;
							<button type="submit" class="btn btn-primary" style="width: 25%;"
								name="sign_up_num_check1" onclick="sendEmailAuth()">인증번호
								전송</button></td>
						<tr>
						<tr>
							<td><font color="white"><b>인증번호 확인</b> : </font></td>
							<td><input type="text" class="textcheck" size="18"
								name="user_number" id="user_number">


								<button type="button" class="btn btn-primary"
									style="width: 25%;" name="sign_up_num_check2"
									onclick="confirmEmailAuth()">인증번호 확인</button>
						<tr>
						<tr>
							<td><font color="white"><b>비밀번호</b> : </font></td>
							<td><input type="password" class="textpass1" size="18"
								name="sign_up_pwd" id="sign_up_pwd" maxlength="20"
								placeholder="영어, 숫자, 특수문자를 최소 한 개 이상 입력"><br> <font
								color="red" style="font-size: 13px; font-face: 맑은 고딕;">
									최소 8 글자 최대 20 글자 내로 입력해 주세요</font></td>
						<tr>
						<tr>
							<td><font color="white"><b>비밀번호 확인</b> : </font></td>
							<td><input type="password" size="18" class="textpass2"
								name="sign_up_pwd2" id="sign_up_pwd2" maxlength="20"></td>
						<tr>
						<tr>
							<td><font color="white"><b>휴대폰 번호</b> : </font></td>
							<td><input type="text" size="18" class="textphone"
								name="sign_up_tel" id="sign_up_tel" maxlength="20"
								placeholder="'-' 없이 입력하세요"></td>
						<tr>
						<tr>
							<td><font color="white"><b>감면 자격</b> : </font></td>
							<td><select style="font-size: 12px; font-face: 돋움;"
								id="sign_up_Reduction" name="sign_up_Reduction">
									<option value="해당없음">해당없음</option>
									<option value="요일제">요일제</option>
									<option value="경차">경차</option>
									<option value="경차(저공해)환승">경차(저공해)환승</option>
									<option value="장애인.국가유공자이자,고엽제후유">장애인.국가유공자이자,고엽제후유</option>
									<option value="5.18">5.18</option>
									<option value="다둥이행복카드소지자(2자녀)">다둥이행복카드소지자(2자녀)</option>
									<option value="다둥이행복카드소지자(3자녀이상)">다둥이행복카드소지자(3자녀이상)</option>
									<option value="환승할인">환승할인</option>
							</select></td>
						</tr>
			</table>



			<p />
				<br>

				<button type="submit" class="btn btn-primary" style="width: 10%;"
					id="join_go" name="join_go">가입하기</button>
				&nbsp;
				
				<button type="button" onclick="window.location.href='mapmainForm.do'" class="btn btn-default" data-dismiss="modal"
					style="width:10%;" id="noAgree">메인으로</button>

</form>
</body>
</html>