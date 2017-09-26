package jutopia.noteAction;

public class PagingUtil {
	private int totalRows = 0;
	private int currentPage = 1;
	private int pageSize = 10;
	private int blockSize = 10;
	private int totalPages;
	private int totalBlocks;
	private int currentBlock;
	private int startPageNum;
	private int endPageNum;
	private int prevPageNum;
	private int nextPageNum;
	private String scriptName = "movePage";
	
	public StringBuffer pageString = new StringBuffer();
	
	public PagingUtil() {
		initialize();
	}
	
	public PagingUtil(int totalRows, int currentPage) {
		this.totalRows = totalRows;
		this.currentPage = currentPage;
		initialize();
	}
	
	public PagingUtil(int totalRows, int currentPage, int pageSize) {
		this.totalRows = totalRows;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		initialize();
	}
	
	public PagingUtil(int totalRows, int currentPage , int pageSize, int blockSize, String scriptNme) {
		this.totalRows = totalRows;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.scriptName = scriptNme;
		
		initialize();
	} 
	
	public void initialize() {	
		this.totalPages = (int)Math.ceil((double)this.totalRows / this.pageSize);
		this.totalBlocks = (int)Math.floor((double)this.totalPages / this.blockSize) + 1;
		this.currentBlock = (int)Math.ceil((double)((this.currentPage - 1) / this.blockSize)) + 1;
		this.startPageNum = (this.currentBlock - 1) * this.blockSize + 1;
		this.endPageNum = (startPageNum + blockSize - 1) > totalPages ? totalPages : (startPageNum + blockSize - 1);
		this.prevPageNum = (this.currentBlock - 1) * this.blockSize;
		this.nextPageNum = (this.currentBlock * this.blockSize) + 1;
	}
	
	public void prePrint() {
		pageString.append("<ul class=\"pagination margin-top-remove\">");
		
		// ì²«í˜?´ì§?ê°? ?•„?‹ ê²½ìš°
		if(this.currentPage > 1)
			pageString.append("<li><a href=\"javascript:"+ scriptName +"(1);\">&lt;&lt;</a></li>");
		// ì²«í˜?´ì§??¼ ê²½ìš°
		else
			pageString.append("");
		
		// ?´? „?˜?´ì§?ê°? ?ˆ?„ ê²½ìš°
		if(this.currentBlock > 1)
			pageString.append("<li><a href=\"javascript:"+ scriptName +"("+ prevPageNum +");\">&lt;</a></li>");
		// ?´? „?˜?´ì§?ê°? ?—†?„ ê²½ìš°
		else
			pageString.append("");
	}
	
	public void postPrint() {
		// ?‹¤?Œ?˜?´ì§?ê°? ?ˆ?„ ê²½ìš°
		if(this.currentBlock < this.totalBlocks )
			pageString.append("<li><a href=\"javascript:"+ scriptName +"("+ nextPageNum +");\">&gt;</a></li>");
		// ?‹¤?Œ?˜?´ì§?ê°? ?—†?„ ê²½ìš°
		else
			pageString.append("");
		
		// ë§ˆì?ë§‰í˜?´ì§?ê°? ?•„?‹ ê²½ìš°
		if(this.currentPage < this.totalPages)
			pageString.append("<li><a href=\"javascript:"+ scriptName +"("+ totalPages +");\">&gt;&gt;</a></li>");
		// ë§ˆì?ë§‰í˜?´ì§??¼ ê²½ìš°
		else
			pageString.append("");
		
		pageString.append("</ul>");
	}
	
	public void printList() {	
		for(int i = startPageNum ; i <= endPageNum ; i++) {
			if(i == this.currentPage)
				pageString.append("<li class=\"on\"><a href=\"#\">"+ i +"</a></li>");
			else
				pageString.append("<li><a href=\"javascript:"+ scriptName +"("+ i +");\">"+ i +"</a></li>");
		}
	}
	
	public String print() {
		if(this.totalPages >= 1) {
			this.prePrint();
			this.printList();
			this.postPrint();
		}
		return(pageString.toString());
	}
}
