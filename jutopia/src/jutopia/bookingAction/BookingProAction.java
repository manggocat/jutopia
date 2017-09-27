package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;
import jutopia.booking.BookingVO;
import jutopia.parking.ParkingDAO;
import jutopia.parking.ParkingVO;

public class BookingProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BookingVO vo = new BookingVO();
		ParkingVO Pvo = new ParkingVO();
		
		vo.setStr_parking_location(request.getParameter("str_parking_location"));
		vo.setStr_book_id_email(request.getParameter("str_book_id_email"));
		vo.setStr_book_name(request.getParameter("str_book_name"));
		vo.setStr_book_car_num(request.getParameter("str_book_car_num"));
		vo.setStr_book_car_kinds(request.getParameter("str_book_car_kinds"));
		vo.setStr_book_tel(request.getParameter("str_book_tel"));		
		vo.setDate_book_day(request.getParameter("date_book_day"));
		
		String start = request.getParameter("date_book_start_time");
		String end = request.getParameter("date_book_end_time");
		
		String Time_limit = start + "  ~  " + end;
		
		String start_hour = start.substring(0,2);
		String start_min = start.substring(3,5);
		String end_hour = end.substring(0,2);
		String end_min = end.substring(3,5);
		String end_time = end_hour + end_min;
		String start_time = start_hour + start_min;
		
		vo.setN_book_start(Integer.parseInt(start_time));
		vo.setN_book_end(Integer.parseInt(end_time));
		vo.setStr_parking_place(request.getParameter("str_parking_place"));
		vo.setN_reserve_discrimintae(Integer.parseInt(request.getParameter("n_reserve_discrimintae")));
		
		Pvo.setStr_parking_lot(request.getParameter("str_parking_location"));
		Pvo.setN_parking_discriminate(Integer.parseInt(request.getParameter("n_reserve_discrimintae")));
		Pvo.setStr_parking_book_day(request.getParameter("date_book_day"));
		Pvo.setN_parking_book_start(Integer.parseInt(start_time));
		Pvo.setN_parking_book_end(Integer.parseInt(end_time));
		Pvo.setStr_parking_position(request.getParameter("str_parking_place"));
		
		BookingDAO dao = BookingDAO.getInstance();
		dao.insert(vo);
		
		ParkingDAO Pdao = ParkingDAO.getInstance();
		Pdao.insert(Pvo);
		
		request.setAttribute("str_book_tel", request.getParameter("str_book_tel"));
		request.setAttribute("str_book_car_num", request.getParameter("str_book_car_num"));
		request.setAttribute("str_book_car_kinds", request.getParameter("str_book_car_kinds"));
		request.setAttribute("str_parking_location", request.getParameter("str_parking_location"));
		request.setAttribute("str_parking_place", request.getParameter("str_parking_place"));
		request.setAttribute("date_book_day", request.getParameter("date_book_day"));
		request.setAttribute("date_book_start_time", Time_limit);


		return "JSP/Booking/Booking_check.jsp";
	}

}
