package jutopia.seasonparking;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class Season_ParkingDAO {
	
	public static Season_ParkingDAO instance = new Season_ParkingDAO();
	
	public static Season_ParkingDAO getInstance()
	{
		return instance;
	}
	
	public Season_ParkingDAO()
	{
		
	}
	
	public Connection getConnection() throws Exception
	{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:jutopiaDB");
		
		return ds.getConnection();
	}
	
	public void insert(Season_ParkingVO Svo) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO PARKING(N_PARKING_NUM, SZ_PARKING_LOT, N_PARKING_DISCRIMINATE, N_PARKING_SEASON_START_DATE, SZ_PARKING_POSITION )");
		sb.append("VALUES(PARKING_N_PARKING_NUM.NEXTVAL, ?, ?, ?, ? ) ");
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sb.toString());
		
		pstmt.setString(1, Svo.getStr_parking_lot());
		pstmt.setInt(2, Svo.getN_parking_discriminate());
		pstmt.setInt(3, Svo.getN_parking_season_start_date());
		pstmt.setString(4, Svo.getStr_parking_position());
		
		int Season_result = pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);
	    CloseUtil.close(conn);
	}
}
