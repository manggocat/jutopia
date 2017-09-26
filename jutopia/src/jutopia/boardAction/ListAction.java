package jutopia.boardAction;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.board.BoardDAO;
import jutopia.board.BoardVO;

public class ListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		int pageSize =7;
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");

		String pageNum = request.getParameter("pageNum");
		String Str_option = request.getParameter("Str_option");
		String Str_search = request.getParameter("Str_search");
		
		
		if( pageNum == null ) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);  // 1
		int startRow = (currentPage * pageSize) - 6 ;  // 1
		int endRow = currentPage * pageSize ;  // 7
		int count = 0, number = 0;
		
		List<BoardVO> list = null;
		BoardDAO  dao = BoardDAO.getInstance();
		count = dao.getListAllCount(startRow, endRow,Str_option,Str_search);
		
		System.out.println("count"+count);
		if( count > 0 ) {
			list = dao.getSelectAll(startRow, endRow,Str_option,Str_search); 
			
		} else {
			list = Collections.EMPTY_LIST ;
		}
	
		
		number = count - (currentPage - 1) * pageSize ;		 // ex) 9
	
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);
		
		return "JSP/board/list.jsp";
	}

}






