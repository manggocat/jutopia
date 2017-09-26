<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
<title>게시판</title>


<script type="text/javascript">
	function checkValue(){

		if (document.form.Str_search.value=="") {
			alert("검색어를 입력해주세요.");
			return false;
		
		}
		
	}
</script>



</head>
 <link href="./CSS/board/boardlist.css" rel="stylesheet" type="text/css"> 
 
<body >
	<center>
	<h2><span class="notice"> List</span></h2>
		
	
	<table width="700" background-color ="white">
		<tr>
			<td align ="left">
				<div class="listcount" align="center">
  					전체 글 : ${ count }
				</div>
		
				
			</td>
			<td  align="right">
				<c:if test="${sessionScope.memID=='jutopia@gmail.com'}">
									
			<a href="writeForm.do" ><input type="image" src="./images/board/write.png" width="30" height="30" /></a>
			</c:if>
			</td>
		</tr>
	</table>

<c:if test="${ count == 0 }">	
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>	
</c:if>
	
<c:if test="${ count > 0 }">	
	<table width="700" border="1" cellpadding="0" cellspacing="0"
		align="center" class ="boardlist" style="background : rgba(0, 0, 0, 0.6);">
		<thead>
		<tr height="30" >
			<th align="center"  style="width:10%;">번 호</th>
			<th align="center" width="50" class="subject">제 목</th>
			<th align="center" width="50" class="writer">작성자</th>
			<th align="center" width="50" class="date">작성날짜</th>
			<th align="center" width="50" style="width:15%;">조회수</th>
		</tr>
		</thead>
		
		<tbody >
		
	<c:forEach var="list"  items="${ list }">    		
	
		<tr height="30" style="color:white;">
			<td align="center" width="50">
				<c:out value="${ number }" />
				<c:set  var="number"   value="${ number - 1 }" />
			</td>
			<td width="250" >
	
	  <a href="content.do?num=${list.getN_num() }&pageNum=${ currentPage }">
					${ list.getStr_subject() }</a> 
	
	<c:if test="list.readcount >= 3">
	 	<img src="./images/baord/hot.gif" border="0" height="16"> 
	</c:if>
			</td>
			<td align="center" width="100">${ list.getStr_id_email() }</td>
			<td align="center" width="150" >
				<fmt:formatDate value="${ list.getDate_reg_date() }"
				type="both" pattern="yyyy-MM-dd"/>
			</td>
			<td align="center" width="150">${ list.getN_readcount() }</td>
			
		</tr>
		
	</c:forEach>
	</tbody>
	</table>
</c:if>

 <c:if test="${ count > 0 }"> 
	    <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
		<c:set  var="startPage"  value="${ 1 }" />  
		<c:set  var="pageBlock"  value="${ 5 }" />
		
		<fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" />
		<c:if  test="${ currentPage % pageBlock != 0 }" > 
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
		</c:if>
		
		<c:if  test="${ currentPage % pageBlock == 0 }" > 
			<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
		</c:if>
	
		<c:set  var="endPage"  value="${ startPage + pageBlock -1 }" />

		<c:if test="${ endPage > pageCount }" >
			<c:set  var="endPage"  value="${ pageCount }" />
		</c:if>
		
			<a href="list.do?currentPage=${1}"><input type="image" src="./images/board/home.png" width="30" height="30"/></a>
		
		<c:if test="${startPage >5 }" >
<a href="list.do?pageNum=${ startPage-5  }"><input type="image" src="./images/board/back.png" width="30" height="30"/> </a>
		</c:if>
<!-- 전체 페이지 출력 -->
		<c:forEach  var="i" begin="${startPage }" end="${ endPage }">	
			 
			 <c:if test="${pageNum ==i}">[${i}]</c:if>
			 <c:if test="${pageNum !=i }">
			 		<a href="list.do?pageNum=${i}"><input type ="button" class="pagenumber" value="${i}"/></a>  
			 </c:if>
	   </c:forEach>
	
	<c:if test="${ endPage < pageCount }" >
		<a href="list.do?pageNum=${ startPage+5 }"><input type="image" src="./images/board/next.png" width="30" height="30"/> </a>
	</c:if>
	
</c:if>
 <br><br>
    <div id="searchForm">
        <form action="list.do" method="get" name="form">
            <select name="Str_option">
                <option value="0">제목+내용</option>
            </select>
            
            	<input type="text" class="textbox" size="20" id ="Str_search" name="Str_search"/>&nbsp;
            
            <input type="image" src="./images/board/search.png" width="30" height="30" class="searchbutton" onclick="return checkValue()"/>
            
         </form>    
    </div>
</div>    


</body>
</center>
</html>
