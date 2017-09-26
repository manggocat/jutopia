package jutopia.noteAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.note.NoteDAO;
import jutopia.note.NoteVo;

public class NoteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		NoteVo vo = new NoteVo();
		vo.setNote_recipient(request.getParameter("note_recipient"));
		vo.setNote_sender(request.getParameter("note_sender"));
		vo.setNote_contents(request.getParameter("note_contents"));

		NoteDAO dao = NoteDAO.getInstance();

		int check = dao.insert(vo);

		// ?ïÑ?ûò Î¶¨ÌÑ¥?éò?ù¥Ïß??óê Í∞ùÏ≤¥Î•? ?ã¥?äî?ã§.
		request.setAttribute("note", vo);
		request.setAttribute("check", check);

		return "noteList.do";
	}

}
