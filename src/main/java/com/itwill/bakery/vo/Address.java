package com.itwill.bakery.vo;

public class Address {
	private int add_no;
	private String address;
	private String user_id;
	
	public Address() {
		// TODO Auto-generated constructor stub
	}

	public Address(int add_no, String address, String user_id) {
		super();
		this.add_no = add_no;
		this.address = address;
		this.user_id = user_id;
	}

	public int getAdd_no() {
		
		return add_no;
	}

	public void setAdd_no(int add_no) {
		this.add_no = add_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "address [add_no=" + add_no + ", address=" + address + ", user_id=" + user_id + "]";
	}
	
}
