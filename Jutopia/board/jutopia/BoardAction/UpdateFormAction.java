package jutopia.BoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.BoardModel.*;

public class UpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		//request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		board_DAO dao = board_DAO.getInstance();
		board_VO vo = dao.getdetail_page(num); 

		request.setAttribute("pageNum", Integer.parseInt(pageNum) );
		request.setAttribute("vo",  vo);
		
		return "jsp/board/updateForm.jsp" ;
	}

}
