package jutopia.Findpwd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;

public class FindpwdDAO {

	private static FindpwdDAO instance = new FindpwdDAO();

	public static FindpwdDAO getInstance() {
		return instance;
	}// getInstance()

	// »ý¼ºÀÚ
	private FindpwdDAO() {
	}

	public void FindpwdUpdate(FindpwdVO findpwdVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DbManager.getConnection("jutopiaDB");

			String[] arrAttribute = { "szSIGN_UP_PWD" };
			String[] arrValue = { findpwdVO.getSIGN_UP_PWD() };
			pstmt = conn.prepareStatement(DbManager.update("Sign_up", arrAttribute, arrValue, "szSIGN_UP_ID_EMAIL",
					findpwdVO.getSIGN_UP_ID_EMAIL()));

			pstmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

	}

	public int FindpwdSelect(FindpwdVO findpwdVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String[] arrAttribute = { "szSIGN_UP_ID_EMAIL", "szSIGN_UP_NAME", "szSIGN_UP_TEL" };
		try {
			conn = DbManager.getConnection("jutopiaDB");
			pstmt = conn.prepareStatement(
					DbManager.select("Sign_up", arrAttribute, "szSIGN_UP_ID_EMAIL", findpwdVO.getSIGN_UP_ID_EMAIL()));

			rs = pstmt.executeQuery();
			System.out.println("namedkdkdkdkd" + findpwdVO.getSIGN_UP_NAME());
			while (rs.next()) {
				if (rs.getString(1).equals(findpwdVO.getSIGN_UP_ID_EMAIL())) {
					if (rs.getString(2).equals(findpwdVO.getSIGN_UP_NAME())) {
						if (rs.getString(3).equals(findpwdVO.getSIGN_UP_TEL())) {

							result = 1;

						}
					}
				}

			}

		} catch (Exception e) {

		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

		return result;
	}

}
