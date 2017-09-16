package jutopia.booking;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

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
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BookingDB");
		return ds.getConnection();
	}
	
	
	public void insert(BookingVO vo) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt=null;

		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO BOOKING(N_BOOK_NUM, SZ_BOOK_ID_EMAIL, SZ_BOOK_NAME, SZ_BOOK_CAR_NUM, SZ_BOOK_CAR_KINDS, SZ_BOOK_TEL, DATE_BOOK_DAY, DATE_BOOK_START_TIME, DATE_BOOK_END_TIME, SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE ) ");
		sb.append(" VALUES(BOOKING_N_BOOK_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
		conn = getConnection();
		pstmt = conn.prepareStatement(sb.toString());
			
		pstmt.setString(1, vo.getStr_book_id_email());
		pstmt.setString(2, vo.getStr_book_name());
		pstmt.setString(3, vo.getStr_book_car_num());
		pstmt.setString(4, vo.getStr_book_car_kinds());
		pstmt.setString(5, vo.getStr_book_tel());
		
		pstmt.setTimestamp(6, vo.getDate_book_day());
		pstmt.setTimestamp(7, vo.getDate_book_start_time());
		pstmt.setTimestamp(8, vo.getDate_book_end_time());
		pstmt.setString(9, vo.getStr_parking_place());
		pstmt.setInt(10, vo.getN_reserve_discrimintae());
						
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
	
	public List<BookingVO> getSelectPosition(String str_parking_position)
	{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List Booking_list = null;
	    
	    try 
	    {
			conn = getConnection();
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE  FROM BOOKING");
			/*sb.append("SELECT SZ_PARKING_PLACE FROM BOOKING WHERE DATE_BOOK_DAY = ? AND DATE_BOOK_START_TIME = ? AND DATE_BOOK_END_TIME = ?");*/
			
			pstmt = conn.prepareStatement(sb.toString());
			/*pstmt.setString(1, );
			pstmt.setString(2, );
			pstmt.setString(3, );*/
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				Booking_list = new ArrayList();
				
				do
				{
					BookingVO vo = new BookingVO();
					
					vo.setStr_parking_place(rs.getString("SZ_PARKING_PLACE"));
					vo.setN_reserve_discrimintae(rs.getInt("N_RESERVE_DISCRIMINATE"));
					
					Booking_list.add(vo);
				}while(rs.next());
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
