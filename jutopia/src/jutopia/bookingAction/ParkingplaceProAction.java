package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;
import jutopia.booking.BookingVO;
import jutopia.parking.ParkingVO;

public class ParkingplaceProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		BookingVO vo = new BookingVO();
		ParkingVO Pvo = new ParkingVO();
		System.out.println("ParkingplacePro : test1");
		
		vo.setStr_parking_place(request.getParameter("str_parking_place"));
		Pvo.setStr_parking_place(request.getParameter("str_parking_place"));
		vo.setN_reserve_discrimintae(Integer.parseInt(request.getParameter("n_reserve_discrimintae")));
		
		
		System.out.println("ParkingplacePro : test2");
		BookingDAO dao = BookingDAO.getInstance();
		dao.insert(vo);
		
		System.out.println("ParkingplacePro : test3");
		
		return "JSP/Booking/ParkingplacePro.jsp";
	}

}
