package com.itwill.bakery.sql;

public class CouponSQL {
	public final static String COUPON_CREATE
	="insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + ?,?,?)";
	
	public final static String COUPON_USE_DELETE
	="delete coupon where c_no=?";
	
	public final static String COUPON_DATE_DELETE
	="delete coupon where c_end_date < sysdate-1";
	
	public final static String COUPON_SELECT_BY_NO
	="select * from coupon where c_no=?";
	
	public final static String COUPON_SELECT_BY_ID
	="select * from coupon where user_id=?";
	
	public final static String COUPON_UPDATE_DISCOUNT
	="update coupon set c_discount=? where c_no =?";

}
