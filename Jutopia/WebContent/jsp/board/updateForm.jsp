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
<title>�ۼ���</title>
<script type="text/javascript">

    function checkIt(){
        var user =document.userinput;
         
        if(!user.id_email.value){
            alert("���̵� �Է��ϼ���");
            user.name.focus();
            return false;
        }
        if(!user.pwd.value){
           alert("��й�ȣ�� �Է��ϼ���");
            user.passwd.focus();
            return false;
        }
       if(!user.content.value){
            alert("������ �Է��ϼ���");
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
<td colspan="2" align="center"><h1>�����ϱ�</h1></td>
</tr>
<tr>
<td>�۹�ȣ</td>
<td><%=vo.getBOARD_NUM() %></td>
</tr>
<tr>
    <td>�ۼ���</td>
    <td><input type="text" name="id_email" value="<%=vo.getBOARD_ID_EMAIL() %>" size="10"></td>
</tr>
<tr>
   <td>����</td>
    <td><input type="text" name="subject" value="<%=vo.getBOARD_SUBJECT()%>" size="50"></td>
</tr>
<tr>
    <td>�̹�����ü</td>
    <input type="hidden" name="originalImage" value="<%=vo.getBOARD_IMG()%>">
    <td><img src="upload/<%=vo.getBOARD_IMG()%>" width="50" height="50">
     <input type="file" size="8" name="image"></td>
</tr>
<tr>
    <td>����</td>
    <td><textarea name="content" rows="5" cols="50"><%=vo.getBOARD_CONTENT() %></textarea></td>
</tr>
    <tr>
    <td>��ȣ</td>
    <td><input type="password" name ="passwd" size="10">
     ��ȣ�� �����ؾ� ���� �����˴ϴ�.</td>
</tr>
<tr>
    <td colspan="2"  align="center">
  <input type="submit" value="�����ϱ�" > 
  <input type="reset" value="�ٽ��ۼ�">
  <input type="button" value="��Ϻ���" onClick="location.href='list.do'">   
    </td>
</tr>
</table>   
</form> 
</body>
</html>
