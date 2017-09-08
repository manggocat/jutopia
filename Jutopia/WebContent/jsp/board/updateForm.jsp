<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import ="jutopia.BoardModel.*" %>

   <%request.setCharacterEncoding("utf-8"); %>

<%
   int num = Integer.parseInt(request.getParameter("num"));
	board_DAO dao = board_DAO.getInstance();
    board_VO vo = dao.getdetail_page(num);
   if(vo.getBOARD_ID_EMAIL()==null){
       vo.setBOARD_ID_EMAIL("");
   }
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정</title>
<script type="text/javascript">

    function checkIt(){
        var user =document.userinput;
         
        if(!user.id_email.value){
            alert("아이디를 입력하세요");
            user.name.focus();
            return false;
        }
        if(!user.pwd.value){
           alert("비밀번호를 입력하세요");
            user.passwd.focus();
            return false;
        }
       if(!user.content.value){
            alert("내용을 입력하세요");
           user.content.focus();
            return false;
       }   
    }

</script>
</head>
<body>
<form action="updatePro.do" method="post" encType="multipart/form-data" name="userinput"  onSubmit="return checkIt()"> 
<input type="hidden" name="num" value="<%=num%>">
<table width ="70%" border ="1" cellpadding="0" cellspacing="0" align="center">
<tr>
<td colspan="2" align="center"><h1>수정하기</h1></td>
</tr>
<tr>
<td>글번호</td>
<td><%=vo.getBOARD_NUM() %></td>
</tr>
<tr>
    <td>작성자</td>
    <td><input type="text" name="id_email" value="<%=vo.getBOARD_ID_EMAIL() %>" size="10"></td>
</tr>
<tr>
   <td>제목</td>
    <td><input type="text" name="subject" value="<%=vo.getBOARD_SUBJECT()%>" size="50"></td>
</tr>
<tr>
    <td>이미지교체</td>
    <input type="hidden" name="originalImage" value="<%=vo.getBOARD_IMG()%>">
    <td><img src="upload/<%=vo.getBOARD_IMG()%>" width="50" height="50">
     <input type="file" size="8" name="image"></td>
</tr>
<tr>
    <td>내용</td>
    <td><textarea name="content" rows="5" cols="50"><%=vo.getBOARD_CONTENT() %></textarea></td>
</tr>
    <tr>
    <td>암호</td>
    <td><input type="password" name ="passwd" size="10">
     암호와 동일해야 글이 수정됩니다.</td>
</tr>
<tr>
    <td colspan="2"  align="center">
  <input type="submit" value="수정하기" > 
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" onClick="location.href='list.do'">   
    </td>
</tr>
</table>   
</form> 
</body>
</html>
