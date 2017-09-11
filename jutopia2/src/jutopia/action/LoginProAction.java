package jutopia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.login.LoginDAO;
import jutopia.login.LoginVO;

public class LoginProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(false);
		 /*if(session != null){  
		      session.invalidate();  
		     }*/
		LoginDAO loginDAO = LoginDAO.get_Instance();
		LoginVO loginVO = new LoginVO();
		
		String strtotal_mail = req.getParameter("login_mail_1") 
				+ "@" 
				+  req.getParameter("login_mail_2");		
		loginVO.setStr_User_ID_Email(strtotal_mail);
		loginVO.setStr_User_Pwd(req.getParameter("login_pwd"));
		
		int result = loginDAO.Login_select(loginVO);
		if(result ==1){
			session = req.getSession(true);
			session.setAttribute("memID",strtotal_mail);
			
		}
		return "/JSP/Signup/test.jsp";
	}
}
