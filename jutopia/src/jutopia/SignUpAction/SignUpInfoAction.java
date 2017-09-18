package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class SignUpInfoAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return "JSP/Sign_Up/Sign_Up_Info.jsp";
	}

}
