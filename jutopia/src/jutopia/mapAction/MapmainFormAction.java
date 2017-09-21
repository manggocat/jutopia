package jutopia.mapAction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.map.LatestSearchVO;
import jutopia.map.MapMainDAO;
import jutopia.map.MapMainVO;

public class MapmainFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(true);
		int count = 0;
		MapMainDAO mapmainDAO =  MapMainDAO.getInstance();
		MapMainVO mapmainVO = new MapMainVO();
		mapmainVO.setStr_User_ID_Email((String)session.getAttribute("memID"));
		

		List<LatestSearchVO> listsearch = mapmainDAO.searchselect(mapmainVO);
	
		req.setAttribute("listsearch", listsearch);
		
	
		
		return"/JSP/Map/MapMain.jsp";
	}
}
