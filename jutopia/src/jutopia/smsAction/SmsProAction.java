package jutopia.smsAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;
import jutopia.sms.SmsDAO;
import jutopia.sms.SmsVO;

public class SmsProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		
		
		SmsVO smsvo = new SmsVO();
		
		SmsDAO smsdao = new SmsDAO(req, resp);
		smsdao.send();
		return null;
	}
}
