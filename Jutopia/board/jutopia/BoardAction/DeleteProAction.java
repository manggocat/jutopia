package jutopia.BoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.BoardModel.board_DAO;
import jutopia.BoardModel.board_VO;
import jutopiaUtil.FileUtil;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		board_DAO  dao = board_DAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pwd = request.getParameter("pwd");
		
		int check = dao.userCheck(num, pwd); 
		
		if(check == 1){
			board_VO vo = dao.getdetail_page(num);
			dao.delete(num);
			
			if(vo.getBOARD_IMG() !=null){
				FileUtil.removeFile(vo.getBOARD_IMG());
			}
		}
		
		request.setAttribute("check", check);
		
		return "jsp/board/deletePro.jsp" ;
	}

}





