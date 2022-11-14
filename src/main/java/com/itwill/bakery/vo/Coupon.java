package com.itwill.bakery.vo;

import java.sql.Date;

public class Coupon {
	private int c_no;
	private String c_start_date;
	private String c_end_date;
	private int c_discount;
	private String user_id;
	private int period;
	public Coupon() {
		
	}
	
	public Coupon(int c_no, String c_start_date, String c_end_date, int c_discount, String user_id, int period) {
		super();
		this.c_no = c_no;
		this.c_start_date = c_start_date;
		this.c_end_date = c_end_date;
		this.c_discount = c_discount;
		this.user_id = user_id;
		this.period = period;
	}
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_start_date() {
		return c_start_date;
	}
	public void setC_start_date(String c_start_date) {
		this.c_start_date = c_start_date;
	}
	public String getC_end_date() {
		return c_end_date;
	}
	public void setC_end_date(String c_end_date) {
		this.c_end_date = c_end_date;
	}
	public int getC_discount() {
		return c_discount;
	}
	public void setC_discount(int c_discount) {
		this.c_discount = c_discount;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	
	@Override
	public String toString() {
		return "Coupon [c_no=" + c_no + ", c_start_date=" + c_start_date + ", c_end_date=" + c_end_date
				+ ", c_discount=" + c_discount + ", user_id=" + user_id + ", period=" + period + "]";
	}
	
	
	

	
	
}
