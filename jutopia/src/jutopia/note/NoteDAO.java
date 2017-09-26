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

    // ? λ²? κ°μ²΄λ₯? ??±??¬ λͺ¨λ  ?΄??€κ°? κ³΅μ ??€(?±?΄?€)
    private static NoteDAO instance = new NoteDAO();//? λ²? κ°μ²΄λ₯? ??±??¬ λͺ¨λ  ?΄??€κ°? κ³΅μ ??€(?±?΄?€)

    public static NoteDAO getInstance() {
        return instance;
    }

    // ??±?(??΄?Έ)//?λ¬΄κ²? ?? ₯ ? ?  ?? ?κΈ? ?λ¬Έμ ??΄?Έ ??±?κ°? ??΄?Ό ??€
    private NoteDAO() {}

    // DB?°κ²?
    public Connection getConnection() throws Exception {
        //?°κ²°μ? JNDI & Pool ??λ‘? ?°κ²? κ°μ²΄ ??±?΄? λ¦¬ν΄ ? κ²μ
        Context ctx = new InitialContext(); //context : κ°μ²΄? ? λ³? ??± λ¦¬μ€?Έλ₯? ?΄? κ°μ²΄
        Context env = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) env.lookup("jdbc:jutopiaDB"); //dbc:BoardDBλ₯? μ°Ύμ? ds? ?£?

        System.out.println("db------------------------------------");
        System.out.println(ds.toString());

        return ds.getConnection();
    }

    /**
     * μͺ½μ? λ³΄λ΄κΈ?
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

            //insert λͺλ Ή μ²λ¦¬
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
     * λ³΄κ??¨ μ‘°ν (μ΄μΉ΄?΄?Έ)
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

            //λ°©λ² 4> //??΄μ§κΈ°λ²? ??΄μ§?λ₯? ?€ κ°?? Έ?€λ©? λ‘λκ°? ?? €μ§?κΈ? ?λ¬Έμ ??΄μ§?λ₯? ? ??? κ²?
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
     * λ³΄κ??¨ μ‘°ν (λ―Έλ΅λ³? μΉ΄μ΄?Έ)
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

            //λ°©λ² 4> //??΄μ§κΈ°λ²? ??΄μ§?λ₯? ?€ κ°?? Έ?€λ©? λ‘λκ°? ?? €μ§?κΈ? ?λ¬Έμ ??΄μ§?λ₯? ? ??? κ²?
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
     * λ³΄κ??¨ μ‘°ν
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

            //λ°©λ² 4> //??΄μ§κΈ°λ²? ??΄μ§?λ₯? ?€ κ°?? Έ?€λ©? λ‘λκ°? ?? €μ§?κΈ? ?λ¬Έμ ??΄μ§?λ₯? ? ??? κ²?
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

                    //list κ°μ²΄? ?°?΄?° ???₯ Bean?Έ BoardVO κ°μ²΄? ???₯??€.
                    list.add(vo);//???₯?? listκ°μ²΄λ₯? λ¦¬ν΄?΄ μ€??€

                } while (rs.next()); //?€???κ°? ?? ?κΉμ? κ³μ λ°λ³΅λ¬ΈμΌλ‘? ??€
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
     * μͺ½μ? ?­? 
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
     * κ΄?λ¦¬μ λ³΄κ??¨ μ‘°ν (μ΄μΉ΄?΄?Έ)
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

            //λ°©λ² 4> //??΄μ§κΈ°λ²? ??΄μ§?λ₯? ?€ κ°?? Έ?€λ©? λ‘λκ°? ?? €μ§?κΈ? ?λ¬Έμ ??΄μ§?λ₯? ? ??? κ²?
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
     * κ΄?λ¦¬μ λ³΄κ??¨ μ‘°ν (λ―Έλ΅λ³? μΉ΄μ΄?Έ)
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

            //λ°©λ² 4> //??΄μ§κΈ°λ²? ??΄μ§?λ₯? ?€ κ°?? Έ?€λ©? λ‘λκ°? ?? €μ§?κΈ? ?λ¬Έμ ??΄μ§?λ₯? ? ??? κ²?
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
     * κ΄?λ¦¬μ λ³΄κ??¨ μ‘°ν
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
            
            System.out.println("------start: "+ start);
            System.out.println("------end: "+ end);
            
            //λ°©λ² 4> //??΄μ§κΈ°λ²? ??΄μ§?λ₯? ?€ κ°?? Έ?€λ©? λ‘λκ°? ?? €μ§?κΈ? ?λ¬Έμ ??΄μ§?λ₯? ? ??? κ²?
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

                    //list κ°μ²΄? ?°?΄?° ???₯ Bean?Έ BoardVO κ°μ²΄? ???₯??€.
                    list.add(vo);//???₯?? listκ°μ²΄λ₯? λ¦¬ν΄?΄ μ€??€

                } while (rs.next()); //?€???κ°? ?? ?κΉμ? κ³μ λ°λ³΅λ¬ΈμΌλ‘? ??€
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
     * μͺ½μ? ?΅λ³? λ³΄λ΄κΈ?
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

    //??Έ??Έ
	public NoteVo getDataDetail(int num) {
		// getDataDetail(num) - noteShowForm.jsp ??Έλ³΄κΈ° ??΄μ§?
		//num? ?΄?Ή?? ? μ½λλ₯?  note??΄λΈμ? κ²???¨
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			NoteVo vo = null;
			String sql = "";
			
			try {
				conn = getConnection();
				
				//?€μ§μ ?Όλ‘? λ³΄μ¬μ£Όλ λΆ?λΆ?
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


