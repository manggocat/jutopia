package jutopia.bookingAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;
import jutopia.booking.BookingVO;

public class BookingFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("�굹���씪");
		List<BookingVO> list_reserved;
		ArrayList true_false = new ArrayList<Boolean>();
		BookingDAO dao = BookingDAO.getInstance();
		list_reserved = dao.getSelectPosition(request.getParameter("str_parking_place"));
		
		boolean disable_result =false;
		/*String[] array_reserved = new String[list_reserved.size()];
		for(int list_num = 0 ; list_num < list_reserved.size(); list_num++)
		{
			array_reserved[list_num] = list_reserved.get(list_num).toString();
			
		}*/
		
		request.setAttribute("arraylist", list_reserved);
		
		/*for(int i =0; i< list_reserved.size(); i++)
		{
		
			System.out.println("arraylist.getN_reserve_discrimintae:"+list_reserved.get(i).getN_reserve_discrimintae());
		}
		System.out.println("arraylist.getStr_parking_place:"+list_reserved.get(0).getStr_parking_place());*/
		
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
/*				System.out.println("result:"+result);
				System.out.println("disable_result:"+disable_result);*/
				true_false.add(disable_result);
			}
		}
		request.setAttribute("true_false_choice", true_false);
		
		/*for(int i = 0 ; i < true_false.size(); i++)
		{
		System.out.println(true_false.get(i));
		}*/
		return "/JSP/Booking/BookingForm.jsp";
	}

}
