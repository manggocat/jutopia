package jutopia.board;

import java.io.Serializable;
import java.sql.Timestamp;

public class BoardVO implements Serializable {
	private String  Str_id_email, Str_subject, Str_content, Str_boardfile;
	private Timestamp Date_reg_date;
	private int N_num, N_readcount, N_ref, N_re_step, N_re_level;
	public BoardVO(){}
	public String getStr_id_email() {
		return Str_id_email;
	}
	public void setStr_id_email(String str_id_email) {
		Str_id_email = str_id_email;
	}
	public String getStr_subject() {
		return Str_subject;
	}
	public void setStr_subject(String str_subject) {
		Str_subject = str_subject;
	}
	public String getStr_content() {
		return Str_content;
	}
	public void setStr_content(String str_content) {
		Str_content = str_content;
	}
	public String getStr_boardfile() {
		return Str_boardfile;
	}
	public void setStr_boardfile(String str_boardfile) {
		Str_boardfile = str_boardfile;
	}
	public Timestamp getDate_reg_date() {
		return Date_reg_date;
	}
	public void setDate_reg_date(Timestamp date_reg_date) {
		Date_reg_date = date_reg_date;
	}
	public int getN_num() {
		return N_num;
	}
	public void setN_num(int n_num) {
		N_num = n_num;
	}
	public int getN_readcount() {
		return N_readcount;
	}
	public void setN_readcount(int n_readcount) {
		N_readcount = n_readcount;
	}
	public int getN_ref() {
		return N_ref;
	}
	public void setN_ref(int n_ref) {
		N_ref = n_ref;
	}
	public int getN_re_step() {
		return N_re_step;
	}
	public void setN_re_step(int n_re_step) {
		N_re_step = n_re_step;
	}
	public int getN_re_level() {
		return N_re_level;
	}
	public void setN_re_level(int n_re_level) {
		N_re_level = n_re_level;
	}
	
}
