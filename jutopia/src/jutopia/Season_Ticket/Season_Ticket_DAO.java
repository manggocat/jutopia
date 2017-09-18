package jutopia.Season_Ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;

public class Season_Ticket_DAO {
	
	private static Season_Ticket_DAO instance = new Season_Ticket_DAO();
	
	public static Season_Ticket_DAO getInstance() {
		return instance;
	}
	
	private Season_Ticket_DAO() {	}
	
/*	public Connection getConnection() throws Exception {
		// �뿰寃곗� JNDI & Pool �삎�깭濡� �뿰寃� 媛앹껜 �깮�꽦�빐�꽌 由ы꽩�븷 寃�
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:JUTOPIADB");

		return ds.getConnection();
	}*/
	
	// insert 泥섎━ - �쉶�썝 媛��엯 泥섎━ 硫붿냼�뱶(�궫�엯)
		public int insert(Season_Ticket_VO vo) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = -1;

			try {
				conn = DbManager.getConnection("ParkingDB");

				StringBuffer sb = new StringBuffer();

				sb.append("INSERT INTO SEASON_TICKET(SEASON_TICKET_NAME, SEASON_TICKET_TEL, ");
				sb.append(" SEASON_TICKET_ID_EMAIL, SEASON_TICKET_CAR_KINDS, SEASON_TICKET_CAR_NUM, ");
				sb.append(" SEASON_TICKET_REDUCTION) VALUES(?, ?, ?, ?, ?, ?) ");

				pstmt = conn.prepareStatement(sb.toString());

				pstmt.setString(1, vo.getSEASON_TICKET_NAME());
				pstmt.setString(2, vo.getSEASON_TICKET_TEL());
				pstmt.setString(3, vo.getSEASON_TICKET_ID_EMAIL());
				pstmt.setString(4, vo.getSEASON_TICKET_CAR_KINDS());
				pstmt.setString(3, vo.getSEASON_TICKET_CAR_NUM());
				pstmt.setString(4, vo.getSEASON_TICKET_REDUCTION());

				result = pstmt.executeUpdate();
				System.out.println("result : " + result);

			} catch (Exception e) {
				e.printStackTrace();
			}

			CloseUtil.close(pstmt);
			CloseUtil.close(conn);

			return result;
		} // insert() end
	

}
