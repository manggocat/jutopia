package jutopia.FindpwdAction;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.Findpwd.FindpwdDAO;
import jutopia.Findpwd.FindpwdVO;
import jutopia.action.CommandAction;
import util.TempKey;

public class FindpwdProAction extends Authenticator implements CommandAction {
	PasswordAuthentication pa;

	public FindpwdProAction() {
		pa = new PasswordAuthentication("herochoding@gmail.com", "herogg3#");
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String toEmail = req.getParameter("text_mail_1")+"@"+req.getParameter("text_mail_2");
		
		String strName = req.getParameter("name");
		String strTel = req.getParameter("tel");
	
		FindpwdDAO findpwdDAO = FindpwdDAO.getInstance();
		FindpwdVO findpwdVO = new FindpwdVO();
		findpwdVO.setSIGN_UP_ID_EMAIL(toEmail);
		findpwdVO.setSIGN_UP_NAME(strName);
		findpwdVO.setSIGN_UP_TEL(strTel);
		int check = findpwdDAO.FindpwdSelect(findpwdVO);
		
		
		if (check == 1) {
			
			String toName = toEmail;

			// ������ ����� ����
			// ������ ������ ���� �ϸ� �˴ϴ�.
			String fromName = "jootophia";
			String fromEmail = "herochoding@gmail.com";
			String key = new TempKey().getKey(6, false);
			findpwdVO.setSIGN_UP_PWD(key);
			try {

				// �̸��� ������ ����
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.auth", "true");

				props.put("mail.debug", "true");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.EnableSSL.enable", "true");

				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.setProperty("mail.smtp.socketFactory.fallback", "false");
				props.setProperty("mail.smtp.socketFactory.port", "465");
				props.setProperty("mail.smtp.port", "465");

				// ���� ����
				Authenticator myauth = new FindpwdProAction();
				Session sess = Session.getInstance(props, myauth);

				// ������ ������� ����
				InternetAddress addr = new InternetAddress();
				addr.setPersonal(fromName, "UTF-8");
				addr.setAddress(fromEmail);

				// �����ڵ带 �����Ѵ�.

				// �̸��� ���۳��� ����
				Message msg = new MimeMessage(sess);
				msg.setFrom(addr);
				msg.setSubject(MimeUtility.encodeText("�ӽ� ��й�ȣ  �Դϴ�", "utf-8", "B"));
				msg.setContent("�ӽ� ��й�ȣ�� �̿��Ͽ� �α����� ��й�ȣ�� ������ �ּ���.<br>[ " + key + " ]", "text/html;charset=utf-8");
				msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

				// todo �����ڵ带 ��� ����
				// ��

				// ��������
				Transport.send(msg);

				findpwdDAO.FindpwdUpdate(findpwdVO);
				
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		
		req.setAttribute("pwdcheck", check);
		return "FindpwdFormAction.do";
	}

}
