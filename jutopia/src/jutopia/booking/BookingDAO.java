package jutopia.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;
import jutopia.mypage.MypageVO;

public class BookingDAO {
	
	private static BookingDAO instance = new BookingDAO();
	
	public static BookingDAO getInstance()
	{
		return instance;
	}
	
	public BookingDAO()
	{
		
	}
	
	public Connection getConnection() throws Exception
	{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:jutopiaDB");
		
		return ds.getConnection();
	}
	

	public MypageVO BookingInfoSelect(MypageVO mypageVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DbManager.getConnection("SignupDB");
			String[] arrAttribute = { "szSIGN_UP_ID_EMAIL","szSIGN_UP_name","szSIGN_UP_tel","szSIGN_UP_REDUCTION"};

			pstmt = conn.prepareStatement(DbManager.select("Sign_up", arrAttribute, "szSIGN_UP_id_email", mypageVO.getStr_User_ID_Email()));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mypageVO.setStr_User_ID_Email(rs.getString("szSIGN_UP_id_email"));
				mypageVO.setStr_User_Name(rs.getString("szSIGN_UP_name"));
				mypageVO.setStr_User_Tel(rs.getString("szSIGN_UP_tel"));
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
	public void insert(BookingVO vo) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt=null;

		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO BOOKING(N_BOOK_NUM, SZ_PARKING_LOCATION, SZ_BOOK_ID_EMAIL, SZ_BOOK_NAME, SZ_BOOK_CAR_NUM, SZ_BOOK_CAR_KINDS, SZ_BOOK_TEL, DATE_BOOK_DAY, N_BOOK_START, N_BOOK_END, SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE ) ");
		sb.append(" VALUES(BOOKING_N_BOOK_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
		conn = getConnection();
		pstmt = conn.prepareStatement(sb.toString());
			
		pstmt.setString(1, vo.getStr_parking_location());
		pstmt.setString(2, vo.getStr_book_id_email());
		pstmt.setString(3, vo.getStr_book_name());
		pstmt.setString(4, vo.getStr_book_car_num());
		pstmt.setString(5, vo.getStr_book_car_kinds());
		pstmt.setString(6, vo.getStr_book_tel());
		
		pstmt.setString(7, vo.getDate_book_day());
		pstmt.setInt(8,vo.getN_book_start());
		pstmt.setInt(9,vo.getN_book_end());
		pstmt.setString(10, vo.getStr_parking_place());
		pstmt.setInt(11, vo.getN_reserve_discrimintae());
						
		int result = pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);
	    CloseUtil.close(conn);

	} //insert end;
	
	public int delete(String str_book_car_num)
	{
		System.out.println("test4");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbstr_book_car_num = "";
		int result = 0;
		System.out.println("test3");
		try
		{
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT SZ_BOOK_CAR_NUM FROM BOOKING WHERE SZ_BOOK_CAR_NUM = ?");
			pstmt.setString(1, str_book_car_num);
			System.out.println(str_book_car_num);
			rs = pstmt.executeQuery();
			System.out.println("test5");
			if(rs.next())
			{
				dbstr_book_car_num = rs.getString("SZ_BOOK_CAR_NUM");
				if(dbstr_book_car_num.equals(str_book_car_num))
				{
					pstmt = conn.prepareStatement("DELETE FROM BOOKING WHERE SZ_BOOK_CAR_NUM = ?");
					pstmt.setString(1, str_book_car_num);
					result = pstmt.executeUpdate();
					result = 1;
					System.out.println("test2");
				}
			
				else
				{
					result = 0;
					System.out.println("test7");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			 CloseUtil.close(rs);
	         CloseUtil.close(pstmt);
	         CloseUtil.close(conn);
		}
			return result;
		
	}
	
	public List<BookingVO> getSelectPosition(String str_parking_location, String Date_book_day)
	{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List Booking_list = null;
	    
	    try 
	    {
			conn = getConnection();
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE, N_BOOK_START, N_BOOK_END FROM BOOKING WHERE SZ_PARKING_LOCATION=? AND DATE_BOOK_DAY=? ");
			conn = getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			BookingVO vo = new BookingVO();
			
			pstmt.setString(1, str_parking_location);
			pstmt.setString(2, Date_book_day);
			
			System.out.println("Date_book_day = " + Date_book_day);
			
			rs = pstmt.executeQuery();
			System.out.println("rs = " + rs);
			if(rs.next())
			{
				Booking_list = new ArrayList();
				
				do
				{			
					BookingVO lvo = new BookingVO();
					lvo.setStr_parking_place(rs.getString("SZ_PARKING_PLACE"));
					System.out.println("SZ_PARKING_PLACE_list = " + rs.getString("SZ_PARKING_PLACE"));
					lvo.setN_reserve_discrimintae(rs.getInt("N_RESERVE_DISCRIMINATE"));
					System.out.println("N_RESERVE_DISCRIMINATE_list = " + rs.getInt("N_RESERVE_DISCRIMINATE"));
					lvo.setN_book_start(rs.getInt("N_BOOK_START"));
					lvo.setN_book_end(rs.getInt("N_BOOK_END"));
					System.out.println("bookingdao n_book_start = " + rs.getInt("N_BOOK_START"));
					System.out.println("bookingdao n_book_end = " + rs.getInt("N_BOOK_END"));
					Booking_list.add(lvo);
					
					for(int i = 0 ; i < Booking_list.size(); i++)
					{
					System.out.println("리스트 = " + Booking_list.get(i));
					}
				}while(rs.next());
				
				
			}
			else
			{
				Booking_list = new ArrayList();
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
		return Booking_list;
	}
}
