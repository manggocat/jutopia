package jutopia.seasonticketAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class Season_Ticket_MoneyInfo_Form_Action implements CommandAction{
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		return "JSP/Season_Ticket/Season_Ticket_MoneyInfo_Form.jsp";
	}

}
