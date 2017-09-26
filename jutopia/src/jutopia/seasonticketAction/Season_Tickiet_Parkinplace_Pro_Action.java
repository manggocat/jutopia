package jutopia.seasonticketAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class Season_Tickiet_Parkinplace_Pro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "JSP/Season_Ticket/Season_Tickiet_Parkinplace_Pro.jsp";
	}

}
