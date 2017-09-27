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
		
		
		return "/JSP/MyPage/MyPageUpdateForm.jsp";
	}

}
