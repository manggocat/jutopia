<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
</head>
<body>
<label>지번주소&nbsp;&nbsp;</label><input type='text' class='postcodify_jibeon_address' id = 'Lotnumber_address'/>
<button id='search_button' >검색</button>&nbsp;&nbsp;&nbsp;
<label>우편번호&nbsp;&nbsp;</label><input type='text' size='4' class='postcodify_postcode6_1' />&nbsp;&nbsp;
<label>-</label>&nbsp;&nbsp;<input type='text' size='4' class='postcodify_postcode6_2' />&nbsp;&nbsp;
<label>참고항목&nbsp;&nbsp;</label><input type='text' class='postcodify_extra_info' />
<script type = "text/javascript">
			
			$('#Lotnumber_address').click(function(){
				   if($.trim($('#Lotnumber_address').val()) == ''){
					   $("#search_button").postcodifyPopUp();
				   }
			});
			$("#search_button").click(function(){
		         $("#search_button").postcodifyPopUp();
		      });
		
</script>
</body>
</html>