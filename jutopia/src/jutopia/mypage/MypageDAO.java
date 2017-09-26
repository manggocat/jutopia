package jutopia.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;
import jutopia.booking.BookingVO;

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
		String[] arrAttribute = {"szSIGN_UP_name","szSIGN_UP_pwd","szSIGN_UP_tel"};
		String[] arrValue = {mypageVO.getStr_User_Name(),mypageVO.getStr_User_Pwd(),mypageVO.getStr_User_Tel()};
		
		try{
			conn = DbManager.getConnection("SignupDB");
			pstmt = conn.prepareStatement(DbManager.update("Sign_up", arrAttribute, arrValue, "szSIGN_UP_id_email", mypageVO.getStr_User_ID_Email()));
			
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
			String[] arrAttribute = { "szSIGN_UP_ID_EMAIL","szSIGN_UP_name","szSIGN_UP_tel","szSIGN_UP_pwd","szSIGN_UP_REDUCTION"};

			pstmt = conn.prepareStatement(DbManager.select("Sign_up", arrAttribute, "szSIGN_UP_id_email", mypageVO.getStr_User_ID_Email()));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mypageVO.setStr_User_ID_Email(rs.getString("szSIGN_UP_id_email"));
				mypageVO.setStr_User_Name(rs.getString("szSIGN_UP_name"));
				mypageVO.setStr_User_Tel(rs.getString("szSIGN_UP_tel"));
				mypageVO.setStr_User_Pwd(rs.getString("szSIGN_UP_pwd"));
				mypageVO.setStr_User_REDUCTION(rs.getString("szSIGN_UP_REDUCTION"));
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
			

			pstmt = conn
					.prepareStatement(DbManager.delete("Sign_up", "szSIGN_UP_ID_EMAIL", mypageVO.getStr_User_ID_Email()));
			
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
			String[] arrAttribute = { "szSIGN_UP_id_email", "szSIGN_UP_pwd" };

			pstmt = conn.prepareStatement(
					DbManager.select("Sign_Up", arrAttribute, "szSIGN_UP_id_email", mypageVO.getStr_User_ID_Email()));
			
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

	public List<MypageVO> getBookingMyImformation(String str_book_id_email)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List Imformation_list = null;
		
		try 
		{
			
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SZ_PARKING_LOCATION, DATE_BOOK_DAY, N_BOOK_START, N_BOOK_END FROM BOOKING WHERE SZ_BOOK_ID_EMAIL = ? order by n_book_num desc");
			conn = DbManager.getConnection("SignupDB");
			pstmt = conn.prepareStatement(sb.toString());
			BookingVO vo = new BookingVO();
			
			pstmt.setString(1, str_book_id_email);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				Imformation_list = new ArrayList();
				
				do
				{
					MypageVO mvo = new MypageVO();
					mvo.setStr_parking_location(rs.getString("SZ_PARKING_LOCATION"));
					System.out.println("DAO 파킹로케이션 = " + rs.getString("SZ_PARKING_LOCATION"));
					mvo.setDate_book_day(rs.getString("DATE_BOOK_DAY"));
					System.out.println("DAO 날짜 = " + rs.getString("DATE_BOOK_DAY"));
					mvo.setN_book_start(rs.getInt("N_BOOK_START"));
					System.out.println("DAO 시작시간 = " + rs.getInt("N_BOOK_START"));
					mvo.setN_book_end(rs.getInt("N_BOOK_END"));
					System.out.println("DAO 끝 시간 = " + rs.getInt("N_BOOK_END"));
					
					Imformation_list.add(mvo);
					
				}while(rs.next());
			}
			else
			{
				Imformation_list = new ArrayList();
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
	    {
	    	CloseUtil.close(rs);
	        CloseUtil.close(pstmt);
	        CloseUtil.close(conn);
	    }
		return Imformation_list;
	}
	
	public List<MypageVO> getSeasonMyImformation(String str_book_id_email)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List Imformation_Season_list = null;
		
		try 
		{
			
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SZ_SEASON_TICKET_PARKING_LOT, SZ_SEASON_TICKET_REDUCTION, N_SEASON_TICKET_START_DATE FROM SEASONTICKET WHERE SZ_SEASON_TICKET_ID_EMAIL = ? order by n_ticket_num desc");
			conn = DbManager.getConnection("SignupDB");
			pstmt = conn.prepareStatement(sb.toString());
			BookingVO vo = new BookingVO();
			
			pstmt.setString(1, str_book_id_email);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				Imformation_Season_list = new ArrayList();
				
				do
				{
					MypageVO svo = new MypageVO();
					
					svo.setStr_season_ticket_parking_lot(rs.getString("SZ_SEASON_TICKET_PARKING_LOT"));
					svo.setStr_season_ticket_reduction(rs.getString("SZ_SEASON_TICKET_REDUCTION"));
					svo.setN_season_ticket_start_date(rs.getInt("N_SEASON_TICKET_START_DATE"));
					System.out.println();
					Imformation_Season_list.add(svo);
					
				}while(rs.next());
			}
			else
			{
				Imformation_Season_list = new ArrayList();
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
	    {
	    	CloseUtil.close(rs);
	        CloseUtil.close(pstmt);
	        CloseUtil.close(conn);
	    }
		return Imformation_Season_list;
	}

}
