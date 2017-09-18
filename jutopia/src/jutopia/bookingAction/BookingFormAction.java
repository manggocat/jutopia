package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class BookingFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	/*	System.out.println("�굹���씪1");
		List<BookingVO> list_reserved;
		System.out.println("�굹���씪2");
		ArrayList true_false = new ArrayList<Boolean>();
		System.out.println("�굹���씪3");
		BookingDAO dao = BookingDAO.getInstance();
		System.out.println("�굹���씪4");
		list_reserved = dao.getSelectPosition(request.getParameter("str_parking_place"));
		System.out.println("�굹���씪5");
		boolean disable_result =false;
		String[] array_reserved = new String[list_reserved.size()];
		for(int list_num = 0 ; list_num < list_reserved.size(); list_num++)
		{
			array_reserved[list_num] = list_reserved.get(list_num).toString();
			
		}
		System.out.println("�굹���씪6");
		request.setAttribute("arraylist", list_reserved);
		System.out.println("�굹���씪7");
		for(int i =0; i< list_reserved.size(); i++)
		{
		
			System.out.println("arraylist.getN_reserve_discrimintae:"+list_reserved.get(i).getN_reserve_discrimintae());
		}
		System.out.println("arraylist.getStr_parking_place:"+list_reserved.get(0).getStr_parking_place());
		System.out.println("�굹���씪8");
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
		
		for(int i = 0 ; i < true_false.size(); i++)
		{
		System.out.println(true_false.get(i));
		}*/
		return "JSP/Booking/BookingForm.jsp";
	}

}
