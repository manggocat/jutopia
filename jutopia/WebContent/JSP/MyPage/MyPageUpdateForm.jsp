<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원의 정보 수정할 거야</title>
</head>

<body bgcolor="${ bodyback_c }"> 
<form method="post" action="MyPageUpdateProAction.do">
<c:catch>
	<table width="600" border="1" align="center" cellpadding="3" cellspacing="0">
		<tr>
			<td colspan="2" height="39" bgcolor="${ title_c }" align="center">
				<font size="+1" > <b> 회원 정보 수정 페이지 </b></font>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="normal" align="center">회원 정보를 수정합니다. </td>
		</tr>
		
		
		<tr>
			<td width="200" > 사용자 ID</td>
			<td width="400" >${sessionScope.memID }</td>
		</tr>
		
		<tr>
			<td width="200" > 비밀번호</td>
			<td width="400" >
			 <input type="password" name="strUserpwd" size="10" maxlength="20" value="${mypageVO.getStr_User_Pwd()}"> 
			</td>
		</tr>
		
		
		<tr>
			<td width="200"  > 사용자 이름</td>
			<td width="400" >
			<input type="text" name="strUsername" size="15" maxlength="20" value="${ mypageVO.getStr_User_Name()}"> 
			</td>
		</tr>
		<tr>
			<td width="200"  > 전화번호</td>
			<td width="400" >
			 <input type="text" name="strUsertel" size="15" maxlength="20" value="${ mypageVO.getStr_User_Tel()}">
			</td>
		</tr>
		
<%-- 		<tr>
			<td width="200"  > 이메일 </td>
			<td width="400" >
	<c:if test="${ list.getEmail() == null }" >
			<input type="text" name="email" size="40" maxlength="30" >
	</c:if>
	<c:if test="${ list.getEmail() != null }" >
			<input type="text" name="email" size="40" maxlength="30" value="${ list.getSIGN_UP_NAME }">
	</c:if>	

			</td>
		</tr> --%>
		
		<tr>
			<td colspan="2" align="center" bgcolor="${ value_c }" >
				<input type="submit" name="Sign_Up_Update" value="수정">
				<input type="button" value="취 소" 
					onclick="javascript:window.location='Main_Te2t.do'">
			</td>
		</tr>
	</table>
</form>	
</body>
</c:catch>
 <%-- <% }catch(Exception e) {e.printStackTrace(); } %> --%>
</html>
