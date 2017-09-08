<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link href = "../../css/main.css" rel = "stylesheet" type = "text/css">

</head>
<body>
<jsp:include page="templete_module/top.jsp" flush="false" />
<%-- <jsp:include page="../module/left.jsp"  flush="false"/> --%>

<table>
	</td>
		<td width="150"  height="150"valign="top">
			<jsp:include page="${ content }"  flush="false"/>
		</td>
	</tr>
</table>



<jsp:include page="templete_module/bottom.jsp"  flush="false"/>
</body>
</html>
