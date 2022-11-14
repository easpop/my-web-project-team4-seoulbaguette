package com.itwill.bakery.sql;

public class OrderReviewSQL {
	public final static String INSERT_OR
	="insert into order_review(r_no,oi_no) values(review_r_no_SEQ.currval,?)";
	
	public final static String SELECT_OR
	="select count(*) from order_review where oi_no=?";
	
	public final static String RETURE_RNO
	="select r_no from order_review where oi_no=?";

}
