package jutopia.parking;

public class ParkingVO {

	private int n_parking_num;
	private String date_parking_day, date_parking_start_time, date_parking_end_time;
	
	public ParkingVO()
	{
		
	}

	public int getN_parking_num() {
		return n_parking_num;
	}

	public void setN_parking_num(int n_parking_num) {
		this.n_parking_num = n_parking_num;
	}

	public String getDate_parking_day() {
		return date_parking_day;
	}

	public void setDate_parking_day(String date_parking_day) {
		this.date_parking_day = date_parking_day;
	}

	public String getDate_parking_start_time() {
		return date_parking_start_time;
	}

	public void setDate_parking_start_time(String date_parking_start_time) {
		this.date_parking_start_time = date_parking_start_time;
	}

	public String getDate_parking_end_time() {
		return date_parking_end_time;
	}

	public void setDate_parking_end_time(String date_parking_end_time) {
		this.date_parking_end_time = date_parking_end_time;
	}
	
	
}
