package jutopia.BoardAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.BoardModel.board_DAO;
import jutopia.BoardModel.board_VO;


public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception  {
		
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		board_DAO dao = board_DAO.getInstance();
		board_VO vo = dao.getdetail_page(num); 
		
		if(vo !=null){
			vo.setBOARD_READCOUNT(dao.update_readcount(num));
		}
		
		request.setAttribute("vo", vo);		
		
		return "jsp/board/content.jsp";
	}

}
