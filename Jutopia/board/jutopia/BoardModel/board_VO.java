package jutopia.BoardModel;

import java.sql.Timestamp;

//	db의 레코드를Object화한 클래스
//	Value Object, Data Transfer Object

public class board_VO {
	private String BOARD_ID_EMAIL, BOARD_PWD, BOARD_CONTENT, BOARD_SUBJECT,BOARD_IMG;
	private int  BOARD_NUM, BOARD_READCOUNT/*, BOARD_REF, BOARD_RE_STEP, BOARD_RE_LEVEL*/;
	private Timestamp BOARD_WRITE_DATE;
	public String getBOARD_ID_EMAIL() {
		return BOARD_ID_EMAIL;
	}
	// Constructor
	public board_VO(){
		super();
		// 기본 생성자......
	}
	public String getBOARD_PWD() {
		return BOARD_PWD;
	}
	public void setBOARD_PWD(String bOARD_PWD) {
		BOARD_PWD = bOARD_PWD;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}
	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}
	public String getBOARD_IMG() {
		return BOARD_IMG;
	}
	public void setBOARD_IMG(String bOARD_IMG) {
		BOARD_IMG = bOARD_IMG;
	}
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public int getBOARD_READCOUNT() {
		return BOARD_READCOUNT;
	}
	public void setBOARD_READCOUNT(int bOARD_READCOUNT) {
		BOARD_READCOUNT = bOARD_READCOUNT;
	}
	public Timestamp getBOARD_WRITE_DATE() {
		return BOARD_WRITE_DATE;
	}
	public void setBOARD_WRITE_DATE(Timestamp bOARD_WRITE_DATE) {
		BOARD_WRITE_DATE = bOARD_WRITE_DATE;
	}
	public void setBOARD_ID_EMAIL(String bOARD_ID_EMAIL) {
		BOARD_ID_EMAIL = bOARD_ID_EMAIL;
	}
	
	
}
