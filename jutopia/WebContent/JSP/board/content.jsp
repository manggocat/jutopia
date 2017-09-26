<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
 <link href="./CSS/board/boardcontent.css" rel="stylesheet" type="text/css"> 
</head>

<body>
<center>
<h2><span class="detail"> Notice</span></h2>
<br>
<form>
<table width = "500" border = "1" cellspacing = "0" cellpadding = "0" 
 align="center" style="background : rgba(0, 0, 0, 0.6);">

<tr height="30">
   <td align="center" width = "125" class="title">글번호</td>
   <td align="center" width = "125" class="content"> ${ vo.getN_num() }</td>
   
   <td align="center" width = "125" class="title">조회수</td>
   <td align="center" width = "125" class="content">${ vo.getN_readcount() }</td>
</tr>
<tr height="30">
   <td align="center" width = "125" class="title">작성자</td>
   <td align="center" width = "125" class="content">${ vo.getStr_id_email() }</td>
   
   <td align="center" width = "125" class="title">작성일</td>
   
   <td align="center" width = "125" class="content"><fmt:formatDate value="${ vo.getDate_reg_date() }"
            type="both" pattern="yyyy-MM-dd"/></td>
</tr>
<tr height="30" >
   <td align="center" width = "125" class="title">글제목</td>
   <td align="center" width = "125" colspan="4" class="content">${ vo.getStr_subject() } </td>
</tr>
<tr height="30">   
   <td align="center" width = "125" class="title">글내용</td>
   <td align="center" width = "125"  colspan="4" class="content">
   <c:if test="${vo.getStr_boardfile() ne null }">
   <img src ="./upload/${ vo.getStr_boardfile() } " width="200px" height="200px">
   </c:if>
   <pre>${ vo.getStr_content() }</pre></td>
</tr>

<tr height ="30">
   <td colspan="4" align="right" >
   <div>
   	<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
   <input type="button" value="글수정" class="contentbutton" onclick="document.location.href='updateForm.do?num=${ vo.getN_num() }&pageNum=${ pageNum }'"> 
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type ="button" value ="글삭제" class="contentbutton" onclick="document.location.href='deletePro.do?num=${ vo.getN_num() }&pageNum=${ pageNum }'">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </c:if>
   <input type = "button" value ="목록 보기" class="contentbutton" onclick="document.location.href='list.do?pageNum=${ pageNum }'"> 
   </div>
   </td>
</tr>
</table>
</form>
</center>
</body>
</html>