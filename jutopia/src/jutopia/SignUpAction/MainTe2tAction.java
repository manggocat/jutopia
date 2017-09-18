package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.Sign_Up.Sign_up_VO;
import jutopia.action.CommandAction;

public class MainTe2tAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Sign_up_VO vo = new Sign_up_VO();
		
		String SIGN_UP_NAME = request.getParameter("SIGN_UP_NAME");
		
		vo.setSIGN_UP_NAME(SIGN_UP_NAME);
		
		request.setAttribute("SIGN_UP_NAME", SIGN_UP_NAME);
		request.setAttribute("vo", vo);
		return "JSP/Sign_Up/Main_Te2t.jsp";
	}

}
