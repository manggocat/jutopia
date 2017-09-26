package jutopia.noteAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.note.NoteDAO;
import jutopia.note.NoteVo;


public class NoteAdminShowProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("note_num"));// ?ƒ?„¸ë³´ê¸° ?•˜? ¤ë©? ?•´?‹¹ ë²ˆí˜¸?˜
	
		NoteDAO dao = NoteDAO.getInstance();
		NoteVo vo = dao.getDataDetail(num); // ?ƒ?„¸ë³´ê¸° ë©”ì†Œ?“œ(num?— ?ˆ?Š” valueê°? ê°?? ¸???„œ vo?— ?‹´?Œ)

	
		request.setAttribute("note_num", new Integer(num));
	    request.setAttribute("note", vo);
		
		return "JSP/note/noteAdminShowForm.jsp";
	}

}
