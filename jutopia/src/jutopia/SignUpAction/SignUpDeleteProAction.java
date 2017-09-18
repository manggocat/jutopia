package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.Sign_Up.Sign_up_DAO;
import jutopia.Sign_Up.Sign_up_VO;
import jutopia.action.CommandAction;

public class SignUpDeleteProAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		Sign_up_VO vo = new Sign_up_VO();
		
		//String Sign_Up_Id_Email = (String)session.getAttribute("SIGN_UP_ID_EMAIL");
		//vo.setSIGN_UP_ID_EMAIL(Sign_Up_Id_Email);
		
		Sign_up_DAO dao = Sign_up_DAO.getInstance();
		dao.delete(vo);
		
		
		return "/JSP/Sign_Up/Sign_Up_Delete_Pro.jsp";
	}

}
