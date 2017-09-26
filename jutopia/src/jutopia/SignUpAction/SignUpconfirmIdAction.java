package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.SignUp.Sign_up_DAO;
import jutopia.action.CommandAction;

public class SignUpconfirmIdAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String total_mail = request.getParameter("email1") + "@" + request.getParameter("email2");

		Sign_up_DAO dao = Sign_up_DAO.getInstance();
		int check = dao.confirmID(total_mail);
		
		request.setAttribute("check", check);
		request.setAttribute("email1", email1);
		request.setAttribute("email2", email2);
		request.setAttribute("total_mail", total_mail);
		return "JSP/SignUp/SignUp_confirmId.jsp";
	}

}
