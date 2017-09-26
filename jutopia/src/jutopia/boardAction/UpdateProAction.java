package jutopia.boardAction;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jutopia.action.CommandAction;
import jutopia.board.BoardDAO;
import jutopia.board.BoardVO;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest multi = null;
		
		int sizeLimit = 10*1024*1024;
		
		String savePath = request.getRealPath("/upload");
		
		try{
			multi = new MultipartRequest(request,savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		}catch(Exception e){
			e.printStackTrace();
		}
		request.setCharacterEncoding("UTF-8");  
		
		String pageNum = multi.getParameter("pageNum");
		BoardVO vo = new BoardVO();
		
		vo.setN_num(Integer.parseInt(multi.getParameter("num")));
		vo.setStr_subject(multi.getParameter("subject"));
		vo.setStr_id_email(multi.getParameter("id_email"));
		vo.setStr_content(multi.getParameter("content"));
		vo.setStr_boardfile(multi.getFilesystemName("boardfile"));
		BoardDAO dao = BoardDAO.getInstance();
		 dao.update(vo);  
		
		 request.setAttribute("vo", vo);
		request.setAttribute("pageNum", pageNum);
		
		
		return "JSP/board/updatePro.jsp";
	}

}
