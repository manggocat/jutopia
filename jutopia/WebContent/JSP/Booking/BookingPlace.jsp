<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
</head>
<body>
ㅈ됨
</body>
</html>




package user;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
   
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
   }
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int valid_flag =F -1;
      int u_year=0;
      int u_month=0;
      int u_day=0;
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      String userID = request.getParameter("userID");
      String userPassword1 = request.getParameter("userPassword1");
      String userPassword2 = request.getParameter("userPassword2");
      String userName = request.getParameter("userName");
      String userYear = request.getParameter("userYear");
      String userMonth = request.getParameter("userMonth");
      String userDay = request.getParameter("userDay");
      String userPhone = request.getParameter("userPhone");
      String userEmail = request.getParameter("userEmail");
      String userOption = request.getParameter("userOption");
      
      if(userID == null || userID.equals("") ||
            userPassword1 == null || userPassword1.equals("") ||
            userPassword2 == null || userPassword2.equals("") ||
            userName == null || userName.equals("") ||
            userYear == null || userYear.equals("") ||
            userMonth == null || userMonth.equals("") ||
            userDay == null || userDay.equals("") ||
            userPhone == null || userPhone.equals("") ||
            userEmail == null || userEmail.equals("")) {
         valid_flag = 0;
         response.getWriter().write(valid_flag+"");
         return;
      }
      
      Pattern pw1_pt = Pattern.compile("(^[a-zA-Z0-9]{8,16}$)");
      Pattern pw2_pt = Pattern.compile("(^[a-zA-Z0-9]{8,16}$)");
      Pattern name_pt = Pattern.compile("(^[가-힣]{2,8}$)");
      Pattern year_pt = Pattern.compile("(^[0-9]{4}$)");
      Pattern month_pt = Pattern.compile("(^[0-9]{1,2}$)");
      Pattern day_pt = Pattern.compile("(^[0-9]{1,2}$)");
      Pattern phone_pt = Pattern.compile("(^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$)");
      Pattern email_pt = Pattern.compile("(^[a-zA-Z0-9]+@[a-zA-Z0-9].+$)");
      Matcher pw1_m = pw1_pt.matcher(userPassword1);
      Matcher pw2_m = pw2_pt.matcher(userPassword2);
      Matcher name_m = name_pt.matcher(userName);
      Matcher year_m = year_pt.matcher(userYear);
      Matcher month_m = month_pt.matcher(userMonth);
      Matcher day_m = day_pt.matcher(userDay);
      Matcher phone_m = phone_pt.matcher(userPhone);
      Matcher email_m = email_pt.matcher(userEmail);
      
      if(pw1_m.find() && pw2_m.find()){
         if (!userPassword1.equals(userPassword2)) { //비밀번호가 일치하지 않을 때
            valid_flag = 1;
            response.getWriter().write(valid_flag + "");
            return;
         }
      }
      else{ //비밀번호를 제대로 입력해야함
         valid_flag = 2;
         response.getWriter().write(valid_flag + "");
         return;
      }
      
      if(name_m.find()){
      }
      else{
         valid_flag = 3;
         response.getWriter().write(valid_flag + "");
         return;
      }
   
      
      if(year_m.find()){
         u_year = Integer.parseInt(userYear);
      }
      else{
         valid_flag = 4;
         response.getWriter().write(valid_flag + "");
         return;
      }
      
      if(month_m.find()){
         u_month = Integer.parseInt(userMonth);
      }
      else{
         valid_flag = 4;
         response.getWriter().write(valid_flag + "");
         return;
      }
      
      if(day_m.find()){
         u_day = Integer.parseInt(userDay);
      }
      else{
         valid_flag = 4;
         response.getWriter().write(valid_flag + "");
         return;
      }
      
      if(phone_m.find()){
      }
      else{
         valid_flag = 5;
         response.getWriter().write(valid_flag + "");
         return;
      }
      
      if(email_m.find()){
      }
      else{
         valid_flag = 6;
         response.getWriter().write(valid_flag + "");
         return;
      }
      
      
      
      
      UserDTO user = new UserDTO();
      user.setJoin_id(userID);
      user.setJoin_pw(userPassword1);
      user.setJoin_name(userName);
      user.setJoin_year(u_year);
      user.setJoin_month(u_month);
      user.setJoin_day(u_day);
      user.setJoin_phone(userPhone);
      user.setJoin_email(userEmail);
      user.setJoin_option(userOption);
      try {
         int result = new UserDAO().register(user);
         
         if(result == 1){ //회원가입 성공 했을 때
            valid_flag = 7;
            response.getWriter().write(valid_flag+"");
         }
         else { //회원가입 실패 (이미 아이디가 있는 경우)
            valid_flag = 8;
            response.getWriter().write(valid_flag+"");
         }
      } catch (Exception e) {
         
      }
   }
}