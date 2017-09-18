package dbconnManager;

import java.sql.Connection;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbManager {

	static DbManager dbConnection;
	
	public DbManager() {
		// TODO Auto-generated constructor stub
	}

	public static Connection getConnection(String strDbname) throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:" + strDbname);

		return ds.getConnection();
	}

	public static DbManager get_dbConnection() {
		return dbConnection;
	}

	public static String select(String strDbname) {
		String strQuery = "select * from " + strDbname;
		return strQuery;
	}

	public static String select(String strDbname, ArrayList arrAttribute) {
		String Attribute = "";
		for (int nStartarr = 0; nStartarr < arrAttribute.size(); nStartarr++) {

			Attribute += arrAttribute.get(nStartarr);
			if (nStartarr < arrAttribute.size() - 1) {
				Attribute += " , ";
			}
		}
		String strQuery = "select " + Attribute + " from " + strDbname;

		return strQuery;
	}

	public static String select(String strDbname, String[] arrAttribute, String strWhereAttribute, String strWhere) {
		String Attribute = "";

		for (int nStartarr = 0; nStartarr < arrAttribute.length; nStartarr++) {

			Attribute += arrAttribute[nStartarr];
			if (nStartarr < arrAttribute.length - 1) {
				Attribute += " , ";
			}

		}
		
		String strQuery = "select " + Attribute + " from " + strDbname + " where " + strWhereAttribute + " = '"
				+ strWhere + "'";
		System.out.println("strQuery:" + strQuery);
		return strQuery;
	}

	public static String insert(String strDbname, String[] arrAttribute, String[] arrValue) {

		String strSetAttribute = "";
		String strSetValue = "";
		for (int nStartarr = 0; nStartarr < arrAttribute.length; nStartarr++) {

			strSetAttribute += arrAttribute[nStartarr];
			if (nStartarr < arrAttribute.length - 1) {
				strSetAttribute += " , ";
			}

		}
		for (int nStartarr = 0; nStartarr < arrValue.length; nStartarr++) {

			strSetValue += ("'" + arrValue[nStartarr] + "'");
			if (nStartarr < arrValue.length - 1) {
				strSetValue += " , ";
			}

		}

		String strQuery = "insert into " + strDbname + "(" + strSetAttribute + ") values( " + strSetValue + " ) ";

		return strQuery;
	}

	public static String insert(String strDbname, String[] arrValue) {
		String strSetValue = "";
		for (int nStartarr = 0; nStartarr < arrValue.length; nStartarr++) {

			strSetValue += ("'" + arrValue[nStartarr] + "'");
			if (nStartarr < arrValue.length - 1) {
				strSetValue += " , ";
			}

		}

		String strQuery = "insert into " + strDbname + " values( " + strSetValue + " ) ";
		return strQuery;
	}

	public static String update(String strDbname, String[] arrAttribute, String[] arrValue, String strWhereAttribute,
			String strWhere) {

		String strSetAttribute = "";
		String strSetValue = "";

		for (int nStartarr = 0; nStartarr < arrAttribute.length; nStartarr++) {

			strSetAttribute += arrAttribute[nStartarr] + " = '" + arrValue[nStartarr]+"'";
			if (nStartarr < arrAttribute.length - 1) {
				strSetAttribute += " , ";
			}

		}

		String strQuery = "update " + strDbname + " set " + strSetAttribute + " where " + strWhereAttribute + " = "
				+"'" +strWhere+"'";
		System.out.println("strQuery:" + strQuery);
		return strQuery;
	}

	public static String delete(String strDbname, String strWhereAttribute, String strWhere) {

		String strQuery = "delete from " + strDbname + " where " + strWhereAttribute + " = '" + strWhere+"'";

		return strQuery;
	}

}
