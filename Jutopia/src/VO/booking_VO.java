package VO;

import java.sql.Timestamp;

public class booking_VO {
	private String BOOK_ID_EMAIL, BOOK_NAME, BOOK_CAR_NUM, BOOK_POSITION, BOOK_CAR_KINDS,
										BOOK_REDUCTION, BOOK_TEL;
	private Timestamp BOOK_START_TIME, BOOK_END_TIME;
	
	public String getBOOK_ID_EMAIL() {
		return BOOK_ID_EMAIL;
	}
	public void setBOOK_ID_EMAIL(String bOOK_ID_EMAIL) {
		BOOK_ID_EMAIL = bOOK_ID_EMAIL;
	}
	public String getBOOK_NAME() {
		return BOOK_NAME;
	}
	public void setBOOK_NAME(String bOOK_NAME) {
		BOOK_NAME = bOOK_NAME;
	}
	public String getBOOK_CAR_NUM() {
		return BOOK_CAR_NUM;
	}
	public void setBOOK_CAR_NUM(String bOOK_CAR_NUM) {
		BOOK_CAR_NUM = bOOK_CAR_NUM;
	}
	public String getBOOK_POSITION() {
		return BOOK_POSITION;
	}
	public void setBOOK_POSITION(String bOOK_POSITION) {
		BOOK_POSITION = bOOK_POSITION;
	}
	public String getBOOK_CAR_KINDS() {
		return BOOK_CAR_KINDS;
	}
	public void setBOOK_CAR_KINDS(String bOOK_CAR_KINDS) {
		BOOK_CAR_KINDS = bOOK_CAR_KINDS;
	}
	public String getBOOK_REDUCTION() {
		return BOOK_REDUCTION;
	}
	public void setBOOK_REDUCTION(String bOOK_REDUCTION) {
		BOOK_REDUCTION = bOOK_REDUCTION;
	}
	public String getBOOK_TEL() {
		return BOOK_TEL;
	}
	public void setBOOK_TEL(String bOOK_TEL) {
		BOOK_TEL = bOOK_TEL;
	}
	public Timestamp getBOOK_START_TIME() {
		return BOOK_START_TIME;
	}
	public void setBOOK_START_TIME(Timestamp bOOK_START_TIME) {
		BOOK_START_TIME = bOOK_START_TIME;
	}
	public Timestamp getBOOK_END_TIME() {
		return BOOK_END_TIME;
	}
	public void setBOOK_END_TIME(Timestamp bOOK_END_TIME) {
		BOOK_END_TIME = bOOK_END_TIME;
	}
	
	
}
