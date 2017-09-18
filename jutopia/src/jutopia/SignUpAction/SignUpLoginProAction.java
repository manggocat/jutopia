package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.Sign_Up.Sign_up_DAO;
import jutopia.Sign_Up.Sign_up_VO;
import jutopia.action.CommandAction;

public class SignUpLoginProAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		Sign_up_VO vo = new Sign_up_VO();
		
		String text_mail_1 = request.getParameter("text_mail_1");
		String text_mail_2 = request.getParameter("text_mail_2");
		
		String SIGN_UP_ID_EMAIL = text_mail_1 + "@" + text_mail_2 ;
		
		//String SIGN_UP_ID_EMAIL = request.getParameter("SIGN_UP_ID_EMAIL");
		String SIGN_UP_PWD = request.getParameter("login_pwd");
		
		Sign_up_DAO dao = Sign_up_DAO.getInstance();
		int check = dao.userCheck(SIGN_UP_ID_EMAIL, SIGN_UP_PWD);

		if ( check == 1 ) {
		session.setAttribute("SIGN_UP_ID_EMAIL", SIGN_UP_ID_EMAIL);
		
		
		}
		request.setAttribute("check", check);

		return "JSP/Sign_Up/Sign_Up_Login_Pro.jsp";
	}

}
