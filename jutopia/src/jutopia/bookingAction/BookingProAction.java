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
		request.setCharacterEncoding("UTF-8");
		System.out.println("test1");
		BookingVO vo = new BookingVO();
		ParkingVO Pvo = new ParkingVO();
		
		System.out.println("test2");
		System.out.println("二쇱감�옣 = " + request.getParameter("str_parking_location"));
		/*vo.setN_book_num(Integer.parseInt(request.getParameter("n_book_num")));*/
		vo.setStr_parking_location(request.getParameter("str_parking_location"));
		vo.setStr_book_id_email(request.getParameter("str_book_id_email"));
		vo.setStr_book_name(request.getParameter("str_book_name"));
		vo.setStr_book_car_num(request.getParameter("str_book_car_num"));
		vo.setStr_book_car_kinds(request.getParameter("str_book_car_kinds"));
		vo.setStr_book_tel(request.getParameter("str_book_tel"));
/*		System.out.println("date_book_day"+request.getParameter("date_book_day"));*/		
		vo.setDate_book_day(request.getParameter("date_book_day"));
		vo.setDate_book_start_time(request.getParameter("date_book_start_time"));
		vo.setDate_book_end_time(request.getParameter("date_book_end_time"));
		vo.setStr_parking_place(request.getParameter("str_parking_place"));
		vo.setN_reserve_discrimintae(Integer.parseInt(request.getParameter("n_reserve_discrimintae")));
		
		Pvo.setDate_parking_day(request.getParameter("date_book_day"));
		Pvo.setDate_parking_start_time(request.getParameter("date_book_start_time"));
		Pvo.setDate_parking_end_time(request.getParameter("date_book_end_time"));
		Pvo.setStr_parking_place(request.getParameter("str_parking_place"));
		
		System.out.println("test3");
		BookingDAO dao = BookingDAO.getInstance();
		dao.insert(vo);
		
		ParkingDAO Pdao = ParkingDAO.getInstance();
		Pdao.insert(Pvo);
		
		return "JSP/Booking/BookingPro.jsp";
	}

}
