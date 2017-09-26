package jutopia.parking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class ParkingDAO {

private static ParkingDAO instance = new ParkingDAO();
	
	public static ParkingDAO getInstance()
	{
		return instance;
	}
	
	public ParkingDAO()
	{
		
	}
	
	public Connection getConnection() throws Exception
	{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:jutopiaDB");


		return ds.getConnection();
	}
	
	public void insert(ParkingVO Pvo) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO PARKING(N_PARKING_NUM, SZ_PARKING_LOT, N_PARKING_DISCRIMINATE, SZ_PARKING_BOOK_DAY, N_PARKING_BOOK_START, N_PARKING_BOOK_END, SZ_PARKING_POSITION ) ");
		sb.append("VALUES(PARKING_N_PARKING_NUM.NEXTVAL, ?, ?, ?, ?, ?, ? ) ");
		conn = getConnection();
		pstmt = conn.prepareStatement(sb.toString());
		
		pstmt.setString(1, Pvo.getStr_parking_lot());
		pstmt.setInt(2, Pvo.getN_parking_discriminate());
		pstmt.setString(3, Pvo.getStr_parking_book_day());
		pstmt.setInt(4, Pvo.getN_parking_book_start());
		pstmt.setInt(5, Pvo.getN_parking_book_end());
		pstmt.setString(6, Pvo.getStr_parking_position());
		
		int Parking_result = 	pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);
	    CloseUtil.close(conn);
	}// parking_insert_end
	
	
	public List<ParkingVO> getReservationPosition(String str_parking_lot, int n_parking_season_start_date)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List Parking_list = null;
		
		try 
		{
			conn = getConnection();
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SZ_PARKING_POSITION, N_PARKING_DISCRIMINATE FROM PARKING WHERE N_PARKING_SEASON_START_DATE=? AND SZ_PARKING_LOT = ? ");
			conn = getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			ParkingVO Pvo = new ParkingVO();
			
			pstmt.setInt(1, n_parking_season_start_date);
			pstmt.setString(2, str_parking_lot);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				Parking_list = new ArrayList();
				
				do
				{
					ParkingVO Rvo = new ParkingVO();
					Rvo.setStr_parking_position(rs.getString("SZ_PARKING_POSITION"));
				
					Parking_list.add(Rvo);
					
				}while(rs.next());
			}
			else
			{
				Parking_list = new ArrayList();
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
		return Parking_list;
	}
	
}
