package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import util.TempKey;

public class SignUpInsertFormAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String key = new TempKey().getKey(6, false);

		request.setAttribute("key", key);
		return "/JSP/SignUp/SignUp_Insert_Form.jsp";
	}

}
