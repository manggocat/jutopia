package jutopia.board;

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

public class BoardDAO { // Controller

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public int insert(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = vo.getN_num();
		int ref = vo.getN_ref();
		int re_step = vo.getN_re_step();
		int re_level = vo.getN_re_level();
		int number = 0;
		StringBuffer sb = new StringBuffer();

		try {
			conn = DbManager.getConnection("jutopiaDB");

			pstmt = conn.prepareStatement("SELECT MAX(N_NUM) FROM BOARD");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			if (num != 0) {
				re_level = re_level + 1;

				pstmt = conn.prepareStatement("SELECT MAX(N_RE_STEP) FROM BOARD WHERE N_REF=? AND N_RE_LEVEL =?");
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_level);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					if (re_step == 0) {
						re_step = rs.getInt(1) + 1;
					}
				} else {
					re_step = 0;
				}

			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}

			sb.append(" INSERT INTO BOARD(N_NUM, STR_SUBJECT, STR_ID_EMAIL, " + "STR_CONTENT,DATE_REG_DATE, ");
			sb.append(" N_REF, N_RE_STEP, N_RE_LEVEL, STR_BOARDFILE) " + "VALUES(BOARD_NUM.NEXTVAL, ?,?,?,?,?,?,?,?)");

			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, vo.getStr_subject());
			pstmt.setString(2, vo.getStr_id_email());
			pstmt.setString(3, vo.getStr_content());
			pstmt.setTimestamp(4, vo.getDate_reg_date());

			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, vo.getStr_boardfile());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return 0;
	}

	public BoardVO getDataDetail(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BoardVO vo = null;

		try {
			conn = DbManager.getConnection("jutopiaDB");

			pstmt = conn.prepareStatement("UPDATE BOARD SET N_READCOUNT = N_READCOUNT + 1WHERE N_NUM =?");
			pstmt.setInt(1, num);
			pstmt.executeQuery();

			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE N_NUM =?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vo = new BoardVO();
				vo.setN_num(rs.getInt("N_num"));
				vo.setStr_subject(rs.getString("Str_subject"));
				vo.setStr_id_email(rs.getString("Str_id_email"));
				vo.setDate_reg_date(rs.getTimestamp("Date_reg_date"));

				vo.setN_readcount(rs.getInt("N_readcount"));
				vo.setN_ref(rs.getInt("N_ref"));
				vo.setN_re_level(rs.getInt("N_re_level"));
				vo.setN_re_step(rs.getInt("N_re_step"));

				vo.setStr_boardfile(rs.getString("Str_boardfile"));
				vo.setStr_content(rs.getString("Str_content"));
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

	public BoardVO update(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		BoardVO vo =null;
		
		try{
			conn =DbManager.getConnection("jutopiaDB");
			pstmt = conn.prepareStatement(" SELECT * FROM BOARD WHERE N_NUM = ? ");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new BoardVO();
				vo.setN_num(rs.getInt("N_num"));
				vo.setStr_subject(rs.getString("Str_subject"));
				vo.setStr_id_email(rs.getString("Str_id_email"));
				vo.setDate_reg_date(rs.getTimestamp("Date_reg_date"));
				
				vo.setN_readcount(rs.getInt("N_readcount"));
				vo.setN_ref(rs.getInt("N_ref"));
				vo.setN_re_level(rs.getInt("N_re_level"));
				vo.setN_re_step(rs.getInt("N_re_step"));
				
				vo.setStr_boardfile(rs.getString("Str_boardfile"));
				vo.setStr_content(rs.getString("Str_content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);  CloseUtil.close(pstmt);  CloseUtil.close(conn);
		}
		return vo;
	}
	
	public void update(BoardVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "";
	
		
		try{
			conn = DbManager.getConnection("jutopiaDB");
			
			
		
					sql = " UPDATE BOARD SET STR_ID_EMAIL=?, STR_SUBJECT =?, ";
					sql += " STR_CONTENT =?, STR_BOARDFILE=? WHERE N_NUM = ? ";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getStr_id_email());
					pstmt.setString(2, vo.getStr_subject());
					pstmt.setString(3, vo.getStr_content());
					pstmt.setString(4, vo.getStr_boardfile());
					pstmt.setInt(5, vo.getN_num());
				
					pstmt.executeUpdate();
					
							
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);  CloseUtil.close(pstmt);  CloseUtil.close(conn);
		}
		
		
	
	}
	// getListAllCount():
	public int getListAllCount(int start, int end, String Str_option, String Str_search) {

		System.out.println("testLog:getListAllCount");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			conn = DbManager.getConnection("jutopiaDB");
		
			if (Str_option == null) {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM BOARD");
				
			} else if (Str_option.equals("0")) {
				StringBuffer sb = new StringBuffer();
				sb.append("select COUNT(*) from ");
				sb.append("(select rownum rnum, N_num, Str_id_email, Str_subject ");
				sb.append(", Str_content,Str_boardfile, Date_reg_date, N_readcount ");
				sb.append(", N_ref, N_re_level, N_re_step ");
				sb.append("from ");
				sb.append("(select *from board where Str_subject like ? or Str_content like ?)) ");
				sb.append("where rnum>=? and rnum<=? ");

				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, "%" + Str_search + "%");
				pstmt.setString(2, "%" + Str_search + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
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

	// getSelectAll(startRow, endRow)
	public List<BoardVO> getSelectAll(int start, int end, String Str_option, String Str_search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();

		try {
			conn = DbManager.getConnection("jutopiaDB");
			StringBuffer sb = new StringBuffer();
			// �븘臾닿쾬�룄 �꽑�깮�븯吏� �븡�븯�쓣 �븣
			if (Str_option == null) {

				sb.append("select*from ");
				sb.append("(select rownum rnum, N_num, Str_id_email, Str_subject ");
				sb.append(", Str_content, Str_boardfile, N_readcount, N_ref ");
				sb.append(", N_re_level, N_re_step, Date_reg_date ");
				sb.append("from ");
				sb.append(" (select*from board order by N_ref desc, N_re_step asc))");
				sb.append("where rnum>=? and rnum<=?");

				pstmt = conn.prepareStatement(sb.toString());

				pstmt.setInt(1, start);
				pstmt.setInt(2, end);

				sb.delete(0, sb.toString().length());

			}
			// 寃��깋 踰꾪듉�쓣 �닃���쓣 �븣
			else if (Str_option.equals("0")) {
				sb.append("select*from ");
				sb.append("(select rownum rnum, N_num, Str_id_email, Str_subject ");
				sb.append(", Str_content,Str_boardfile, Date_reg_date, N_readcount ");
				sb.append(", N_ref, N_re_level, N_re_step ");
				sb.append("from ");
				sb.append("(select *from board where Str_subject like ? or Str_content like ?)) ");
				sb.append("where rnum>=? and rnum<=? ");

				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, "%" + Str_search + "%");
				pstmt.setString(2, "%" + Str_search + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);

				sb.delete(0, sb.toString().length());
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setN_num(rs.getInt("N_num"));
				vo.setStr_id_email(rs.getString("Str_id_email"));
				vo.setStr_subject(rs.getString("Str_subject"));
				vo.setStr_content(rs.getString("Str_content"));
				vo.setStr_boardfile(rs.getString("Str_boardfile"));
				vo.setN_readcount(rs.getInt("N_readcount"));
				vo.setN_ref(rs.getInt("N_ref"));
				vo.setN_re_level(rs.getInt("N_re_level"));
				vo.setN_re_step(rs.getInt("N_re_step"));
				vo.setDate_reg_date(rs.getTimestamp("Date_reg_date"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

		return list;
	}
	
	public void delete(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		
		int result = 0;
		
		try{
			conn =DbManager.getConnection("jutopiaDB");
			
			
		
					pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE N_NUM = ? ");
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
					
					
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			CloseUtil.close(rs);  CloseUtil.close(pstmt);  CloseUtil.close(conn);
		}
	
	}
}
