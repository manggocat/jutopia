package jutopia.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;

public class MypageDAO {

	private static MypageDAO instance = new MypageDAO();

	/* private static DbConnection dbConnection; */
	public MypageDAO() {
		/* DbConnection.getData(); */
		// TODO Auto-generated constructor stub
	}

	public static MypageDAO get_Instance() {
		return instance;
	}

	
	
	public void MypageInfoUpdate(MypageVO mypageVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] arrAttribute = {"sz_user_name","sz_user_pwd","sz_user_tel"};
		String[] arrValue = {mypageVO.getStr_User_Name(),mypageVO.getStr_User_Pwd(),mypageVO.getStr_User_Tel()};
		
		try{
			conn = DbManager.getConnection("SignupDB");
			pstmt = conn.prepareStatement(DbManager.update("Sign_up", arrAttribute, arrValue, "sz_user_id_email", mypageVO.getStr_User_ID_Email()));
			
			pstmt.executeUpdate();
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		
	}
	
	public MypageVO MypageInfoSelect(MypageVO mypageVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DbManager.getConnection("SignupDB");
			String[] arrAttribute = { "sz_user_id_email","sz_user_name","sz_user_tel","sz_user_pwd"};

			pstmt = conn.prepareStatement(DbManager.select("Sign_up", arrAttribute, "sz_user_id_email", mypageVO.getStr_User_ID_Email()));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mypageVO.setStr_User_ID_Email(rs.getString("sz_user_id_email"));
				mypageVO.setStr_User_Name(rs.getString("sz_user_name"));
				mypageVO.setStr_User_Tel(rs.getString("sz_user_tel"));
				mypageVO.setStr_User_Pwd(rs.getString("sz_user_pwd"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		
		return mypageVO;
	}

	public void MyPageDelete(MypageVO mypageVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {

			conn = DbManager.getConnection("SignupDB");
			// �쁽�옱 board �뀒�씠釉붿뿉 �젅肄붾뱶 �쑀臾� �뙋�떒怨� 湲� 踰덊샇 吏��젙

			pstmt = conn
					.prepareStatement(DbManager.delete("Sign_up", "sz_user_id_email", mypageVO.getStr_User_ID_Email()));

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}

	public int MypageSelect(MypageVO mypageVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();

		int result = -1;

		try {
			conn = DbManager.getConnection("SignupDB");
			// �쁽�옱 board �뀒�씠釉붿뿉 �젅肄붾뱶 �쑀臾� �뙋�떒怨� 湲� 踰덊샇 吏��젙
			String[] arrAttribute = { "sz_user_id_email", "sz_user_pwd" };

			pstmt = conn.prepareStatement(
					DbManager.select("Sign_Up", arrAttribute, "sz_user_id_email", mypageVO.getStr_User_ID_Email()));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getString(2).equalsIgnoreCase(mypageVO.getStr_User_Pwd())) {

					result = 1;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

		return result;
	}

}
