package jutopia.booking;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.sql.Date;

public class BookingVO {
	private int n_book_num, n_reserve_discrimintae;
	private String str_parking_location, str_book_id_email, str_book_name, str_book_car_num, str_book_car_kinds,
			str_book_tel, str_parking_place;

	private String str_book_start, str_book_end, date_book_day;

	/* private Date date_book_day; */
	public BookingVO() {

	}

	public String getStr_parking_location() {
		return str_parking_location;
	}

	public void setStr_parking_location(String str_parking_location) {
		this.str_parking_location = str_parking_location;
	}

	public int getN_book_num() {
		return n_book_num;
	}

	public void setN_book_num(int n_book_num) {
		this.n_book_num = n_book_num;
	}

	public int getN_reserve_discrimintae() {
		return n_reserve_discrimintae;
	}

	public void setN_reserve_discrimintae(int n_reserve_discrimintae) {
		this.n_reserve_discrimintae = n_reserve_discrimintae;
	}

	public String getStr_book_id_email() {
		return str_book_id_email;
	}

	public void setStr_book_id_email(String str_book_id_email) {
		this.str_book_id_email = str_book_id_email;
	}

	public String getStr_book_name() {
		return str_book_name;
	}

	public void setStr_book_name(String str_book_name) {
		this.str_book_name = str_book_name;
	}

	public String getStr_book_car_num() {
		return str_book_car_num;
	}

	public void setStr_book_car_num(String str_book_car_num) {
		this.str_book_car_num = str_book_car_num;
	}

	public String getStr_book_car_kinds() {
		return str_book_car_kinds;
	}

	public void setStr_book_car_kinds(String str_book_car_kinds) {
		this.str_book_car_kinds = str_book_car_kinds;
	}

	public String getStr_book_tel() {
		return str_book_tel;
	}

	public void setStr_book_tel(String str_book_tel) {
		this.str_book_tel = str_book_tel;
	}

	public String getStr_parking_place() {
		return str_parking_place;
	}

	public void setStr_parking_place(String str_parking_place) {
		this.str_parking_place = str_parking_place;
	}

	public String getDate_book_day() {

		return date_book_day;
	}

	public void setDate_book_day(String date_book_day) throws ParseException {
		/*
		 * DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 * System.out.println(date_book_day); java.util.Date utildate =
		 * sdf.parse(date_book_day); java.sql.Date sqlDate = new
		 * java.sql.Date(utildate.getTime()); this.date_book_day = sqlDate;
		 * System.out.println("result: "+this.date_book_day);
		 */
		this.date_book_day = date_book_day;
	}

	public String getDate_book_start_time() {
		return str_book_start;
	}

	public void setDate_book_start_time(String book_start_time) {

		System.out.println(book_start_time);
		this.str_book_start = book_start_time;
	}

	public String getDate_book_end_time() {
		return str_book_end;
	}

	public void setDate_book_end_time(String date_book_end_time) {

		System.out.println(date_book_end_time);
		this.str_book_end = date_book_end_time;
	}
}
