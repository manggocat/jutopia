package jutopia.map;

import java.sql.Timestamp;

public class MapParkInfoVO {

	private String str_User_ID_Email;
	private String str_Searchword;
	private String str_Address;
	public String getStr_Address() {
		return str_Address;
	}

	public void setStr_Address(String str_Address) {
		this.str_Address = str_Address;
	}

	private Timestamp time_searchtime;
	public Timestamp getTime_searchtime() {
		return time_searchtime;
	}

	public void setTime_searchtime(Timestamp time_searchtime) {
		this.time_searchtime = time_searchtime;
	}

	public String getStr_User_ID_Email() {
		return str_User_ID_Email;
	}

	public void setStr_User_ID_Email(String str_User_ID_Email) {
		this.str_User_ID_Email = str_User_ID_Email;
	}

	public String getStr_Searchword() {
		return str_Searchword;
	}

	public void setStr_Searchword(String str_Searchword) {
		this.str_Searchword = str_Searchword;
	}

}
