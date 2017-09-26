package jutopia.noteAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.note.NoteDAO;
import jutopia.note.NoteVo;

public class NoteReplyProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		NoteVo vo = new NoteVo();
		vo.setNote_num(Integer.parseInt(request.getParameter("note_num")));
		vo.setNote_reply(request.getParameter("note_reply"));
		
		System.out.println("note_num : " + request.getParameter("note_num"));
		System.out.println("note_reply : " + request.getParameter("note_reply"));

		NoteDAO dao = NoteDAO.getInstance();

		int check = dao.insertReply(vo);

		// ?ïÑ?ûò Î¶¨ÌÑ¥?éò?ù¥Ïß??óê Í∞ùÏ≤¥Î•? ?ã¥?äî?ã§.
		request.setAttribute("note", vo);
		request.setAttribute("check", check);

		return "JSP/note/noteForm.jsp";
	}

}
