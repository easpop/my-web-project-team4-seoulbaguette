package com.itwill.bakery.sql;

public class ReviewSQL {
	public final static String REVIEW_CREATE
	="insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,?,sysdate,?,?,?,?)";
	
	public final static String REVIEW_UPDATE
	="update review set r_stargrade=?, r_title=?,r_content=? where r_no=?";
	
	public final static String REVIEW_DELETE
	="delete from review where r_no=?";
	
	public final static String REVIEW_SELECT_BY_ID
	="select * from review r join product p on r.p_no=p.p_no where user_id=? order by r.r_no desc";
			
	public final static String REVIEW_SELECT_BY_P
	="SELECT * FROM review r join product p on r.p_no=p.p_no where p.p_no=? order by r.r_no desc";
	
	public final static String REVIEW_SELECT
	="select * from review r join product p on r.p_no=p.p_no where r.r_no=?";
}
