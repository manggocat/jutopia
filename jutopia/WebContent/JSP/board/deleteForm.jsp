<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<!-- <link href="./view/style.css" rel="stylesheet" type="text/css"> -->
<!-- <script language="JavaScript" src="./view/script.js"></script> -->

</head>
<body >  
<center><b>글삭제</b> <br>
<form action="deletePro.do?pageNum=${ pageNum }"  method="post"
		  onsubmit="return deleteSave()"	 name="delForm">
	
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		
		<tr height="30"> 
			<td align="center" >
			<input type="submit"  value="글삭제">
			<input type="button"  value="글목록" 
			onclick="document.location.href='list.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>



