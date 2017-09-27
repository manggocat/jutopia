<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
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
<title>게시판</title>


<script type="text/javascript">
	function checkValue(){

		if (document.form.Str_search.value=="") {
			alertify.alert("검색어를 입력해주세요.");
			return false;
		
		}
		
	}
</script>



</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/MainForm/MainForm.css" rel="stylesheet"
	type="text/css">
<link href="./CSS/Map/manubar.css" rel="stylesheet" type="text/css">

 <link href="./CSS/board/boardlist.css" rel="stylesheet" type="text/css"> 
 <script type="text/javascript">
	function loginshowPopup() {
		window.open("SignUp_LoginForm.do", "로그인",
				"width=500, height=350, left=100, top=50");
	}
</script>
 
<body >
<c:if test="${sessionScope.memID != null}">
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

								<div style="position: relative;"><a href="mapmainForm.do">
									<img src="./images/MainForm/Logo.png"
										style="width: 160px; height: 90px; position: absolute;" /></a>
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
											<li><a href="Season_Ticket_Info_Action.do"><font
													color="white">주차 정기권</font></a></li>
											<li><a href="BookingForm.do"><font color="white">주차
														예약권</font></a></li>
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
	</c:if>
	<c:if test="${sessionScope.memID == null}">
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

								<div style="position: relative;"><a href="mapmainForm.do" >
									<img src="./images/MainForm/Logo.png"
										style="width: 160px; height: 90px; position: absolute;" /></a>
								</div>
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav" style="padding-left: 17%;">
									<li class="active"
										style="padding-right: 20px; padding-left: 20px;"><a
										href="mapmainForm.do" class="">Home</a></li>
										
										<li class=" dropdown"
										style="padding-right: 30px; padding-left: 20px;"><a
										href="BookingForm.do" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">예약
											하기<span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="Season_Ticket_Info_Action.do"><font
													color="white">주차 정기권</font></a></li>
											<li><a href="BookingForm.do"><font color="white">주차
														예약권</font></a></li>
										</ul></li>


									<li style="padding-right: 20px;"><a href="list.do">공지사항</a></li>

									<li><a href="CompanyinfoAction.do">회사 소개</a></li>

								</ul>
								<ul class="nav navbar-nav pull-right">
									<li class="" style="padding-right: 20px;"><a href=""
										onclick="loginshowPopup();">Login</a></li>
									<li class=""><a href="SignUp_InsertInfo.do">SignUp</a></li>
								</ul>

							</div>

						</div>

					</nav>
				</div>
			</div>
		</form>
	</c:if>
	<center>
	<h2><span class="notice"> List</span></h2>
		
	
	<table width="700" background-color ="white">
		<tr>
			<td align ="left">
				<div class="listcount" align="center">
  					전체 글 : ${ count }
				</div>
		
				
			</td>
			<td  align="right">
				<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
									
			<a href="writeForm.do" ><input type="image" src="./images/board/write.png" width="30" height="30" /></a>
			</c:if>
			</td>
		</tr>
	</table>

<c:if test="${ count == 0 }">	
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>	
</c:if>
	
<c:if test="${ count > 0 }">	
	<table width="700" border="1" cellpadding="0" cellspacing="0"
		align="center" class ="boardlist" style="background : rgba(0, 0, 0, 0.6);">
		<thead>
		<tr height="30" >
			<th align="center"  style="width:10%;">번 호</th>
			<th align="center" width="50" class="subject">제 목</th>
			<th align="center" width="50" class="writer">작성자</th>
			<th align="center" width="50" class="date">작성날짜</th>
			<th align="center" width="50" style="width:15%;">조회수</th>
		</tr>
		</thead>
		
		<tbody >
		
	<c:forEach var="list"  items="${ list }">    		
	
		<tr height="30" style="color:white;">
			<td align="center" width="50">
				<c:out value="${ number }" />
				<c:set  var="number"   value="${ number - 1 }" />
			</td>
			<td width="250" >
	
	  <a href="content.do?num=${list.getN_num() }&pageNum=${ currentPage }">
					${ list.getStr_subject() }</a> 
	
	<c:if test="list.readcount >= 3">
	 	<img src="./images/baord/hot.gif" border="0" height="16"> 
	</c:if>
			</td>
			<td align="center" width="100">${ list.getStr_id_email() }</td>
			<td align="center" width="150" >
				<fmt:formatDate value="${ list.getDate_reg_date() }"
				type="both" pattern="yyyy-MM-dd"/>
			</td>
			<td align="center" width="150">${ list.getN_readcount() }</td>
			
		</tr>
		
	</c:forEach>
	</tbody>
	</table>
</c:if>

 <c:if test="${ count > 0 }"> 
	    <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
		<c:set  var="startPage"  value="${ 1 }" />  
		<c:set  var="pageBlock"  value="${ 5 }" />
		
		<fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" />
		<c:if  test="${ currentPage % pageBlock != 0 }" > 
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
		</c:if>
		
		<c:if  test="${ currentPage % pageBlock == 0 }" > 
			<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
		</c:if>
	
		<c:set  var="endPage"  value="${ startPage + pageBlock -1 }" />

		<c:if test="${ endPage > pageCount }" >
			<c:set  var="endPage"  value="${ pageCount }" />
		</c:if>
		
			<a href="list.do?currentPage=${1}"><input type="image" src="./images/board/home.png" width="30" height="30"/></a>
		
		<c:if test="${startPage >5 }" >
<a href="list.do?pageNum=${ startPage-5  }"><input type="image" src="./images/board/back.png" width="30" height="30"/> </a>
		</c:if>
<!-- 전체 페이지 출력 -->
		<c:forEach  var="i" begin="${startPage }" end="${ endPage }">	
			 
			 <c:if test="${pageNum ==i}">[${i}]</c:if>
			 <c:if test="${pageNum !=i }">
			 		<a href="list.do?pageNum=${i}"><input type ="button" class="pagenumber" value="${i}"/></a>  
			 </c:if>
	   </c:forEach>
	
	<c:if test="${ endPage < pageCount }" >
		<a href="list.do?pageNum=${ startPage+5 }"><input type="image" src="./images/board/next.png" width="30" height="30"/> </a>
	</c:if>
	
</c:if>
 <br><br>
    <div id="searchForm">
        <form action="list.do" method="get" name="form">
            <select name="Str_option">
                <option value="0">제목+내용</option>
            </select>
            
            	<input type="text" class="textbox" size="20" id ="Str_search" name="Str_search"/>&nbsp;
            
            <input type="image" src="./images/board/search.png" width="30" height="30" class="searchbutton" onclick="return checkValue()"/>
            
         </form>    
    </div>
</div>    


</body>
</center>
</html>
