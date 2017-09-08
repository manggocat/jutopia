package jutopia.BoardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class board_DAO { // Controller

	private static board_DAO instance = new board_DAO();

	public static board_DAO getInstance() {
		return instance;
	}

	public board_DAO() {
	}

	public Connection getConnection() throws Exception {

		Context initctx = new InitialContext();
		Context env = (Context) initctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:JUTOPIADB");

		return ds.getConnection();
	} // getConnection() end

	// 글쓰기
	public void insert(board_VO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = vo.getBOARD_NUM();
		int readcount = vo.getBOARD_READCOUNT();
		int number = 0;
		int cnt = 0;
		String sql = null;
		StringBuffer sb = new StringBuffer();

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("SELECT MAX(BOARD_NUM) FROM BOARD");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "INSERT INTO BOARD(BOARD_ID_EMAIL, BOARD_PWD, BOARD_CONTENT, BOARD_SUBJECT, BOARD_WRITE_DATE, BOARD_IMG,"
					+ "BOARD_NUM, BOARD_READCOUNT) values(board_num.nextval, ?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, vo.getBOARD_ID_EMAIL());
			pstmt.setString(++cnt, vo.getBOARD_PWD());
			pstmt.setString(++cnt, vo.getBOARD_CONTENT());
			pstmt.setString(++cnt, vo.getBOARD_SUBJECT());
			pstmt.setTimestamp(++cnt, vo.getBOARD_WRITE_DATE());
			pstmt.setString(++cnt, vo.getBOARD_IMG());
			pstmt.setInt(++cnt, num);
			pstmt.setInt(++cnt, readcount);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

	}// insert() end

	// 글 갯수
	public int getdetailcount(String keyfield, String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			conn = getConnection();
			if (keyword == null || "".equals(keyword.trim())) {
				sql = "SELECT COUNT(*)FROM BOARD";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "SELECT COUNT(*)FROM BOARD where " + keyfield + "like? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return count;
	}

	// 리스트 보이기
	public List<board_VO> getshow_list(int startrow, int endrow, String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<board_VO> list = null;
		String sql = null;

		try {
			conn = getConnection();
			if (keyword == null || "".equals(keyword.trim())) {
				sql = "SELECT*FROM ( ROWNUM RNUM FROM(SELECT*FROM BOARD WHERE" + keyfield
						+ " LIKE ? ORDER BY NUM DESC)A) WHERE RNUM >=? AND RNUM <=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
			} else {
				sql = "SELECT * FROM(SELECT A.*, ROWNUM RNUM FROM(SELECT * FROM BOARD WHERE " + keyfield
						+ " LIKE ? ORDER BY NUM DESC)A) WHERE RNUM >=? AND RNUM <=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);

			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<board_VO>();

				do {
					board_VO vo = new board_VO();
					vo.setBOARD_NUM(rs.getInt("num"));
					vo.setBOARD_ID_EMAIL(rs.getString("id_email"));
					vo.setBOARD_SUBJECT(rs.getString("subject"));
					vo.setBOARD_PWD(rs.getString("pwd"));
					vo.setBOARD_WRITE_DATE(rs.getTimestamp("write_date"));

					vo.setBOARD_READCOUNT(rs.getInt("readcount"));

					vo.setBOARD_CONTENT(rs.getString("content"));
					vo.setBOARD_IMG(rs.getString("img"));
					list.add(vo);

				} while (rs.next());
			} else {
				list = Collections.EMPTY_LIST;
			} // if end

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

		return list;
	}

	// 상세페이지
	public board_VO getdetail_page(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		board_VO vo = null;
		String sql = "";

		try {
			conn = getConnection();

			sql = "UPDATE BOARD SET BOARD_READCOUNT = BOARD_READCOUNT + 1WHERE BOARD_NUM =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();

			if (rs.next()) {

				vo = new board_VO();
				vo.setBOARD_NUM(rs.getInt("num"));
				vo.setBOARD_SUBJECT(rs.getString("subject"));
				vo.setBOARD_ID_EMAIL(rs.getString("id_email"));
				vo.setBOARD_PWD(rs.getString("pwd"));
				vo.setBOARD_WRITE_DATE(rs.getTimestamp("write_date"));

				vo.setBOARD_READCOUNT(rs.getInt("readcount"));

				vo.setBOARD_CONTENT(rs.getString("content"));
				vo.setBOARD_IMG(rs.getString("img"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return vo;
	}

	// 조회수 증가
	public int update_readcount(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;

		try {
			conn = getConnection();

			// 조회수 증가
			sql = "UPDATE BOARD SET READCOUNT=READCOUNT+1 WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 증가된 조회수 조회
			sql = "SELECT READCOUNT FROM BOARD WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return count;
	}

	// 수정
	
	public void update(board_VO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		int cnt = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			sql = "UPDATE BOARD SET BOARD_ID_EMAIL =?, BOARD_SUBJECT =?, BOARD_PWD=?, ";
			sql += " BOARD_CONTENT =?, BOARD_IMG = ? WHERE BOARD_NUM = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++cnt, vo.getBOARD_ID_EMAIL());
			pstmt.setString(++cnt, vo.getBOARD_SUBJECT());
			pstmt.setString(++cnt, vo.getBOARD_PWD());
			pstmt.setString(++cnt, vo.getBOARD_CONTENT());
			pstmt.setString(++cnt, vo.getBOARD_IMG());
			pstmt.setInt(++cnt, vo.getBOARD_NUM());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

	}

	// 삭제
	public void delete(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {
			conn = getConnection();

			pstmt.setInt(1, num);

			sql = "DELETE FROM BOARD WHERE BOARD_NUM = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return;
	}

	// 인증
	public int userCheck(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		String sql = "";
		int user_check = -1;
		try {

			conn = getConnection();
			sql = "SELECT BOARD_PWD FROM BOARD WHERE BOARD_NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("pwd");
				if (dbpasswd.equals(passwd)) {
					user_check = 1;// 인증성공
				} else
					user_check = 0;// 비밀전호 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return user_check;
	}

}
