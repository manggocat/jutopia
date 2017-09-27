package jutopia.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class CompanyinfoAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		return "JSP/CompanyProfile/info.jsp";
	}
}
