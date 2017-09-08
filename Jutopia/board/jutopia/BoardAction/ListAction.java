package jutopia.BoardAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.BoardModel.board_DAO;
import jutopia.BoardModel.board_VO;
import jutopia.BoardModel.board_page_VO;

public class ListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		if (keyfield == null) {
			keyfield = "";
		}
		if (keyword == null) {
			keyword = "";
		}

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		int pageSize = 20;
		int currentpage = Integer.parseInt(pageNum);
		int startrow = (currentpage - 1) * pageSize + 1;
		int endrow = currentpage * pageSize;
		int count = 0;
		int number = 0;

		List<board_VO> pagelist = null;
		board_DAO vo = board_DAO.getInstance();
		count = vo.getdetailcount(keyfield, keyword);

		if (count > 0) {
			pagelist = vo.getshow_list(startrow, endrow, keyfield, keyword);
		}
		// 가짜 글번호
		number = count - (currentpage - 1) * pageSize;

		board_page_VO page = new board_page_VO();
		page.setBOARD_COUNT(count);
		page.setBOARD_CURRENTPAGE(currentpage);
		page.setBOARD_NUMBER(number);
		page.setBOARD_PAGESIZE(pageSize);
		page.setBOARD_KEYFIELD(keyfield);
		page.setBOARD_KEYWORD(keyword);

		request.setAttribute("page", page);
		request.setAttribute("pagelist", pagelist);;

		return "jsp/board/list.jsp";
	}

}
