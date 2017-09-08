package VO;

import java.sql.Timestamp;

public class re_board_VO {
	private String RB_ID_EMAIL, RB_PWD, RB_CONTENTS;
	private Timestamp RB_WRITE_DATE;
	private int RB_BOARD_NUM, RB_NUM;
	
	public String getRB_ID_EMAIL() {
		return RB_ID_EMAIL;
	}
	public void setRB_ID_EMAIL(String rB_ID_EMAIL) {
		RB_ID_EMAIL = rB_ID_EMAIL;
	}
	public String getRB_PWD() {
		return RB_PWD;
	}
	public void setRB_PWD(String rB_PWD) {
		RB_PWD = rB_PWD;
	}
	public String getRB_CONTENTS() {
		return RB_CONTENTS;
	}
	public void setRB_CONTENTS(String rB_CONTENTS) {
		RB_CONTENTS = rB_CONTENTS;
	}
	public Timestamp getRB_WRITE_DATE() {
		return RB_WRITE_DATE;
	}
	public void setRB_WRITE_DATE(Timestamp rB_WRITE_DATE) {
		RB_WRITE_DATE = rB_WRITE_DATE;
	}
	public int getRB_BOARD_NUM() {
		return RB_BOARD_NUM;
	}
	public void setRB_BOARD_NUM(int rB_BOARD_NUM) {
		RB_BOARD_NUM = rB_BOARD_NUM;
	}
	public int getRB_NUM() {
		return RB_NUM;
	}
	public void setRB_NUM(int rB_NUM) {
		RB_NUM = rB_NUM;
	}
	
	
	
}
