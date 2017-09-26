package jutopia.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.board.BoardDAO;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO  dao = BoardDAO.getInstance();
		String N_num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		System.out.println(N_num);
		
		dao.delete(new Integer(N_num)); 
		
		request.setAttribute("num", N_num);
		request.setAttribute("pageNum", pageNum);

		
		return "JSP/board/deletePro.jsp" ;
	}

}





