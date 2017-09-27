package jutopia.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;



public class LoginDAO {

	private static LoginDAO instance = new LoginDAO();
	
	public LoginDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static LoginDAO get_Instance() {
		return instance;
	}

	public int Login_select(LoginVO loginVO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		int result= -1;
		
		try{
			conn =DbManager.getConnection("SignupDB");
			// �쁽�옱 board �뀒�씠釉붿뿉 �젅肄붾뱶 �쑀臾� �뙋�떒怨� 湲� 踰덊샇 吏��젙
			String[] arrAttribute={"sz_user_id_email","sz_user_pwd"};
			
			
			pstmt = conn.prepareStatement(DbManager.select("Sign_Up", arrAttribute, 
					"sz_user_id_email", loginVO.getStr_User_ID_Email()));
			
			
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
