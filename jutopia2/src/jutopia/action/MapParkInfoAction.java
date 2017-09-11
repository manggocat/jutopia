package jutopia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MapParkInfoAction implements CommandAction {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		
		String strname = req.getParameter("name");
		String straddress = req.getParameter("address");
		String straddress2 = req.getParameter("address2");
		if (straddress.length() == 0) {
			straddress = straddress2;
		}
		
		req.setAttribute("name", strname);
		req.setAttribute("address", straddress);
		
		
		return "/JSP/Map/MapParkInfo.jsp";
	}

}
