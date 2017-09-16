package jutopia.signup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;



public class SignupDAO {

	private static SignupDAO instance = new SignupDAO();
	/*private static DbConnection dbConnection;*/
	public SignupDAO() {
		/*DbConnection.getData();*/
		// TODO Auto-generated constructor stub
	}
	
	public static SignupDAO get_Instance() {
		return instance;
	}
		
	/*dbConnection.list(a);*/
	
	public void Signup_insert(SignupVO signVO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		
		try{
			
			conn = DbManager.getConnection("SignupDB");
			// 현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			String[] arrAttribute = {"sz_user_id_email","sz_user_name","sz_user_pwd",
					"sz_user_tel"};
			
			String[] arrValue={signVO.getStr_User_ID_Email(),signVO.getStr_User_Name(),
							   signVO.getStr_User_Pwd(),signVO.getStr_User_Tel(),
							   };
			
			System.out.println("signVO.getStr_Manager():"+signVO.getStr_Manager());
			System.out.println("insert:"+DbManager.insert("SIGN_UP",arrAttribute,arrValue));
			pstmt = conn.prepareStatement(DbManager.insert("SIGN_UP",arrAttribute,arrValue));
			
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
