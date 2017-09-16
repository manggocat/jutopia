<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.MimeUtility" %>
<%@ page import="java.util.Properties" %>
<%@ page import="util.TempKey" %>

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
    String toName = "심재삼";
    String toEmail = "spikeparaffa@gmail.com";


    // 보내는 사람의 정보
    // 정해진 정보로 세팅 하면 됩니다.
    String fromName = "choding hero";
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
        String key = new TempKey().getKey(5, false);

        // 이메일 전송내용 세팅
        Message msg = new MimeMessage(sess);
        msg.setFrom(addr);
        msg.setSubject(MimeUtility.encodeText("메일인증 입니다", "utf-8", "B"));
        msg.setContent("가입시 필요한 이메일 인증 코드를 입력해서 확인해 주세요.<br>[ "+key+" ]", "text/html;charset=utf-8");
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

        // todo 인증코드를 디비에 저장
        // ...

        // 메일전송
        Transport.send(msg);


    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
        return;
    }

    out.println("<script>alert('메일이 전송되었습니다.');<script>");

%>

<%
    /**
     * 참고사이트
     * http://handcoding.tistory.com/m/114
     * http://lovelyjk.tistory.com/65
     * http://devgwangpal.tistory.com/34
     *
     * 해당 이메일 인증은 참고용입니다.
     * 실제 프로젝트에서는 기획의도와 기능정의에 맞게 구현하시면 됩니다.
     * 위에 이메일전송을 위한 구글계정은 개발용으로 사용하셔두 되며 종강되면 제가 비밀번호 바꿔놓겠습니다.
     *
     * 이메일 인증으로 메일을 전송할때 생성한 인증코드를 디비에 동시에 저장하고 사용자가 메일을 확인하고 코드를 가입창에 입력하고 확인할때
     * 저장한 인증코드를 조회해서 검증하는 프로세스로 가면 됩니다.
     * 즉 생성한 이메일 인증코드는 서버에서 디비로 저장하는 걸 해야합니다.
     * 그래야 인증코드를 받은 사용자가 행동에 맞게 진행하는지 검증을 할수 있습니다.
     */
%>