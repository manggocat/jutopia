<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "jutopia.signup.*"%>
<%@ include file="../view/color.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("SIGN_UP_ID_EMAIL");
	String pwd = request.getParameter("SIGN_UP_PWD");
	
	SignupDAO dao = SignupDAO.get_Instance();
	int check = dao.userCheck(email, pwd);
	
	if ( check == 1 ) {
		session.setAttribute("userEmail", email);		// name (key), value
		response.sendRedirect("member_login_Form.jsp");
	}	else if ( check == 0 ) {
%>
		<script type="text/javascript">
<!--
	 alert ("비밀번호가 틀렸습니다");
	 history.go(-1);
	 // -->
		</script>
<%		
	} else { %>
	<script type="text/javascript">
	
	<!--
	 alert ("아이디가 없습니다");
	 history.go(-1);
	 // -->
	</script>
<%		
	} // if end
	

%>