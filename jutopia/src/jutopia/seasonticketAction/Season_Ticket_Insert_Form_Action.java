package jutopia.seasonticketAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class Season_Ticket_Insert_Form_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("�뤌�븸�뀡 �솕�떎媛�");
		return "JSP/Season_Ticket/Season_Ticket_Insert_Form.jsp";
	}

}
