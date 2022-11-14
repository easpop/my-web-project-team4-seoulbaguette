package com.itwill.bakery.vo;

import java.util.ArrayList;
import java.util.List;

public class User{
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_phone;
	private int user_point;
	private List<Address> addressList=new ArrayList<Address>();
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public String getUser_id() {
		return user_id;
	}




	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}




	public String getUser_password() {
		return user_password;
	}




	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}




	public String getUser_name() {
		return user_name;
	}




	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}




	public String getUser_email() {
		return user_email;
	}




	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}




	public String getUser_phone() {
		return user_phone;
	}




	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}




	public int getUser_point() {
		return user_point;
	}




	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}




	public List<Address> getAddressList() {
		return addressList;
	}




	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}




	public User(String user_id, String user_password, String user_name, String user_email, String user_phone,
			int user_point, List<Address> addressList) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_point = user_point;
		this.addressList = addressList;
	}

	//패스워드 일치 검사
	public boolean isMatchPassword(String password){
		boolean isMatch=false;
		if(this.user_password.equals(password)){
			isMatch=true;
		}
		return isMatch;
	}


	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_point=" + user_point
				+ ", addressList=" + addressList + "]";
	}
	
	
	
	
	

}
