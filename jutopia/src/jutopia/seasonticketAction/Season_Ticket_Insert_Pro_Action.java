package jutopia.seasonticketAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.seasonparking.Season_ParkingDAO;
import jutopia.seasonparking.Season_ParkingVO;
import jutopia.seasonticket.SeasonticketDAO;
import jutopia.seasonticket.SeasonticketVO;

public class Season_Ticket_Insert_Pro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		SeasonticketVO vo = new SeasonticketVO();
		Season_ParkingVO Svo = new Season_ParkingVO();
		
		vo.setStr_season_ticket_parking_lot(request.getParameter("str_season_ticket_parking_lot"));
		vo.setStr_season_ticket_id_email(request.getParameter("str_season_ticket_id_email") + "@" +request.getParameter("str_season_ticket_email2"));
		vo.setStr_season_ticket_name(request.getParameter("str_season_ticket_name"));
		vo.setStr_season_ticket_car_num(request.getParameter("str_season_ticket_car_num"));
		vo.setStr_season_ticket_position(request.getParameter("str_season_ticket_position"));
		vo.setStr_season_ticket_car_kinds(request.getParameter("str_season_ticket_car_kinds"));
		vo.setStr_season_ticket_reduction(request.getParameter("book_reduction"));
		vo.setN_season_ticket_start_date(Integer.parseInt(request.getParameter("n_season_ticket_start_date")));
		vo.setStr_season_ticket_end_date(request.getParameter("str_season_ticket_end_date"));
		vo.setStr_season_ticket_tel(request.getParameter("str_season_ticket_tel"));
		vo.setN_season_ticket_discriminate(Integer.parseInt(request.getParameter("n_season_ticket_discriminate")));
		
		Svo.setN_parking_discriminate(Integer.parseInt(request.getParameter("n_season_ticket_discriminate")));
		Svo.setN_parking_season_start_date(Integer.parseInt(request.getParameter("n_season_ticket_start_date")));
		Svo.setStr_parking_lot(request.getParameter("str_season_ticket_parking_lot"));
		Svo.setStr_parking_position(request.getParameter("str_season_ticket_position"));
		
		SeasonticketDAO dao = SeasonticketDAO.getInstance();
		dao.insert(vo);
		
		Season_ParkingDAO Sdao = Season_ParkingDAO.getInstance();
		Sdao.insert(Svo);
		
		request.setAttribute("str_season_ticket_name", request.getParameter("str_season_ticket_name"));
		request.setAttribute("str_season_ticket_tel", request.getParameter("str_season_ticket_tel"));
		request.setAttribute("str_season_ticket_car_num", request.getParameter("str_season_ticket_car_num"));
		request.setAttribute("str_season_ticket_car_kinds", request.getParameter("str_season_ticket_car_kinds"));
		request.setAttribute("str_season_ticket_parking_lot", request.getParameter("str_season_ticket_parking_lot"));
		request.setAttribute("str_season_ticket_position", request.getParameter("str_season_ticket_position"));
		request.setAttribute("n_season_ticket_start_date", request.getParameter("n_season_ticket_start_date") + "월");
		request.setAttribute("str_book_reduction", request.getParameter("book_reduction"));
		
		
		return "JSP/Season_Ticket/Season_Ticket_Check.jsp";
	}

}
