<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet"
	type="text/css">
<link href="./CSS/MypageForm/MyPageUpdateForm" rel="stylesheet"
	type="text/css">
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
<title>회원 정보 수정</title>

<script type="text/javascript">
	function checkIt() {
		
		var passwd_filter = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		
		if (!passwd_filter.test(strUserpwd.value)) {
			alertify.alert("비밀번호 양식을 지켜서 입력해 주세요");
			return false;
		}

	}
</script>
</head>
<body bgcolor="${ bodyback_c }">
	<c:catch>

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
									<img src="./images/MainForm/Logo.png"
										style="width: 160px; height: 90px; position: absolute;" />
								</div>

							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active"
										style="padding-right: 20px; padding-left: 20px;"><a
										href="mapmainForm.do" class="">Home</a></li>

									<li class=" dropdown"
										style="padding-right: 30px; padding-left: 20px;"><a
										href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">예약
											하기<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li class=" dropdown"><a href="#"
												class="dropdown-toggle " data-toggle="dropdown"
												role="button" aria-haspopup="true" aria-expanded="false"><font
													color="white">주차 정기권</font></a></li>
											<li><a href="#"><font color="white">주차 예약권</font></a></li>
										</ul></li>
									<c:if test="${sessionScope.memID!='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a href="noteList.do">
												쪽지함 </a></li>
									</c:if>
									<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
										<li style="padding-right: 20px;"><a
											href="noteListAdmin.do"> 쪽지함 </a></li>
									</c:if>
									<li style="padding-right: 20px;"><a href="#">공지사항</a></li>

									<li><a href="#">회사 소개</a></li>

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

		<!-- 회원 정보 수정 -->

		<div class="row">
			<div class="col-md-7 col-md-offset-3" style="margin-top: 5%;">

				<form class="form-horizontal" role="form" method="get"
					id="reservationForm" name="reservationForm"
					action="MyPageUpdateProAction.do" onsubmit="return checkIt()"
					style="">
					<input type="hidden" name="reduction" id="reduction">
					<fieldset>

						<!-- Form Name -->
						<legend>
							<h2>
								<font color="white">회원 정보 수정</font>
								</text>
							</h2>
						</legend>

						<!-- 아이디 -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="textinput"
								style="color: white;">사용자 ID : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control"
									value="${sessionScope.memID }">
							</div>
						</div>

						<!-- 비밀 번호-->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="textinput"
								style="color: white;">Password : </label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="strUserpwd" id="strUserpwd"
									value="${mypageVO.getStr_User_Pwd()}">
							</div>
						</div>

						<!-- 사용자 이름 -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="textinput"
								style="color: white;">사용자 이름 : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="strUsername"
									value="${ mypageVO.getStr_User_Name()}">
							</div>
						</div>

						<!-- 전화 번호 -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="textinput"
								style="color: white;">전화 번호 : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="strUsertel"
									value="${ mypageVO.getStr_User_Tel()}">
							</div>
						</div>
						<%-- 
           <!-- 이메일 -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput" >E-mail : </label>
            <div class="col-sm-6">
            <c:if test="${ list.getEmail() == null }" >
			  <input type="text" name="email"  class="form-control" >
	        </c:if>
	        
	        <c:if test="${ list.getEmail() != null }" >
			  <input type="text" name="email" class="form-control" value="${ list.getSIGN_UP_NAME }">
	        </c:if>	
 
            </div>
          </div> --%>

						<!-- 버튼 부분 -->
						<div class="form-group">
							<div class="col-md-8 text-right">

								<button type="submit"class="btn btn-primary"
									name="Sign_Up_Update">수정</button>
								&nbsp;
								<button type="submit" class="btn btn-default"
									onclick="javascript:window.location='Main_Te2t.do'">취소</button>

							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
</body>
</c:catch>
<%-- <% }catch(Exception e) {e.printStackTrace(); } %> --%>
</html>
