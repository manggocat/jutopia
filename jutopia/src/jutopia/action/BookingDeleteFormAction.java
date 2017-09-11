package jutopia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookingDeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String str_book_car_num = request.getParameter("str_book_car_num");
		
		request.setAttribute("str_book_car_num", str_book_car_num);
		
		return "/JSP/Booking/BookingDeleteForm.jsp";
	}

}
