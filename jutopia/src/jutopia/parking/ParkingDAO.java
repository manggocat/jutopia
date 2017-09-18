package jutopia.parking;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;

public class ParkingDAO {

private static ParkingDAO instance = new ParkingDAO();
	
	public static ParkingDAO getInstance()
	{
		return instance;
	}
	
	public ParkingDAO()
	{
		
	}
	
	public void insert(ParkingVO Pvo) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO PARKING(N_PARKING_NUM, DATE_PARKING_DAY, DATE_PARKING_START_TIME, DATE_PARKING_END_TIME )");
		sb.append(" VALUES(PARKING_N_PARKING_NUM.NEXTVAL, ?, ?, ? ) ");
		conn = DbManager.getConnection("ParkingDB");
		pstmt = conn.prepareStatement(sb.toString());
		
		pstmt.setString(1, Pvo.getDate_parking_day());
		pstmt.setString(2, Pvo.getDate_parking_start_time());
		pstmt.setString(3, Pvo.getDate_parking_end_time());
		
		int Parking_result = pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);
	    CloseUtil.close(conn);
	}// parking_insert_end
	
	
}
