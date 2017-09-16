<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>jutopia MainForm</title>

<style>   
ul{max-width:100%;height:60px;background:black;opacity:0.5;list-style:none;padding-top:25px;}
li{ float:right; margin-right:50px }
a{font-size:20px;color:white;font-weight:bold;text-decoration:none}
</style>

<title>우편번호 검색</title>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->


<script type = "text/javascript">
      $(function(){
    	 
		  $('#doro').click(function(){
			  $("#search_button").postcodifyPopUp();
		         $("#stage1").html
		         
		            ("<label>도로명주소&nbsp;&nbsp;</label><input type='text'  class='postcodify_address'/><label>우편번호&nbsp;&nbsp;</label><input type='text' size='4' class='postcodify_postcode6_1' />&nbsp;&nbsp;<label>-</label>&nbsp;&nbsp;<input type='text' size='4' class='postcodify_postcode6_2' />&nbsp;&nbsp;<label>참고항목&nbsp;&nbsp;</label><input type='text' class='postcodify_extra_info' />");
		          alert("1");
		         
			  });
		 
		  
		  $("#zibun").click(function(){
			  $("#search_button").postcodifyPopUp();
		         $("#stage1").html
		            ("<label>지번주소&nbsp;&nbsp;</label><input type='text' class='postcodify_jibeon_address' /><label>우편번호&nbsp;&nbsp;</label><input type='text' size='4' class='postcodify_postcode6_1' />&nbsp;&nbsp;<label>-</label>&nbsp;&nbsp;<input type='text' size='4' class='postcodify_postcode6_2' />&nbsp;&nbsp;<label>참고항목&nbsp;&nbsp;</label><input type='text' class='postcodify_extra_info' />");
		      });

      });

  
</script>


<script type = "text/javascript">
      
    
  
</script>
</head>

<body>
   <ul>
      <li><a href = "#">회사소개</a></li>
      <li><a href = "#">공지사항</a></li>
      <li><a href = "#">로그인</a></li>
      <li><a href = "#">마이페이지</a></li>
   </ul>
<div align = "center">
   <button  type="button" name="juso" value = ""  id = "doro" onclick="">도로명 주소 </button>&nbsp;&nbsp; 
   <input  type="button" name="juso" value = "지번 주소"    id = "zibun"/>
   <p><input align = "center" type = 'text' size = '20' placeholder = '검색 버튼을 눌러주세요'> <button id="search_button" >검색</button></p> 
</div>
<div align = "center" id = "stage1">
   
</div>






<script type="text/javascript">
   
</script> 




   
   <table align = "center">
   
      <tr>
         <td><font>서울시 강남구 태해란로 103길 17정석빌딩 &nbsp;&nbsp; 대표이사 : 서효진 &nbsp;&nbsp; 사업자등록번호 : 138-81-05876 &nbsp;&nbsp; 통신판매업 신고번호 : 제2011-서울강남-02008호</td>
      </tr>
      <tr>
         <td>문의전화(평일 09:00~18:00) : 1566-7727 &nbsp;&nbsp; (유료)이메일 : meloninformation@iloen.com &nbsp;&nbsp;© 2016. LOEN Entertainment, Inc. ALL RIGHTS RESERVED.</td>
      </tr>
   
   </table>
   

   

</body>
</html>




<!--  <div align = "center" id = "stage2">
   
   <input type="radio" name="juso" checked="checked" id = "doro"/> <span class="up">도로명 주소</span>&nbsp;&nbsp; 
   <input type="radio" name="juso"/> <span class="up" id = "zibun">지번 주소</span>

   <p>
   <input type = "text" size = "20" placeholder = "검색 버튼을 눌러주세요"> <button id="search_button" >검색</button>
    </p>
    <label>우편번호</label><input type="text" size="4" class="postcodify_postcode6_1" /> &ndash;
    <label></label><input type="text" size="4" class="postcodify_postcode6_2" /> &nbsp;
    <script>()</script>
    <label>도로명주소</label><input type="text" class="postcodify_address" />
    <label>지번주소</label><input type="text" class="postcodify_jibeon_address" />
    <label>참고항목</label><input type="text" class="postcodify_extra_info" />

</div>  -->