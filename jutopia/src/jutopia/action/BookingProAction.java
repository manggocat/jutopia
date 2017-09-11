package jutopia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.booking.BookingDAO;
import jutopia.booking.BookingVO;

public class BookingProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println("test1");
		BookingVO vo = new BookingVO();
		System.out.println("test2");
		/*vo.setN_book_num(Integer.parseInt(request.getParameter("n_book_num")));*/
		vo.setStr_book_id_email(request.getParameter("str_book_id_email"));
		vo.setStr_book_name(request.getParameter("str_book_name"));
		vo.setStr_book_car_num(request.getParameter("str_book_car_num"));
		vo.setStr_book_car_kinds(request.getParameter("str_book_car_kinds"));
		vo.setStr_book_tel(request.getParameter("str_book_tel"));
		vo.setDate_book_day(request.getParameter("date_book_day"));
		vo.setDate_book_start_time(request.getParameter("date_book_start_time"));
		vo.setDate_book_start_time(request.getParameter("date_book_end_time"));
		System.out.println("test3");
		BookingDAO dao = BookingDAO.getInstance();
		dao.insert(vo);
		System.out.println("test4");
		
		return "/JSP/Booking/BookingPro.jsp";
	}

}
