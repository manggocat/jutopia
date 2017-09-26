<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<label>지번주소&nbsp;&nbsp;</label><input type='text' class='postcodify_jibeon_address' id = 'Lotnumber_address' autofocus style="border-style:groove;" />

<button id='search_button' class="btn btn-primary btn-sm" style="background-color: #581276;"  >검색</button>&nbsp;&nbsp;&nbsp;

<label>우편번호&nbsp;&nbsp;</label><input type='text' size='4' class='postcodify_postcode6_1' style="border-style:groove;"/>&nbsp;&nbsp;

<label>-</label>&nbsp;&nbsp;<input type='text' size='4' class='postcodify_postcode6_2' style="border-style:groove;"/>&nbsp;&nbsp;

<label>참고항목&nbsp;&nbsp;</label><input type='text' class='postcodify_extra_info' style="border-style:groove;"/>

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