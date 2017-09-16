package jutopia.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;
import jutopia.login.LoginVO;
import jutopia.signup.SignupDAO;
import jutopia.signup.SignupVO;

public class MypageDAO {

	private static MypageDAO instance = new MypageDAO();
	/*private static DbConnection dbConnection;*/
	public MypageDAO() {
		/*DbConnection.getData();*/
		// TODO Auto-generated constructor stub
	}
	
	public static MypageDAO get_Instance() {
		return instance;
	}
	
	public void MyPageDelete(MypageVO mypageVO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		
		try{
			
			conn = DbManager.getConnection("SignupDB");
			// 현재 board 테이블에 레코드 유무 판단과 글 번호 지정
						
			pstmt = conn.prepareStatement(DbManager.delete("Sign_up", "sz_user_id_email", mypageVO.getStr_User_ID_Email()));
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	public int MypageSelect(MypageVO mypageVO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		int result= -1;
		
		try{
			conn =DbManager.getConnection("SignupDB");
			// 현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			String[] arrAttribute={"sz_user_id_email","sz_user_pwd"};
			
			
			pstmt = conn.prepareStatement(DbManager.select("Sign_Up", arrAttribute, 
					"sz_user_id_email", mypageVO.getStr_User_ID_Email()));
			
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				if(rs.getString(2).equalsIgnoreCase(mypageVO.getStr_User_Pwd())){
					
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