package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class ParkingplaceProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		
		return "JSP/Booking/hello.jsp";
	}

}
