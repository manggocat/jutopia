package jutopia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MapmainFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		return "/JSP/Map/MapMain.jsp";
	}
}
