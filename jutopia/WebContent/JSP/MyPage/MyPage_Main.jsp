<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./CSS/MypageForm/Mypage.css" rel="stylesheet" type="text/css">

<title>주토피아 MyPage</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('#my_imformation').click(function() {
         $('#myPage_Menu').load("JSP/MyPage/My_Imformation.jsp");
      });
      $('#my_secession').click(function() {
         $('#myPage_Menu').load("JSP/MyPage/My_Modified.jsp");
      });
      $('#my_modified').click(function() {
         $('#myPage_Menu').load("JSP/MyPage/My_Secession.jsp");
      });

   });
</script>
</head>
<body>
<c:if test="${nCheck==1 }">
<script type="text/javascript">
alert("삭제 완료");
window.location.href="mapmainForm.do";
</script>
</c:if>
<c:if test="${nCheck==-1}">
<script type="text/javascript">
alert("비밀번호가 다릅니다");
</c:if>
</script>

<c:if test="${nUpdateCheck==1 }">
<script type="text/javascript">

window.location.href="MyPageUpdateFormAction.do";
</script>
</c:if>
<c:if test="${nUpdateCheck==-1}">
<script type="text/javascript">
alert("비밀번호가 다릅니다");
</script>

</c:if>
   <br>
   <br>
   <br>
   <center>
   <table align="center" cellpadding="20px" >
      <tr>
         <td class = "name">이 &nbsp;&nbsp;&nbsp;&nbsp;름
         </td>
         <td width="200px">${mypageVO.getStr_User_Name()}</td>
      </tr>
      
      <tr class = "height">
      </tr>
      
      <tr>
         <td class = "name" >전화번호</td>
         <td width="200px">${mypageVO.getStr_User_Tel()}</td>
      </tr>
      
      <tr class = "height">
      </tr>
      
      <tr>
         <td class = "name">E&nbsp;-&nbsp;mail</td>
         <td width="200px">${mypageVO.getStr_User_ID_Email()}</td>
      </tr>
   </table>
   

   <br>
      
      <center>
         <!-- <input type="button" class = "button" id="my_imformation" value="나의정보" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="button" class = "button active" id="my_secession" value="회원탈퇴" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="button" class = "button button-check"id="my_modified" value="회원수정" /> -->
         <button type = "button" id="my_imformation"><h3>나의 정보</h3></button>&nbsp;&nbsp;&nbsp;&nbsp;
         <button type = "button" id="my_secession"><h3>회원 탈퇴</h3></button>&nbsp;&nbsp;&nbsp;&nbsp;
         <button type = "button" id="my_modified"><h3>회원 수정</h3></button>
      </center>
      
   

   <div id="myPage_Menu"></div>
</center>
</body>
</html>