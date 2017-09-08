package jutopia.BoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return "jsp/board/writeForm.jsp" ;
	}

}