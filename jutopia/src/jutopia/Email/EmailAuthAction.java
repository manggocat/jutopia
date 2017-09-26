package jutopia.Email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.action.CommandAction;

public class EmailAuthAction extends Authenticator implements CommandAction {
	PasswordAuthentication pa;

	public EmailAuthAction() {
		pa = new PasswordAuthentication("herochoding@gmail.com", "herogg3#");
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	
	public void mailsned(){
		
		
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		String toEmail = req.getParameter("email");
		String toName = toEmail;

		// ������ ����� ����
		// ������ ������ ���� �ϸ� �˴ϴ�.
		String fromName = "jootophia";
		String fromEmail = "herochoding@gmail.com";
		String key = req.getParameter("code");
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
			Authenticator myauth = new EmailAuthAction();
			Session sess = Session.getInstance(props, myauth);

			// ������ ������� ����
			InternetAddress addr = new InternetAddress();
			addr.setPersonal(fromName, "UTF-8");
			addr.setAddress(fromEmail);

			// �����ڵ带 �����Ѵ�.
		

			// �̸��� ���۳��� ����
			Message msg = new MimeMessage(sess);
			msg.setFrom(addr);
			msg.setSubject(MimeUtility.encodeText("�������� �Դϴ�", "utf-8", "B"));
			msg.setContent("���Խ� �ʿ��� �̸��� ���� �ڵ带 �Է��ؼ� Ȯ���� �ּ���.<br>[ " + key + " ]", "text/html;charset=utf-8");
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

			// todo �����ڵ带 ��� ����
			// ��

			// ��������
			Transport.send(msg);
		
		} catch (Exception e) {
			e.printStackTrace();

		}
		

		return "SignUp_InsertForm.do";
	}
}
