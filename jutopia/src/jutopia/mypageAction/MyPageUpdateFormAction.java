package jutopia.mypageAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.SignUp.Sign_up_DAO;
import jutopia.SignUp.Sign_up_VO;
import jutopia.action.CommandAction;
import jutopia.mypage.MypageDAO;
import jutopia.mypage.MypageVO;

public class MyPageUpdateFormAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(true);
		MypageDAO mypageDAO = MypageDAO.get_Instance();
		MypageVO mypageVO = new MypageVO();
		
		mypageVO.setStr_User_ID_Email((String)session.getAttribute("memID"));
		
		mypageVO = mypageDAO.MypageInfoSelect(mypageVO);
		
		
		request.setAttribute("mypageVO", mypageVO);
		
		
		
		/*HttpSession session = request.getSession(true);
		
		request.setCharacterEncoding("UTF-8");
		
		String SIGN_UP_ID_EMAIL = request.getParameter("SIGN_UP_ID_EMAIL");		
		Sign_up_DAO dao = Sign_up_DAO.getInstance();
		Sign_up_VO vo = dao.getDataDetail(SIGN_UP_ID_EMAIL); 
		
		
		String SIGN_UP_NAME = vo.getSIGN_UP_NAME();
		String SIGN_UP_PWD = vo.getSIGN_UP_PWD();
		
		request.setAttribute("SIGN_UP_NAME", SIGN_UP_NAME);
		request.setAttribute("SIGN_UP_PWD", SIGN_UP_PWD);
		request.setAttribute("vo", vo);		
		
		request.setAttribute("nUpdateCheck", nUpdateCheck);*/
		
		return "/JSP/MyPage/MyPageUpdateForm.jsp";
	}

}
