package jutopia.seasonticket;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class SeasonticketDAO {

	public static SeasonticketDAO instance = new SeasonticketDAO();
	
	public static SeasonticketDAO getInstance()
	{
		return instance;
	}
	
	public SeasonticketDAO()
	{
		
	}
	
	public Connection getConnection() throws Exception
	{
		Context ctx =  new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:jutopiaDB");
		return ds.getConnection();
	}
	
	public void insert(SeasonticketVO vo) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO SEASONTICKET(N_TICKET_NUM, SZ_SEASON_TICKET_PARKING_LOT, SZ_SEASON_TICKET_ID_EMAIL, SZ_SEASON_TICKET_NAME, ");
		sb.append("SZ_SEASON_TICKET_CAR_NUM, SZ_SEASON_TICKET_POSITION, SZ_SEASON_TICKET_CAR_KINDS, SZ_SEASON_TICKET_REDUCTION, N_SEASON_TICKET_START_DATE, SZ_SEASON_TICKET_END_DATE, SZ_SEASON_TICKET_TEL, N_SEASON_TICKET_DISCRIMINATE ) ");
		sb.append("VALUES(SEASONTICKET_N_TICKET_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
		conn = getConnection();
		pstmt = conn.prepareStatement(sb.toString());
		
		pstmt.setString(1, vo.getStr_season_ticket_parking_lot());
		pstmt.setString(2, vo.getStr_season_ticket_id_email());
		pstmt.setString(3, vo.getStr_season_ticket_name());
		pstmt.setString(4, vo.getStr_season_ticket_car_num());
		pstmt.setString(5, vo.getStr_season_ticket_position());
		pstmt.setString(6, vo.getStr_season_ticket_car_kinds());
		pstmt.setString(7, vo.getStr_season_ticket_reduction());
		pstmt.setInt(8, vo.getN_season_ticket_start_date());
		pstmt.setString(9, vo.getStr_season_ticket_end_date());
		pstmt.setString(10, vo.getStr_season_ticket_tel());
		pstmt.setInt(11, vo.getN_season_ticket_discriminate());
		
		int result = pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);
	    CloseUtil.close(conn);
	} //insert end
	
	public List<SeasonticketVO> getSelect_Season_Position(String str_season_ticket_parking_lot, int n_season_ticket_start_date)
	{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List Season_Ticket_list = null;
	    
	    try 
	    {
	    	conn = getConnection();
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SZ_SEASON_TICKET_POSITION, N_SEASON_TICKET_DISCRIMINATE FROM SEASONTICKET WHERE SZ_SEASON_TICKET_PARKING_LOT=? AND N_SEASON_TICKET_START_DATE=? ");
			conn = getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			SeasonticketVO vo = new SeasonticketVO();
			
			pstmt.setString(1, str_season_ticket_parking_lot);
			pstmt.setInt(2, n_season_ticket_start_date);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				Season_Ticket_list = new ArrayList();
				
				do
				{
					SeasonticketVO lvo = new SeasonticketVO();
					
					lvo.setStr_season_ticket_position(rs.getString("SZ_SEASON_TICKET_POSITION"));
					lvo.setN_season_ticket_discriminate(rs.getInt("N_SEASON_TICKET_DISCRIMINATE"));
					
					Season_Ticket_list.add(lvo);
					
				}while(rs.next());
			}
			else
			{
				Season_Ticket_list = new ArrayList();
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
	    
	    return Season_Ticket_list;
	}
} //��?��?��?���? 媛�?�엳�뒗寃� ?�꾩�?
