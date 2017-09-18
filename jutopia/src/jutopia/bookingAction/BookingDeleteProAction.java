package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;

public class BookingDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		System.out.println("test1");
		BookingDAO dao = BookingDAO.getInstance();
		String str_book_car_num = request.getParameter("str_book_car_num");
		
		int check = dao.delete(str_book_car_num);
		System.out.println("test1");
		
		request.setAttribute("str_book_car_num", str_book_car_num);
		
		return "JSP/Booking/BookingDeletePro.jsp";
	}

}
