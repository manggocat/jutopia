<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jutopia.Sign_Up.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="vo" class="jutopia.Sign_Up.Sign_up_VO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<fmt:requestEncoding value="UTF-8" />

<%-- <c:redirect url="list.do" /> --%>

<meta http-equiv="Refresh" content="0; url=Main_Test.do">