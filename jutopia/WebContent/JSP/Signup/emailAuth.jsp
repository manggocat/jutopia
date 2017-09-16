<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.MimeUtility" %>
<%@ page import="java.util.Properties" %>
<%@ page import="jutopia.email.TempKey" %>

<%!
    public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
        PasswordAuthentication pa;

        public MyAuthentication() {
            pa = new PasswordAuthentication("herochoding@gmail.com", "herogg3#");
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return pa;
        }
    }
%>

<%

	

    // 받는 사람의 정보
    // 파라미터로 받는걸 구현해야합니다.
    
    String toEmail = request.getParameter("email");
    String toName = toEmail;


    // 보내는 사람의 정보
    // 정해진 정보로 세팅 하면 됩니다.
    String fromName = "jootophia";
    String fromEmail = "herochoding@gmail.com";

    try {

        // 이메일 설정값 세팅
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");

        props.put("mail.debug", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.EnableSSL.enable","true");

        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.setProperty("mail.smtp.port", "465");

        // 메일 인증
        Authenticator myauth = new MyAuthentication();
        Session sess = Session.getInstance(props, myauth);

        // 보내는 사람정보 셋팅
        InternetAddress addr = new InternetAddress();
        addr.setPersonal(fromName, "UTF-8");
        addr.setAddress(fromEmail);

        // 인증코드를 생성한다.
        String key = request.getParameter("code");

        // 이메일 전송내용 세팅
        Message msg = new MimeMessage(sess);
        msg.setFrom(addr);
        msg.setSubject(MimeUtility.encodeText("메일인증 입니다", "utf-8", "B"));
        msg.setContent("가입시 필요한 이메일 인증 코드를 입력해서 확인해 주세요.<br>[ "+key+" ]", "text/html;charset=utf-8");
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

        // todo 인증코드를 디비에 저장
        // …

        // 메일전송
        Transport.send(msg);


    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
        return;
    }

    out.println("<script>alert('메일이 전송되었습니다.');<script>");

%>