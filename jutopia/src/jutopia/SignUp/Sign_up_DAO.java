package jutopia.SignUp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;
import jutopia.SignUp.Sign_up_VO;

public class Sign_up_DAO {

	private static Sign_up_DAO instance = new Sign_up_DAO();

	public static Sign_up_DAO getInstance() {
		return instance;
	}// getInstance()

	// 생성자
	private Sign_up_DAO(){}  
	
	
	public int insert(Sign_up_VO vo) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;

		try {
			conn = DbManager.getConnection("jutopiaDB");

			StringBuffer sb = new StringBuffer();

			sb.append("INSERT INTO SIGN_UP(szSIGN_UP_ID_EMAIL, szSIGN_UP_NAME, szSIGN_UP_PWD, szSIGN_UP_TEL, szSIGN_UP_REDUCTION) values(?, ?, ?, ?, ?) ");

			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, vo.getSIGN_UP_ID_EMAIL());
			pstmt.setString(2, vo.getSIGN_UP_NAME());
			pstmt.setString(3, vo.getSIGN_UP_PWD());
			pstmt.setString(4, vo.getSIGN_UP_TEL());
			pstmt.setString(5, vo.getSIGN_UP_REDUCTION());

			result = pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		CloseUtil.close(pstmt);
		CloseUtil.close(conn);

		return result;
	} // insert() end

	// userCheck(id_email, pwd) - 로그인 시 사용할 메소드 id/password 체크함
	public int userCheck(String email, String pwd) throws Exception {
		String sql = "SELECT szSIGN_UP_PWD FROM SIGN_UP WHERE szSIGN_UP_ID_EMAIL = ? ";
		String dbpwd = "";
		int result = -1;
		
		Connection conn =DbManager.getConnection("JUTOPIADB");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			dbpwd = rs.getString("szSIGN_UP_PWD");
			if (dbpwd.equals(pwd))
				result = 1; // 인증 성공
			else
				result = 0; // 비번 ㄷ틀림
		} else {
			result = -1; // 해당 아이디 없음
		} // if end
		

		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);

		return result;
	} // userCheck(email, pwd ) end

	// confirmID(email) - 회원가입 시 email 중복 체크할 때 사용할 메소드
	public int confirmID(String email) throws Exception {
		String sql = "SELECT szSIGN_UP_ID_EMAIL FROM SIGN_UP WHERE szSIGN_UP_ID_EMAIL = ? ";
		int result = -1;

		Connection conn = DbManager.getConnection("JUTOPIADB");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next())
			result = 1; // 해당 아이디가 있음
		else
			result = -1;

		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);

		return result;
	} // confirmID(id) end
	
	// update(vo) - 회원정보 수정
	public void update(Sign_up_VO vo) throws Exception {
		String sql = "UPDATE SIGN_UP SET SIGN_UP_PWD = ?, SIGN_UP_REDUCTION = ?, SIGN_UP_NAME = ? WHERE SIGN_UP_ID_EMAIL = ? ";
		Connection conn = DbManager.getConnection("JUTOPIADB");
		PreparedStatement pstmt = conn.prepareStatement(sql);
				
		pstmt.setString(1, vo.getSIGN_UP_PWD());
		pstmt.setString(2, vo.getSIGN_UP_REDUCTION());
		pstmt.setString(3, vo.getSIGN_UP_NAME());
		pstmt.setString(4, vo.getSIGN_UP_ID_EMAIL());
				
		pstmt.executeUpdate();
				
		CloseUtil.close(pstmt);			CloseUtil.close(conn);
				
	}	// update() end
			
	// delete(passwd) 회원정보 삭제하기
	public void delete(Sign_up_VO vo) throws Exception {
		String sql = " DELETE FROM SIGN_UP WHERE SIGN_UP_ID_EMAIL = ? ";
		Connection conn = DbManager.getConnection("JUTOPIADB");
		PreparedStatement pstmt = conn.prepareStatement(sql);
				
		pstmt.setString(1, vo.getSIGN_UP_ID_EMAIL());	
		pstmt.executeUpdate();
				
		CloseUtil.close(pstmt);		CloseUtil.close(conn);
						
	}	// delete() end
	
	/*//selectAll() - 회원 정보 보기!
	public ArrayList<Sign_up_VO> selectAll() throws Exception {
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT SIGN_UP_NAME, ");
		sb.append(" SIGN_UP_PWD FROM SIGN_UP ORDER BY SIGN_UP_ID_EMAIL DESC ");
				
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		ResultSet rs = pstmt.executeQuery();
				
		Sign_up_VO vo = null;
		ArrayList<Sign_up_VO> list = new ArrayList<>();
				
		while(rs.next() ) {
			vo = new Sign_up_VO();
			//vo.setSIGN_UP_ID_EMAIL(rs.getString("SIGN_UP_ID_EMAIL"));
			vo.setSIGN_UP_NAME(rs.getString("SIGN_UP_NAME"));
			vo.setSIGN_UP_PWD(rs.getString("SIGN_UP_PWD"));

			list.add(vo);
	}
		
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
				
		return list;
	}	// selectAll() end */
	
	
	
	// getDataDetail ( num ) - content.jsp 상세보기 페이지
	// num에 해당하는 레코드를 board 테이블에서 검색함
		public Sign_up_VO getDataDetail(String SIGN_UP_ID_EMAIL) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			
			Sign_up_VO vo = null;
			String sql = "";
			
			
			
			try {
				conn = DbManager.getConnection("JUTOPIADB");
				
				pstmt = conn.prepareStatement("SELECT * FROM SIGN_UP WHERE SIGN_UP_ID_EMAIL = ? " );
				pstmt.setString(1, SIGN_UP_ID_EMAIL);
				rs = pstmt.executeQuery();
				
				if ( rs.next() ) {
					vo = new Sign_up_VO();
					vo.setSIGN_UP_NAME(rs.getString("SIGN_UP_NAME"));
					vo.setSIGN_UP_PWD(rs.getString("SIGN_UP_PWD"));


				}	// if end
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
			}	
			
			return vo;
		}	// getDataDetail() end
	
	
}
