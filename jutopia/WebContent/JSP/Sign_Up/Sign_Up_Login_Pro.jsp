<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "jutopia.Sign_Up.*"%>
<%@ include file="../../view/color.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<fmt:requestEncoding value="UTF-8" />
<%-- <jsp:useBean id="vo" class="edu.kosta.board.BoardVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean> --%>

<c:if test="${ check == 1 }" >
	<center>
	주토피아 홈페이지에 접속하신 걸 환영합니다.<br><br>
	즐거운 시간 보내시길 바랍니다.<p/><p/>
	
	<input type="button" value="닫기" 
	style="color:#000;font:12px/15px 굴림, Gulim, sans-serif;" 
	onclick="setMain()">
	</center>
	
	<script type="text/javascript">
	function setMain() {
		var main =  window.open("Main_Te2t.do");
		self.close();
		/* main.document.write("<center><pre>주토피아 홈페이지에 접속하신 걸 환영합니다. <br><br> 즐거운 시간 보내시길 바랍니다.</pre></center>"); */
	}
	</script>

	<!-- <meta http-equiv="Refresh" content="0; url=javascript:window.location='Main_Te2t.do' "> -->
</c:if>
<c:if test="${ check == 0 }" >
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다");
	history.go(-1);
	</script>
</c:if>
<c:if test="${ check == -1 }" >
	<script type="text/javascript">
	alert("아이디가 없습니다");
	history.go(-1);
		</script>
</c:if>
