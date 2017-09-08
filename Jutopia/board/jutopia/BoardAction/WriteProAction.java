package jutopia.BoardAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import jutopia.BoardModel.*;
import jutopiaUtil.FileUtil;


public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		MultipartRequest multi =FileUtil.createFile(request);
		
		board_VO vo = new board_VO();
		
		vo.setBOARD_NUM(Integer.parseInt(request.getParameter("num")));
		vo.setBOARD_SUBJECT(request.getParameter("subject"));  
		vo.setBOARD_ID_EMAIL(request.getParameter("email"));
		vo.setBOARD_CONTENT(request.getParameter("content"));
		vo.setBOARD_PWD(request.getParameter("passwd"));
		
		vo.setBOARD_WRITE_DATE(new Timestamp(System.currentTimeMillis()));
		
		vo.setBOARD_IMG((FileUtil.rename("img")));
		board_DAO dao = board_DAO.getInstance();
		dao.insert(vo);
		
		return "jsp/board/writePro.jsp";
	}

}
