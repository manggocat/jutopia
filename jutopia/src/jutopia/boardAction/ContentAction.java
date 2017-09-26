package jutopia.boardAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.board.BoardDAO;
import jutopia.board.BoardVO;


public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception  {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.getDataDetail(num); 
		
		int ref = vo.getN_ref();
		int re_step = vo.getN_re_step();
		int re_level = vo.getN_re_level();
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("vo", vo);		
		
		return "JSP/board/content.jsp";
	}

}
