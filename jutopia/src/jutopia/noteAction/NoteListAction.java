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
		vo.setNote_sender((String)session.getAttribute("memID")); // "paraffa@naver.com" ?´ ?ŒŒ?¼ë¯¸í„°?Š” ë¡œê·¸?¸?•œ ?‚¬?š©??˜ ?„¹?…˜?—?„œ ê°?? ¸?˜¤ë©? ?œ?‹¤.
		
		NoteDAO dao = NoteDAO.getInstance();

		// ì´ì¹´?š´?Š¸
		int totalCount = dao.getSelectAllCount(vo.getNote_sender());

		// ë¯¸ë‹µë³? ì¹´ìš´?Š¸
		int unreadCount = dao.getSelectAllUnreadCount(vo.getNote_sender());

		// ?˜?´ì§?
		PagingUtil pageutil = new PagingUtil(totalCount, vo.getPage_num(), vo.getPage_limit());

		int start = (vo.getPage_num() - 1) * vo.getPage_limit()+1;
		int end   = start + vo.getPage_limit()-1;

		// ê´?ë¦¬ì?—ê²? ë°›ì? ìª½ì?ë¥? ì¡°íšŒ?• ?•Œ?Š” ì¿¼ë¦¬ ì¡°ê±´?œ¼ë¡? ?”°ë¡? ?•´?•¼?•¨.
		List<NoteVo> noteList = dao.getSelectAll(vo.getNote_sender(), start, end);

		// ?•„?˜ ë¦¬í„´?˜?´ì§??— ê°ì²´ë¥? ?‹´?Š”?‹¤.
		request.setAttribute("note", vo);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("unreadCount", unreadCount);
		request.setAttribute("noteList", noteList);
		request.setAttribute("page_num", vo.getPage_num());
		request.setAttribute("page", pageutil.print());

		return "JSP/note/noteList.jsp";
	}

}
