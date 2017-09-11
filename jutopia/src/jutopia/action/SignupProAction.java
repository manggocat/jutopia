package jutopia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.signup.SignupDAO;
import jutopia.signup.SignupVO;

public class SignupProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		SignupDAO signupDAO = SignupDAO.get_Instance();
		SignupVO signupVO = new SignupVO();
		

		
		String strtotal_mail = req.getParameter("text_mail_1") 
							+ "@" 
							+  req.getParameter("text_mail_2");
		
		String strtel=req.getParameter("user_hp1")+req.getParameter("user_hp2")+req.getParameter("user_hp3");
		
		System.out.println("인설트1");
		
		signupVO.setStr_User_ID_Email(strtotal_mail);
		signupVO.setStr_User_Name(req.getParameter("user_name"));
		signupVO.setStr_User_Pwd(req.getParameter("user_pwd"));
		signupVO.setStr_User_Tel(strtel);
		//signupVO.set(req.getParameter("sign_up_Reduction"));
		
		
		
		
		
		 signupDAO.Signup_insert(signupVO); 
		
		 
		
	/*	response.sendRedirect("member_login_Form.jsp");*/
		return "/JSP/Signup/member_insert_Pro.jsp";
	}
}
