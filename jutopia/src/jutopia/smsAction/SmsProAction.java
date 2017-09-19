package jutopia.smsAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jutopia.action.CommandAction;
import jutopia.sms.SmsDAO;
import jutopia.sms.SmsVO;

public class SmsProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession(true);
		
		String strSIGN_UP_ID_EMAIL= (String)session.getAttribute("memID");
		String strAddress = req.getParameter("address");
		String strName = req.getParameter("name");
		SmsVO smsvo = new SmsVO();
		
		SmsDAO smsdao = new SmsDAO(req, resp);
	
		String a = "asdf";
		
		smsdao.send(smsdao.smsSelect(strSIGN_UP_ID_EMAIL));
		int smsCheck =1;
		req.setAttribute("smsCheck",smsCheck);
		
		return "mapparkinfo.do?address="+strAddress+"&name="+strName;
	}
}
