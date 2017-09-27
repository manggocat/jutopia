package jutopia.bookingAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;
import jutopia.booking.BookingVO;
import jutopia.parking.ParkingDAO;
import jutopia.parking.ParkingVO;

public class ParkingplaceFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		
		
		List<BookingVO> list_reserved;
		List<ParkingVO> list_parking;
		

		ArrayList true_false = new ArrayList<Boolean>();
		BookingDAO dao = BookingDAO.getInstance();
		ArrayList parking_true_false = new ArrayList<Boolean>();
		ParkingDAO Pdao = ParkingDAO.getInstance();
		
		String date_book_day = request.getParameter("date_book_day");
		String date_book_start_time = request.getParameter("date_book_start_time");
		String date_book_end_time = request.getParameter("date_book_end_time");
		String str_parking_location = request.getParameter("str_parking_location");
		
		
		String divide = date_book_day;
		String start = date_book_start_time;
		String end = date_book_end_time;
		
		int n_month = Integer.parseInt(divide.substring(5,7));
		String start_hour = start.substring(0,2);
		String start_min = start.substring(3,5);
		String start_time = start_hour + start_min;
		int n_start_time = Integer.parseInt(start_time);
		
		String end_hour = end.substring(0,2);
		String end_min = end.substring(3,5);
		String end_time = end_hour + end_min;
		int n_end_time = Integer.parseInt(end_time);
		
		
		list_parking = null;
		list_reserved= null;
		list_parking = Pdao.getReservationPosition(str_parking_location, n_month);
		list_reserved = dao.getSelectPosition(str_parking_location, date_book_day);
		
		boolean disable_result =false;
		
		
		
		
		
		request.setAttribute("arraylist", list_reserved);
	

		for(int a = 1; a < 10; a++)
		{
			for(int j = 1; j<10; j++)
			{
				String result = a + "-" + j;
				disable_result = false;
				for(int i =0; i< list_reserved.size(); i++)
				{	
					
					if(result.equals(list_reserved.get(i).getStr_parking_place()))
		               {
		                  if((list_reserved.get(i).getN_book_start() <= n_start_time) && (list_reserved.get(i).getN_book_end() >= n_start_time))
		                  {
		                  
		                  disable_result = true;
		                  }
		                  else if((list_reserved.get(i).getN_book_start() <= n_end_time) && (list_reserved.get(i).getN_book_start() >= n_start_time))
		                  {
		                     disable_result = true;
		                  }
		               }
				}
				
				for(int t=0; t < list_parking.size(); t++)
				{
					if(result.equals(list_parking.get(t).getStr_parking_position()))
					{
						
						disable_result = true;
					}
				}
				
				
				true_false.add(disable_result);
			}
		}
		
		for(int i = 0; i< list_parking.size(); i++)
		{
			
		}
		request.setAttribute("true_false_choice", true_false);
	

		return "JSP/Booking/ParkingplaceForm.jsp";
	}

}
