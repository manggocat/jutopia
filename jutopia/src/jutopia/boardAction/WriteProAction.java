package jutopia.boardAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jutopia.action.CommandAction;
import jutopia.board.BoardDAO;
import jutopia.board.BoardVO;


public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		
		MultipartRequest multi = null;
		
		int sizeLimit = 10*1024*1024;
		
		String savePath = request.getRealPath("/upload");
		
		try{
			multi = new MultipartRequest(request,savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	
		
		BoardVO vo = new BoardVO();
		vo.setN_num(Integer.parseInt(multi.getParameter("num")));
		vo.setStr_subject(multi.getParameter("subject"));  
		vo.setStr_id_email(multi.getParameter("id_email"));
		vo.setStr_content(multi.getParameter("content"));
		vo.setStr_boardfile(multi.getFilesystemName("boardfile"));
		
		vo.setDate_reg_date(new Timestamp(System.currentTimeMillis()));
		vo.setN_ref(Integer.parseInt(multi.getParameter("ref")));
		vo.setN_re_step(Integer.parseInt(multi.getParameter("re_step")));
		vo.setN_re_level(Integer.parseInt(multi.getParameter("re_level")));
	
	
		BoardDAO dao = BoardDAO.getInstance();
		dao.insert(vo);
		
		return "JSP/board/writePro.jsp";
	}

}
