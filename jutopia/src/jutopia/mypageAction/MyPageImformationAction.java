package jutopia.mypageAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.mypage.MypageDAO;
import jutopia.mypage.MypageVO;

public class MyPageImformationAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<MypageVO> listImformation;
		List<MypageVO> listImformation_Season;

		MypageDAO dao = MypageDAO.get_Instance();
		MypageVO mypageVO = new MypageVO();
		HttpSession session = request.getSession(true);
		mypageVO.setStr_User_ID_Email((String) session.getAttribute("memID"));
		mypageVO = dao.MypageInfoSelect(mypageVO);

		String str_User_ID_Email = (String) session.getAttribute("memID");
		String strLastReservationStartTime = "";
		String strLastReservationEndTime = "";
		String strLastReservationPlace = "";
		String strLastSeasonStartTime = "";
		String strLastSeasonEndTime = "";

		listImformation = dao.getBookingMyImformation(str_User_ID_Email);
		listImformation_Season = dao.getSeasonMyImformation(str_User_ID_Email);

		if (listImformation.size() != 0) {
			strLastReservationPlace = String.valueOf(listImformation.get(0).getStr_parking_location());

			if (String.valueOf(listImformation.get(0).getN_book_start()).length() > 3) {
				strLastReservationStartTime = String.valueOf(listImformation.get(0).getN_book_start()).substring(0, 2)
						+ ":" + String.valueOf(listImformation.get(0).getN_book_start()).substring(2, 4);
			} else if (String.valueOf(listImformation.get(0).getN_book_start()).length() == 1) {
				strLastReservationStartTime = "0:0" + String.valueOf(listImformation.get(0).getN_book_start());
			} else if (String.valueOf(listImformation.get(0).getN_book_start()).length() == 2) {
				strLastReservationStartTime = "0:" + String.valueOf(listImformation.get(0).getN_book_start());
			} else {
				strLastReservationStartTime = String.valueOf(listImformation.get(0).getN_book_start()).substring(0, 1)
						+ ":" + String.valueOf(listImformation.get(0).getN_book_start()).substring(1, 3);
			}

			if (String.valueOf(listImformation.get(0).getN_book_end()).length() > 3) {
				strLastReservationEndTime = String.valueOf(listImformation.get(0).getN_book_end()).substring(0, 2) + ":"
						+ String.valueOf(listImformation.get(0).getN_book_end()).substring(2, 4);
			} else if (String.valueOf(listImformation.get(0).getN_book_end()).length() == 1) {
				strLastReservationEndTime = "0:0" + String.valueOf(listImformation.get(0).getN_book_end());
			} else if (String.valueOf(listImformation.get(0).getN_book_end()).length() == 2) {
				strLastReservationEndTime = "0:" + String.valueOf(listImformation.get(0).getN_book_end());
			} else {
				strLastReservationEndTime = String.valueOf(listImformation.get(0).getN_book_end()).substring(0, 1) + ":"
						+ String.valueOf(listImformation.get(0).getN_book_end()).substring(1, 3);
			}
		} else {
			strLastReservationPlace = " ";
			strLastReservationStartTime = " 없음 ";
			strLastReservationEndTime = " 없음 ";

		}
//
		if (listImformation_Season.size() != 0) {
			
			if (String.valueOf(listImformation_Season.get(0).getN_book_start()).length() > 3) {
				strLastSeasonStartTime = String.valueOf(listImformation_Season.get(0).getN_book_start()).substring(0, 2)
						+ ":" + String.valueOf(listImformation.get(0).getN_book_start()).substring(2, 4);
			} else if (String.valueOf(listImformation_Season.get(0).getN_book_start()).length() == 1) {
				strLastSeasonStartTime = "0:0" + String.valueOf(listImformation_Season.get(0).getN_book_start());
			} else if (String.valueOf(listImformation_Season.get(0).getN_book_start()).length() == 2) {
				strLastSeasonStartTime = "0:" + String.valueOf(listImformation_Season.get(0).getN_book_start());
			} else {
				strLastSeasonStartTime = String.valueOf(listImformation_Season.get(0).getN_book_start()).substring(0, 1)
						+ ":" + String.valueOf(listImformation_Season.get(0).getN_book_start()).substring(1, 3);
			}

			if (String.valueOf(listImformation_Season.get(0).getN_book_end()).length() > 3) {
				strLastSeasonEndTime = String.valueOf(listImformation_Season.get(0).getN_book_end()).substring(0, 2) + ":"
						+ String.valueOf(listImformation_Season.get(0).getN_book_end()).substring(2, 4);
			} else if (String.valueOf(listImformation_Season.get(0).getN_book_end()).length() == 1) {
				strLastSeasonEndTime = "0:0" + String.valueOf(listImformation_Season.get(0).getN_book_end());
			} else if (String.valueOf(listImformation_Season.get(0).getN_book_end()).length() == 2) {
				strLastSeasonEndTime = "0:" + String.valueOf(listImformation_Season.get(0).getN_book_end());
			} else {
				strLastSeasonEndTime = String.valueOf(listImformation_Season.get(0).getN_book_end()).substring(0, 1) + ":"
						+ String.valueOf(listImformation_Season.get(0).getN_book_end()).substring(1, 3);
			}
		} else {
			strLastSeasonStartTime = " 없음 ";
			strLastSeasonEndTime = " 없음 ";
		}

		

		request.setAttribute("strLastReservationPlace", strLastReservationPlace);
		request.setAttribute("strLastReservationStartTime", strLastReservationStartTime);
		request.setAttribute("strLastReservationEndTime", strLastReservationEndTime);
		request.setAttribute("nLastReservationSize", listImformation.size());
		request.setAttribute("nLastSeasonReservationSize", listImformation_Season.size());
		request.setAttribute("strLastSeasonStartTime", strLastSeasonStartTime);
		request.setAttribute("strLastSeasonEndTime", strLastSeasonEndTime);
	
		
		request.setAttribute("mypageVO", mypageVO);
		return "/JSP/MyPage/My_Imformation.jsp";
	}

}
