package jutopia.sms;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;
import sun.misc.BASE64Encoder;

public class SmsDAO {
	HttpServletRequest request;
	HttpServletResponse response;

	
	public String smsSelect(String szSIGN_UP_ID_EMAIL){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String rphone="";
		String[] arrAttribute = {"szSIGN_UP_TEL"};
		
		try{
			conn = DbManager.getConnection("jutopiaDB");
			pstmt = conn.prepareStatement(DbManager.select("Sign_up", arrAttribute, "szSIGN_UP_ID_EMAIL", szSIGN_UP_ID_EMAIL));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				rphone= rs.getString("szSIGN_UP_TEL");
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return rphone;
	}
	
	public SmsDAO(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
	}

	public static String nullcheck(String str, String Defaultvalue) throws Exception {
		String ReturnDefault = "";
		if (str == null) {
			ReturnDefault = Defaultvalue;
		} else if (str == "") {
			ReturnDefault = Defaultvalue;
		} else {
			ReturnDefault = str;
		}
		return ReturnDefault;
	}

	public static String base64Encode(String str) throws java.io.IOException {
		BASE64Encoder encoder = new BASE64Encoder();
		byte[] strByte = str.getBytes();
		String result = encoder.encode(strByte);
		System.out.println("result : "+result);
		return result;
	}

	public  void send(String strPhone)throws Exception{
		
		   String charsetType = "UTF-8"; //EUC-KR �삉�뒗 UTF-8

		    request.setCharacterEncoding(charsetType);
		    response.setCharacterEncoding(charsetType);
		    String  action     = nullcheck(request.getParameter("action"), "");
		    if(action.equals("go")) {

		        String sms_url = "";
		        sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS �쟾�넚�슂泥� URL
		        String user_id = base64Encode("wangi0304"); // SMS�븘�씠�뵒
		        String secure = base64Encode("76cbbe87090606943f1c49cf98588d5d");//�씤利앺궎
		        String msg = base64Encode(nullcheck(request.getParameter("msg"), ""));
		        System.out.println("msg:"+request.getParameter("msg"));
		        System.out.println("msg64:"+msg);
		        String rphone = base64Encode(nullcheck(strPhone, ""));
		        String sphone1 = base64Encode(nullcheck(request.getParameter("sphone1"), ""));
		        String sphone2 = base64Encode(nullcheck(request.getParameter("sphone2"), ""));
		        String sphone3 = base64Encode(nullcheck(request.getParameter("sphone3"), ""));
		        String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
		        String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
		        String mode = base64Encode("1");
		        String subject = "";
		        if(nullcheck(request.getParameter("smsType"), "").equals("L")) {
		            subject = base64Encode(nullcheck(request.getParameter("subject"), ""));
		        }
		        String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
		        String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
		        String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
		        String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
		        String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
		        String returnurl = nullcheck(request.getParameter("returnurl"), "");
		        String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
		        String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

		        String[] host_info = sms_url.split("/");
		        String host = host_info[2];
		        String path = "/" + host_info[3];
		        int port = 80;

		        // �뜲�씠�꽣 留듯븨 蹂��닔 �젙�쓽
		        String arrKey[]
		            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
		                        ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
		        String valKey[]= new String[arrKey.length] ;
		        valKey[0] = user_id;
		        valKey[1] = secure;
		        valKey[2] = msg;
		        valKey[3] = rphone;
		        valKey[4] = sphone1;
		        valKey[5] = sphone2;
		        valKey[6] = sphone3;
		        valKey[7] = rdate;
		        valKey[8] = rtime;
		        valKey[9] = mode;
		        valKey[10] = testflag;
		        valKey[11] = destination;
		        valKey[12] = repeatFlag;
		        valKey[13] = repeatNum;
		        valKey[14] = repeatTime;
		        valKey[15] = smsType;
		        valKey[16] = subject;

		        String boundary = "";
		        Random rnd = new Random();
		        String rndKey = Integer.toString(rnd.nextInt(32000));
		        MessageDigest md = MessageDigest.getInstance("MD5");
		        byte[] bytData = rndKey.getBytes();
		        md.update(bytData);
		        byte[] digest = md.digest();
		        for(int i =0;i<digest.length;i++)
		        {
		            boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		        }
		        boundary = "---------------------"+boundary.substring(0,11);

		        // 蹂몃Ц �깮�꽦
		        String data = "";
		        String index = "";
		        String value = "";
		        for (int i=0;i<arrKey.length; i++)
		        {
		            index =  arrKey[i];
		            value = valKey[i];
		            data +="--"+boundary+"\r\n";
		            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
		            data += "\r\n"+value+"\r\n";
		            data +="--"+boundary+"\r\n";
		        }

		        //out.println(data);

		        InetAddress addr = InetAddress.getByName(host);
		        Socket socket = new Socket(host, port);
		        // �뿤�뜑 �쟾�넚
		        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
		        wr.write("POST "+path+" HTTP/1.0\r\n");
		        wr.write("Content-Length: "+data.length()+"\r\n");
		        wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
		        wr.write("\r\n");

		        // �뜲�씠�꽣 �쟾�넚
		        wr.write(data);
		        wr.flush();

		        // 寃곌낵媛� �뼸湲�
		        BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
		        String line;
		        String alert = "";
		        ArrayList tmpArr = new ArrayList();
		        while ((line = rd.readLine()) != null) {
		            tmpArr.add(line);
		        }
		        wr.close();
		        rd.close();

		        String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
		        String[] rMsg = tmpMsg.split(",");
		        String Result= rMsg[0]; //諛쒖넚寃곌낵
		        String Count= ""; //�옍�뿬嫄댁닔
		        if(rMsg.length>1) {Count= rMsg[1]; }

		                        //諛쒖넚寃곌낵 �븣由�
		        if(Result.equals("success")) {
		            alert = "�꽦怨듭쟻�쑝濡� 諛쒖넚�븯���뒿�땲�떎.";
		            alert += " �옍�뿬嫄댁닔�뒗 "+ Count+"嫄� �엯�땲�떎.";
		        }
		        else if(Result.equals("reserved")) {
		            alert = "�꽦怨듭쟻�쑝濡� �삁�빟�릺�뿀�뒿�땲�떎";
		            alert += " �옍�뿬嫄댁닔�뒗 "+ Count+"嫄� �엯�땲�떎.";
		        }
		        else if(Result.equals("3205")) {
		            alert = "�옒紐삳맂 踰덊샇�삎�떇�엯�땲�떎.";
		        }
		        else {
		            alert = "[Error]"+Result;
		        }

		       /* out.println(nointeractive);

		        if(nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success")) && !(Result.equals("reserved")) ) {
		            out.println("<script>alert('" + alert + "')</script>");
		        }
		        else if(!(nointeractive.equals("1"))) {
		            out.println("<script>alert('" + alert + "')</script>");
		        }


		        out.println("<script>location.href='"+returnurl+"';</script>");*/
		    }
		
	}
}
