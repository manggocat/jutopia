package jutopia.note;

import dbclose.util.*;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO { //controller

    // ?�� �? 객체�? ?��?��?��?�� 모든 ?��?��?���? 공유?��?��(?��?��?��)
    private static NoteDAO instance = new NoteDAO();//?�� �? 객체�? ?��?��?��?�� 모든 ?��?��?���? 공유?��?��(?��?��?��)

    public static NoteDAO getInstance() {
        return instance;
    }

    // ?��?��?��(?��?��?��)//?��무것?�� ?��?�� ?�� ?�� ?��?�� ?���? ?��문에 ?��?��?�� ?��?��?���? ?��?��?�� ?��?��
    private NoteDAO() {}

    // DB?���?
    public Connection getConnection() throws Exception {
        //?��결�? JNDI & Pool ?��?���? ?���? 객체 ?��?��?��?�� 리턴 ?��것임
        Context ctx = new InitialContext(); //context : 객체?�� ?���? ?��?�� 리스?���? ?��?�� 객체
        Context env = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) env.lookup("jdbc:jutopiaDB"); //dbc:BoardDB�? 찾아?�� ds?�� ?��?��

        
        

        return ds.getConnection();
    }

    /**
     * 쪽�? 보내�?
     *
     * @param vo
     * @return
     */
    public int insert(NoteVo vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        StringBuffer sb = new StringBuffer();

        try {
            conn = getConnection();

            //insert 명령 처리
            sb.append("insert into note(note_num, note_recipient, note_sender, note_contents, note_send_time) ");
            sb.append("values (note_num.nextval, ?, ?, ?, sysdate)");

            pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getNote_recipient());
			pstmt.setString(2, vo.getNote_sender());
			pstmt.setString(3, vo.getNote_contents());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return result;
    }

    /**
     * 보�??�� 조회 (총카?��?��)
     * @param email
     * @return
     */
    public int getSelectAllCount(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        try {
            conn = getConnection();

            StringBuffer sb = new StringBuffer();

            //방법 4> //?��?��징기�? ?��?���?�? ?�� �??��?���? 로드�? ?��?���?�? ?��문에 ?��?���?�? ?��?��?��?�� �?
            sb.append("select count(*) cnt ");
            sb.append("from   note ");
            sb.append("where  note_sender = ? ");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if(rs.next()) count = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return count;
    }

    /**
     * 보�??�� 조회 (미답�? 카운?��)
     * @param email
     * @return
     */
    public int getSelectAllUnreadCount(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        try {
            conn = getConnection();

            StringBuffer sb = new StringBuffer();

            //방법 4> //?��?��징기�? ?��?���?�? ?�� �??��?���? 로드�? ?��?���?�? ?��문에 ?��?���?�? ?��?��?��?�� �?
            sb.append("select count(*) cnt ");
            sb.append("from   note ");
            sb.append("where  note_sender = ? ");
            sb.append("and    note_reply is null");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if(rs.next()) count = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return count;
    }

    /**
     * 보�??�� 조회
     * @param start
     * @param end
     * @return
     */
    public List<NoteVo> getSelectAll(String email, int start, int end) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<NoteVo> list = null;

        try {
            conn = getConnection();

            StringBuffer sb = new StringBuffer();

            //방법 4> //?��?��징기�? ?��?���?�? ?�� �??��?���? 로드�? ?��?���?�? ?��문에 ?��?���?�? ?��?��?��?�� �?
            sb.append("select note_num, note_sender, note_recipient, note_contents, note_reply, TO_CHAR(note_send_time, 'YYYY-MM-DD HH24:MI:SS') note_send_time, TO_CHAR(note_reply_time, 'YYYY-MM-DD HH24:MI:SS') note_reply_time, R ");
            sb.append("from (select  note_num, note_sender, note_recipient, note_contents, note_reply, note_send_time, note_reply_time, ROWNUM R ");
            sb.append("      from (select note_num, note_sender, note_recipient, note_contents, note_reply, note_send_time, note_reply_time ");
            sb.append("            from note ");
            sb.append("            where note_sender = ? ");
            sb.append("            order by note_reply_time, note_num desc) ");
            sb.append(") where R between ? and ? ");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, email);
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                list = new ArrayList<>();

                do {
                    NoteVo vo = new NoteVo();
                    vo.setNote_num(rs.getInt("note_num"));
                    vo.setNote_sender(rs.getString("note_sender"));
                    vo.setNote_recipient(rs.getString("note_recipient"));
                    vo.setNote_contents(rs.getString("note_contents"));
                    vo.setNote_reply(rs.getString("note_reply"));
                    vo.setNote_send_time(rs.getString("note_send_time"));
                    vo.setNote_reply_time(rs.getString("note_reply_time"));

                    //list 객체?�� ?��?��?�� ???�� Bean?�� BoardVO 객체?�� ???��?��?��.
                    list.add(vo);//???��?��?�� list객체�? 리턴?�� �??��

                } while (rs.next()); //?��?��?��?���? ?��?�� ?��까�? 계속 반복문으�? ?��?��
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

    /**
     * 쪽�? ?��?��
     * @param note_num
     * @return
     * @throws Exception
     */
    public int delete(int note_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("DELETE FROM note WHERE note_num = ?");
            pstmt.setInt(1, note_num);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return result;
    }

    /**
     * �?리자 보�??�� 조회 (총카?��?��)
     * @param email
     * @return
     */
    public int getSelectAllAdminCount(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        try {
            conn = getConnection();

            StringBuffer sb = new StringBuffer();

            //방법 4> //?��?��징기�? ?��?���?�? ?�� �??��?���? 로드�? ?��?���?�? ?��문에 ?��?���?�? ?��?��?��?�� �?
            sb.append("select count(*) cnt ");
            sb.append("from   note ");
            sb.append("where  note_recipient = ? ");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if(rs.next()) count = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return count;
    }

    /**
     * �?리자 보�??�� 조회 (미답�? 카운?��)
     * @param email
     * @return
     */
    public int getSelectAllAdminUnreadCount(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        try {
            conn = getConnection();

            StringBuffer sb = new StringBuffer();

            //방법 4> //?��?��징기�? ?��?���?�? ?�� �??��?���? 로드�? ?��?���?�? ?��문에 ?��?���?�? ?��?��?��?�� �?
            sb.append("select count(*) cnt ");
            sb.append("from   note ");
            sb.append("where  note_recipient = ? ");
            sb.append("and    note_reply is null");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if(rs.next()) count = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return count;
    }

    /**
     * �?리자 보�??�� 조회
     * @param start
     * @param end
     * @return
     */
    public List<NoteVo> getSelectAllAdmin(String email, int start, int end) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<NoteVo> list = null;

        try {
            conn = getConnection();

            StringBuffer sb = new StringBuffer();
           
            
            //방법 4> //?��?��징기�? ?��?���?�? ?�� �??��?���? 로드�? ?��?���?�? ?��문에 ?��?���?�? ?��?��?��?�� �?
            sb.append("select note_num, note_sender, note_recipient, note_contents, note_reply, TO_CHAR(note_send_time, 'YYYY-MM-DD HH24:MI:SS') note_send_time, TO_CHAR(note_reply_time, 'YYYY-MM-DD HH24:MI:SS') note_reply_time, R ");
            sb.append("from (select  note_num, note_sender, note_recipient, note_contents, note_reply, note_send_time, note_reply_time, ROWNUM R ");
            sb.append("      from (select note_num, note_sender, note_recipient, note_contents, note_reply, note_send_time, note_reply_time ");
            sb.append("            from note ");
            sb.append("            where note_recipient = ? ");
            sb.append("            order by note_num desc) ");
            sb.append(") where R between ? and ? ");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, email);
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                list = new ArrayList<>();

                do {
                    NoteVo vo = new NoteVo();
                    vo.setNote_num(rs.getInt("note_num"));
                    vo.setNote_sender(rs.getString("note_sender"));
                    vo.setNote_recipient(rs.getString("note_recipient"));
                    vo.setNote_contents(rs.getString("note_contents"));
                    vo.setNote_reply(rs.getString("note_reply"));
                    vo.setNote_send_time(rs.getString("note_send_time"));
                    vo.setNote_reply_time(rs.getString("note_reply_time"));

                    //list 객체?�� ?��?��?�� ???�� Bean?�� BoardVO 객체?�� ???��?��?��.
                    list.add(vo);//???��?��?�� list객체�? 리턴?�� �??��

                } while (rs.next()); //?��?��?��?���? ?��?�� ?��까�? 계속 반복문으�? ?��?��
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

    /**
     * 쪽�? ?���? 보내�?
     *
     * @param vo
     * @return
     */
    public int insertReply(NoteVo vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        StringBuffer sb = new StringBuffer();

        try {
            conn = getConnection();

          sb.append("update note set note_reply = ?, note_reply_time = sysdate where note_num = ?");

            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, vo.getNote_reply());
            pstmt.setInt(2, vo.getNote_num());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(rs);
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
        }

        return result;
    }

    //?��?��?��?��
	public NoteVo getDataDetail(int num) {
		// getDataDetail(num) - noteShowForm.jsp ?��?��보기 ?��?���?
		//num?�� ?��?��?��?�� ?��코드�?  note?��?��블에?�� �??��?��
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			NoteVo vo = null;
			String sql = "";
			
			try {
				conn = getConnection();
				
				//?��질적?���? 보여주는 �?�?
				pstmt = conn.prepareStatement("select * from note where note_num = ?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo = new NoteVo();
					
	                    vo.setNote_sender(rs.getString("note_sender"));
	                    vo.setNote_recipient(rs.getString("note_recipient"));
	                    vo.setNote_contents(rs.getString("note_contents"));
	 
				}//if end
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseUtil.close(rs);
		    	CloseUtil.close(pstmt);
		    	CloseUtil.close(conn);
			}
			return vo;
		}// getDataDetail() end
	}


