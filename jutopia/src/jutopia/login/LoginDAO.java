package jutopia.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import jutopia.signup.SignupVO;



public class LoginDAO {

	private static LoginDAO instance = new LoginDAO();
	
	public LoginDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static LoginDAO get_Instance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:SignupDB");
		// DataSource ds = (DataSource)
		// ctx.lookup("java:comp/env/jdbc:BoardDB"); 이렇게 한줄로도 사용 할수 있다
		return ds.getConnection();
	}
	
	public int Login_select(LoginVO loginVO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		int result= -1;
		
		try{
			conn = getConnection();
			// 현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			sb.append("select sz_user_id_email, sz_user_pwd from Sign_up where sz_user_id_email = ? ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, loginVO.getStr_User_ID_Email());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString(2).equalsIgnoreCase(loginVO.getStr_User_Pwd())){
					
					result = 1;
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return result;
	}
	
}
