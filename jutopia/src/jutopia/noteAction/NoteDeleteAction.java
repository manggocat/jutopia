package jutopia.noteAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.note.NoteDAO;
import jutopia.note.NoteVo;

public class NoteDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		NoteVo vo = new NoteVo();
		vo.setPage_num(Integer.parseInt(request.getParameter("page_num") == null ? "1" : request.getParameter("page_num")));
		vo.setNote_num(Integer.parseInt(request.getParameter("note_num")));

		NoteDAO dao = NoteDAO.getInstance();

		int check = dao.delete(vo.getNote_num());

		// ?ïÑ?ûò Î¶¨ÌÑ¥?éò?ù¥Ïß??óê Í∞ùÏ≤¥Î•? ?ã¥?äî?ã§.
		request.setAttribute("page_num", vo.getPage_num());
		request.setAttribute("note_num", vo.getNote_num());
		request.setAttribute("check", check);

		return "/noteList.do?page_num="+vo.getPage_num();
	}

}
