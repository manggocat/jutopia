<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 글쓰기</title>
<!-- <link href = "./view/mystyle.css" rel = "stylesheet" type = text/css">
<script type = "text/javascript" src = "./view/script.js"></script> -->
</head>
<link href="./CSS/board/boardmodify.css" rel="stylesheet" type="text/css"> 
<center>
<body >
	<h2><span class="modify">Modify</span></h2>
</center>
<form action = "updatePro.do?pageNum=${ pageNum }" method="post" name = "updatePro" enctype="multipart/form-data">

<table width='400' border='1' cellspacing='0' cellpadding='0' 
align="center">


<tr>
	<td width="70"  align = "center" class="title" style="width:60%;"> 작성자</td>
	<td width="330"><input type="text" size= "10" maxlenth="10" name ="id_email" value="${ vo.getStr_id_email() }">
		<input type="hidden" name="num" value="${ vo.getN_num() }"></td>
	</td>
	
</tr>
<tr>
	<td width="70"  align = "center" class="title" style="width:60%;"> 제  목</td>
	<td width="330"   >
<!-- 	답변인것에 대한 처리 -->
<input type= "text" size = "40" maxlength="50"  class="textbox" name = "subject" value = "${ vo.getStr_subject() }"></td>
</tr>

<tr>
	<td width="70"  align = "center"class="title" style="width:60%;"> 내  용</td>
	<td width="330" ><textarea rows="13" cols="40" name = "content"  class="textbox" >${ vo.getStr_content() }</textarea></td>
	
</tr>
<tr>
	<td width="70"  align = "center"class="title" style="width:60%;"> 파  일</td>
<td colspan="2" align="center" class="textbox"><img src ="./upload/${ vo.getStr_boardfile() } " width="100px" height="100px"></td>
</tr>
<tr>
	<td width="70"  align = "center"class="title" style="width:60%;"> 수정할 파일</td>
	<td  class="textbox" ><input type= "file" size = "40" maxlength="50" name = "boardfile" value = "${ vo.getStr_boardfile() }"></td>
</tr>

<tr>
	<td align="center" colspan="2" >
	<div>
	<input type = "submit" value = "글수정" class="modifybutton" >
	<a href = "list.do"><input type="button" value="목록"  class="modifybutton" > </a>
	</div>
</tr>
</table>
</form>
</body>
</html>