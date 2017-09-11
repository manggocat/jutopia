package jutopia.login;

import java.io.Serializable;

public class LoginVO implements Serializable {
	private String str_User_ID_Email;
	private String str_User_Pwd;
	public String getStr_User_ID_Email() {
		return str_User_ID_Email;
	}
	public void setStr_User_ID_Email(String str_User_ID_Email) {
		this.str_User_ID_Email = str_User_ID_Email;
	}
	public String getStr_User_Pwd() {
		return str_User_Pwd;
	}
	public void setStr_User_Pwd(String str_User_Pwd) {
		this.str_User_Pwd = str_User_Pwd;
	}
}
