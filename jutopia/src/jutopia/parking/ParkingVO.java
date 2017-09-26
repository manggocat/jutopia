package jutopia.parking;

public class ParkingVO {

	private int n_parking_book_start, n_parking_num, n_parking_discriminate, n_parking_season_start_date , n_parking_book_end;
	private String str_parking_lot, str_parking_position;
	
	private String str_parking_book_day;

	public ParkingVO()
	{
		
	}

	public int getN_parking_num() {
		return n_parking_num;
	}

	public void setN_parking_num(int n_parking_num) {
		this.n_parking_num = n_parking_num;
	}

	public String getStr_parking_lot() {
		return str_parking_lot;
	}

	public void setStr_parking_lot(String str_parking_lot) {
		this.str_parking_lot = str_parking_lot;
	}



	public String getStr_parking_position() {
		return str_parking_position;
	}

	public int getN_parking_season_start_date() {
		return n_parking_season_start_date;
	}

	public void setN_parking_season_start_date(int n_parking_season_start_date) {
		this.n_parking_season_start_date = n_parking_season_start_date;
	}

	public void setStr_parking_position(String str_parking_position) {
		this.str_parking_position = str_parking_position;
	}

	public int getN_parking_discriminate() {
		return n_parking_discriminate;
	}

	public void setN_parking_discriminate(int n_parking_discriminate) {
		this.n_parking_discriminate = n_parking_discriminate;
	}

	public String getStr_parking_book_day() {
		return str_parking_book_day;
	}

	public void setStr_parking_book_day(String str_parking_book_day) {
		this.str_parking_book_day = str_parking_book_day;
	}

	public int getN_parking_book_start() {
		return n_parking_book_start;
	}

	public void setN_parking_book_start(int n_parking_book_start) {
		this.n_parking_book_start = n_parking_book_start;
	}

	public int getN_parking_book_end() {
		return n_parking_book_end;
	}

	public void setN_parking_book_end(int n_parking_book_end) {
		this.n_parking_book_end = n_parking_book_end;
	}




	
}
