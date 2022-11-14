package com.itwill.bakery.vo;



/*
이름          널?       유형            
----------- -------- ------------- 
R_NO        NOT NULL NUMBER(10)    
R_TITLE              VARCHAR2(100) 
R_DATE               DATE          
R_STARGRADE          NUMBER(10)    
R_CONTENT            VARCHAR2(300) 
USER_ID              VARCHAR2(100) 
P_NO                 NUMBER(10)    
*/

public class Review {
	private int r_no;
	private String r_title;
	private String r_date;
	private int r_stargrade;
	private String r_content;
	private String user_id;
	private Product product;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int r_no, String r_title, String r_date, int r_stargrade, String r_content, String user_id,
			Product product) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_date = r_date;
		this.r_stargrade = r_stargrade;
		this.r_content = r_content;
		this.user_id = user_id;
		this.product = product;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_stargrade() {
		return r_stargrade;
	}

	public void setR_stargrade(int r_stargrade) {
		this.r_stargrade = r_stargrade;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", r_title=" + r_title + ", r_date=" + r_date + ", r_stargrade=" + r_stargrade
				+ ", r_content=" + r_content + ", user_id=" + user_id + ", product=" + product + "]";
	}
	
	
	
	

	

}
