package jutopia.BoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import jutopia.BoardModel.board_DAO;
import jutopia.BoardModel.board_VO;
import jutopiaUtil.FileUtil;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");  
		
		MultipartRequest multi = FileUtil.createFile(request);
		
		//전송 이미지 정보
		
		String img = multi.getFilesystemName("img");
		/*String pagenum = multi.getFilesystemName("pagenum");*/
		board_DAO dao = board_DAO.getInstance();
		
		//인증
		int check =dao.userCheck(Integer.parseInt(multi.getParameter("num")),multi.getParameter("passwd"));

		if(check==1){
			/*String pageNum = request.getParameter("pageNum");*/
			String original_image = multi.getParameter("origin_img");
			
			board_VO vo = new board_VO();
			
			vo.setBOARD_NUM(Integer.parseInt(request.getParameter("num")));
			vo.setBOARD_SUBJECT(request.getParameter("subject"));
			vo.setBOARD_ID_EMAIL(request.getParameter("email"));
			vo.setBOARD_CONTENT(request.getParameter("content"));
			vo.setBOARD_PWD(request.getParameter("pwd"));
			
			if(img !=null){
				vo.setBOARD_IMG(FileUtil.rename(img));
			}else{
				if(img !=null)FileUtil.removeFile(img);
			}
		}
		
		/*request.setAttribute("pageNum", pageNum);*/
		request.setAttribute("check", new Integer(check));	
		
		return "jsp/board/updatePro.jsp";
	}

}
