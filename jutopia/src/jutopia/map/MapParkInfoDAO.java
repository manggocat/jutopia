package jutopia.map;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;
import jutopia.SignUp.Sign_up_VO;
import jutopia.mypage.MypageDAO;

public class MapParkInfoDAO {


	private static MapParkInfoDAO instance = new MapParkInfoDAO();

	/* private static DbConnection dbConnection; */
	public MapParkInfoDAO() {
		/* DbConnection.getData(); */
		// TODO Auto-generated constructor stub
	}

	public static MapParkInfoDAO getInstance() {
		return instance;
	}
	
	public void insert(MapParkInfoVO mapparkinfoVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		

		try {
			conn = DbManager.getConnection("jutopiaDB");

			StringBuffer sb = new StringBuffer();
			
			sb.append("INSERT INTO searchword values(?, ?, ?,?) ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, mapparkinfoVO.getStr_User_ID_Email());
			pstmt.setString(2, mapparkinfoVO.getStr_Searchword());
			pstmt.setString(3, mapparkinfoVO.getStr_Address());
			pstmt.setTimestamp(4, mapparkinfoVO.getTime_searchtime());
			/*String[] arrValue = {mapparkinfoVO.getStr_User_ID_Email(),mapparkinfoVO.getStr_Searchword(),};
			pstmt = conn.prepareStatement(DbManager.insert("searchword", arrValue));*/
			
		 pstmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}
		
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);

		
	}
}
