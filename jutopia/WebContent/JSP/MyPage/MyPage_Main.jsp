<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="./CSS/MypageForm/Mypage.css" rel="stylesheet" type="text/css"> -->

<title>주토피아 MyPage</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet" type="text/css">
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
<!-- <link href="./CSS/MypageForm/MyPage_Main.css" rel="stylesheet" type="text/css"> -->
<script type="text/javascript">
    $(document).ready(function() {
      $('#my_imformation').click(function() {
         $('#myPage_Menu').load("MyPageImformationAction.do");
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
alertify.alert("삭제 완료");
window.location.href="mapmainForm.do";
</script>
</c:if>

<c:if test="${nCheck==-1}">
<script type="text/javascript">
alertify.alert("비밀번호가 다릅니다");
</c:if>
</script>

<c:if test="${nUpdateCheck==1 }">
<script type="text/javascript">

window.location.href="MyPageUpdateFormAction.do";
</script>
</c:if>
<c:if test="${nUpdateCheck==-1}">
<script type="text/javascript">
alertify.alert("비밀번호가 다릅니다");
</script>

</c:if>

<c:set var="searchlist" value="${searchlist }" />

	
		<form class="background">
			<div class="navbar-wrapper">
				<div class="container-fluid">
					<nav id="aaa" class="navbar navbar-fixed-top"
						style="position: relative;">
						<div class="container">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse" data-target="#navbar"
									aria-expanded="false" aria-controls="navbar">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								
						<div style="position: relative;">
								<a href="mapmainForm.do" >	<img src="./images/MainForm/Logo.png" style="width: 160px; height: 90px; position: absolute;"/></a></div>
						
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active" style="padding-right: 20px; padding-left: 20px;"><a href="mapmainForm.do" class="">Home</a></li> 
									
									<li class=" dropdown" style="padding-right: 30px; padding-left: 20px;">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">예약 하기<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li >
											<a href="Season_Ticket_Info_Action.do" ><font color="white">주차 정기권</font></a></li>
											<li><a href="BookingForm.do"><font color="white">주차 예약권</font></a></li>
										</ul></li>
									<c:if test="${sessionScope.memID!='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a href="noteList.do">
												쪽지함 </a></li>
									</c:if>
									<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a
											href="noteListAdmin.do"> 쪽지함 </a></li>
											
									</c:if>
									<li style="padding-right: 20px;"><a href="list.do">공지사항</a></li>

									<li><a href="CompanyinfoAction.do">회사 소개</a></li>
									<li><a href="QnAFormAction.do">QnA</a></li>
								</ul>
								<ul class="nav navbar-nav pull-right">
									<li class=""><a href="MyPageMainForm.do">MyPage</a></li>
									<li class=""><a href="SignUp_Logout.do">LogOut</a></li>
								</ul>

							</div>

						</div>

					</nav>
				</div>
			</div>
		</form>

<!--  메인 페이지 시작   -->
   <br><br>

	<div class="row-fluid">
        <div class="span2" >
  
        <div class="col-sm-6" style="float: right; width: 75%; padding:10px;"> 
           <div id="myPage_Menu"></div></div>
		   <img src="./images/MyPage/c12.png" class="img-rounded" alt="Cinque Terre" width="300" height="300" style="margin-left: 5%; margin-top: 5%:">
        </div>
        
        <div class="span8" style="margin-left: 5%;">
            <h3><font color="white">이 름 : <c:out value="${mypageVO.getStr_User_Name()}" /></font></h3>  
            <h3><font color="white">전화 번호 : <c:out value="${mypageVO.getStr_User_Tel()}" /></font></h3>
            <h3><font color="white">Email: <c:out value="${mypageVO.getStr_User_ID_Email()}" /></font></h3>
            
        </div>
        
        <div class="span2"> <div class="modal-footer" style="margin-right: 70%">
            
                
                <button type = "button" class="btn btn-info"  id="my_imformation">예약 정보<span class="icon-cog icon-white"></span></button> 
                <button type = "button" class="btn btn-info"  id="my_modified">회원 수정<span class="icon-cog icon-white"></span></button>
                <button type = "button" class="btn btn-info"  id="my_secession">회원 탈퇴<span class="icon-cog icon-white"></span></button>
 
            </div>
            
        </div>
        
</div>


 
  
   
  
</center>
</body>
</html>