<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jutopia MainForm</title>

<style>   
ul{max-width:100%;height:60px;background:black;opacity:0.5;list-style:none;padding-top:25px;}
li{ float:right; margin-right:50px }
a{font-size:20px;color:white;font-weight:bold;text-decoration:none}

      }
    
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3de7ecb8dd0593be114d513b5c0a775d"></script>
</head>
<body>
   <ul>
      <li><a href = "#">회사소개</a></li>
      <li><a href = "#">공지사항</a></li>
      <li><a href = "#">로그인</a></li>
      <li><a href = "#">마이페이지</a></li>
   </ul>
   
	<table align ="center">
	
	<tr>
	<td>
	<%@ include file = "map/map.jsp" %>

	</td>
	<td>
<input type="button" class="img_roadview"  value="로드뷰보기"  background-image="url('http://image.hanmail.net/hanmail/general/logo_sec.gif')"  
onClick="self.location='map/roadview.jsp';">

	</td>
	</tr>
	
	</table>
   
   <table align = "center">
   
      <tr>
         <td><font>서울시 강남구 태해란로 103길 17정석빌딩 &nbsp;&nbsp; 대표이사 : 서효진 &nbsp;&nbsp; 사업자등록번호 : 138-81-05876 &nbsp;&nbsp; 통신판매업 신고번호 : 제2011-서울강남-02008호</td>
      </tr>
      <tr>
         <td>문의전화(평일 09:00~18:00) : 1566-7727 &nbsp;&nbsp; (유료)이메일 : meloninformation@iloen.com &nbsp;&nbsp;© 2016. LOEN Entertainment, Inc. ALL RIGHTS RESERVED.</td>
      </tr>
   
   </table>
   

   

</body>