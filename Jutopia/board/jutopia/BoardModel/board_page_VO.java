package jutopia.BoardModel;

public class board_page_VO {
	private int BOARD_COUNT,BOARD_PAGESIZE,BOARD_CURRENTPAGE, BOARD_NUMBER;
	private String BOARD_KEYFIELD,BOARD_KEYWORD;
	public int getBOARD_COUNT() {
		return BOARD_COUNT;
	}
	public void setBOARD_COUNT(int bOARD_COUNT) {
		BOARD_COUNT = bOARD_COUNT;
	}
	public int getBOARD_PAGESIZE() {
		return BOARD_PAGESIZE;
	}
	public void setBOARD_PAGESIZE(int bOARD_PAGESIZE) {
		BOARD_PAGESIZE = bOARD_PAGESIZE;
	}
	public int getBOARD_CURRENTPAGE() {
		return BOARD_CURRENTPAGE;
	}
	public void setBOARD_CURRENTPAGE(int bOARD_CURRENTPAGE) {
		BOARD_CURRENTPAGE = bOARD_CURRENTPAGE;
	}
	public int getBOARD_NUMBER() {
		return BOARD_NUMBER;
	}
	public void setBOARD_NUMBER(int bOARD_NUMBER) {
		BOARD_NUMBER = bOARD_NUMBER;
	}
	public String getBOARD_KEYFIELD() {
		return BOARD_KEYFIELD;
	}
	public void setBOARD_KEYFIELD(String bOARD_KEYFIELD) {
		BOARD_KEYFIELD = bOARD_KEYFIELD;
	}
	public String getBOARD_KEYWORD() {
		return BOARD_KEYWORD;
	}
	public void setBOARD_KEYWORD(String bOARD_KEYWORD) {
		BOARD_KEYWORD = bOARD_KEYWORD;
	}
	
}
