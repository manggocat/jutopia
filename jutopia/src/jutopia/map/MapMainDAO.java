package jutopia.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import jutopia.map.LatestSearchVO;

import dbclose.util.CloseUtil;
import dbconnManager.DbManager;

public class MapMainDAO {

	private static MapMainDAO instance = new MapMainDAO();

	/* private static DbConnection dbConnection; */
	public MapMainDAO() {
		/* DbConnection.getData(); */
		// TODO Auto-generated constructor stub
	}

	public static MapMainDAO getInstance() {
		return instance;
	}

	public List searchselect(MapMainVO mapmainVO) {
		
		LatestSearchVO lastestsearchvo;
		List<LatestSearchVO> search = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DbManager.getConnection("jutopiaDB");

			StringBuffer sb = new StringBuffer();

			sb.append("select szSearch , szAddress from searchword where szsign_up_id_email = ? order by datesearchtime desc ");
			String[] arrAttribute = { "szSearch" };
			String[] strWhereAttribute = { "szsign_up_id_email" };
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, mapmainVO.getStr_User_ID_Email());

			/*
			 * String[] arrValue =
			 * {mapparkinfoVO.getStr_User_ID_Email(),mapparkinfoVO.
			 * getStr_Searchword(),}; pstmt =
			 * conn.prepareStatement(DbManager.insert("searchword", arrValue));
			 */

			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				lastestsearchvo = new LatestSearchVO();
				lastestsearchvo.setName(rs.getString(1));
				lastestsearchvo.setAddress(rs.getString(2));
				if(count>2){
					break;
				}
				search.add(lastestsearchvo);
				
				
				for(int i = 0 ; i<count;i++){
					
					if(search.get(count).getName().equals(search.get(i).getName())){
						search.remove(count);
						count--;
					}
				}
				/*if (count >= 1) {
					if (search.get(count).getName().equals(search.get(count - 1).getName())) {
						search.remove(count);
						count--;
					}
				}*/
				count++;
				
			}
			System.out.println(search.size());
		
			
			


		} catch (Exception e) {
			e.printStackTrace();
		}

		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
/*for(int i = 0 ; i<2;i++){
		System.out.println(search.get(i));
}*/
		return search;
	}

}
