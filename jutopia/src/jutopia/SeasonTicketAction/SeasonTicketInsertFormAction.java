package jutopia.SeasonTicketAction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class SeasonTicketInsertFormAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "JSP/Season_Ticket/Season_Ticket_Insert_Form.jsp";
	}

}
