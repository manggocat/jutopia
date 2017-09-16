<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<fmt:requestEncoding value = "utf-8" />

<c:if test ="check == 0"">
	<script type="text/javascript">
			alert("차량번호가 맞지 않습니다.");
	</script>
</c:if>

<c:if test ="check == 1"">
	<meta http-equiv = "Refresh" content="0; url=BookingDeleteForm.jsp">	
</c:if>