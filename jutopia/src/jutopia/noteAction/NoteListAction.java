package jutopia.noteAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.note.NoteDAO;
import jutopia.note.NoteVo;

public class NoteListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
	
	
		NoteVo vo = new NoteVo();
		vo.setPage_num(Integer.parseInt(request.getParameter("page_num") == null ? "1" : request.getParameter("page_num")));
		vo.setNote_sender((String)session.getAttribute("memID")); // "paraffa@naver.com" ?�� ?��?��미터?�� 로그?��?�� ?��?��?��?�� ?��?��?��?�� �??��?���? ?��?��.
		
		NoteDAO dao = NoteDAO.getInstance();

		// 총카?��?��
		int totalCount = dao.getSelectAllCount(vo.getNote_sender());

		// 미답�? 카운?��
		int unreadCount = dao.getSelectAllUnreadCount(vo.getNote_sender());

		// ?��?���?
		PagingUtil pageutil = new PagingUtil(totalCount, vo.getPage_num(), vo.getPage_limit());

		int start = (vo.getPage_num() - 1) * vo.getPage_limit()+1;
		int end   = start + vo.getPage_limit()-1;

		// �?리자?���? 받�? 쪽�?�? 조회?��?��?�� 쿼리 조건?���? ?���? ?��?��?��.
		List<NoteVo> noteList = dao.getSelectAll(vo.getNote_sender(), start, end);

		// ?��?�� 리턴?��?���??�� 객체�? ?��?��?��.
		request.setAttribute("note", vo);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("unreadCount", unreadCount);
		request.setAttribute("noteList", noteList);
		request.setAttribute("page_num", vo.getPage_num());
		request.setAttribute("page", pageutil.print());

		return "JSP/note/noteList.jsp";
	}

}
