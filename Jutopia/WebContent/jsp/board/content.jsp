<%@page import="jutopia.BoardModel.board_VO"%>
<%@page import="jutopia.BoardModel.board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../view/color.jsp" %> --%>
<!DOCTYPE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import = "java.text.SimpleDateFormat"%>
<%--  <%@ include file = "/view/style.css"%> --%>

<html>
<head><title>게시판</title>
<link href="../view/style.css" rel = "stylesheet" type = "text/css">
</head>
<!-- <style>

<!--
a:link { text-decoration:none; }
a:visited { text-decoration:none; }
a:active { text-decoration:none; }
a:hover { color:rgb(82,156,255); text-decoration:none; }
-->

A:link, A:active{ 
color: red; 
font-size: 11pt; 
text-decoration: none; 
}

A:visited { 
color: green; 
font-size: 11pt; 
text-decoration: none; 
}  

A:hover { 
color: 000000; 
font-size: 11pt; 
text-decoration: underline; 
}  

</style>
 -->
<body>
<table width ="70%" border ="1" cellpadding="0" cellspacing="0" align="center">
<tr><td  colspan="2" align="center"><h1>상세보기</h1></tr>
<tr>
<td>글번호</td>
<td>${vo.BOARD_NUM}</td>
</tr>
 
<tr>
<td>작성자</td>
<td>${vo.BOARD_ID_EMAIL}</td>
</tr>
 
<tr>
<td>조회수</td>
<td>${vo.BOARD_READCOUNT}</td>
</tr>
 
<tr>
<td>작성일</td>
<td><fmt:formatDate value="${BOARD_WRITE_DATE}" pattern="yyyy년MM월dd일"/></td>
</tr>

<tr><td>이미지</td><td>
<img src="upload/${BOARD_IMG}">
</td></tr>
<tr><td>글제목</td><td>
${BOARD_SUBJECT}
</td></tr>
<tr><td>내용</td><td>
${BOARD_CONTENT}
</td></tr>
<tr><td colspan="2" align="center">
 <input type="button" value="수정하기" onClick="location.href='updateForm.do?num=${album.num}'"> 
  <input type="button" value="삭제하기" onClick="location.href='deleteForm.do?num=${album.num}'">
  <input type="button" value="목록보기" onClick="location.href='list.do'">   
</td></tr>
</table>

</body>
</html>