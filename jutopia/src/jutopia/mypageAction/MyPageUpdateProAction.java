package jutopia.mypageAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.mypage.MypageDAO;
import jutopia.mypage.MypageVO;

public class MyPageUpdateProAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		MypageDAO mypageDAO = MypageDAO.get_Instance();
		MypageVO mypageVO = new MypageVO();
		
		mypageVO.setStr_User_ID_Email((String)session.getAttribute("memID"));
		
		
		
		mypageVO.setStr_User_Name(request.getParameter("strUsername"));
		mypageVO.setStr_User_Tel(request.getParameter("strUsertel"));
		mypageVO.setStr_User_Pwd(request.getParameter("strUserpwd"));
		
		System.out.println("strUsername"+request.getParameter("strUsername"));
		mypageDAO.MypageInfoUpdate(mypageVO);
		
		/*HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		
		//String SIGN_UP_ID_EMAIL = (String)session.getAttribute("SIGN_UP_ID_EMAIL");
		//vo.setSIGN_UP_ID_EMAIL(SIGN_UP_ID_EMAIL);
		
		Sign_up_DAO dao = Sign_up_DAO.getInstance();
		dao.update(vo);
		
		Sign_up_DAO dao = Sign_up_DAO.getInstance();
		ArrayList<Sign_up_VO> list = dao.selectAll();
		Sign_up_VO vo = null;

		
		//String SIGN_UP_ID_EMAIL = vo.getSIGN_UP_ID_EMAIL();
		String SIGN_UP_NAME = vo.getSIGN_UP_NAME();
		String SIGN_UP_PWD = vo.getSIGN_UP_PWD();
		
		
		session.setAttribute("SIGN_UP_NAME", SIGN_UP_NAME);
		session.setAttribute("SIGN_UP_PWD", SIGN_UP_PWD);
		*/
		
		return "MyPageMainForm.do";
	}

}
