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
		
		
		mypageDAO.MypageInfoUpdate(mypageVO);
		
		
		return "MyPageMainForm.do";
	}

}
