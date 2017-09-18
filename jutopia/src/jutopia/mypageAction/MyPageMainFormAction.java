package jutopia.mypageAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.mypage.MypageDAO;
import jutopia.mypage.MypageVO;

public class MyPageMainFormAction implements CommandAction{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(true);
		MypageDAO mypageDAO = MypageDAO.get_Instance();
		MypageVO mypageVO = new MypageVO();
		
		mypageVO.setStr_User_ID_Email((String)session.getAttribute("memID"));
		
		mypageVO = mypageDAO.MypageInfoSelect(mypageVO);
		
		
		req.setAttribute("mypageVO", mypageVO);
		
		return "/JSP/MyPage/MyPage_Main.jsp";
	}
}
