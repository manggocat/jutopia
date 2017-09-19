package jutopia.SignUpAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.SignUp.Sign_up_DAO;
import jutopia.SignUp.Sign_up_VO;
import jutopia.action.CommandAction;

public class SignUpInsertProAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		Sign_up_VO vo = new Sign_up_VO();
		
		String sign_up_name = request.getParameter("sign_up_name");

		String text_mail_1 = request.getParameter("text_mail_1");
		String text_mail_2 = request.getParameter("text_mail_2");
		String total_mail = text_mail_1 + "@" + text_mail_2;
		
	
		vo.setSIGN_UP_ID_EMAIL(total_mail);
		vo.setSIGN_UP_NAME(sign_up_name);
		vo.setSIGN_UP_PWD(request.getParameter("sign_up_pwd"));
		vo.setSIGN_UP_TEL(request.getParameter("sign_up_tel"));
		vo.setSIGN_UP_REDUCTION(request.getParameter("sign_up_Reduction"));

		Sign_up_DAO dao = Sign_up_DAO.getInstance(); //�뿰寃�
		int result = dao.insert(vo);
		
		
		//response.sendRedirect("Main_Test.jsp");

		
		return "mapmainForm.do";
	}

}
