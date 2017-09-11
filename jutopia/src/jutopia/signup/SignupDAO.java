package jutopia.signup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;



public class SignupDAO {

	private static SignupDAO instance = new SignupDAO();
	
	public SignupDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static SignupDAO get_Instance() {
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

	
	public void Signup_insert(SignupVO signVO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		
		try{
			conn = getConnection();
			// 현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			sb.append("insert into SIGN_UP values(?,?,?,?,?) ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, signVO.getStr_User_ID_Email());
			pstmt.setString(2, signVO.getStr_User_Name());
			pstmt.setString(3, signVO.getStr_User_Pwd());
			pstmt.setString(4, signVO.getStr_User_Tel());
			pstmt.setString(5, signVO.getStr_Manager());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	
	
}
