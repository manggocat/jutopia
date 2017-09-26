
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 - 글쓰기</title>

<script type="text/javascript">
	function checkValue(){

		var subject = writeForm.subject.value;
		var content = writeForm.content.value;
		
		
		if (subject == null || subject=="") {
			alert("제목을 입력해주세요.");
			return false;
			
			
			
			
		}if (content == null || content=="") {
			alert("내용을 입력해주세요.");
				
			return false;
		}
		
	}
</script>

</head>
<link href="./CSS/board/boardwrite.css" rel="stylesheet" type="text/css"> 
<body>
	<center>
	<br>
	<h2><span class="notice">Write</span></h2>
	
	<br>
	<form action="writePro.do" method="post" name="writeForm" enctype="multipart/form-data"
		onsubmit="return checkValue()">
		<input type="hidden" name="num" value="${ num }"> 
		<input type="hidden" name="ref" value="${ ref }"> 
		<input type="hidden" name="re_step" value="${ re_step }"> 
		<input type="hidden" name="re_level" value="${ re_level }">
		
		<!-- 	<form method="post" action="writePro.bo" name="writeForm" enctype="multipart/form-data"
		onsubmit="return checkValue()"> -->
		<%-- <input type="hidden" name="board_id" value="${sessionS cope.sessionID}" onsubmit="return checkValue()"> --%>
		
		<table width="700" border="3" bordercolor="lightgray" align="center" class="boardwrite" 
		style="background : rgba(0, 0, 0, 0.6); ">
			<tr>
				<td class="title" align="center" >작성자</td>
				<td><input name="id_email" type="text" size="70"
					maxlength="100" value="${sessionScope.memID}" /></td>
				<%-- <td>${sessionScope.sessionID}</td> --%>
			</tr>
			<tr>
				<td width="70" class="title" align="center">제 목</td>
				<td width="330">
								
					<c:if test="${ num == 0 }">
				
						<input type="text" size="40" maxlength="50" id="subject" name="subject" class="textbox">
				
					</c:if>
					
				</td>
			</tr>
			<tr>
				<td class="title" align="center">내 용</td>
				<td><textarea id = "content" name="content" cols="72" rows="20" class="textbox"></textarea></td>
			</tr>
			<tr>
				<td class="title" align="center">파일첨부</td>
				<td><input type="file" name="boardfile" src="./images/board/file.png" width="30" height="30"/></td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5">
			<div >
 				<input type="submit" value="등록" class="writebutton"> 
			
				
				<a href = "list.do"><input type="button" value="목록"  class="writebutton"></a>
				</div>
				</td>
			</tr>
		</table>
	</form>
</center>
</body>