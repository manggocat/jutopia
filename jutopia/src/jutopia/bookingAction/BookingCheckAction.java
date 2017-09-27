package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class BookingCheckAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "JSP/Booking/Booking_check.jsp";
	}

}
