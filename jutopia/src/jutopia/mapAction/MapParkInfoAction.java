package jutopia.mapAction;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.map.MapParkInfoDAO;
import jutopia.map.MapParkInfoVO;

public class MapParkInfoAction implements CommandAction {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(true);
		MapParkInfoDAO mapparkinfoDAO =  MapParkInfoDAO.getInstance();
		MapParkInfoVO mapparkinfoVO = new MapParkInfoVO();
		String strname = req.getParameter("name");
		String straddress = req.getParameter("address");
		String straddress2 = req.getParameter("address2");
		String strUrl=req.getRequestURI();
		if (straddress.length() == 0) {
			straddress = straddress2;
		}
		
		req.setAttribute("name", strname);
		req.setAttribute("address", straddress);
		
		if((String)session.getAttribute("memID")!=null){
		mapparkinfoVO.setStr_User_ID_Email((String)session.getAttribute("memID"));
		mapparkinfoVO.setStr_Searchword(strname);
		mapparkinfoVO.setStr_Address(straddress);
		mapparkinfoVO.setTime_searchtime(new Timestamp(System.currentTimeMillis()));
		mapparkinfoDAO.insert(mapparkinfoVO);
		}
		return "/JSP/Map/MapParkInfo.jsp";
	}

}
