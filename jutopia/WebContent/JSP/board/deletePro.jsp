<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<fmt:requestEncoding   value="UTF-8" />

<c:if test="${check == 1}" >
		<meta  http-equiv="Refresh"  content="0; url=list.do?pageNum=${ pageNum }" >
</c:if>
<br>

 <a href="javascript:history.go(-3)">글목록으로 가기</a> 
 <c:redirect  url="list.do" />





