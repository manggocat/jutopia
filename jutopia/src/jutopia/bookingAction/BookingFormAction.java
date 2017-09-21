package jutopia.bookingAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.booking.BookingDAO;
import jutopia.mypage.MypageDAO;
import jutopia.mypage.MypageVO;

public class BookingFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		
		BookingDAO bookingDAO = BookingDAO.getInstance();
		MypageVO mypageVO = new MypageVO();
		
		mypageVO.setStr_User_ID_Email((String)session.getAttribute("memID"));
		mypageVO = bookingDAO.BookingInfoSelect(mypageVO);
		
		request.setAttribute("BookingVO", mypageVO);
		
		return "JSP/Booking/BookingForm.jsp";
	}

}
