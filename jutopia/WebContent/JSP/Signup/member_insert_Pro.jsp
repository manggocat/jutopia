<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "jutopia.Sign_Up.*"%>


<% request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id="vo" class="jutopia.Sign_Up.Sign_up_VO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>



<%

	String sign_up_name = request.getParameter("sign_up_name");

	String text_mail_1 = request.getParameter("text_mail_1");
	String text_mail_2 = request.getParameter("text_mail_2");
	String total_mail = text_mail_1 + "@" + text_mail_2;
	
	
	out.print(text_mail_1 + " / " + text_mail_2 + " / " + total_mail);
	
	vo.setSIGN_UP_ID_EMAIL(total_mail);
	vo.setSIGN_UP_NAME(sign_up_name);
	vo.setSIGN_UP_PWD(request.getParameter("sign_up_pwd"));
	vo.setSIGN_UP_TEL(request.getParameter("sign_up_tel"));
	vo.setSIGN_UP_REDUCTION(request.getParameter("sign_up_Reduction"));
	

	out.print(sign_up_Reduction);
	Sign_up_DAO dao = Sign_up_DAO.getInstance(); //연결
	
	
	/* int result = dao.insert(vo); */
	
	
	response.sendRedirect("member_login_Form.jsp");
%>

<jsp:getProperty property="SIGN_UP_NAME" name="vo"/> 님의 회원 가입을 축하합니다.
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입 메시지 출력</title>
</head>
<body>

</body>
</html>
