package jutopia.mypageAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.mypage.MypageDAO;
import jutopia.mypage.MypageVO;

public class MyPageModifiedAction implements CommandAction{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session = req.getSession(true);
		MypageDAO mypageDAO = MypageDAO.get_Instance();
		MypageVO mypageVO = new MypageVO();
		mypageVO.setStr_User_ID_Email(req.getParameter("strUserId"));
		mypageVO.setStr_User_Pwd(req.getParameter("strUserpwd"));
		
		int nCheck=mypageDAO.MypageSelect(mypageVO);
		
		if(nCheck==1){
			mypageDAO.MyPageDelete(mypageVO);
			session.invalidate();
		}
			
		
		req.setAttribute("nCheck", nCheck);
		
		return "MyPageMainForm.do";
		
	}

	
}
