package jutopia.seasonticketAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.seasonticket.SeasonticketDAO;
import jutopia.seasonticket.SeasonticketVO;

public class Season_Tickiet_Parkinplace_Form_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<SeasonticketVO> list_season_reserved;
		
		ArrayList seat_discriminate = new ArrayList<Boolean>();
		SeasonticketDAO dao = SeasonticketDAO.getInstance();
		
		System.out.println("parking �꽆�뼱�삩媛� = " + request.getParameter("str_season_ticket_parking_lot"));
		System.out.println("parking �꽆�뼱�삩�닽�옄 = " + request.getParameter("n_season_ticket_start_date"));
		
		String str_season_ticket_parking_lot = request.getParameter("str_season_ticket_parking_lot");
		int n_season_ticket_start_date = Integer.parseInt(request.getParameter("n_season_ticket_start_date"));
		
		list_season_reserved = dao.getSelect_Season_Position(str_season_ticket_parking_lot, n_season_ticket_start_date);
		
		boolean list_result = false;
		
		request.setAttribute("season_arraylist", list_season_reserved);
		
		for(int a = 1; a <10; a++)
		{
			for(int j= 1; j<10; j++)
			{
				String result = a + "-" + j;
				list_result = false;
				for(int i = 0 ; i < list_season_reserved.size() ; i++)
				{
					System.out.println("二쇱감 醫뚯꽍 = " + list_season_reserved.get(i).getStr_season_ticket_position());
					if(result.equals(list_season_reserved.get(i).getStr_season_ticket_position()))
					{
						list_result = true;
					}
				}
				seat_discriminate.add(list_result);
			}
		}
		for(int i = 0; i<list_season_reserved.size(); i++)
		{
			
		}
		
		request.setAttribute("season_seat_discriminate", seat_discriminate);
		
		return "JSP/Season_Ticket/Season_Tickiet_Parkinplace_Form.jsp";
	}

}
