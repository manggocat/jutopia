package jutopia.SeasonTicketAction;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.Season_Ticket.Season_Ticket_DAO;
import jutopia.Season_Ticket.Season_Ticket_VO;
import jutopia.action.CommandAction;

public class SeasonTicketInsertProAction extends HttpServlet implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Season_Ticket_VO vo = new Season_Ticket_VO();
		
		vo.setSEASON_TICKET_NAME(request.getParameter("season_ticket_name"));
		vo.setSEASON_TICKET_TEL(request.getParameter("season_ticket_tel"));
		vo.setSEASON_TICKET_ID_EMAIL(request.getParameter("season_ticket_email"));
		vo.setSEASON_TICKET_CAR_KINDS(request.getParameter("season_ticket_kinds"));
		vo.setSEASON_TICKET_CAR_NUM(request.getParameter("season_ticket_num"));
		vo.setSEASON_TICKET_REDUCTION(request.getParameter("season_ticket_Reduction"));

		Season_Ticket_DAO dao = Season_Ticket_DAO.getInstance(); //연결
		
		int result = dao.insert(vo);
		
		return "JSP/Season_Ticket/Season_Ticket_Insert_Pro.jsp";
	}

}
