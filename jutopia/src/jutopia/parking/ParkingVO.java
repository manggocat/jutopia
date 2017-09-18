package jutopia.parking;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ParkingVO {

	private int n_parking_num;
	private String date_parking_start_time, date_parking_end_time,str_parking_place;
	private Date date_parking_day;
	public ParkingVO()
	{
		
	}

	
	
	public String getStr_parking_place() {
		return str_parking_place;
	}



	public void setStr_parking_place(String str_parking_place) {
		this.str_parking_place = str_parking_place;
	}



	public int getN_parking_num() {
		return n_parking_num;
	}

	public void setN_parking_num(int n_parking_num) {
		this.n_parking_num = n_parking_num;
	}

	public Date getDate_parking_day() {
		return date_parking_day;
	}

	public void setDate_parking_day(String date_parking_day) throws ParseException
	{
		DateFormat	 sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(date_parking_day);
		java.util.Date utildate = sdf.parse(date_parking_day);
		java.sql.Date sqlDate = new java.sql.Date(utildate.getTime());
		this.date_parking_day = sqlDate;
		System.out.println("result: "+this.date_parking_day);
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
