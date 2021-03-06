package jutopia.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.board.BoardDAO;
import jutopia.board.BoardVO;

public class UpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.update(num); 

		request.setAttribute("pageNum", Integer.parseInt(pageNum) );
		request.setAttribute("vo",  vo);
		
		return "JSP/board/updateForm.jsp" ;
	}

}
