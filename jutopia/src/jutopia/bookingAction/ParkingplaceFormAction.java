package jutopia.bookingAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;
import jutopia.booking.BookingVO;

public class ParkingplaceFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("�굹���씪1");
		List<BookingVO> list_reserved;
		/*List<BookingVO> date_book_day_list;
		List<BookingVO> date_book_start_time_list;
		List<BookingVO> date_book_end_time_list;*/
		
		
		
		
		ArrayList true_false = new ArrayList<Boolean>();
		BookingDAO dao = BookingDAO.getInstance();
		
		/*String date_book_day = request.getParameter("date_book_day");
		DateFormat	 sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utildate = sdf.parse(date_book_day);
		java.sql.Date sqlDate = new java.sql.Date(utildate.getTime());
		Date Date_date_book_day = sqlDate;*/
		
		String date_book_day = request.getParameter("date_book_day");
		String date_book_start_time = request.getParameter("date_book_start_time");
		String date_book_end_time = request.getParameter("date_book_end_time");
		String str_parking_location = request.getParameter("str_parking_location");
		list_reserved = dao.getSelectPosition(str_parking_location, date_book_day ,date_book_start_time,date_book_end_time);
	
		
		boolean disable_result =false;
		
		/*for(int i = 0; i < list_reserved.size();i++)
		{
			System.out.println("list = "+list_reserved.get(i).getStr_parking_place());
		}*/
		
		request.setAttribute("arraylist", list_reserved);
		System.out.println("�굹���씪7");
		System.out.println("list_reserved.size()"+list_reserved.size());
/*		System.out.println("arraylist.getStr_parking_place:"+list_reserved.get(0).getStr_parking_place());*/		System.out.println("�굹���씪8");
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
						System.out.println(" 李얠븯�떎 !!! list_reserved:"+list_reserved.get(i).getStr_parking_place());
						disable_result = true;
					}

				}
				System.out.println("result:"+result);
				System.out.println("disable_result:"+disable_result);
				true_false.add(disable_result);
			}
		}
		request.setAttribute("true_false_choice", true_false);
		System.out.println("�굹���씪9");

		return "JSP/Booking/ParkingplaceForm.jsp";
	}

}
