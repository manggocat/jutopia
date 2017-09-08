<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>write.jsp</title>

<script type="text/javascript">
function writeSave(){
	     
	    if(document.writeform.writer.value==""){
	      alert("작성자를 입력하십시요.");
	      document.writeform.writer.focus();
	      return false;
	   }
	    if(document.writeform.subject.value==""){
	      alert("제목을 입력하십시요.");
	      document.writeform.subject.focus();
	      return false;
	    }
	     
	    if(document.writeform.content.value==""){
	      alert("내용을 입력하십시요.");
	      document.writeform.content.focus();
	      return false;
	   }
	         
	    if(document.writeform.passwd.value==""){
	     alert(" 비밀번호를 입력하십시요.");
	     document.writeform.passwd.focus();
	      return false;
	    }
	    return true;
	 }   
	</script>
</head>
<body>
<center>
  <br>
  <font color="navy" size="5">
   <b>글 쓰 기</b>
  </font>
  <br>
 <hr width=500 color="red">
  <a href="board_list.do?method=list">LIST</a>|<a href="index.do">HOME</a>
 <hr width=500 color="red">
 <!-- 파일 전송까지 하기 위해서~~enctype추가 -->
 <form name="f" method="post" action="writePro.do" enctype="multipart/form-data" >
  <table border=1 width=600>
   <tr>
    <td width="20%" align="center"><B>제 목</B></td>
    <td width="80%">
     <input type="text" name="subject" size=60>
    </td>
   </tr>
   <tr>
    <td width="20%" align="center"><B>내 용</B></td>
    <td width="80%">
     <textarea name = content rows=10 cols=60></textarea>
    </td>
   </tr>
   <tr>
    <td width="20%" align="center"><B>작성자</B></td>
    <td width="80%">
     <input type="text" name="writer" size=60>
    </td>
   </tr>
 
   <tr>
    <td width="20%" align="center"><B>비밀번호</B></td>
    <td width="80%">
     <input type="password" name="pwd" size=60>
    </td>
   </tr>
   <tr>
    <td width="20%" align="center"><B>첨부파일</B></td>
    <td width="80%">
     <input type="file" name="filename" size=40>
    </td>
   </tr>
   <tr>
    <td colspan="2" align="center">
     <input type="button" value="글쓰기"  >
     <input type ="reset" value="다시 쓰기">
     <input type ="button" value = "목록보기" onclick="window.location='board_list.do' ">
    </td>
   </tr>
  </table>
 </form>
</center>
</body>
</html>

